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
	{ 0x2d3385d3, __VMLINUX_SYMBOL_STR(system_wq) },
	{ 0xee57ea5d, __VMLINUX_SYMBOL_STR(kmalloc_caches) },
	{ 0x12da5bb2, __VMLINUX_SYMBOL_STR(__kmalloc) },
	{ 0x307b04d9, __VMLINUX_SYMBOL_STR(vring_del_virtqueue) },
	{ 0x97255bdf, __VMLINUX_SYMBOL_STR(strlen) },
	{ 0x8362bcb1, __VMLINUX_SYMBOL_STR(arm_dma_ops) },
	{ 0x4dc26a4c, __VMLINUX_SYMBOL_STR(register_virtio_device) },
	{ 0xe2fae716, __VMLINUX_SYMBOL_STR(kmemdup) },
	{ 0x4cb84431, __VMLINUX_SYMBOL_STR(mutex_unlock) },
	{ 0xcbee6439, __VMLINUX_SYMBOL_STR(ida_simple_get) },
	{ 0xe2d5255a, __VMLINUX_SYMBOL_STR(strcmp) },
	{ 0x81f3afb, __VMLINUX_SYMBOL_STR(complete_all) },
	{ 0x275ef902, __VMLINUX_SYMBOL_STR(__init_waitqueue_head) },
	{ 0x1fab5905, __VMLINUX_SYMBOL_STR(wait_for_completion) },
	{ 0xff8cbb1f, __VMLINUX_SYMBOL_STR(idr_destroy) },
	{ 0x8726801c, __VMLINUX_SYMBOL_STR(device_del) },
	{ 0x87b3bbcb, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0xb1159195, __VMLINUX_SYMBOL_STR(mutex_lock_interruptible) },
	{ 0xbb1ac380, __VMLINUX_SYMBOL_STR(__mutex_init) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0x71c90087, __VMLINUX_SYMBOL_STR(memcmp) },
	{ 0x29e1b020, __VMLINUX_SYMBOL_STR(ida_simple_remove) },
	{ 0xc78872f2, __VMLINUX_SYMBOL_STR(mutex_lock) },
	{ 0x6220b4a2, __VMLINUX_SYMBOL_STR(crc32_le) },
	{ 0x21110dbf, __VMLINUX_SYMBOL_STR(mmioset) },
	{ 0x78dcff11, __VMLINUX_SYMBOL_STR(dma_release_from_coherent) },
	{ 0xbfbcddf8, __VMLINUX_SYMBOL_STR(idr_alloc) },
	{ 0xe936e778, __VMLINUX_SYMBOL_STR(device_add) },
	{ 0x7c215f55, __VMLINUX_SYMBOL_STR(request_firmware_nowait) },
	{ 0x9b0129, __VMLINUX_SYMBOL_STR(of_find_node_by_phandle) },
	{ 0xa67f0373, __VMLINUX_SYMBOL_STR(unregister_virtio_device) },
	{ 0x9570c08e, __VMLINUX_SYMBOL_STR(dma_alloc_from_coherent) },
	{ 0x32907b91, __VMLINUX_SYMBOL_STR(idr_remove) },
	{ 0xcfea7ca5, __VMLINUX_SYMBOL_STR(module_put) },
	{ 0xc928eb40, __VMLINUX_SYMBOL_STR(vring_new_virtqueue) },
	{ 0x3d51bbd, __VMLINUX_SYMBOL_STR(_dev_info) },
	{ 0x17506ac5, __VMLINUX_SYMBOL_STR(kmem_cache_alloc) },
	{ 0xb5684e29, __VMLINUX_SYMBOL_STR(idr_find_slowpath) },
	{ 0xf92db060, __VMLINUX_SYMBOL_STR(put_device) },
	{ 0xff05fa13, __VMLINUX_SYMBOL_STR(vring_interrupt) },
	{ 0xcde3422f, __VMLINUX_SYMBOL_STR(get_device) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0x9d669763, __VMLINUX_SYMBOL_STR(memcpy) },
	{ 0xdff957cd, __VMLINUX_SYMBOL_STR(device_initialize) },
	{ 0x7c6e9a4, __VMLINUX_SYMBOL_STR(request_firmware) },
	{ 0x5839c362, __VMLINUX_SYMBOL_STR(dev_warn) },
	{ 0x216d759a, __VMLINUX_SYMBOL_STR(mmiocpy) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0xb2d48a2e, __VMLINUX_SYMBOL_STR(queue_work_on) },
	{ 0xb81960ca, __VMLINUX_SYMBOL_STR(snprintf) },
	{ 0xa2adb196, __VMLINUX_SYMBOL_STR(dev_set_name) },
	{ 0x528d0c14, __VMLINUX_SYMBOL_STR(idr_init) },
	{ 0x8375d79d, __VMLINUX_SYMBOL_STR(ida_destroy) },
	{ 0x5af896b0, __VMLINUX_SYMBOL_STR(vring_transport_features) },
	{ 0x5f58e930, __VMLINUX_SYMBOL_STR(release_firmware) },
	{ 0x6b916f02, __VMLINUX_SYMBOL_STR(try_module_get) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=virtio_ring,virtio";

