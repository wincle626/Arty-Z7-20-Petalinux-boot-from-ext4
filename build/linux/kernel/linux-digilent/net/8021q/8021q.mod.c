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
	{ 0xf1cc4f09, __VMLINUX_SYMBOL_STR(register_netdevice) },
	{ 0xee57ea5d, __VMLINUX_SYMBOL_STR(kmalloc_caches) },
	{ 0x5d096bee, __VMLINUX_SYMBOL_STR(gro_find_receive_by_type) },
	{ 0x93235db, __VMLINUX_SYMBOL_STR(dev_change_flags) },
	{ 0x87a55e8b, __VMLINUX_SYMBOL_STR(dev_mc_unsync) },
	{ 0x305169ee, __VMLINUX_SYMBOL_STR(single_open) },
	{ 0xa506e378, __VMLINUX_SYMBOL_STR(dev_get_flags) },
	{ 0x60a13e90, __VMLINUX_SYMBOL_STR(rcu_barrier) },
	{ 0x74a16d82, __VMLINUX_SYMBOL_STR(dev_get_nest_level) },
	{ 0x3e67dbfa, __VMLINUX_SYMBOL_STR(vlan_dev_vlan_id) },
	{ 0xf0f30010, __VMLINUX_SYMBOL_STR(dev_uc_add) },
	{ 0x5b19f49f, __VMLINUX_SYMBOL_STR(single_release) },
	{ 0xf225d75d, __VMLINUX_SYMBOL_STR(seq_puts) },
	{ 0xc7a4fbed, __VMLINUX_SYMBOL_STR(rtnl_lock) },
	{ 0x5a8432d2, __VMLINUX_SYMBOL_STR(vlan_uses_dev) },
	{ 0x59efd356, __VMLINUX_SYMBOL_STR(netif_carrier_on) },
	{ 0xd3f57a2, __VMLINUX_SYMBOL_STR(_find_next_bit_le) },
	{ 0x695c02bb, __VMLINUX_SYMBOL_STR(seq_printf) },
	{ 0xd2da1048, __VMLINUX_SYMBOL_STR(register_netdevice_notifier) },
	{ 0x97fbedbc, __VMLINUX_SYMBOL_STR(netif_carrier_off) },
	{ 0x9a1c3003, __VMLINUX_SYMBOL_STR(remove_proc_entry) },
	{ 0xdffdb7c5, __VMLINUX_SYMBOL_STR(dev_set_allmulti) },
	{ 0x365ac6d6, __VMLINUX_SYMBOL_STR(vlan_vid_del) },
	{ 0x748cb313, __VMLINUX_SYMBOL_STR(call_netdevice_notifiers) },
	{ 0x176ab823, __VMLINUX_SYMBOL_STR(linkwatch_fire_event) },
	{ 0x8f7c8ff3, __VMLINUX_SYMBOL_STR(dev_add_offload) },
	{ 0x28cc25db, __VMLINUX_SYMBOL_STR(arm_copy_from_user) },
	{ 0xb966ba32, __VMLINUX_SYMBOL_STR(vlan_vid_add) },
	{ 0xf43e2f74, __VMLINUX_SYMBOL_STR(seq_read) },
	{ 0xc9ec4e21, __VMLINUX_SYMBOL_STR(free_percpu) },
	{ 0x9d0d6206, __VMLINUX_SYMBOL_STR(unregister_netdevice_notifier) },
	{ 0xf4fa543b, __VMLINUX_SYMBOL_STR(arm_copy_to_user) },
	{ 0xe2d5255a, __VMLINUX_SYMBOL_STR(strcmp) },
	{ 0x7a880cdd, __VMLINUX_SYMBOL_STR(proc_remove) },
	{ 0x63002f6a, __VMLINUX_SYMBOL_STR(vlan_ioctl_set) },
	{ 0x8b5ceeb7, __VMLINUX_SYMBOL_STR(__pskb_pull_tail) },
	{ 0xa22b70be, __VMLINUX_SYMBOL_STR(PDE_DATA) },
	{ 0xfe7c4287, __VMLINUX_SYMBOL_STR(nr_cpu_ids) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0x1e94db69, __VMLINUX_SYMBOL_STR(unregister_pernet_subsys) },
	{ 0x9fdecc31, __VMLINUX_SYMBOL_STR(unregister_netdevice_many) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0xdf44f384, __VMLINUX_SYMBOL_STR(ethtool_op_get_link) },
	{ 0x5c54b7e6, __VMLINUX_SYMBOL_STR(ns_capable) },
	{ 0x86858050, __VMLINUX_SYMBOL_STR(__ethtool_get_settings) },
	{ 0x31977223, __VMLINUX_SYMBOL_STR(free_netdev) },
	{ 0x328a05f1, __VMLINUX_SYMBOL_STR(strncpy) },
	{ 0x33d70ab8, __VMLINUX_SYMBOL_STR(nla_put) },
	{ 0xfebed376, __VMLINUX_SYMBOL_STR(netdev_upper_dev_unlink) },
	{ 0x73e20c1c, __VMLINUX_SYMBOL_STR(strlcpy) },
	{ 0x500ce78e, __VMLINUX_SYMBOL_STR(dev_remove_offload) },
	{ 0x557cf7dd, __VMLINUX_SYMBOL_STR(skb_push) },
	{ 0x4b9b90a6, __VMLINUX_SYMBOL_STR(proc_mkdir_data) },
	{ 0x7fa797cf, __VMLINUX_SYMBOL_STR(seq_release_net) },
	{ 0x6e261cc0, __VMLINUX_SYMBOL_STR(netif_stacked_transfer_operstate) },
	{ 0x2469810f, __VMLINUX_SYMBOL_STR(__rcu_read_unlock) },
	{ 0x15aee832, __VMLINUX_SYMBOL_STR(gro_find_complete_by_type) },
	{ 0xbbc54de1, __VMLINUX_SYMBOL_STR(init_net) },
	{ 0x6b688c2c, __VMLINUX_SYMBOL_STR(rtnl_link_unregister) },
	{ 0xd9910e86, __VMLINUX_SYMBOL_STR(__dev_get_by_index) },
	{ 0x6c209eab, __VMLINUX_SYMBOL_STR(__alloc_percpu_gfp) },
	{ 0x347013de, __VMLINUX_SYMBOL_STR(nla_validate) },
	{ 0x17506ac5, __VMLINUX_SYMBOL_STR(kmem_cache_alloc) },
	{ 0xd3e6f60d, __VMLINUX_SYMBOL_STR(cpu_possible_mask) },
	{ 0x18c81d4a, __VMLINUX_SYMBOL_STR(eth_header_parse) },
	{ 0x6b2dc060, __VMLINUX_SYMBOL_STR(dump_stack) },
	{ 0xd210200, __VMLINUX_SYMBOL_STR(alloc_netdev_mqs) },
	{ 0x89e02871, __VMLINUX_SYMBOL_STR(register_pernet_subsys) },
	{ 0xb7efc443, __VMLINUX_SYMBOL_STR(netdev_upper_dev_link) },
	{ 0xb4f78dcd, __VMLINUX_SYMBOL_STR(ether_setup) },
	{ 0xb97ec216, __VMLINUX_SYMBOL_STR(dev_uc_unsync) },
	{ 0xfa27d03c, __VMLINUX_SYMBOL_STR(__dev_get_by_name) },
	{ 0x341dbfa3, __VMLINUX_SYMBOL_STR(__per_cpu_offset) },
	{ 0x73422d4c, __VMLINUX_SYMBOL_STR(unregister_netdevice_queue) },
	{ 0x5cd303e7, __VMLINUX_SYMBOL_STR(netdev_warn) },
	{ 0x9c538f20, __VMLINUX_SYMBOL_STR(proc_create_data) },
	{ 0x765b9639, __VMLINUX_SYMBOL_STR(eth_validate_addr) },
	{ 0x90e0d79b, __VMLINUX_SYMBOL_STR(seq_lseek) },
	{ 0x3c35789a, __VMLINUX_SYMBOL_STR(dev_set_promiscuity) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0x9d669763, __VMLINUX_SYMBOL_STR(memcpy) },
	{ 0x77d7c288, __VMLINUX_SYMBOL_STR(seq_open_net) },
	{ 0x49f71442, __VMLINUX_SYMBOL_STR(dev_close_many) },
	{ 0xf418bab8, __VMLINUX_SYMBOL_STR(rtnl_link_register) },
	{ 0xc8aaab0, __VMLINUX_SYMBOL_STR(dev_uc_del) },
	{ 0x1ad9d5a, __VMLINUX_SYMBOL_STR(dev_uc_sync) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
	{ 0xb81960ca, __VMLINUX_SYMBOL_STR(snprintf) },
	{ 0xe113bbbc, __VMLINUX_SYMBOL_STR(csum_partial) },
	{ 0xdb640615, __VMLINUX_SYMBOL_STR(netdev_update_features) },
	{ 0x85670f1d, __VMLINUX_SYMBOL_STR(rtnl_is_locked) },
	{ 0xccdbd9ef, __VMLINUX_SYMBOL_STR(dev_queue_xmit) },
	{ 0x8d522714, __VMLINUX_SYMBOL_STR(__rcu_read_lock) },
	{ 0x3a244be7, __VMLINUX_SYMBOL_STR(dev_mc_sync) },
	{ 0x6e720ff2, __VMLINUX_SYMBOL_STR(rtnl_unlock) },
	{ 0x71b5cc36, __VMLINUX_SYMBOL_STR(dev_get_stats) },
	{ 0xe8c8828c, __VMLINUX_SYMBOL_STR(dev_set_mtu) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";


MODULE_INFO(srcversion, "A01DAC82C015CE86F512796");
