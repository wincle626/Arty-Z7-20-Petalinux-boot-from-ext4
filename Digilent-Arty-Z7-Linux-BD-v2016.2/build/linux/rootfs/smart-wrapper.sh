#!/bin/bash

function print_err ()
{
	echo "ERROR: ${FUNCNAME[1]}: $@" 1>&2
}

function print_err2 ()
{
	echo "ERROR: ${FUNCNAME[2]}: $@" 1>&2
}

function exit_err ()
{
	print_err2 "$@"
	exit 255
}

function print_info ()
{
	echo "INFO: $@"
}

function print_warn ()
{
	echo "WARNING: $@"
}

function print_dbg ()
{
	if [ "${PLNX_PRINT_DEBUG}" == "y" ]; then
		echo "DEBUG: ${FUNCNAME[2]}: ${FUNCNAME[1]}: $@"
	fi
}

SMART_ROOT=${PETALINUX}/tools/yocto-sdk
AVAIL_PKGS_INFO="available_pkgs_info.txt"
AVAIL_PKGS_SUM="available_pkgs_summary.txt"
KCONFIG_PKGS_FILE="Kconfig.pkgs"
KCONFIG_PKGS_DEFAULT="Kconfig.pkgs.default"
AVAIL_PKGS_INFO_BRIEF="available_pkgs_info_brief.txt"

source "${SMART_ROOT}/environment-setup-x86_64-petalinux-linux"
source "$(pwd)/rootfs-sandbox.sh"

function smart_common ()
{
	if ! check_input $@; then
		print_err "Failed to check smart input: \"$@\"."
		return 255
	elif ! setup_rootfs_env; then
		print_err "Failed to setup smart rootfs env."
		return 255
	else
		return 0
	fi
}

function smart_setup ()
{
	export http_proxy ftp_proxy
	if ! smart_common $@ -e "${ROOTFS_CONFIG_DIR}/smart_extra"; then
		return 255
	elif ! (echo "setup smart: creating scripts" && create_scripts); then
		return 255
	elif ! (echo "setup smart: rootfs_setup" && rootfs_setup); then
		return 255
	elif ! (echo "setup smart: channel setup" && smart_channel_setup); then
		return 255
	else
		return 0
	fi
}

function smart_get_packages_info ()
{
	local p_sum_md5sum=0
	if [ -f "${AVAIL_PKGS_SUM}" ]; then
		p_sum_md5sum=$(md5sum "${AVAIL_PKGS_SUM}" | awk '{print $1}')
	fi
	if ! smart_common $@; then
		exit_err "Failed to setup smart common."
	elif ! (echo "getting packages summary from smart." && smart_get_summary_packages); then
		exit_err "Failed to get packages list from smart."
	fi
	if [ ! -f "${AVAIL_PKGS_INFO}" ] || [ ! "$(md5sum "${AVAIL_PKGS_SUM}" | awk '{print $1}')" == "${p_sum_md5sum}" ];  then
		print_info "Getting packages info. It will take a while." 1>&2
		${FAKEROOT} smart ${OFLAGS} query \
		--show-format=\
'${name};${version};${name}-${version};${group};${source}\nDescription:\n${description}\nEND\n' \
		--output="${AVAIL_PKGS_INFO}"
	fi
	if [ $? -ne 0 ]; then
		exit_err "Failed to get the details of packages summary."
	fi
}

function smart_gen_kconfig ()
{
	local info_brief="$1"
	if [ ! -f "${info_brief}" ]; then
		exit_err "Packages information brief file doesn't exist."
	fi
	awk '
BEGIN {
	pkgs=" ";
	cgroup="";
	csource="";
	ignore["locale"]="";
	ignore["ptest"]="";
}
$0 ~ /.*/ {
	split($0,tmp,";")
	name=tmp[3]
	for (v in ignore) {
		if (index(name, v) > 0) {
			next
		}
	}
	strname=sprintf(" %s ",name)
	idx=index(pkgs,strname)
	if (idx == 0) {
		pkgs=sprintf("%s%s ",pkgs,name)
		group=tmp[1]
		source=tmp[2]
		kname=tmp[6]
		version=tmp[4]

		for (v in ignore) {
			if (index(source, v) > 0) {
				next
			}
		}
		gsub(/@.*/,"",version)
		gsub(/\+/,"\\+",version)
		printf ("%s\n",version) > "logerror"
		vpattern=sprintf("-%s.*",version)
		gsub(vpattern,"",source)
		printf ("%s\n",source) > "logerror"
		helptxt=tmp[7]
		is_group_change=0;
		if ( cgroup != group ) {
			if ( cgroup != "" ) {
				printf("endmenu\nendmenu\n")
			}
			cgroup = group
			printf("menu \"%s\"\n",group)
			is_group_change=1;
		}
		if ( (source == csource) && (is_group_change == 1)) {
			printf ("menu \"%s\"\n",source)
		} else {
			if (source != csource) {
				if (is_group_change == 0) {
					print "endmenu"
				}
				printf ("menu \"%s\"\n",source)
				csource = source
			}
		}
		printf("config %s\n\tbool \"%s\"\n\thelp\n",kname,name)
		n=1
		while(substr(helptxt,n,60)) {
			tmpstr=sprintf("%s", substr(helptxt,n,60));gsub(/^[ \t]+/,"",tmpstr);printf("\t %s\n",tmpstr);n+=60
		}
	}
}' < <(cat "${info_brief}")
	echo -e "endmenu\nendmenu"
}

