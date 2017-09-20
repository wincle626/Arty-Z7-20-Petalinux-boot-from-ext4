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
	{ 0x4227a7fd, __VMLINUX_SYMBOL_STR(ip_tunnel_get_link_net) },
	{ 0x685ccac3, __VMLINUX_SYMBOL_STR(param_ops_bool) },
	{ 0xe921772, __VMLINUX_SYMBOL_STR(ip_tunnel_get_iflink) },
	{ 0xe7ce2345, __VMLINUX_SYMBOL_STR(ip_tunnel_get_stats64) },
	{ 0xf418bab8, __VMLINUX_SYMBOL_STR(rtnl_link_register) },
	{ 0xb7d30fef, __VMLINUX_SYMBOL_STR(xfrm4_tunnel_register) },
	{ 0x34d9a8ea, __VMLINUX_SYMBOL_STR(register_pernet_device) },
	{ 0x60a13e90, __VMLINUX_SYMBOL_STR(rcu_barrier) },
	{ 0xa3ad5bf2, __VMLINUX_SYMBOL_STR(unregister_pernet_device) },
	{ 0xc56c1f2d, __VMLINUX_SYMBOL_STR(xfrm4_tunnel_deregister) },
	{ 0x6b688c2c, __VMLINUX_SYMBOL_STR(rtnl_link_unregister) },
	{ 0xee57ea5d, __VMLINUX_SYMBOL_STR(kmalloc_caches) },
	{ 0xc6cbbc89, __VMLINUX_SYMBOL_STR(capable) },
	{ 0x17506ac5, __VMLINUX_SYMBOL_STR(kmem_cache_alloc) },
	{ 0x19f462ab, __VMLINUX_SYMBOL_STR(kfree_call_rcu) },
	{ 0xbc10dd97, __VMLINUX_SYMBOL_STR(__put_user_4) },
	{ 0x12da5bb2, __VMLINUX_SYMBOL_STR(__kmalloc) },
	{ 0xf4fa543b, __VMLINUX_SYMBOL_STR(arm_copy_to_user) },
	{ 0x5c54b7e6, __VMLINUX_SYMBOL_STR(ns_capable) },
	{ 0x28cc25db, __VMLINUX_SYMBOL_STR(arm_copy_from_user) },
	{ 0x6a7b2b2c, __VMLINUX_SYMBOL_STR(netdev_state_change) },
	{ 0x609f1c7e, __VMLINUX_SYMBOL_STR(synchronize_net) },
	{ 0xbf07a76e, __VMLINUX_SYMBOL_STR(ip_tunnel_dst_reset_all) },
	{ 0x28aa6a67, __VMLINUX_SYMBOL_STR(call_rcu) },
	{ 0x6b2dc060, __VMLINUX_SYMBOL_STR(dump_stack) },
	{ 0x85670f1d, __VMLINUX_SYMBOL_STR(rtnl_is_locked) },
	{ 0xda28be1e, __VMLINUX_SYMBOL_STR(ipv6_chk_prefix) },
	{ 0xb994b31b, __VMLINUX_SYMBOL_STR(netif_rx) },
	{ 0xb96b9029, __VMLINUX_SYMBOL_STR(skb_scrub_packet) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0xc9eba651, __VMLINUX_SYMBOL_STR(ipv6_chk_custom_prefix) },
	{ 0xf6ebc03b, __VMLINUX_SYMBOL_STR(net_ratelimit) },
	{ 0x1ee91112, __VMLINUX_SYMBOL_STR(rt6_lookup) },
	{ 0xe3708daa, __VMLINUX_SYMBOL_STR(skb_pull) },
	{ 0x8b5ceeb7, __VMLINUX_SYMBOL_STR(__pskb_pull_tail) },
	{ 0x36e188f7, __VMLINUX_SYMBOL_STR(skb_clone) },
	{ 0xf0b5e4d2, __VMLINUX_SYMBOL_STR(ipv4_redirect) },
	{ 0xa53f679a, __VMLINUX_SYMBOL_STR(ipv4_update_pmtu) },
	{ 0xc6704a6a, __VMLINUX_SYMBOL_STR(ip_tunnel_rcv) },
	{ 0xcbf9e918, __VMLINUX_SYMBOL_STR(iptunnel_pull_header) },
	{ 0x93fe5a73, __VMLINUX_SYMBOL_STR(__xfrm_policy_check) },
	{ 0x7d11c268, __VMLINUX_SYMBOL_STR(jiffies) },
	{ 0x554557b9, __VMLINUX_SYMBOL_STR(kfree_skb) },
	{ 0x43b0c9c3, __VMLINUX_SYMBOL_STR(preempt_schedule) },
	{ 0xa98ea662, __VMLINUX_SYMBOL_STR(iptunnel_xmit) },
	{ 0xb22fd5eb, __VMLINUX_SYMBOL_STR(ip_tunnel_encap) },
	{ 0x91b13e7e, __VMLINUX_SYMBOL_STR(consume_skb) },
	{ 0xb8209980, __VMLINUX_SYMBOL_STR(skb_set_owner_w) },
	{ 0xc12c3298, __VMLINUX_SYMBOL_STR(skb_realloc_headroom) },
	{ 0x32b3c52a, __VMLINUX_SYMBOL_STR(icmpv6_send) },
	{ 0xb00f0a46, __VMLINUX_SYMBOL_STR(neigh_destroy) },
	{ 0xd542439, __VMLINUX_SYMBOL_STR(__ipv6_addr_type) },
	{ 0x3df89229, __VMLINUX_SYMBOL_STR(ip_tunnel_xmit) },
	{ 0x187078de, __VMLINUX_SYMBOL_STR(iptunnel_handle_offloads) },
	{ 0x416b31ef, __VMLINUX_SYMBOL_STR(register_netdev) },
	{ 0x6e720ff2, __VMLINUX_SYMBOL_STR(rtnl_unlock) },
	{ 0x9fdecc31, __VMLINUX_SYMBOL_STR(unregister_netdevice_many) },
	{ 0xc7a4fbed, __VMLINUX_SYMBOL_STR(rtnl_lock) },
	{ 0x341dbfa3, __VMLINUX_SYMBOL_STR(__per_cpu_offset) },
	{ 0xfe7c4287, __VMLINUX_SYMBOL_STR(nr_cpu_ids) },
	{ 0xd3e6f60d, __VMLINUX_SYMBOL_STR(cpu_possible_mask) },
	{ 0x50c89f23, __VMLINUX_SYMBOL_STR(__alloc_percpu) },
	{ 0xd3f57a2, __VMLINUX_SYMBOL_STR(_find_next_bit_le) },
	{ 0x6c209eab, __VMLINUX_SYMBOL_STR(__alloc_percpu_gfp) },
	{ 0x37a0cba, __VMLINUX_SYMBOL_STR(kfree) },
	{ 0xd9910e86, __VMLINUX_SYMBOL_STR(__dev_get_by_index) },
	{ 0xd20444cb, __VMLINUX_SYMBOL_STR(dst_release) },
	{ 0xa255aefa, __VMLINUX_SYMBOL_STR(ip_route_output_flow) },
	{ 0xc2428aaf, __VMLINUX_SYMBOL_STR(ip_tunnel_encap_setup) },
	{ 0xd210200, __VMLINUX_SYMBOL_STR(alloc_netdev_mqs) },
	{ 0xe914e41e, __VMLINUX_SYMBOL_STR(strcpy) },
	{ 0x73e20c1c, __VMLINUX_SYMBOL_STR(strlcpy) },
	{ 0x31977223, __VMLINUX_SYMBOL_STR(free_netdev) },
	{ 0xc9ec4e21, __VMLINUX_SYMBOL_STR(free_percpu) },
	{ 0xf1cc4f09, __VMLINUX_SYMBOL_STR(register_netdevice) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0xbbc54de1, __VMLINUX_SYMBOL_STR(init_net) },
	{ 0x73422d4c, __VMLINUX_SYMBOL_STR(unregister_netdevice_queue) },
	{ 0x2469810f, __VMLINUX_SYMBOL_STR(__rcu_read_unlock) },
	{ 0x8d522714, __VMLINUX_SYMBOL_STR(__rcu_read_lock) },
	{ 0x33d70ab8, __VMLINUX_SYMBOL_STR(nla_put) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=ip_tunnel,tunnel4,ipv6";

