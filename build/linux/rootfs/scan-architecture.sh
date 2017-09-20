#!/bin/bash

function is_mcpu()
{
	echo "$*" | grep -q "\-mcpu=v[0-9]\{1,2\}.[0-9]\{1,2\}"
	return $?
}

function convert_mcpu_to_version()
{
	mcpu_whole_ver=$(echo "$*" | grep -o "[0-9]\{1,2\}.[0-9]\{1,2\}")
	echo $(($((${mcpu_whole_ver%.*} * 100)) + ${mcpu_whole_ver#*.}))
}

function check_flags()
{
	MATCHES=y
	for i in $*; do
		if is_mcpu $i; then
			CPU_VER_FLAG=$(convert_mcpu_to_version $i)
		else
			CPU_VER_FLAG=
		fi

		FLAG_IN_CFLAGS=n
		for j in $CFLAGS; do
			if is_mcpu $j; then
				if [ ! -z "$CPU_VER_FLAG" ]; then
					CPU_VER_FLAG_CFLAG=$(convert_mcpu_to_version $j)
					if [ ! -z "$CPU_VER_FLAG_CFLAG" -a $CPU_VER_FLAG_CFLAG -ge $CPU_VER_FLAG ]; then
						FLAG_IN_CFLAGS=y
					fi
				fi
			fi
			if [ "$i" = "$j" ]; then
				FLAG_IN_CFLAGS=y
			fi
		done

		if [ "$FLAG_IN_CFLAGS" = "y" ];then
			MATCHES=$MATCHES
		else
			MATCHES=n
		fi
	done

	if [ "$MATCHES" = "y" ]; then
		return 0
	else
		return 255
	fi
}

CFLAGS=$*

if [ "$MACHINE" = "microblazeel" ]; then
	# MicroBlaze Package Definitions
	PACKAGE_MICROBLAZEEL_LITE="-mno-xl-soft-mul -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.30.a"
	PACKAGENAME_MICROBLAZEEL_LITE="microblazeel_v8.30_bs_cmp_ml"
	PACKAGE_MICROBLAZEEL_FULL="-mno-xl-soft-mul -mxl-multiply-high -mno-xl-soft-div -mxl-barrel-shift -mxl-pattern-compare -mcpu=v8.30.a"
	PACKAGENAME_MICROBLAZEEL_FULL="microblazeel_v8.30_bs_cmp_mh_div"

	# Check if lite is supported
	if check_flags $PACKAGE_MICROBLAZEEL_LITE; then
		PACKAGE_ARCH=$PACKAGENAME_MICROBLAZEEL_LITE
	fi
	# Check if full is supported
	if check_flags $PACKAGE_MICROBLAZEEL_FULL; then
		PACKAGE_ARCH=$PACKAGENAME_MICROBLAZEEL_FULL
	fi
elif [ "$MACHINE" = "arm" ]; then
	# Only one ARM platform (A9/Zynq)
	PACKAGE_ARCH="cortexa9hf_vfp_neon"
elif [ "${MACHINE}" == "aarch64" ]; then
	PACKAGE_ARCH="aarch64"
fi

if [ -z "$PACKAGE_ARCH" ]; then
	echo "ERROR: Failed to detect package architecture. Actual ARCH: ${CFLAGS}."
	if [ "$MACHINE" = "microblazeel" ]; then
		echo "Minimum requirements: ${PACKAGE_MICROBLAZEEL_LITE}"
	fi
	exit 255
fi
echo $PACKAGE_ARCH

