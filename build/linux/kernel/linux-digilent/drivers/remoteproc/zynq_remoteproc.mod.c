#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

MODULE_INFO(intree, "Y");

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x951ca67e, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0xdec9ab2d, __VMLINUX_SYMBOL_STR(param_ops_charp) },
	{ 0x96114fff, __VMLINUX_SYMBOL_STR(platform_driver_unregister) },
	{ 0x3d47ec15, __VMLINUX_SYMBOL_STR(__platform_driver_register) },
	{ 0xee57ea5d, __VMLINUX_SYMBOL_STR(kmalloc_caches) },
	{ 0xa233098c, __VMLINUX_SYMBOL_STR(rproc_add) },
	{ 0xf35406f6, __VMLINUX_SYMBOL_STR(rproc_alloc) },
	{ 0xe7c98531, __VMLINUX_SYMBOL_STR(of_get_property) },
	{ 0x2215d4f9, __VMLINUX_SYMBOL_STR(set_ipi_handler) },
	{ 0xb97f8687, __VMLINUX_SYMBOL_STR(of_property_read_u32_array) },
	{ 0xd6b8e852, __VMLINUX_SYMBOL_STR(request_threaded_irq) },
	{ 0x17506ac5, __VMLINUX_SYMBOL_STR(kmem_cache_alloc) },
	{ 0x496bedd3, __VMLINUX_SYMBOL_STR(platform_get_irq) },
	{ 0x6e10166c, __VMLINUX_SYMBOL_STR(dma_supported) },
	{ 0xee5476ea, __VMLINUX_SYMBOL_STR(dma_declare_coherent_memory) },
	{ 0x530f290, __VMLINUX_SYMBOL_STR(platform_get_resource) },
	{ 0x84940cd6, __VMLINUX_SYMBOL_STR(devm_kmalloc) },
	{ 0x7cb1ae69, __VMLINUX_SYMBOL_STR(cpu_down) },
	{ 0x2d3385d3, __VMLINUX_SYMBOL_STR(system_wq) },
	{ 0xb2d48a2e, __VMLINUX_SYMBOL_STR(queue_work_on) },
	{ 0x9ebe08e1, __VMLINUX_SYMBOL_STR(rproc_vq_interrupt) },
	{ 0x2f4ac89e, __VMLINUX_SYMBOL_STR(zynq_cpun_start) },
	{ 0x822137e2, __VMLINUX_SYMBOL_STR(arm_heavy_mb) },
	{ 0xe07ca631, __VMLINUX_SYMBOL_STR(cpu_bit_bitmap) },
	{ 0x84bbaba8, __VMLINUX_SYMBOL_STR(gic_raise_softirq) },
	{ 0x56d697ce, __VMLINUX_SYMBOL_STR(cpu_up) },
	{ 0x9fe77070, __VMLINUX_SYMBOL_STR(rproc_put) },
	{ 0x439aa588, __VMLINUX_SYMBOL_STR(rproc_del) },
	{ 0x99bd722b, __VMLINUX_SYMBOL_STR(clear_ipi_handler) },
	{ 0x624922eb, __VMLINUX_SYMBOL_STR(dma_release_declared_memory) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0xf20dabd8, __VMLINUX_SYMBOL_STR(free_irq) },
	{ 0x3d51bbd, __VMLINUX_SYMBOL_STR(_dev_info) },
	{ 0xdafd2cd3, __VMLINUX_SYMBOL_STR(gic_set_cpu) },
	{ 0x87b3bbcb, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=remoteproc";

MODULE_ALIAS("of:N*T*Cxlnx,zynq_remoteproc*");
