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
	{ 0x6cbfb7a0, __VMLINUX_SYMBOL_STR(bus_register) },
	{ 0xee57ea5d, __VMLINUX_SYMBOL_STR(kmalloc_caches) },
	{ 0xf88c3301, __VMLINUX_SYMBOL_STR(sg_init_table) },
	{ 0xd73e037b, __VMLINUX_SYMBOL_STR(driver_register) },
	{ 0x8362bcb1, __VMLINUX_SYMBOL_STR(arm_dma_ops) },
	{ 0x154f4cca, __VMLINUX_SYMBOL_STR(virtio_check_driver_offered_feature) },
	{ 0xadb7abcb, __VMLINUX_SYMBOL_STR(virtqueue_kick_prepare) },
	{ 0x4cb84431, __VMLINUX_SYMBOL_STR(mutex_unlock) },
	{ 0x2f03c178, __VMLINUX_SYMBOL_STR(virtqueue_kick) },
	{ 0x91715312, __VMLINUX_SYMBOL_STR(sprintf) },
	{ 0x71b3797a, __VMLINUX_SYMBOL_STR(virtqueue_get_buf) },
	{ 0x275ef902, __VMLINUX_SYMBOL_STR(__init_waitqueue_head) },
	{ 0xff8cbb1f, __VMLINUX_SYMBOL_STR(idr_destroy) },
	{ 0x364269e1, __VMLINUX_SYMBOL_STR(device_register) },
	{ 0x87b3bbcb, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0xbb1ac380, __VMLINUX_SYMBOL_STR(__mutex_init) },
	{ 0x9721d109, __VMLINUX_SYMBOL_STR(device_find_child) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0xffa86e52, __VMLINUX_SYMBOL_STR(driver_unregister) },
	{ 0x328a05f1, __VMLINUX_SYMBOL_STR(strncpy) },
	{ 0xf8a47414, __VMLINUX_SYMBOL_STR(virtqueue_disable_cb) },
	{ 0x84b183ae, __VMLINUX_SYMBOL_STR(strncmp) },
	{ 0xc78872f2, __VMLINUX_SYMBOL_STR(mutex_lock) },
	{ 0x78dcff11, __VMLINUX_SYMBOL_STR(dma_release_from_coherent) },
	{ 0xbfbcddf8, __VMLINUX_SYMBOL_STR(idr_alloc) },
	{ 0xa22b1b09, __VMLINUX_SYMBOL_STR(__virtqueue_add_sgs) },
	{ 0x3c6d9f11, __VMLINUX_SYMBOL_STR(bus_unregister) },
	{ 0x9570c08e, __VMLINUX_SYMBOL_STR(dma_alloc_from_coherent) },
	{ 0x32907b91, __VMLINUX_SYMBOL_STR(idr_remove) },
	{ 0x592ddb36, __VMLINUX_SYMBOL_STR(virtqueue_notify) },
	{ 0xc4f2d67d, __VMLINUX_SYMBOL_STR(virtqueue_get_vring_size) },
	{ 0x4059792f, __VMLINUX_SYMBOL_STR(print_hex_dump) },
	{ 0x3d51bbd, __VMLINUX_SYMBOL_STR(_dev_info) },
	{ 0x17506ac5, __VMLINUX_SYMBOL_STR(kmem_cache_alloc) },
	{ 0xb5684e29, __VMLINUX_SYMBOL_STR(idr_find_slowpath) },
	{ 0xd6fc6c71, __VMLINUX_SYMBOL_STR(unregister_virtio_driver) },
	{ 0xf92db060, __VMLINUX_SYMBOL_STR(put_device) },
	{ 0xd62c833f, __VMLINUX_SYMBOL_STR(schedule_timeout) },
	{ 0xd85cd67e, __VMLINUX_SYMBOL_STR(__wake_up) },
	{ 0x344b7739, __VMLINUX_SYMBOL_STR(prepare_to_wait_event) },
	{ 0x2a2aee5f, __VMLINUX_SYMBOL_STR(device_for_each_child) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0x9d669763, __VMLINUX_SYMBOL_STR(memcpy) },
	{ 0x1cfb04fa, __VMLINUX_SYMBOL_STR(finish_wait) },
	{ 0x5839c362, __VMLINUX_SYMBOL_STR(dev_warn) },
	{ 0xad997745, __VMLINUX_SYMBOL_STR(device_unregister) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0xa2adb196, __VMLINUX_SYMBOL_STR(dev_set_name) },
	{ 0x528d0c14, __VMLINUX_SYMBOL_STR(idr_init) },
	{ 0x7f5281f0, __VMLINUX_SYMBOL_STR(virtqueue_enable_cb) },
	{ 0x6c07d933, __VMLINUX_SYMBOL_STR(add_uevent_var) },
	{ 0x3b9fd729, __VMLINUX_SYMBOL_STR(register_virtio_driver) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=virtio,virtio_ring";

MODULE_ALIAS("virtio:d00000007v*");
