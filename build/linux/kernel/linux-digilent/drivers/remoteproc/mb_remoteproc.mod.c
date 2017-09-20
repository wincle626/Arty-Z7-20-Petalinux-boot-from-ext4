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
	{ 0x9ebe08e1, __VMLINUX_SYMBOL_STR(rproc_vq_interrupt) },
	{ 0xa233098c, __VMLINUX_SYMBOL_STR(rproc_add) },
	{ 0xf35406f6, __VMLINUX_SYMBOL_STR(rproc_alloc) },
	{ 0xe7c98531, __VMLINUX_SYMBOL_STR(of_get_property) },
	{ 0x5f5b922f, __VMLINUX_SYMBOL_STR(devm_ioremap_resource) },
	{ 0xf4acc22b, __VMLINUX_SYMBOL_STR(of_find_device_by_node) },
	{ 0xd60dcd2, __VMLINUX_SYMBOL_STR(of_parse_phandle) },
	{ 0x7626f115, __VMLINUX_SYMBOL_STR(gpiod_to_irq) },
	{ 0xa228d6d5, __VMLINUX_SYMBOL_STR(devm_gpio_request_one) },
	{ 0x3d627d29, __VMLINUX_SYMBOL_STR(of_get_named_gpio_flags) },
	{ 0xfba8e16c, __VMLINUX_SYMBOL_STR(devm_request_threaded_irq) },
	{ 0x496bedd3, __VMLINUX_SYMBOL_STR(platform_get_irq) },
	{ 0x6e10166c, __VMLINUX_SYMBOL_STR(dma_supported) },
	{ 0xee5476ea, __VMLINUX_SYMBOL_STR(dma_declare_coherent_memory) },
	{ 0x530f290, __VMLINUX_SYMBOL_STR(platform_get_resource) },
	{ 0x84940cd6, __VMLINUX_SYMBOL_STR(devm_kmalloc) },
	{ 0x2d3385d3, __VMLINUX_SYMBOL_STR(system_wq) },
	{ 0xb2d48a2e, __VMLINUX_SYMBOL_STR(queue_work_on) },
	{ 0x5f58e930, __VMLINUX_SYMBOL_STR(release_firmware) },
	{ 0x9d669763, __VMLINUX_SYMBOL_STR(memcpy) },
	{ 0x7c6e9a4, __VMLINUX_SYMBOL_STR(request_firmware) },
	{ 0x5dcf6341, __VMLINUX_SYMBOL_STR(outer_cache) },
	{ 0x4298b775, __VMLINUX_SYMBOL_STR(v7_flush_kern_cache_all) },
	{ 0x8e865d3c, __VMLINUX_SYMBOL_STR(arm_delay_ops) },
	{ 0x98323838, __VMLINUX_SYMBOL_STR(gpiod_set_raw_value) },
	{ 0x693a159f, __VMLINUX_SYMBOL_STR(gpio_to_desc) },
	{ 0x87b3bbcb, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0x9fe77070, __VMLINUX_SYMBOL_STR(rproc_put) },
	{ 0x439aa588, __VMLINUX_SYMBOL_STR(rproc_del) },
	{ 0x624922eb, __VMLINUX_SYMBOL_STR(dma_release_declared_memory) },
	{ 0x3d51bbd, __VMLINUX_SYMBOL_STR(_dev_info) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=remoteproc";

MODULE_ALIAS("of:N*T*Cxlnx,mb_remoteproc*");
