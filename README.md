# Arty-Z7-20-Petalinux-boot-from-ext4
This repo is created from standard Petalinux 2016.2 with Arty Z7 BSP. 
Different from the official one, this Petalinux does not build rootfs and boot from mmcblk0p2 with ext4 format. 
This allow user to have more flexibility of development. 
All built files are under ......./image/linux folder.

Notice: actually only the kernel was rebuilt while the device tree and u-boot are using the pre-build version. I failed to build bootloard zynq_fsbl.elf for some unknown reason. Hence, the pre-build bootloader is adopted as well. 
By choosing the boot rootfs as SD Card (/dev/mmcblk0p2) instead of ramfs, when using petalinux-config, the kernel will find the second partition of sd card for the file system instead of build a rootfs itself.
