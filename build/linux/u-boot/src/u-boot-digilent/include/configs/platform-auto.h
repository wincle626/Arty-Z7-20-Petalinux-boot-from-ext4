/*
 * This file is auto-generated by PetaLinux SDK
 * DO NOT MODIFY this file, the modification will not persist
 */

#ifndef __PLNX_CONFIG_H
#define __PLNX_CONFIG_H

/* Board oscillator frequency */
#define CONFIG_ZYNQ_PS_CLK_FREQ	50000000UL

/* The following table includes the supported baudrates */
#define CONFIG_SYS_BAUDRATE_TABLE  {9600, 19200, 38400, 57600, 115200, 230400}

/* use serial multi for all serial devices */
#define CONFIG_SERIAL_MULTI
#define CONFIG_SYS_CONSOLE_IS_IN_ENV 1

/* Board name */
#define XILINX_BOARD_NAME	Digilent-Arty-Z7-Linux-BD-v2016_2
#define CONFIG_HOSTNAME	XILINX_BOARD_NAME

/* processor - ps7_cortexa9_0 */
#define CONFIG_CPU_FREQ_HZ	650000000
#define CONFIG_ARMV7
#define CONFIG_CMD_CACHE
#define CONFIG_SYS_L2CACHE_OFF
#define CONFIG_CLOCKS
#define CONFIG_CMD_CLK
#define CONFIG_SYS_CACHELINE_SIZE	32
#define CONFIG_SYS_LDSCRIPT	"arch/arm/mach-zynq/u-boot.lds"

/* main_memory - ps7_ddr_0 */
#define CONFIG_SYS_SDRAM_BASE	0x0
#define CONFIG_SYS_SDRAM_SIZE	0x20000000

/* Memory testing handling */
#define CONFIG_SYS_MEMTEST_START	CONFIG_SYS_SDRAM_BASE
#define CONFIG_SYS_MEMTEST_END	(CONFIG_SYS_SDRAM_BASE + 0x1000)
#define CONFIG_SYS_TEXT_BASE	0x00400000
#define CONFIG_SYS_LOAD_ADDR	CONFIG_SYS_SDRAM_BASE /* default load address */
#define CONFIG_NR_DRAM_BANKS	1

/* Size of malloc() pool */
#define SIZE	0xC00000
#define CONFIG_SYS_MALLOC_LEN	SIZE

/* Physical Memory Map */
#define CONFIG_SYS_INIT_RAM_ADDR	0xFFFF0000
#define CONFIG_SYS_INIT_RAM_SIZE	0x1000
#define CONFIG_SYS_INIT_SP_ADDR	(CONFIG_SYS_INIT_RAM_ADDR + \
				CONFIG_SYS_INIT_RAM_SIZE - \
				GENERATED_GBL_DATA_SIZE)

/* uart - ps7_uart_0 */
#define CONFIG_ZYNQ_SERIAL
#define CONFIG_ZYNQ_SERIAL_UART0
#define PSSERIAL0	"psserial0=setenv stdout ttyPS0;setenv stdin ttyPS0\0"
#define SERIAL_MULTI	"serial=setenv stdout serial;setenv stdin serial\0"
#define CONSOLE_ARG	"console=console=ttyPS0,115200\0"
#define SERIAL_MULTI  "serial=setenv stdout serial;setenv stdin serial\0"
#define CONFIG_BAUDRATE	115200

/* ethernet - ps7_ethernet_0 */
#define CONFIG_SYS_FAULT_ECHO_LINK_DOWN
#define CONFIG_SYS_ENET
#define CONFIG_MII
#define CONFIG_PHY_GIGE
#define CONFIG_PHY_MARVELL
#define CONFIG_PHY_NATSEMI
#define CONFIG_NET_MULTI
#define CONFIG_BOOTP_MAY_FAIL
#define CONFIG_NETCONSOLE	1
#define CONFIG_SERVERIP	10.0.3.1
#define CONFIG_IPADDR

