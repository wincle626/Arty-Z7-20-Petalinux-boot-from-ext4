cmd_arch/arm/dts/zynq-zybo.dtb := mkdir -p arch/arm/dts/ ; arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/dts/.zynq-zybo.dtb.d.pre.tmp -nostdinc -I/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/dts -I/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/dts/include -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/dts/.zynq-zybo.dtb.dts.tmp /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/dts/zynq-zybo.dts ; dtc -O dtb -o arch/arm/dts/zynq-zybo.dtb -b 0 -i /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/dts/  -d arch/arm/dts/.zynq-zybo.dtb.d.dtc.tmp arch/arm/dts/.zynq-zybo.dtb.dts.tmp ; cat arch/arm/dts/.zynq-zybo.dtb.d.pre.tmp arch/arm/dts/.zynq-zybo.dtb.d.dtc.tmp > arch/arm/dts/.zynq-zybo.dtb.d

source_arch/arm/dts/zynq-zybo.dtb := /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/dts/zynq-zybo.dts

deps_arch/arm/dts/zynq-zybo.dtb := \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/dts/zynq-7000.dtsi \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/dts/skeleton.dtsi \

arch/arm/dts/zynq-zybo.dtb: $(deps_arch/arm/dts/zynq-zybo.dtb)

$(deps_arch/arm/dts/zynq-zybo.dtb):
