cmd_arch/arm/boot/dts/zynq-zed.dtb := mkdir -p arch/arm/boot/dts/ ; arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/boot/dts/.zynq-zed.dtb.d.pre.tmp -nostdinc -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/boot/dts -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/boot/dts/include -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/drivers/of/testcase-data -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/.zynq-zed.dtb.dts.tmp /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/boot/dts/zynq-zed.dts ; ./scripts/dtc/dtc -O dtb -o arch/arm/boot/dts/zynq-zed.dtb -b 0 -i /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/boot/dts/  -d arch/arm/boot/dts/.zynq-zed.dtb.d.dtc.tmp arch/arm/boot/dts/.zynq-zed.dtb.dts.tmp ; cat arch/arm/boot/dts/.zynq-zed.dtb.d.pre.tmp arch/arm/boot/dts/.zynq-zed.dtb.d.dtc.tmp > arch/arm/boot/dts/.zynq-zed.dtb.d

source_arch/arm/boot/dts/zynq-zed.dtb := /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/boot/dts/zynq-zed.dts

deps_arch/arm/boot/dts/zynq-zed.dtb := \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/boot/dts/zynq-7000.dtsi \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/boot/dts/skeleton.dtsi \

arch/arm/boot/dts/zynq-zed.dtb: $(deps_arch/arm/boot/dts/zynq-zed.dtb)

$(deps_arch/arm/boot/dts/zynq-zed.dtb):
