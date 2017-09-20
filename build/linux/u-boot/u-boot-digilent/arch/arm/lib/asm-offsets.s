	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 4	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"asm-offsets.c"
@ GNU C (crosstool-NG linaro-1.13.1-4.9-2014.09 - Linaro GCC 4.9-2014.09) version 4.9.2 20140904 (prerelease) (arm-linux-gnueabihf)
@	compiled by GNU C version 4.1.2 20080704 (Red Hat 4.1.2-54), GMP version 5.0.2, MPFR version 3.1.0, MPC version 0.9
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -nostdinc -I include
@ -I /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include
@ -I /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/include
@ -I /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/.
@ -I .
@ -I /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/mach-zynq/include
@ -imultilib . -imultiarch arm-linux-gnueabihf
@ -iprefix /opt/petalinux/petalinux-v2016.2-final/tools/linux-i386/gcc-arm-linux-gnueabi/bin/../lib/gcc/arm-linux-gnueabihf/4.9.2/
@ -isysroot /opt/petalinux/petalinux-v2016.2-final/tools/linux-i386/gcc-arm-linux-gnueabi/bin/../arm-linux-gnueabihf/libc
@ -D __KERNEL__ -D __UBOOT__ -D __ARM__ -D DO_DEPS_ONLY -D KBUILD_STR(s)=#s
@ -D KBUILD_BASENAME=KBUILD_STR(asm_offsets)
@ -D KBUILD_MODNAME=KBUILD_STR(asm_offsets)
@ -isystem /opt/petalinux/petalinux-v2016.2-final/tools/linux-i386/gcc-arm-linux-gnueabi/bin/../lib/gcc/arm-linux-gnueabihf/4.9.2/include
@ -include /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/linux/kconfig.h
@ -MD arch/arm/lib/.asm-offsets.s.d
@ /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/lib/asm-offsets.c
@ -marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations
@ -mno-unaligned-access -mfloat-abi=soft -march=armv7-a -mtune=cortex-a9
@ -mfpu=vfpv3-d16 -mtls-dialect=gnu
@ -auxbase-strip arch/arm/lib/asm-offsets.s -g -Os -Wall
@ -Wstrict-prototypes -Wno-format-security -Wno-format-nonliteral
@ -Werror=date-time -fno-builtin -ffreestanding -fno-stack-protector
@ -fno-delete-null-pointer-checks -fstack-usage -fno-pic
@ -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
@ -fbranch-count-reg -fcaller-saves -fcombine-stack-adjustments
@ -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
@ -fdata-sections -fdefer-pop -fdevirtualize -fdevirtualize-speculatively
@ -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
@ -fexpensive-optimizations -fforward-propagate -ffunction-cse
@ -ffunction-sections -fgcse -fgcse-lm -fgnu-runtime -fgnu-unique
@ -fguess-branch-probability -fhoist-adjacent-loads -fident -fif-conversion
@ -fif-conversion2 -findirect-inlining -finline -finline-atomics
@ -finline-functions -finline-functions-called-once
@ -finline-small-functions -fipa-cp -fipa-profile -fipa-pure-const
@ -fipa-reference -fipa-sra -fira-hoist-pressure -fira-share-save-slots
@ -fira-share-spill-slots -fisolate-erroneous-paths-dereference -fivopts
@ -fkeep-static-consts -fleading-underscore -fmath-errno -fmerge-constants
@ -fmerge-debug-strings -fmove-loop-invariants -fomit-frame-pointer
@ -foptimize-sibling-calls -fpartial-inlining -fpeephole -fpeephole2
@ -fprefetch-loop-arrays -freg-struct-return -freorder-blocks
@ -freorder-functions -frerun-cse-after-loop
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-pressure -fsched-rank-heuristic -fsched-spec
@ -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns2
@ -fsection-anchors -fshow-column -fshrink-wrap -fsigned-zeros
@ -fsplit-ivs-in-unroller -fsplit-wide-types -fstrict-aliasing
@ -fstrict-overflow -fstrict-volatile-bitfields -fsync-libcalls
@ -fthread-jumps -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
@ -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
@ -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
@ -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
@ -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
@ -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
@ -ftree-vrp -funit-at-a-time -fvar-tracking -fvar-tracking-assignments
@ -fverbose-asm -fzero-initialized-in-bss -marm -mglibc -mlittle-endian
@ -mlra -mpic-data-is-text-relative -msched-prolog
@ -mvectorize-with-neon-quad -mword-relocations

	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.startup.main,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
.LFB196:
	.file 1 "/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/arch/arm/lib/asm-offsets.c"
	.loc 1 24 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 202 0
	mov	r0, #0	@,
	bx	lr	@
	.cfi_endproc
