cmd_arch/arm/kernel/vmlinux.lds := arm-linux-gnueabihf-gcc -E -Wp,-MD,arch/arm/kernel/.vmlinux.lds.d  -nostdinc -isystem /opt/petalinux/petalinux-v2016.2-final/tools/linux-i386/gcc-arm-linux-gnueabi/bin/../lib/gcc/arm-linux-gnueabihf/4.9.2/include -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include -Iarch/arm/include/generated/uapi -Iarch/arm/include/generated  -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include -Iinclude -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi -Iinclude/generated/uapi -include /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -DTEXT_OFFSET=0x00008000 -P -C -Uarm -D__ASSEMBLY__ -DLINKER_SCRIPT -o arch/arm/kernel/vmlinux.lds /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/kernel/vmlinux.lds.S

source_arch/arm/kernel/vmlinux.lds := /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/kernel/vmlinux.lds.S

deps_arch/arm/kernel/vmlinux.lds := \
    $(wildcard include/config/arm/kernmem/perms.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/smp/on/up.h) \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/xip/phys/addr.h) \
    $(wildcard include/config/debug/rodata.h) \
    $(wildcard include/config/arm/unwind.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/have/tcm.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/asm-generic/vmlinux.lds.h \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/kprobes.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/syscalls.h) \
    $(wildcard include/config/serial/earlycon.h) \
    $(wildcard include/config/clksrc/of.h) \
    $(wildcard include/config/irqchip.h) \
    $(wildcard include/config/common/clk.h) \
    $(wildcard include/config/of/iommu.h) \
    $(wildcard include/config/of/reserved/mem.h) \
    $(wildcard include/config/cpu/idle.h) \
    $(wildcard include/config/acpi.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/pm/trace.h) \
    $(wildcard include/config/blk/dev/initrd.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/arm/lpae.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/asm-generic/getorder.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/uapi/linux/const.h \
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
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/linux/sizes.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \

arch/arm/kernel/vmlinux.lds: $(deps_arch/arm/kernel/vmlinux.lds)

$(deps_arch/arm/kernel/vmlinux.lds):
