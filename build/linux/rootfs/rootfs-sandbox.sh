
# Authored-by:  David Nyström <david.nystrom@enea.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# An Openembedded rootfs-sandbox intended for use with the
# meta-toolchain SDK tarball provided with a OE based distro.
# Uses a remote or local package repository for rootfs configuration.

# TODO :
# 2: Reset RPM DB rootfs path to / before creating the rootfs tarball. Not working.
# 3: Remove host-native path to ensure no host-contamination when
#    All needed items are added to nativesdk.
# 4: Fix extesion of nativesdk and target sysroots with RPM. Not working.

### Set ENV ###
export INTERCEPT_DIR="${OECORE_NATIVE_SYSROOT}/usr/share/postinst-intercepts"

# Setup pseduo environment
export PSEUDO_BINDIR=${OECORE_NATIVE_SYSROOT}/usr/bin
export PSEUDO_LIBDIR=${OECORE_NATIVE_SYSROOT}/usr/lib/pseudo/lib
export PSEUDO_PREFIX=${OECORE_NATIVE_SYSROOT}
export LD_LIBRARY_PATH=${OECORE_NATIVE_SYSROOT}/usr/lib/pseudo/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${OECORE_NATIVE_SYSROOT}/usr/lib/pseudo/lib64:${LD_LIBRARY_PATH}
export PSEUDO_NOSYMLINKEXP=1
export PSEUDO_DISABLED=0
export PSEUDO_UNLOAD=0
export PSEUDO_DEBUG=0
FAKEROOT="pseudo"

# Needed by qemuwrapper and postinstall intercepts
export datadir="/usr/share"
export includedir="/usr/include"
export libdir="/usr/lib"
export base_libdir="/lib"
export bindir="/usr/bin"
export base_bindir="/bin"
export sysconfdir="/etc"

export PYTHONIOENCODING="UTF-8"

DEVTABLE="${OECORE_NATIVE_SYSROOT}/usr/share/device_table-minimal.txt"
rpmlibdir="/var/lib/rpm"
declare -a REPO_URL
declare -a CLEANUP_FILES

