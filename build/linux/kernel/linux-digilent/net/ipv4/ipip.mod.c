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
	{ 0x177012d0, __VMLINUX_SYMBOL_STR(ip_tunnel_dellink) },
	{ 0x685ccac3, __VMLINUX_SYMBOL_STR(param_ops_bool) },
	{ 0xe921772, __VMLINUX_SYMBOL_STR(ip_tunnel_get_iflink) },
	{ 0xe7ce2345, __VMLINUX_SYMBOL_STR(ip_tunnel_get_stats64) },
	{ 0xce95b3d2, __VMLINUX_SYMBOL_STR(ip_tunnel_change_mtu) },
	{ 0x801bff9, __VMLINUX_SYMBOL_STR(ip_tunnel_uninit) },
	{ 0x6b688c2c, __VMLINUX_SYMBOL_STR(rtnl_link_unregister) },
	{ 0xa3ad5bf2, __VMLINUX_SYMBOL_STR(unregister_pernet_device) },
	{ 0xc56c1f2d, __VMLINUX_SYMBOL_STR(xfrm4_tunnel_deregister) },
	{ 0xf418bab8, __VMLINUX_SYMBOL_STR(rtnl_link_register) },
	{ 0xb7d30fef, __VMLINUX_SYMBOL_STR(xfrm4_tunnel_register) },
	{ 0x34d9a8ea, __VMLINUX_SYMBOL_STR(register_pernet_device) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0x970b0388, __VMLINUX_SYMBOL_STR(ip_tunnel_init_net) },
	{ 0xfd16f71a, __VMLINUX_SYMBOL_STR(ip_tunnel_delete_net) },
	{ 0xc6704a6a, __VMLINUX_SYMBOL_STR(ip_tunnel_rcv) },
	{ 0xcbf9e918, __VMLINUX_SYMBOL_STR(iptunnel_pull_header) },
	{ 0x93fe5a73, __VMLINUX_SYMBOL_STR(__xfrm_policy_check) },
	{ 0x7d11c268, __VMLINUX_SYMBOL_STR(jiffies) },
	{ 0xbbc54de1, __VMLINUX_SYMBOL_STR(init_net) },
	{ 0xf0b5e4d2, __VMLINUX_SYMBOL_STR(ipv4_redirect) },
	{ 0xa53f679a, __VMLINUX_SYMBOL_STR(ipv4_update_pmtu) },
	{ 0x6e068e78, __VMLINUX_SYMBOL_STR(ip_tunnel_lookup) },
	{ 0x2469810f, __VMLINUX_SYMBOL_STR(__rcu_read_unlock) },
	{ 0x8d522714, __VMLINUX_SYMBOL_STR(__rcu_read_lock) },
	{ 0xfeb2f8cd, __VMLINUX_SYMBOL_STR(ip_tunnel_init) },
	{ 0x554557b9, __VMLINUX_SYMBOL_STR(kfree_skb) },
	{ 0x3df89229, __VMLINUX_SYMBOL_STR(ip_tunnel_xmit) },
	{ 0x187078de, __VMLINUX_SYMBOL_STR(iptunnel_handle_offloads) },
	{ 0xf4fa543b, __VMLINUX_SYMBOL_STR(arm_copy_to_user) },
	{ 0x1f8477e2, __VMLINUX_SYMBOL_STR(ip_tunnel_ioctl) },
	{ 0x28cc25db, __VMLINUX_SYMBOL_STR(arm_copy_from_user) },
	{ 0xd968e595, __VMLINUX_SYMBOL_STR(ip_tunnel_setup) },
	{ 0x18b5c852, __VMLINUX_SYMBOL_STR(ip_tunnel_newlink) },
	{ 0x1b05fea5, __VMLINUX_SYMBOL_STR(ip_tunnel_changelink) },
	{ 0xc2428aaf, __VMLINUX_SYMBOL_STR(ip_tunnel_encap_setup) },
	{ 0xfa2a45e, __VMLINUX_SYMBOL_STR(__memzero) },
	{ 0x33d70ab8, __VMLINUX_SYMBOL_STR(nla_put) },
	{ 0xefd6cf06, __VMLINUX_SYMBOL_STR(__aeabi_unwind_cpp_pr0) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=ip_tunnel,tunnel4";

