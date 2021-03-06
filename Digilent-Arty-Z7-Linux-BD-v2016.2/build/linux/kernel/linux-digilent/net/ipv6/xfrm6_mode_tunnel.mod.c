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
	{ 0xf646dc65, __VMLINUX_SYMBOL_STR(xfrm6_prepare_output) },
	{ 0xad2db2e5, __VMLINUX_SYMBOL_STR(xfrm_prepare_input) },
	{ 0x1be7ac21, __VMLINUX_SYMBOL_STR(xfrm_unregister_mode) },
	{ 0xd7309a5a, __VMLINUX_SYMBOL_STR(xfrm_register_mode) },
	{ 0x47ebb753, __VMLINUX_SYMBOL_STR(pskb_expand_head) },
	{ 0x99bb8806, __VMLINUX_SYMBOL_STR(memmove) },
	{ 0x8b5ceeb7, __VMLINUX_SYMBOL_STR(__pskb_pull_tail) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0x95d5be51, __VMLINUX_SYMBOL_STR(ip6_dst_hoplimit) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=ipv6";

