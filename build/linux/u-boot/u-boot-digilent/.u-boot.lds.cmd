cmd_u-boot.lds := arm-linux-gnueabihf-gcc -E -Wp,-MD,./.u-boot.lds.d -D__KERNEL__ -D__UBOOT__   -D__ARM__ -marm -mno-thumb-interwork  -mabi=aapcs-linux  -mword-relocations  -fno-pic  -mno-unaligned-access  -ffunction-sections -fdata-sections -fno-common -ffixed-r9  -msoft-float   -pipe  -march=armv7-a  -I/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/mach-zynq/include -Iinclude  -I/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include  -I/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/include -include /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/linux/kconfig.h  -nostdinc -isystem /opt/petalinux/petalinux-v2016.2-final/tools/linux-i386/gcc-arm-linux-gnueabi/bin/../lib/gcc/arm-linux-gnueabihf/4.9.2/include -include /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/u-boot/u-boot.lds.h -DCPUDIR=arch/arm/cpu/armv7  -ansi -D__ASSEMBLY__ -x assembler-with-cpp -P -o u-boot.lds /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/mach-zynq/u-boot.lds

source_u-boot.lds := /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/mach-zynq/u-boot.lds

deps_u-boot.lds := \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/u-boot/u-boot.lds.h \

u-boot.lds: $(deps_u-boot.lds)

$(deps_u-boot.lds):