/* spi_flash - ps7_qspi_0 */
#define XILINX_PS7_QSPI_CLK_FREQ_HZ	200000000
#define CONFIG_SF_DEFAULT_SPEED	(XILINX_PS7_QSPI_CLK_FREQ_HZ / 4)
#define CONFIG_SF_DUAL_FLASH
#define CONFIG_SYS_NO_FLASH
#define CONFIG_ENV_IS_IN_SPI_FLASH
#define CONFIG_ENV_OFFSET	0x500000
#define CONFIG_ENV_SIZE	0x20000
#define CONFIG_ENV_SECT_SIZE	0x20000

/* sdio - ps7_sd_0 */
#define CONFIG_ZYNQ_SDHCI0	0xE0100000
#define CONFIG_MMC
#define CONFIG_GENERIC_MMC
#define CONFIG_SDHCI
#define CONFIG_ZYNQ_SDHCI
#define CONFIG_CMD_MMC
#define CONFIG_CMD_FAT
#define CONFIG_SUPPORT_VFAT
#define CONFIG_CMD_EXT2
#define CONFIG_CMD_EXT4_WRITE
#define CONFIG_DOS_PARTITION
#define CONFIG_FAT_WRITE
#define CONFIG_ZYNQ_SDHCI_MAX_FREQ  52000000

/* devcfg - ps7_dev_cfg_0 */
#define CONFIG_FPGA
#define CONFIG_FPGA_XILINX
#define CONFIG_FPGA_ZYNQPL
#define CONFIG_FPGA_LOADFS

/* ps7_scutimer_0 */
#define ZYNQ_SCUTIMER_BASEADDR	0xF8F00600
#define CONFIG_SYS_TIMER_COUNTS_DOWN
#define CONFIG_SYS_TIMERBASE	ZYNQ_SCUTIMER_BASEADDR
#define CONFIG_SYS_TIMER_COUNTER	(CONFIG_SYS_TIMERBASE + 0x4)

/* FPGA */

#ifdef CONFIG_CMD_GPIO
# define CONFIG_ZYNQ_GPIO
#endif


/* Make the BOOTM LEN big enough for the compressed image */
#define CONFIG_SYS_BOOTM_LEN 0x4000000


/* BOOTP options */
#define CONFIG_BOOTP_SERVERIP
#define CONFIG_BOOTP_BOOTFILESIZE
#define CONFIG_BOOTP_BOOTPATH
#define CONFIG_BOOTP_GATEWAY
#define CONFIG_BOOTP_HOSTNAME

/*Command line configuration.*/
#define CONFIG_CMD_ASKENV
#define CONFIG_CMDLINE_EDITING
#define CONFIG_CMD_SAVES

/* Miscellaneous configurable options */
#define CONFIG_SYS_CBSIZE	2048/* Console I/O Buffer Size      */
#define CONFIG_SYS_PBSIZE	(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)

/* Boot Argument Buffer Size */
#define CONFIG_SYS_MAXARGS	32	/* max number of command args */
#define CONFIG_SYS_LONGHELP

/* architecture dependent code */
#define CONFIG_SYS_USR_EXCEP	/* user exception */
#define CONFIG_SYS_HZ	1000

/* Use the HUSH parser */
#define CONFIG_SYS_HUSH_PARSER
#define CONFIG_SYS_PROMPT_HUSH_PS2 "> "

/* auto-boot delay */
#define	CONFIG_BOOTDELAY	4

/* Don't define BOOTARGS, we get it from the DTB chosen fragment */
#undef CONFIG_BOOTARGS

#define CONFIG_ENV_OVERWRITE	/* Allow to overwrite the u-boot environment variables */

/* FIT image support */
#define CONFIG_FIT	1
#define CONFIG_LMB
#define CONFIG_OF_LIBFDT	1
#define CONFIG_FIT_VERBOSE	1 /* enable fit_format_{error,warning}() */

/* Initial memory map for Linux */
#define CONFIG_SYS_BOOTMAPSZ 0x08000000

/* PREBOOT */
#define CONFIG_PREBOOT	"echo U-BOOT for ${hostname};setenv preboot; echo; dhcp"

