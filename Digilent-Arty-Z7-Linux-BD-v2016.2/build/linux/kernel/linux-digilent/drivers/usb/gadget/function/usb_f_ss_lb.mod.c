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
	{ 0xee57ea5d, __VMLINUX_SYMBOL_STR(kmalloc_caches) },
	{ 0x3b38b8bc, __VMLINUX_SYMBOL_STR(usb_free_all_descriptors) },
	{ 0xf7802486, __VMLINUX_SYMBOL_STR(__aeabi_uidivmod) },
	{ 0x31640d39, __VMLINUX_SYMBOL_STR(usb_ep_autoconfig_release) },
	{ 0x4cb84431, __VMLINUX_SYMBOL_STR(mutex_unlock) },
	{ 0x91715312, __VMLINUX_SYMBOL_STR(sprintf) },
	{ 0xca808cc1, __VMLINUX_SYMBOL_STR(usb_function_unregister) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0x5f754e5a, __VMLINUX_SYMBOL_STR(memset) },
	{ 0xf6c9ef74, __VMLINUX_SYMBOL_STR(usb_put_function_instance) },
	{ 0x5a5a94a6, __VMLINUX_SYMBOL_STR(kstrtou8) },
	{ 0x87b3bbcb, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0xbb1ac380, __VMLINUX_SYMBOL_STR(__mutex_init) },
	{ 0xe0e2fc89, __VMLINUX_SYMBOL_STR(usb_ep_autoconfig) },
	{ 0xc78872f2, __VMLINUX_SYMBOL_STR(mutex_lock) },
	{ 0xf35c45d, __VMLINUX_SYMBOL_STR(config_group_init_type_name) },
	{ 0x5f1ff848, __VMLINUX_SYMBOL_STR(usb_function_register) },
	{ 0x17506ac5, __VMLINUX_SYMBOL_STR(kmem_cache_alloc) },
	{ 0xe45f99c5, __VMLINUX_SYMBOL_STR(alloc_ep_req) },
	{ 0x5ac15bae, __VMLINUX_SYMBOL_STR(kstrtou16) },
	{ 0x7214e2bf, __VMLINUX_SYMBOL_STR(config_ep_by_speed) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0xa46f2f1b, __VMLINUX_SYMBOL_STR(kstrtouint) },
	{ 0x4a577402, __VMLINUX_SYMBOL_STR(usb_string_id) },
	{ 0x9443f4e1, __VMLINUX_SYMBOL_STR(usb_assign_descriptors) },
	{ 0xcdce012d, __VMLINUX_SYMBOL_STR(usb_interface_id) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=libcomposite,configfs";