function add_cleanup ()
{
	while [ $# -ne 0 ]; do
		local files_count=${#CLEANUP_FILES[@]}
		CLEANUP_FILES[${files_count}]="$1"
		shift;
	done
}

function do_file_cleanup ()
{
	local ret=$?
	for f in "${CLEANUP_FILES[@]}"; do
		rm -rf "${f}"
	done
	return ${ret}
}

trap do_file_cleanup EXIT KILL QUIT SEGV INT HUP TERM

TMPFILE="$(mktemp)"
add_cleanup "${TMPFILE}"
chmod +x "${TMPFILE}"

### Define helper functions ###
create_scripts()
{
    cat << EOF > ${SCRIPTS}/scriptlet_wrapper
#!/bin/bash

export PATH="${PATH}"
export D="${IMAGE_ROOTFS}"
export OFFLINE_ROOT="\$D"
export IPKG_OFFLINE_ROOT="\$D"
export OPKG_OFFLINE_ROOT="\$D"
export INTERCEPT_DIR="${INTERCEPT_DIR}"
export NATIVE_ROOT=${OECORE_NATIVE_SYSROOT}
export PYTHONIOENCODING="UTF-8"

\$2 \$1/\$3 \$4
if [ \$? -ne 0 ]; then
    if [ \$4 -eq 1 ]; then
	mkdir -p \$1/etc/rpm-postinsts
	num=100
	while [ -e \$1/etc/rpm-postinsts/\${num}-* ]; do num=\$((num + 1)); done
	name=\`head -1 \$1/\$3 | cut -d' ' -f 2\`
	echo "#!\$2" > \$1/etc/rpm-postinsts/\${num}-\${name}
	echo "# Arg: \$4" >> \$1/etc/rpm-postinsts/\${num}-\${name}
	cat \$1/\$3 >> \$1/etc/rpm-postinsts/\${num}-\${name}
	chmod +x \$1/etc/rpm-postinsts/\${num}-\${name}
    else
	echo "Error: pre/post remove scriptlet failed"
    fi
fi
EOF
    chmod 755 ${SCRIPTS}/scriptlet_wrapper


    cat << EOF > ${SCRIPTS}/smart
#!/bin/sh
${OECORE_NATIVE_SYSROOT}/usr/bin/smart ${OFLAGS} "\$@"
EOF
    chmod 755 ${SCRIPTS}/smart


    # Create devmodwrapper dummy script
    if [ ! -f ${SCRIPTS}/depmodwrapper ] ; then
	cat > ${SCRIPTS}/depmodwrapper << EOF
#!/bin/sh
# Expected to be called as: depmodwrapper -a KERNEL_VERSION
if [ "\$1" != "-a" -o "\$2" != "-b" ]; then
    echo "Usage: depmodwrapper -a -b rootfs KERNEL_VERSION" >&2
    exit 1
fi

# Sanity checks off, since we are installing from a package repository,
# dependency checks should be alredy in place in package RDEPENDS.
exec env depmod "\$1" "\$2" "\$3" "\$4"
EOF
	chmod 755 ${SCRIPTS}/depmodwrapper
    fi

}

show_help() {
    local cmd="${FUNCNAME[1]}"
    cat << EOF
Usage: ${cmd} -r <rootfs_path> -p <rpm>

Example:
$${cmd} -r /tmp/rootfs -a ppce500v2 -u file:///media/sdb5/poky/build/tmp/deploy/

OPTIONS:
-r      Rootfs path
-a      Architecture (x86-64, ppce500v2 et.c.)
-u      Set Repository URL
EOF
}


check_input() {
    unset OPTIND
    ### BEGIN ###
    if [ "${OECORE_NATIVE_SYSROOT}x" = "x" ]; then
	echo "source the SDK environment before running me"
    fi

    if [ $# = 0 ]; then
	show_help
    fi

    rflag=false

    # Set sane default
    export T_ARCH="x86_64"

    while getopts "h?r:u:a:e:" opt; do
	case "$opt" in
	    h|\?)
		show_help
		;;
	    r)  export IMAGE_ROOTFS=${OPTARG}
		rflag=true
		;;
	    a)  export T_ARCH=$OPTARG
		;;
	    u)
		local repo_count=${#REPO_URL[@]}
		REPO_URL[${repo_count}]=${OPTARG}
		;;
	    e)
		export SMART_EXTRA_FILE="${OPTARG}"
		;;
	esac
    done

	export REPO_URL

    if [ $rflag = false ]; then
	echo "Error: Options -r is mandatory"
	return 1
    fi
    return 0
}

rootfs_setup() {
	echo "Installing initial /dev directory"

	cat > "${TMPFILE}" << EOF
#!/bin/bash
mkdir -p ${IMAGE_ROOTFS}/dev
mkdir -p ${IMAGE_ROOTFS}/etc/opkg/arch
mkdir -p ${IMAGE_ROOTFS}/etc/rpm
mkdir -p ${IMAGE_ROOTFS}/etc/rpm-postinsts
mkdir -p ${IMAGE_ROOTFS}/install/tmp

mkdir -p ${IMAGE_ROOTFS}/var/lib/opkg
mkdir -p ${OPKG_TMP_DIR}/var/lib/pseudo

mkdir -p ${IMAGE_ROOTFS}-tmp/etc
echo "root:x:0:0:root:/root:/bin/bash" > ${IMAGE_ROOTFS}-tmp/etc/passwd
echo "passwd: files " > ${IMAGE_ROOTFS}-tmp/etc/nsswitch.conf

mkdir -p ${IMAGE_ROOTFS}/etc/rpm/sysinfo
echo "/" > ${IMAGE_ROOTFS}/etc/rpm/sysinfo/Dirnames
mkdir -p ${IMAGE_ROOTFS}/$rpmlibdir
if [ ! -z ${IS_SYSROOT} ]; then
	rm -fr ${IMAGE_ROOTFS}/$rpmlibdir/*
fi
mkdir -p ${IMAGE_ROOTFS}/$rpmlibdir/log

# After change the __db.* cache size, log file will not be generated automatically,
# that will raise some warnings, so touch a bare log for rpm write into it.
touch ${IMAGE_ROOTFS}/$rpmlibdir/log/log.0000000001
EOF
	export IMAGE_ROOTFS OPKG_TMP_DIR IS_SYSROOT rpmlibdir
	cat "${TMPFILE}" && ${FAKEROOT} "${TMPFILE}"
	if [ $? -ne 0 ]; then
		echo "Error: Failed to setup rootfs."
		return 255
	fi
	if [ ! -e ${IMAGE_ROOTFS}/$rpmlibdir/DB_CONFIG ]; then
		$FAKEROOT cat > ${IMAGE_ROOTFS}/$rpmlibdir/DB_CONFIG << EOF
# ================ Environment
set_data_dir .
set_create_dir .
set_lg_dir ./log
set_tmp_dir ./tmp
set_flags db_log_autoremove on

# -- thread_count must be >= 8
set_thread_count 64

# ================ Logging

# ================ Memory Pool
set_cachesize 0 1048576 0
set_mp_mmapsize 268435456

# ================ Locking
set_lk_max_locks 16384
set_lk_max_lockers 16384
set_lk_max_objects 16384
mutex_set_max 163840

# ================ Replication
EOF

	cat > "${TMPFILE}" << EOF
#!/bin/bash
# Create database so that smart doesn't complain (lazy init)
rpm --root ${IMAGE_ROOTFS} --dbpath $rpmlibdir -qa > /dev/null
$PMC ${OFLAGS} config --set rpm-root=${IMAGE_ROOTFS}
$PMC ${OFLAGS} config --set rpm-dbpath=$rpmlibdir
$PMC ${OFLAGS} config --set rpm-extra-macros._var=/var
$PMC ${OFLAGS} config --set rpm-extra-macros._tmppath=/install/tmp

# Write common configuration for host and target usage
$PMC ${OFLAGS} config --set rpm-nolinktos=1
$PMC ${OFLAGS} config --set ignore-all-recommends=1
$PMC ${OFLAGS} config --set rpm-extra-macros._cross_scriptlet_wrapper=${SCRIPTS}/scriptlet_wrapper
rpm --eval "%{_arch}-%{_vendor}-%{_os}%{?_gnu}" > ${IMAGE_ROOTFS}/etc/rpm/platform
echo ".*" >> ${IMAGE_ROOTFS}/etc/rpm/platform
if [ ! -z ${IS_SYSROOT} ]; then
	$PMC ${OFLAGS} config --set rpm-noscripts=1
fi
EOF
	fi

	cat >> "${TMPFILE}" << EOF
#    command -v makedevs >/dev/null 2>&1 || { echo "Cant find 'makedevs' in PATH. Aborting." >&2; exit 1; }

    # Ignore exitcode
#    set +e
#    $FAKEROOT makedevs -r ${IMAGE_ROOTFS} -D $DEVTABLE
#    set -e

# Base time
date "+%m%d%H%M%Y" > ${IMAGE_ROOTFS}/etc/timestamp

# Add OpenDNS
echo "nameserver 208.67.220.220" >> ${IMAGE_ROOTFS}/etc/resolv.conf
echo "nameserver 208.67.222.222" >> ${IMAGE_ROOTFS}/etc/resolv.conf
EOF

	local smart_http_proxy="${http_proxy}"
	if [ ! -z "${smart_http_proxy}" ]; then
		if ! echo "${smart_http_proxy}" | grep -q "^http:"; then
			smart_http_proxy="http://${smart_http_proxy}"
		fi
		echo "$PMC ${OFLAGS} config --set http-proxy=${smart_http_proxy}" >> "${TMPFILE}"
	fi
	local smart_ftp_proxy="${ftp_proxy}"
	if [ ! -z "${smart_ftp_proxy}" ]; then
		smart_ftp_proxy="${smart_http_proxy}"
	fi
	if [ ! -z "${smart_ftp_proxy}" ]; then
		if ! echo "${smart_ftp_proxy}" | egrep -q "^http:|^ftp:"; then
			smart_ftp_proxy="http://${smart_ftp_proxy}"
		fi
		echo "$PMC ${OFLAGS} config --set ftp-proxy=${smart_ftp_proxy}" >> "${TMPFILE}"
	fi
	if [ -f "${SMART_EXTRA_FILE}" ]; then
		local extra_smart_configs=$(cat "${SMART_EXTRA_FILE}" | grep "^smart" | sed "s/^smart/${PMC} ${OFLAGS}/g")
		echo "${extra_smart_configs}" >> "${TMPFILE}"
	fi
	export OFLAGS PMC SCRIPTS
	cat "${TMPFILE}" && $FAKEROOT "${TMPFILE}"
	if [ $? -ne 0 ]; then
		echo "Error: Failed to setup rootfs."
		return 255
	fi

	cd ${IMAGE_ROOTFS};
}

smart_channel_setup() {
	echo "#!/bin/bash
smart ${OFLAGS} channel -y --add rpmsys type=rpm-sys name=\"Local RPM Database\" || exit 255
" > "${TMPFILE}"
	local pbase=0
	for u in "${REPO_URL[@]}"; do
		echo "
smart ${OFLAGS} channel -y --add all_${pbase} type=rpm-md baseurl=${u}/rpm/all || exit 255
smart ${OFLAGS} channel -y --add ${T_ARCH}_${pbase} type=rpm-md baseurl=${u}/rpm/${T_ARCH} || exit 255
smart ${OFLAGS} channel -y --add ${T_BSP}_${pbase} type=rpm-md baseurl=${u}/rpm/${T_BSP} || exit 255
smart ${OFLAGS} channel -y --set all_${pbase} priority=$((1 + ${pbase})) || exit 255
smart ${OFLAGS} channel -y --set ${T_ARCH}_${pbase} priority=$((16 + ${pbase})) || exit 255
smart ${OFLAGS} channel -y --set ${T_BSP}_${pbase} priority=$((21 + ${pbase})) || exit 255
" >> "${TMPFILE}"
		pbase=$((${pbase} + 30))
	done
	echo "
smart ${OFLAGS} update
" >> "${TMPFILE}"
	cat "${TMPFILE}"
	if ! $FAKEROOT "${TMPFILE}"; then
		echo "Error: smart failed to setup channels."
		return 255
	fi
}

smart_channel_reinstall() {
	if [ -f "need_recreate_channel" ]; then
		echo "#!/bin/bash
rm -rf ${IMAGE_ROOTFS}/var/lib/smart
smart ${OFLAGS} config --set rpm-root=${IMAGE_ROOTFS}
smart ${OFLAGS} config --set rpm-nolinktos=1
smart ${OFLAGS} config --set rpm-noparentdirs=1
smart ${OFLAGS} config --set ignore-all-recommends=1
" > "${TMPFILE}"
		cat "${TMPFILE}"
		$FAKEROOT "${TMPFILE}"
		smart_channel_setup
		rm -f need_recreate_channel
	fi
}

smart_channel_remove() {
	echo "#!/bin/bash
" > "${TMPFILE}"
	local pbase=0
	for u in "${REPO_URL[@]}"; do
		echo "
smart ${OFLAGS} channel -y --remove all_${pbase}
smart ${OFLAGS} channel -y --remove ${T_ARCH}_${pbase}
smart ${OFLAGS} channel -y --remove ${T_BSP}_${pbase}
" >> "${TMPFILE}"
		pbase=$((${pbase} + 30))
	done
echo "
rm -rf ${IMAGE_ROOTFS}/var/lib/smart
smart ${OFLAGS} config --set rpm-root=/
smart ${OFLAGS} config --set rpm-nolinktos=1
smart ${OFLAGS} config --set rpm-noparentdirs=1
smart ${OFLAGS} config --set ignore-all-recommends=1
smart ${OFLAGS} channel -y --add rpmsys type=rpm-sys name=\"Local RPM Database\"
" >> "${TMPFILE}"
	cat "${TMPFILE}"
	if ! $FAKEROOT "${TMPFILE}"; then
		echo "Error: smart failed to remove channels."
		return 255
	else
		touch need_recreate_channel
	fi
}

smart_get_available_packages() {
    $FAKEROOT smart ${OFLAGS} query --show-all --output available_pkgs.txt
}

smart_get_summary_packages() {
    $FAKEROOT smart ${OFLAGS} query --output available_pkgs_summary.txt
}

smart_get_group_info() {
    $FAKEROOT smart ${OFLAGS} info --output available_pkgs_group_info.txt
}

smart_install() {
    $FAKEROOT smart update
    $FAKEROOT smart ${OFLAGS} install run-postinsts packagegroup-core-boot -y
}


setup_rootfs_env() {
    IMAGE_ROOTFS=$(readlink -f $IMAGE_ROOTFS)

    export PMS="rpm"
    export PMC="smart"
if [ "${T_ARCH}" == "aarch64" ]; then
    export T_BSP=zynqmp_generic
elif [ "${T_ARCH}" == "cortexa9hf_vfp_neon" ]; then
    export T_BSP=zynq_generic
else
    export T_BSP=${T_ARCH}_generic
fi

    ### BEGIN ENV ###
    # Stores PSEUDO fakeroot DB and opkg temp files
    export OPKG_TMP_DIR="${IMAGE_ROOTFS}-tmp"
    export SCRIPTS="${IMAGE_ROOTFS}-tmp/scripts"

    # Use targets "special" update-rc.d + shadow utils + makedevs
    export PATH="${OECORE_NATIVE_SYSROOT}/usr/sbin:/usr/sbin:${PATH}"
    export PATH="${OECORE_NATIVE_SYSROOT}/sbin:${OECORE_NATIVE_SYSROOT}/usr/bin/crossscripts:${PATH}"
    #python path
    export PATH="${SCRIPTS}:${OECORE_NATIVE_SYSROOT}/usr/bin:${PATH}"

    export PSEUDO_LOCALSTATEDIR="${IMAGE_ROOTFS}-tmp/var/lib/pseudo"

    # Needed for SDKs update-alternatives
    export OPKG_OFFLINE_ROOT="${IMAGE_ROOTFS}"

    # Needed for update-rc.d and many others
    export D="${IMAGE_ROOTFS}"

    # Old Legacy, to be removed ?
    export OFFLINE_ROOT="${IMAGE_ROOTFS}"
    export IPKG_OFFLINE_ROOT="${IMAGE_ROOTFS}"
    ### END ENV ###

    mkdir -p ${SCRIPTS}

    export OFLAGS="--log-level=warning --data-dir=${IMAGE_ROOTFS}/var/lib/smart"

    export PSEUDO_PASSWD="${IMAGE_ROOTFS}:${IMAGE_ROOTFS}-tmp"

    export INTERCEPT_DIR="${IMAGE_ROOTFS}-tmp/scripts/intercept_scripts"

    export PSEUDO_PASSWD="${IMAGE_ROOTFS}:${IMAGE_ROOTFS}-tmp"

    export RPM_ETCRPM=${IMAGE_ROOTFS}/etc/rpm

}

# check_input $*
# setup_rootfs_env
# create_scripts
# rootfs_setup
# smart_channel_setup
# smart_get_available_packages
# smart_install