.LFE196:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u-boot-digilent/include/net.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x12b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1
	.4byte	.LASF30
	.4byte	.LASF31
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x4
	.byte	0x2
	.2byte	0x210
	.4byte	0xdb
	.uleb128 0x5
	.4byte	.LASF11
	.sleb128 0
	.uleb128 0x5
	.4byte	.LASF12
	.sleb128 1
	.uleb128 0x6
	.ascii	"ARP\000"
	.sleb128 2
	.uleb128 0x5
	.4byte	.LASF13
	.sleb128 3
	.uleb128 0x5
	.4byte	.LASF14
	.sleb128 4
	.uleb128 0x5
	.4byte	.LASF15
	.sleb128 5
	.uleb128 0x6
	.ascii	"DNS\000"
	.sleb128 6
	.uleb128 0x6
	.ascii	"NFS\000"
	.sleb128 7
	.uleb128 0x6
	.ascii	"CDP\000"
	.sleb128 8
	.uleb128 0x5
	.4byte	.LASF16
	.sleb128 9
	.uleb128 0x5
	.4byte	.LASF17
	.sleb128 10
	.uleb128 0x5
	.4byte	.LASF18
	.sleb128 11
	.uleb128 0x5
	.4byte	.LASF19
	.sleb128 12
	.uleb128 0x5
	.4byte	.LASF20
	.sleb128 13
	.byte	0
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x4
	.byte	0x2
	.2byte	0x277
	.4byte	0x101
	.uleb128 0x5
	.4byte	.LASF23
	.sleb128 0
	.uleb128 0x5
	.4byte	.LASF24
	.sleb128 1
	.uleb128 0x5
	.4byte	.LASF25
	.sleb128 2
	.uleb128 0x5
	.4byte	.LASF26
	.sleb128 3
	.byte	0
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x1
	.byte	0x17
	.4byte	0x48
	.4byte	.LFB196
	.4byte	.LFE196-.LFB196
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x27d
	.4byte	0xdb
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x2b0
	.4byte	0x79
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB196
	.4byte	.LFE196-.LFB196
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB196
	.4byte	.LFE196
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF17:
	.ascii	"SNTP\000"
.LASF11:
	.ascii	"BOOTP\000"
.LASF30:
	.ascii	"/home/yunwu/workspaces/gitworkspace/arty-z7/Digilen"
	.ascii	"t-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/src/u"
	.ascii	"-boot-digilent/arch/arm/lib/asm-offsets.c\000"
.LASF31:
	.ascii	"/home/yunwu/workspaces/gitworkspace/arty-z7/Digilen"
	.ascii	"t-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/u-boo"
	.ascii	"t-digilent\000"
.LASF21:
	.ascii	"proto_t\000"
.LASF27:
	.ascii	"net_state\000"
.LASF25:
	.ascii	"NETLOOP_SUCCESS\000"
.LASF12:
	.ascii	"RARP\000"
.LASF26:
	.ascii	"NETLOOP_FAIL\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF2:
	.ascii	"short unsigned int\000"
.LASF0:
	.ascii	"unsigned char\000"
.LASF15:
	.ascii	"PING\000"
.LASF32:
	.ascii	"main\000"
.LASF19:
	.ascii	"TFTPPUT\000"
.LASF5:
	.ascii	"unsigned int\000"
.LASF20:
	.ascii	"LINKLOCAL\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF8:
	.ascii	"sizetype\000"
.LASF28:
	.ascii	"net_loop_last_protocol\000"
.LASF6:
	.ascii	"long long int\000"
.LASF24:
	.ascii	"NETLOOP_RESTART\000"
.LASF22:
	.ascii	"net_loop_state\000"
.LASF4:
	.ascii	"short int\000"
.LASF14:
	.ascii	"DHCP\000"
.LASF23:
	.ascii	"NETLOOP_CONTINUE\000"
.LASF10:
	.ascii	"long int\000"
.LASF9:
	.ascii	"char\000"
.LASF29:
	.ascii	"GNU C 4.9.2 20140904 (prerelease) -marm -mno-thumb-"
	.ascii	"interwork -mabi=aapcs-linux -mword-relocations -mno"
	.ascii	"-unaligned-access -mfloat-abi=soft -march=armv7-a -"
	.ascii	"mtune=cortex-a9 -mfpu=vfpv3-d16 -mtls-dialect=gnu -"
	.ascii	"g -Os -fno-builtin -ffreestanding -fno-stack-protec"
	.ascii	"tor -fno-delete-null-pointer-checks -fstack-usage -"
	.ascii	"fno-pic -ffunction-sections -fdata-sections -fno-co"
	.ascii	"mmon -ffixed-r9\000"
.LASF16:
	.ascii	"NETCONS\000"
.LASF3:
	.ascii	"signed char\000"
.LASF13:
	.ascii	"TFTPGET\000"
.LASF18:
	.ascii	"TFTPSRV\000"
	.ident	"GCC: (crosstool-NG linaro-1.13.1-4.9-2014.09 - Linaro GCC 4.9-2014.09) 4.9.2 20140904 (prerelease)"
	.section	.note.GNU-stack,"",%progbits
