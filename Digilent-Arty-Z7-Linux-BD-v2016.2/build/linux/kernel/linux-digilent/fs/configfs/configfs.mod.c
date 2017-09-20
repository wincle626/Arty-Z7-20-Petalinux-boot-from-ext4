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
	{ 0x31e791fd, __VMLINUX_SYMBOL_STR(kmem_cache_destroy) },
	{ 0xce4f5aa1, __VMLINUX_SYMBOL_STR(simple_pin_fs) },
	{ 0xee57ea5d, __VMLINUX_SYMBOL_STR(kmalloc_caches) },
	{ 0x12da5bb2, __VMLINUX_SYMBOL_STR(__kmalloc) },
	{ 0x9b388444, __VMLINUX_SYMBOL_STR(get_zeroed_page) },
	{ 0x39997686, __VMLINUX_SYMBOL_STR(up_read) },
	{ 0x528c709d, __VMLINUX_SYMBOL_STR(simple_read_from_buffer) },
	{ 0x5fc56a46, __VMLINUX_SYMBOL_STR(_raw_spin_unlock) },
	{ 0xb4835070, __VMLINUX_SYMBOL_STR(generic_file_llseek) },
	{ 0x188a3dfb, __VMLINUX_SYMBOL_STR(timespec_trunc) },
	{ 0x2e5810c6, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr1) },
	{ 0x97255bdf, __VMLINUX_SYMBOL_STR(strlen) },
	{ 0x51e2aaaa, __VMLINUX_SYMBOL_STR(simple_write_end) },
	{ 0x66003df0, __VMLINUX_SYMBOL_STR(simple_release_fs) },
	{ 0x36a7549a, __VMLINUX_SYMBOL_STR(generic_delete_inode) },
	{ 0xcdc49e19, __VMLINUX_SYMBOL_STR(lockref_get) },
	{ 0xe59e486a, __VMLINUX_SYMBOL_STR(dput) },
	{ 0x9fd0de5b, __VMLINUX_SYMBOL_STR(inc_nlink) },
	{ 0x28cc25db, __VMLINUX_SYMBOL_STR(arm_copy_from_user) },
	{ 0x4cb84431, __VMLINUX_SYMBOL_STR(mutex_unlock) },
	{ 0xde0705fd, __VMLINUX_SYMBOL_STR(mount_single) },
	{ 0x44d0dc01, __VMLINUX_SYMBOL_STR(generic_read_dir) },
	{ 0xe2d5255a, __VMLINUX_SYMBOL_STR(strcmp) },
	{ 0x5f07cd8d, __VMLINUX_SYMBOL_STR(down_read) },
	{ 0xd136af05, __VMLINUX_SYMBOL_STR(d_delete) },
	{ 0x7a2add7d, __VMLINUX_SYMBOL_STR(current_kernel_time64) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0x322c2776, __VMLINUX_SYMBOL_STR(sysfs_remove_mount_point) },
	{ 0xa6909ab1, __VMLINUX_SYMBOL_STR(kern_path) },
	{ 0x25dd515d, __VMLINUX_SYMBOL_STR(kill_litter_super) },
	{ 0x4ff72efd, __VMLINUX_SYMBOL_STR(simple_write_begin) },
	{ 0xbb1ac380, __VMLINUX_SYMBOL_STR(__mutex_init) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0xd3250280, __VMLINUX_SYMBOL_STR(d_rehash) },
	{ 0x328a05f1, __VMLINUX_SYMBOL_STR(strncpy) },
	{ 0xa5df38a7, __VMLINUX_SYMBOL_STR(kmem_cache_free) },
	{ 0xc78872f2, __VMLINUX_SYMBOL_STR(mutex_lock) },
	{ 0x123c0b5a, __VMLINUX_SYMBOL_STR(free_page_put_link) },
	{ 0xeac955c9, __VMLINUX_SYMBOL_STR(simple_readpage) },
	{ 0xcfea7ca5, __VMLINUX_SYMBOL_STR(module_put) },
	{ 0xc6cbbc89, __VMLINUX_SYMBOL_STR(capable) },
	{ 0x17506ac5, __VMLINUX_SYMBOL_STR(kmem_cache_alloc) },
	{ 0x1c973694, __VMLINUX_SYMBOL_STR(simple_unlink) },
	{ 0x42c70324, __VMLINUX_SYMBOL_STR(simple_setattr) },
	{ 0x93fca811, __VMLINUX_SYMBOL_STR(__get_free_pages) },
	{ 0x8b8059bd, __VMLINUX_SYMBOL_STR(in_group_p) },
	{ 0xeac76711, __VMLINUX_SYMBOL_STR(d_drop) },
	{ 0x8582a24b, __VMLINUX_SYMBOL_STR(path_put) },
	{ 0x9c0bd51f, __VMLINUX_SYMBOL_STR(_raw_spin_lock) },
	{ 0xf68ea58b, __VMLINUX_SYMBOL_STR(kmem_cache_create) },
	{ 0x58041af6, __VMLINUX_SYMBOL_STR(register_filesystem) },
	{ 0x7afa89fc, __VMLINUX_SYMBOL_STR(vsnprintf) },
	{ 0x4302d0eb, __VMLINUX_SYMBOL_STR(free_pages) },
	{ 0x8b848218, __VMLINUX_SYMBOL_STR(sysfs_create_mount_point) },
	{ 0xe953b21f, __VMLINUX_SYMBOL_STR(get_next_ino) },
	{ 0x8b264228, __VMLINUX_SYMBOL_STR(kernel_kobj) },
	{ 0x21741a7f, __VMLINUX_SYMBOL_STR(iput) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0xdf7834de, __VMLINUX_SYMBOL_STR(iunique) },
	{ 0x85b91df7, __VMLINUX_SYMBOL_STR(always_delete_dentry) },
	{ 0x4235f210, __VMLINUX_SYMBOL_STR(generic_readlink) },
	{ 0xdabe28df, __VMLINUX_SYMBOL_STR(d_make_root) },
	{ 0x3698ebe2, __VMLINUX_SYMBOL_STR(simple_statfs) },
	{ 0x2b4ed51, __VMLINUX_SYMBOL_STR(d_alloc_name) },
	{ 0xbd86f248, __VMLINUX_SYMBOL_STR(unregister_filesystem) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0xb81960ca, __VMLINUX_SYMBOL_STR(snprintf) },
	{ 0xb4df0395, __VMLINUX_SYMBOL_STR(new_inode) },
	{ 0xbfba4cc7, __VMLINUX_SYMBOL_STR(d_instantiate) },
	{ 0x6b916f02, __VMLINUX_SYMBOL_STR(try_module_get) },
	{ 0x158ac9f5, __VMLINUX_SYMBOL_STR(simple_rmdir) },
	{ 0xbd4b4ccd, __VMLINUX_SYMBOL_STR(__d_drop) },
	{ 0xe914e41e, __VMLINUX_SYMBOL_STR(strcpy) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";


MODULE_INFO(srcversion, "0CB263492829B80A3E89940");