function smart_gen_default_pkgs_kconfig ()
{
	local info_brief="$1"
	if [ ! -f "${info_brief}" ]; then
		exit_err "Packages information brief file doesn't exist."
	fi
	local pkgs_info_list=$(cat "${info_brief}")
	local coreboot_pkg=packagegroup-core-boot
	local default_pkgs=$(${FAKEROOT} smart ${OFLAGS} install --dump ${coreboot_pkg} 2>&1 >/dev/null | grep -e ".*@.*")
	if [ ! $? -eq 0 ]; then
		exit_err "Failed to generate default packages kconfig. Failed to get default packages."
	fi
	echo " config ROOTFS_BASE_SYSTEM_DEFAULT
	bool \"base-system-default\""
	for p in ${default_pkgs}; do
		local pkg_str=$(echo "${pkgs_info_list}" | grep -e "^.*;.*;.*;.*;${p};" | head -n1)
		if [ -z "${pkg_str}" ]; then
			continue
		fi
		local kname=$(echo "${pkg_str}" | awk -F";" '{print $6}')
		echo -e "\tselect ${kname}"
	done
	extra_pkgs="busybox-mdev busybox-udhcpc"
	for e in ${extra_pkgs}; do
		if ! echo "${default_pkgs}" | grep -q "^${e}"; then
			echo -e "\tselect ROOTFS_PACKAGES_$(echo "${e}" | tr [:lower:] [:upper:] | tr '-' '_' | tr '+' "PLUS")"
		fi
	done
	echo "	default y
	help
	 Base System Image
"
}

function smart_gen_pkgs_info_brief_file ()
{
	print_dbg
	if ! smart_get_packages_info $@; then
		exit_err "Failed to get packages info from smart."
	fi

	awk '
BEGIN {
	name="";
	kname="";
	version="";
	raw_version="";
	source="";
	group=""
	desc="";
	is_skip=0;
	is_desc=0;
}

/^packagegroup-.*/ {
	is_skip=1;
	name=""
	next
}

/^Description:/ {
	if (is_skip == 0) {
		is_desc=1;
		desc="";
	}
	next
}

/^END/ {
	is_desc = 0;
	if (is_skip == 1) {
		is_skip = 0;
		next;
	}
	is_skip = 0;
	printf("%s;%s;%s;%s;%s-%s;ROOTFS_PACKAGES_%s;%s\n",group,source,name,version,name,raw_version,kname,desc);
	next
}
$0 ~ /.*/ {
	if (is_skip == 1) {
		next
	}
	if (is_desc == 0) {
		split($0,tmp,";")
		name=tmp[1]
		raw_version=tmp[2]
		version=tmp[2]
		group=tmp[4]
		source=tmp[5]
		gsub(/.*:/,"",version)
		kname=toupper(name)
		gsub(/-/,"_",kname)
		gsub(/\+/,"PLUS",kname)
	} else {
		desc=sprintf("%s %s",desc,$0)
	}
	next
}' "${AVAIL_PKGS_INFO}" > "${AVAIL_PKGS_INFO_BRIEF}"
	local pkgs_info=$(cat "${AVAIL_PKGS_INFO_BRIEF}" | sort -k1,1 -k2,2 -k3n -t ";")
	echo "${pkgs_info}" > "${AVAIL_PKGS_INFO_BRIEF}"
	print_dbg
}

function smart_kopt_pkgs_map ()
{
	local kopts="${@}"
	kopts=$(echo "${kopts}" | sed -e "s%CONFIG_\(.*\)=y%\1;|%g" | tr -d "\n" | sed "$ s/.$//")
	grep -E "${kopts}" "${AVAIL_PKGS_INFO_BRIEF}" | awk -F";" '{print $3}'
}

