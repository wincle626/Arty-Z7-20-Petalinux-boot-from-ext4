cmd_tools/envcrc.o := cc -Wp,-MD,tools/.envcrc.o.d -Itools -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -DCONFIG_FIT_SIGNATURE -include /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/libfdt_env.h -idirafterinclude -idirafter/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include -idirafter/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/include   -I/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/lib/libfdt   -I/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/tools -DCONFIG_SYS_TEXT_BASE=0x4000000 -DUSE_HOSTCC -D__KERNEL_STRICT_NAMES -D_GNU_SOURCE -c -o tools/envcrc.o /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/tools/envcrc.c

source_tools/envcrc.o := /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/tools/envcrc.c

deps_tools/envcrc.o := \
    $(wildcard include/config/env/is/in/flash.h) \
    $(wildcard include/config/env/addr.h) \
    $(wildcard include/config/sys/flash/base.h) \
    $(wildcard include/config/env/offset.h) \
    $(wildcard include/config/env/addr/redund.h) \
    $(wildcard include/config/env/offset/redund.h) \
    $(wildcard include/config/env/size.h) \
    $(wildcard include/config/env/sect/size.h) \
    $(wildcard include/config/env/size/redund.h) \
    $(wildcard include/config/sys/monitor/base.h) \
    $(wildcard include/config/sys/monitor/len.h) \
    $(wildcard include/config/sys/redundand/environment.h) \
    $(wildcard include/config/build/envcrc.h) \
  /usr/include/stdc-predef.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/libfdt_env.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/compiler.h \
    $(wildcard include/config/use/stdint.h) \
  /usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h \
  /usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/features.h \
  /usr/include/x86_64-linux-gnu/sys/cdefs.h \
  /usr/include/x86_64-linux-gnu/bits/wordsize.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs-64.h \
  /usr/include/x86_64-linux-gnu/bits/wchar.h \
  /usr/include/errno.h \
  /usr/include/x86_64-linux-gnu/bits/errno.h \
  /usr/include/linux/errno.h \
  /usr/include/x86_64-linux-gnu/asm/errno.h \
  /usr/include/asm-generic/errno.h \
  /usr/include/asm-generic/errno-base.h \
  /usr/include/stdlib.h \
  /usr/include/x86_64-linux-gnu/bits/waitflags.h \
  /usr/include/x86_64-linux-gnu/bits/waitstatus.h \
  /usr/include/endian.h \
  /usr/include/x86_64-linux-gnu/bits/endian.h \
  /usr/include/x86_64-linux-gnu/bits/byteswap.h \
  /usr/include/x86_64-linux-gnu/bits/types.h \
  /usr/include/x86_64-linux-gnu/bits/typesizes.h \
  /usr/include/x86_64-linux-gnu/bits/byteswap-16.h \
  /usr/include/xlocale.h \
  /usr/include/x86_64-linux-gnu/sys/types.h \
  /usr/include/time.h \
  /usr/include/x86_64-linux-gnu/sys/select.h \
  /usr/include/x86_64-linux-gnu/bits/select.h \
  /usr/include/x86_64-linux-gnu/bits/sigset.h \
  /usr/include/x86_64-linux-gnu/bits/time.h \
  /usr/include/x86_64-linux-gnu/bits/select2.h \
  /usr/include/x86_64-linux-gnu/sys/sysmacros.h \
  /usr/include/x86_64-linux-gnu/bits/pthreadtypes.h \
  /usr/include/alloca.h \
  /usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h \
  /usr/include/x86_64-linux-gnu/bits/stdlib-float.h \
  /usr/include/x86_64-linux-gnu/bits/stdlib.h \
  /usr/include/stdio.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h \
  /usr/include/x86_64-linux-gnu/bits/stdio_lim.h \
  /usr/include/x86_64-linux-gnu/bits/sys_errlist.h \
  /usr/include/x86_64-linux-gnu/bits/stdio.h \
  /usr/include/x86_64-linux-gnu/bits/stdio2.h \
  /usr/include/string.h \
  /usr/include/x86_64-linux-gnu/bits/string.h \
  /usr/include/x86_64-linux-gnu/bits/string2.h \
  /usr/include/x86_64-linux-gnu/bits/string3.h \
  /usr/include/x86_64-linux-gnu/sys/mman.h \
  /usr/include/x86_64-linux-gnu/bits/mman.h \
  /usr/include/x86_64-linux-gnu/bits/mman-linux.h \
  /usr/include/fcntl.h \
  /usr/include/x86_64-linux-gnu/bits/fcntl.h \
  /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h \
  /usr/include/x86_64-linux-gnu/bits/uio.h \
  /usr/include/x86_64-linux-gnu/bits/stat.h \
  /usr/include/x86_64-linux-gnu/bits/fcntl2.h \
  /usr/include/byteswap.h \
  /usr/include/x86_64-linux-gnu/bits/timex.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
  /usr/include/linux/posix_types.h \
  /usr/include/linux/stddef.h \
  /usr/include/x86_64-linux-gnu/asm/posix_types.h \
  /usr/include/x86_64-linux-gnu/asm/posix_types_64.h \
  /usr/include/asm-generic/posix_types.h \
  /usr/include/x86_64-linux-gnu/asm/bitsperlong.h \
  /usr/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /usr/include/x86_64-linux-gnu/asm/types.h \
  /usr/include/asm-generic/types.h \
  /usr/include/asm-generic/int-ll64.h \
  /usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h \
  /usr/include/unistd.h \
  /usr/include/x86_64-linux-gnu/bits/posix_opt.h \
  /usr/include/x86_64-linux-gnu/bits/environments.h \
  /usr/include/x86_64-linux-gnu/bits/confname.h \
  /usr/include/getopt.h \
  /usr/include/x86_64-linux-gnu/bits/unistd.h \
  include/config.h \
    $(wildcard include/config/boarddir.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/config_defaults.h \
    $(wildcard include/config/defaults/h/.h) \
    $(wildcard include/config/bootm/linux.h) \
    $(wildcard include/config/bootm/netbsd.h) \
    $(wildcard include/config/bootm/plan9.h) \
    $(wildcard include/config/bootm/rtems.h) \
    $(wildcard include/config/bootm/vxworks.h) \
    $(wildcard include/config/gzip.h) \
    $(wildcard include/config/zlib.h) \
    $(wildcard include/config/partitions.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/config_uncmd_spl.h \
    $(wildcard include/config/uncmd/spl/h//.h) \
    $(wildcard include/config/spl/build.h) \
    $(wildcard include/config/spl/dm.h) \
    $(wildcard include/config/dm/serial.h) \
    $(wildcard include/config/dm/gpio.h) \
    $(wildcard include/config/dm/i2c.h) \
    $(wildcard include/config/dm/spi.h) \
    $(wildcard include/config/dm/warn.h) \
    $(wildcard include/config/dm/stdio.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/configs/zynq_artyz7.h \
    $(wildcard include/config/fit.h) \
    $(wildcard include/config/fit/verbose.h) \
    $(wildcard include/config/bootdelay.h) \
    $(wildcard include/config/cmd/mmc.h) \
    $(wildcard include/config/cmd/cache.h) \
    $(wildcard include/config/cmd/ext2.h) \
    $(wildcard include/config/cmd/ext4/write.h) \
    $(wildcard include/config/cmd/fat.h) \
    $(wildcard include/config/zynq/sdhci.h) \
    $(wildcard include/config/sys/hz.h) \
    $(wildcard include/config/of/libfdt.h) \
    $(wildcard include/config/sys/malloc/len.h) \
    $(wildcard include/config/sys/init/ram/addr.h) \
    $(wildcard include/config/sys/sdram/base.h) \
    $(wildcard include/config/sys/init/ram/size.h) \
    $(wildcard include/config/zynq/gem/phy/addr0.h) \
    $(wildcard include/config/sys/text/base.h) \
    $(wildcard include/config/zynq/usb.h) \
    $(wildcard include/config/zynq/i2c0.h) \
    $(wildcard include/config/zynq/i2c1.h) \
    $(wildcard include/config/sys/i2c/eeprom/addr/len.h) \
    $(wildcard include/config/cmd/eeprom.h) \
    $(wildcard include/config/display.h) \
    $(wildcard include/config/i2c/edid.h) \
    $(wildcard include/config/zynq/gem/spi/mac/offset.h) \
    $(wildcard include/config/sys/i2c/zynq.h) \
    $(wildcard include/config/sys/i2c.h) \
    $(wildcard include/config/sys/i2c/zynq/speed.h) \
    $(wildcard include/config/sys/i2c/zynq/slave.h) \
    $(wildcard include/config/usb/ehci.h) \
    $(wildcard include/config/usb/storage.h) \
    $(wildcard include/config/usb/ehci/zynq.h) \
    $(wildcard include/config/ehci/is/tdi.h) \
    $(wildcard include/config/usb/max/controller/count.h) \
    $(wildcard include/config/sys/dfu/data/buf/size.h) \
    $(wildcard include/config/usb/function/dfu.h) \
    $(wildcard include/config/dfu/ram.h) \
    $(wildcard include/config/usb/cable/check.h) \
    $(wildcard include/config/cmd/thor/download.h) \
    $(wildcard include/config/usb/function/thor.h) \
    $(wildcard include/config/display/boardinfo.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/configs/platform-auto.h \
    $(wildcard include/config/h.h) \
    $(wildcard include/config/zynq/ps/clk/freq.h) \
    $(wildcard include/config/sys/baudrate/table.h) \
    $(wildcard include/config/serial/multi.h) \
    $(wildcard include/config/sys/console/is/in/env.h) \
    $(wildcard include/config/hostname.h) \
    $(wildcard include/config/cpu/freq/hz.h) \
    $(wildcard include/config/armv7.h) \
    $(wildcard include/config/sys/l2cache/off.h) \
    $(wildcard include/config/clocks.h) \
    $(wildcard include/config/cmd/clk.h) \
    $(wildcard include/config/sys/cacheline/size.h) \
    $(wildcard include/config/sys/ldscript.h) \
    $(wildcard include/config/sys/sdram/size.h) \
    $(wildcard include/config/sys/memtest/start.h) \
    $(wildcard include/config/sys/memtest/end.h) \
    $(wildcard include/config/sys/load/addr.h) \
    $(wildcard include/config/nr/dram/banks.h) \
    $(wildcard include/config/sys/init/sp/addr.h) \
    $(wildcard include/config/zynq/serial.h) \
    $(wildcard include/config/zynq/serial/uart0.h) \
    $(wildcard include/config/baudrate.h) \
    $(wildcard include/config/sys/fault/echo/link/down.h) \
    $(wildcard include/config/sys/enet.h) \
    $(wildcard include/config/mii.h) \
    $(wildcard include/config/phy/gige.h) \
    $(wildcard include/config/phy/marvell.h) \
    $(wildcard include/config/phy/natsemi.h) \
    $(wildcard include/config/net/multi.h) \
    $(wildcard include/config/bootp/may/fail.h) \
    $(wildcard include/config/netconsole.h) \
    $(wildcard include/config/serverip.h) \
    $(wildcard include/config/ipaddr.h) \
    $(wildcard include/config/sf/default/speed.h) \
    $(wildcard include/config/sf/dual/flash.h) \
    $(wildcard include/config/sys/no/flash.h) \
    $(wildcard include/config/env/is/in/spi/flash.h) \
    $(wildcard include/config/zynq/sdhci0.h) \
    $(wildcard include/config/mmc.h) \
    $(wildcard include/config/generic/mmc.h) \
    $(wildcard include/config/sdhci.h) \
    $(wildcard include/config/support/vfat.h) \
    $(wildcard include/config/dos/partition.h) \
    $(wildcard include/config/fat/write.h) \
    $(wildcard include/config/zynq/sdhci/max/freq.h) \
    $(wildcard include/config/fpga.h) \
    $(wildcard include/config/fpga/xilinx.h) \
    $(wildcard include/config/fpga/zynqpl.h) \
    $(wildcard include/config/fpga/loadfs.h) \
    $(wildcard include/config/sys/timer/counts/down.h) \
    $(wildcard include/config/sys/timerbase.h) \
    $(wildcard include/config/sys/timer/counter.h) \
    $(wildcard include/config/cmd/gpio.h) \
    $(wildcard include/config/zynq/gpio.h) \
    $(wildcard include/config/sys/bootm/len.h) \
    $(wildcard include/config/bootp/serverip.h) \
    $(wildcard include/config/bootp/bootfilesize.h) \
    $(wildcard include/config/bootp/bootpath.h) \
    $(wildcard include/config/bootp/gateway.h) \
    $(wildcard include/config/bootp/hostname.h) \
    $(wildcard include/config/cmd/askenv.h) \
    $(wildcard include/config/cmdline/editing.h) \
    $(wildcard include/config/cmd/saves.h) \
    $(wildcard include/config/sys/cbsize.h) \
    $(wildcard include/config/sys/pbsize.h) \
    $(wildcard include/config/sys/prompt.h) \
    $(wildcard include/config/sys/maxargs.h) \
    $(wildcard include/config/sys/longhelp.h) \
    $(wildcard include/config/sys/usr/excep.h) \
    $(wildcard include/config/sys/hush/parser.h) \
    $(wildcard include/config/sys/prompt/hush/ps2.h) \
    $(wildcard include/config/bootargs.h) \
    $(wildcard include/config/env/overwrite.h) \
    $(wildcard include/config/lmb.h) \
    $(wildcard include/config/sys/bootmapsz.h) \
    $(wildcard include/config/preboot.h) \
    $(wildcard include/config/extra/env/settings.h) \
    $(wildcard include/config/bootcommand.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/include/asm/config.h \
    $(wildcard include/config/h/.h) \
    $(wildcard include/config/sys/boot/ramdisk/high.h) \
    $(wildcard include/config/arm64.h) \
    $(wildcard include/config/phys/64bit.h) \
    $(wildcard include/config/static/rela.h) \
    $(wildcard include/config/ls102xa.h) \
    $(wildcard include/config/cpu/pxa27x.h) \
    $(wildcard include/config/cpu/monahans.h) \
    $(wildcard include/config/cpu/pxa25x.h) \
    $(wildcard include/config/fsl/layerscape.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/config_fallbacks.h \
    $(wildcard include/config/fallbacks/h.h) \
    $(wildcard include/config/spl.h) \
    $(wildcard include/config/spl/pad/to.h) \
    $(wildcard include/config/spl/max/size.h) \
    $(wildcard include/config/fs/fat.h) \
    $(wildcard include/config/cmd/ext4.h) \
    $(wildcard include/config/fs/ext4.h) \
    $(wildcard include/config/ext4/write.h) \
    $(wildcard include/config/cmd/ide.h) \
    $(wildcard include/config/cmd/sata.h) \
    $(wildcard include/config/scsi.h) \
    $(wildcard include/config/cmd/usb.h) \
    $(wildcard include/config/cmd/part.h) \
    $(wildcard include/config/cmd/gpt.h) \
    $(wildcard include/config/systemace.h) \
    $(wildcard include/config/sandbox.h) \
    $(wildcard include/config/partition/uuids.h) \
    $(wildcard include/config/efi/partition.h) \
    $(wildcard include/config/random/uuid.h) \
    $(wildcard include/config/cmd/uuid.h) \
    $(wildcard include/config/bootp/pxe.h) \
    $(wildcard include/config/lib/uuid.h) \
    $(wildcard include/config/lib/rand.h) \
    $(wildcard include/config/lib/hw/rand.h) \
    $(wildcard include/config/api.h) \
    $(wildcard include/config/lcd.h) \
    $(wildcard include/config/cmd/bmp.h) \
    $(wildcard include/config/fit/signature.h) \
    $(wildcard include/config/image/format/legacy.h) \
    $(wildcard include/config/disable/image/legacy.h) \
    $(wildcard include/config/cmdline.h) \
    $(wildcard include/config/menu.h) \

tools/envcrc.o: $(deps_tools/envcrc.o)

$(deps_tools/envcrc.o):
