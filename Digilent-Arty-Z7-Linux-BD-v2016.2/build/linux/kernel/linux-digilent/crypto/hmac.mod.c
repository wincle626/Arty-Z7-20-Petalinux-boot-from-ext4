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
	{ 0x569e7b91, __VMLINUX_SYMBOL_STR(crypto_unregister_template) },
	{ 0xd6d6b96d, __VMLINUX_SYMBOL_STR(crypto_register_template) },
	{ 0xd8649c1c, __VMLINUX_SYMBOL_STR(crypto_mod_put) },
	{ 0xa804a884, __VMLINUX_SYMBOL_STR(shash_free_instance) },
	{ 0x4e6cd324, __VMLINUX_SYMBOL_STR(shash_register_instance) },
	{ 0x56c62cd0, __VMLINUX_SYMBOL_STR(crypto_init_shash_spawn) },
	{ 0xf0997058, __VMLINUX_SYMBOL_STR(crypto_alloc_instance2) },
	{ 0xa73050fc, __VMLINUX_SYMBOL_STR(shash_attr_alg) },
	{ 0xd16712f3, __VMLINUX_SYMBOL_STR(crypto_check_attr_type) },
	{ 0xa735c74e, __VMLINUX_SYMBOL_STR(crypto_spawn_tfm2) },
	{ 0xb4cf9894, __VMLINUX_SYMBOL_STR(crypto_destroy_tfm) },
	{ 0xd01618c1, __VMLINUX_SYMBOL_STR(crypto_shash_final) },
	{ 0x3b8915ff, __VMLINUX_SYMBOL_STR(crypto_shash_finup) },
	{ 0x2e5810c6, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr1) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0x9d669763, __VMLINUX_SYMBOL_STR(memcpy) },
	{ 0x8d7426a6, __VMLINUX_SYMBOL_STR(crypto_shash_digest) },
	{ 0xc832e56d, __VMLINUX_SYMBOL_STR(crypto_shash_update) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

