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
	{ 0x6c09c2a4, __VMLINUX_SYMBOL_STR(del_timer) },
	{ 0x685ccac3, __VMLINUX_SYMBOL_STR(param_ops_bool) },
	{ 0x9580deb, __VMLINUX_SYMBOL_STR(init_timer_key) },
	{ 0x7d11c268, __VMLINUX_SYMBOL_STR(jiffies) },
	{ 0x6025b302, __VMLINUX_SYMBOL_STR(usb_ep_autoconfig_reset) },
	{ 0x88bea0fd, __VMLINUX_SYMBOL_STR(usb_otg_descriptor_init) },
	{ 0xdec9ab2d, __VMLINUX_SYMBOL_STR(param_ops_charp) },
	{ 0x706d051c, __VMLINUX_SYMBOL_STR(del_timer_sync) },
	{ 0xf6c9ef74, __VMLINUX_SYMBOL_STR(usb_put_function_instance) },
	{ 0x16e5c2a, __VMLINUX_SYMBOL_STR(mod_timer) },
	{ 0xda8aad93, __VMLINUX_SYMBOL_STR(usb_otg_descriptor_alloc) },
	{ 0xf85e7294, __VMLINUX_SYMBOL_STR(usb_composite_overwrite_options) },
	{ 0x3d51bbd, __VMLINUX_SYMBOL_STR(_dev_info) },
	{ 0x22b12fa2, __VMLINUX_SYMBOL_STR(usb_composite_probe) },
	{ 0x15ac73e4, __VMLINUX_SYMBOL_STR(usb_add_function) },
	{ 0xe7b38738, __VMLINUX_SYMBOL_STR(usb_put_function) },
	{ 0x50b1d508, __VMLINUX_SYMBOL_STR(usb_composite_unregister) },
	{ 0xe1130df5, __VMLINUX_SYMBOL_STR(usb_get_function) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0xeb0976c7, __VMLINUX_SYMBOL_STR(usb_string_ids_tab) },
	{ 0x13a9287d, __VMLINUX_SYMBOL_STR(usb_add_config_only) },
	{ 0x71f262a8, __VMLINUX_SYMBOL_STR(usb_get_function_instance) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0xb342a03a, __VMLINUX_SYMBOL_STR(param_ops_ushort) },
	{ 0x7f02188f, __VMLINUX_SYMBOL_STR(__msecs_to_jiffies) },
	{ 0x1c2e2ce3, __VMLINUX_SYMBOL_STR(param_ops_uint) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=libcomposite";