function smart_pkgs_kopt_map ()
{
	local pkgs="${@}"
	pkgs=$(echo "${pkgs}" | sed -e "s%\(.*\)@.*%\1|%g" | tr -d "\n" | sed "$ s/.$//" | tr "+" ".")
	cat "${AVAIL_PKGS_INFO_BRIEF}" | awk -F";" '{printf("%s;%s\n",$5,$6)}' | grep -E "${pkgs}" | awk -F";" '{printf("CONFIG_%s=y\n",$2)}'
}

function smart_pkgs_pname_map ()
{
	local pkgs="${@}"
	pkgs=$(echo "${pkgs}" | sed -e "s%\(.*\)@.*%;\1@|%g" | tr -d "\n" | sed "$ s/.$//" | tr "+" ".")
	echo "${pkgs}" > pkgs_to_install_grep
	grep -E "${pkgs}" "${AVAIL_PKGS_INFO_BRIEF}" | awk -F";" '{print $3}'
}

function smart_gen_kconfig_file ()
{
	local pbreif_md5sum=0
	if [ -f "${AVAIL_PKGS_INFO_BRIEF}" ]; then
		pbrief_md5sum=$(md5sum "${AVAIL_PKGS_INFO_BRIEF}" | awk '{print $1}')
	fi
	if ! smart_gen_pkgs_info_brief_file $@; then
		exit_err "Failed to generate packages infomation brief file."
	fi
	local brief_md5sum=$(md5sum "${AVAIL_PKGS_INFO_BRIEF}" | awk '{print $1}')
	if [ ! -f "${KCONFIG_PKGS_FILE}" ] || [ ! -f "${KCONFIG_PKGS_DEFAULT}" ] || [ ! "${pbrief_md5sum}" == "${brief_md5sum}" ]; then
		print_info "Generating the Kconfig file, it can take some time. Please don't close the console."
		smart_gen_kconfig "${AVAIL_PKGS_INFO_BRIEF}" > "${KCONFIG_PKGS_FILE}"
		if [ ! $? -eq 0 ]; then
			mv "${KCONFIG_PKGS_FILE}" "${KCONFIG_PKGS_FILE}.broken"
		fi
		smart_gen_default_pkgs_kconfig "${AVAIL_PKGS_INFO_BRIEF}" > "${KCONFIG_PKGS_DEFAULT}"
	fi
}

function smart_get_pkgs_to_targetroot ()
{
	local configf="$1"
	local pkgf="${2}"
	shift; shift;
	if [ ! -f "${configf}" ]; then
		exit_err "Config file doesn't exist."
	fi
	if ! smart_gen_pkgs_info_brief_file $@; then
		exit_err "Failed to generate packages information brief file."
	fi
	local pkgs_info_list=$(cat "${AVAIL_PKGS_INFO_BRIEF}")
	local pkgs=""
	local non_pkgs_opts=$(cat "${configf}" | grep "^CONFIG_" | grep -v "^CONFIG_ROOTFS_PACKAGES_")
	local pkgs_opts=$(cat "${configf}" | grep "^CONFIG_ROOTFS_PACKAGES_")

	local pkgs=$(smart_kopt_pkgs_map "${pkgs_opts}")
	echo "${pkgs}" > pkgs_before
	print_info "Checking packages to install."
	local pkgs_to_install=$(${FAKEROOT} smart ${OFLAGS} install --dump ${pkgs}  2>&1 >/dev/null | grep -e ".*@.*")
	if echo "${pkgs_to_install}" | grep "error:" 1>&2; then
		exit_err "Failed to generate the list of packages to install based on the selected packages."
	fi
	local kpkgs_to_install=$(smart_pkgs_kopt_map "${pkgs_to_install}")
	local kpkgs_old_md5sum=$(md5sum < <(echo "${pkgs_opts}") | cut -d" " -f1)
	local kpkgs_md5sum=$(md5sum < <(echo "${kpkgs_to_install}") | cut -d" " -f1)
	if [ ! "${kpkgs_old_md5sum}" == "${kpkgs_md5sum}" ]; then
		echo "${non_pkgs_opts}" > "${configf}"
		echo -e "${kpkgs_to_install}" >> "${configf}"
	fi
	echo "${pkgs_to_install}" > pkgs_to_install_raw
	echo "$(smart_pkgs_pname_map "${pkgs_to_install}")" > "${pkgf}"
}

