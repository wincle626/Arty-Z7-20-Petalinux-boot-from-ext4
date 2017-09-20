cmd_lib/decompress.o := arm-linux-gnueabihf-gcc -Wp,-MD,lib/.decompress.o.d  -nostdinc -isystem /opt/petalinux/petalinux-v2016.2-final/tools/linux-i386/gcc-arm-linux-gnueabi/bin/../lib/gcc/arm-linux-gnueabihf/4.9.2/include -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include -Iarch/arm/include/generated/uapi -Iarch/arm/include/generated  -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include -Iinclude -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi -Iinclude/generated/uapi -include /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/kconfig.h  -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/lib -Ilib -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Os -Wno-maybe-uninitialized --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(decompress)"  -D"KBUILD_MODNAME=KBUILD_STR(decompress)" -c -o lib/.tmp_decompress.o /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/lib/decompress.c

source_lib/decompress.o := /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/lib/decompress.c

deps_lib/decompress.o := \
    $(wildcard include/config/decompress/gzip.h) \
    $(wildcard include/config/decompress/bzip2.h) \
    $(wildcard include/config/decompress/lzma.h) \
    $(wildcard include/config/decompress/xz.h) \
    $(wildcard include/config/decompress/lzo.h) \
    $(wildcard include/config/decompress/lz4.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/decompress/generic.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/decompress/bunzip2.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/decompress/unlzma.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/decompress/unxz.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/decompress/inflate.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/decompress/unlzo.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/decompress/unlz4.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/linux/types.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/asm/types.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/asm-generic/int-ll64.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/asm-generic/bitsperlong.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/asm-generic/bitsperlong.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/linux/posix_types.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/stddef.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/linux/stddef.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/uapi/asm/posix_types.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/asm-generic/posix_types.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /opt/petalinux/petalinux-v2016.2-final/tools/linux-i386/gcc-arm-linux-gnueabi/lib/gcc/arm-linux-gnueabihf/4.9.2/include/stdarg.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/linux/string.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/asm/string.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/lto.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/kern_levels.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/linkage.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/stringify.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/asm/linkage.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/cache.h \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/linux/kernel.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/linux/sysinfo.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/dynamic_debug.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/errno.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/linux/errno.h \
  arch/arm/include/generated/asm/errno.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/asm-generic/errno.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/asm-generic/errno-base.h \

lib/decompress.o: $(deps_lib/decompress.o)

$(deps_lib/decompress.o):