/* Extra U-Boot Env settings */
#define CONFIG_EXTRA_ENV_SETTINGS \
	SERIAL_MULTI \
	CONSOLE_ARG \
	PSSERIAL0 \
	"nc=setenv stdout nc;setenv stdin nc;\0" \
	"ethaddr=\0" \
	"sdboot=echo boot Petalinux; mmcinfo && fatload mmc 0 ${netstart} ${kernel_img} && bootm \0" \
	"autoload=no\0" \
	"clobstart=0x04000000\0" \
	"netstart=0x04000000\0" \
	"dtbnetstart=0x05800000\0" \
	"loadaddr=0x04000000\0" \
	"boot_img=BOOT.BIN\0" \
	"load_boot=tftpboot ${clobstart} ${boot_img}\0" \
	"update_boot=setenv img boot; setenv psize ${bootsize}; setenv installcmd \"install_boot\"; run load_boot ${installcmd}; setenv img; setenv psize; setenv installcmd\0" \
	"install_boot=mmcinfo && fatwrite mmc 0 ${clobstart} ${boot_img} ${filesize}\0" \
	"bootenvsize=0x20000\0" \
	"bootenvstart=0x500000\0" \
	"eraseenv=sf probe 0 && sf erase ${bootenvstart} ${bootenvsize}\0" \
	"jffs2_img=rootfs.jffs2\0" \
	"load_jffs2=tftpboot ${clobstart} ${jffs2_img}\0" \
	"update_jffs2=setenv img jffs2; setenv psize ${jffs2size}; setenv installcmd \"install_jffs2\"; run load_jffs2 test_img; setenv img; setenv psize; setenv installcmd\0" \
	"sd_update_jffs2=echo Updating jffs2 from SD; mmcinfo && fatload mmc 0:1 ${clobstart} ${jffs2_img} && run install_jffs2\0" \
	"install_jffs2=sf probe 0 && sf erase ${jffs2start} ${jffs2size} && " \
		"sf write ${clobstart} ${jffs2start} ${filesize}\0" \
	"kernel_img=image.ub\0" \
	"load_kernel=tftpboot ${clobstart} ${kernel_img}\0" \
	"update_kernel=setenv img kernel; setenv psize ${kernelsize}; setenv installcmd \"install_kernel\"; run load_kernel ${installcmd}; setenv img; setenv psize; setenv installcmd\0" \
	"install_kernel=mmcinfo && fatwrite mmc 0 ${clobstart} ${kernel_img} ${filesize}\0" \
	"cp_kernel2ram=mmcinfo && fatload mmc 0 ${netstart} ${kernel_img}\0" \
	"dtb_img=system.dtb\0" \
	"load_dtb=tftpboot ${clobstart} ${dtb_img}\0" \
	"update_dtb=setenv img dtb; setenv psize ${dtbsize}; setenv installcmd \"install_dtb\"; run load_dtb test_img; setenv img; setenv psize; setenv installcmd\0" \
	"sd_update_dtb=echo Updating dtb from SD; mmcinfo && fatload mmc 0:1 ${clobstart} ${dtb_img} && run install_dtb\0" \
	"fault=echo ${img} image size is greater than allocated place - partition ${img} is NOT UPDATED\0" \
	"test_crc=if imi ${clobstart}; then run test_img; else echo ${img} Bad CRC - ${img} is NOT UPDATED; fi\0" \
	"test_img=setenv var \"if test ${filesize} -gt ${psize}\\; then run fault\\; else run ${installcmd}\\; fi\"; run var; setenv var\0" \
	"netboot=tftpboot ${netstart} ${kernel_img} && bootm\0" \
	"default_bootcmd=run cp_kernel2ram && bootm ${netstart}\0" \
""

/* BOOTCOMMAND */
#define CONFIG_BOOTCOMMAND	"run default_bootcmd"

#undef CONFIG_SPL_BUILD /* Disable SPL by default*/

#endif /* __PLNX_CONFIG_H */