function smart_install_pkgs ()
{
	local pkgs_f="$1"
	local attempt="$2"
	shift; shift;
	if [ ! -f "${pkgs_f}" ]; then
		exit_err "Failed to install packages since packages list file \"${pkgs_f}\" doesn't exist."
	fi
	local pkgs=$(cat "${pkgs_f}")
	smart_common $@
	if [ "${IMAGE_ROOTFS}" == "${TARGETDIR}" ]; then
		smart_channel_reinstall
	fi
	if ! $FAKEROOT smart ${OFLAGS} update; then
		exit_err "Failed to install pakcages because failed to do smart update."
	fi
	if [ "${attempt}" == "y" ]; then
		local attempt_opt="--attempt"
	else
		local attempt_opt=""
	fi
	if ! $FAKEROOT smart ${OFLAGS} install ${attempt_opt} -y ${pkgs}; then
		exit_err "Failed to install pakcages."
	fi
}

function smart_get_dev_pkgs ()
{
	local pkgs_f="$1"
	local devpkgs_f="$2"
	shift; shift;
	if [ ! -f "${pkgs_f}" ]; then
		exit_err "Failed to install packages since packages list file \"${pkgs_f}\" doesn't exist."
	fi
	local pkgs=$(cat "${pkgs_f}")
	local providesf="baseroot_provides"
	smart_common $@
	if ! $FAKEROOT smart ${OFLAGS} query --show-provides --output "${providesf}" ${pkgs}; then
		exit_err "Failed to get pakcages provides information."
	fi

	local popts=$(grep -v -E "^[a-zA-Z]|Provides" "${providesf}" | awk '{print $1}' \
		| sort | uniq | grep -v -E "\-dev$|\-dbg$|^$" \
		| awk '{printf("-e \"%s-dev;\"\n-e \"%s-dbg;\"\n",$1,$1)}' \
		| tr "+" ".")
	eval grep ${popts} "${AVAIL_PKGS_INFO_BRIEF}" | awk -F";" '{print $3}' > "${devpkgs_f}"
	local extra_pkgs="linux-libc-headers-dev
linux-libc-headers-dbg
"
	echo "${extra_pkgs}" >> "${devpkgs_f}"
	awk '
/libgcc-s1/ {
	printf("libgcc-s-dev\nlibgcc-s-dbg\n");
}

/libpng16-16/ {
	printf("libpng16-dev\nlibpng16-dbg\n");
}

/libqt5svg5/ {
	printf("libqt5svg-dev\nlibqt5svg-dbg\n");
}

/libmali1/ {
	printf("libmali-dev\nlibmali-dbg\n");
}

/libz1/ {
	printf("libz-dev\nlibz-dbg\n");
}' < <(echo "${pkgs}") >> "${devpkgs_f}"
}

function smart_rm_channels ()
{
	smart_common $@
	if ! smart_channel_remove; then
		exit_err "smart failed to remove channles."
	fi
}

function smart_plnx_locate_repo ()
{
	local sysconf=$(readlink -f "${1}")
	local repo_url_kopt="CONFIG_SUBSYSTEM_COMPONENT_ROOTFS_PACKAGE_REPO_URL"
	if [ -z "${sysconf}" ]; then
		exit_err "System config: \"${1}\" doesn't exist."
	fi
	local repos=""
	local repourl=""
	local repo_total=4
	for ((i=0; i<${repo_total}; i++)); do
		repourl=$(grep "^${repo_url_kopt}${i}=" "${sysconf}" | awk -F"=" '{print $2}')
		if [ ! -z "${repourl}" ]; then
			repos[$i]=$(eval echo "${repourl}")
		else
			break
		fi
	done
	if [ -z "${repos[0]}" ]; then
		local repourl_str="\"file:///\${PETALINUX}/components/packages-repo/plnx-repo\""
		if grep -q -e "${repo_url_kopt}[ =]" "${sysconf}"; then
			sed -i -e "s%.*\(${repo_url_kopt}0\)[ =].*%\1=${repourl_str}%g" "${sysconf}"
		else
			echo "${repo_url_kopt}0=${repourl_str}" >> "${sysconf}"
		fi
		repos[0]=$(eval echo "${repourl}")
	fi
	echo "${repos[@]}"
}

function smart_repos_is_different ()
{
	local sysconf="$1"
	local old_repo_file="$2"
	local repo_opt="CONFIG_SUBSYSTEM_COMPONENT_ROOTFS_PACKAGE_REPO_URL"
	local oldrepos=$(grep "^${repo_opt}" "${old_repo_file}" 2>/dev/null)
	local newrepos=$(grep "^${repo_opt}" "${sysconf}")

	if [ ! "${oldrepos}" == "${newrepos}" ]; then
		echo "y"
	fi
}

CMD=$1
shift

if [ -z "${WORK_ROOT}" ]; then
	WORK_ROOT=$(pwd)
fi
mkdir -p "${WORK_ROOT}"

pushd "${WORK_ROOT}" 1>/dev/null
smart_${CMD} $@
popd 1>/dev/null
