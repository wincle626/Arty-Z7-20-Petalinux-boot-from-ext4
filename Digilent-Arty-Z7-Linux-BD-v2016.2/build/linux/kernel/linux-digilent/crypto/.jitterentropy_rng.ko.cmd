cmd_crypto/jitterentropy_rng.ko := arm-linux-gnueabihf-ld -EL -r  -T /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/scripts/module-common.lds --build-id  -o crypto/jitterentropy_rng.ko crypto/jitterentropy_rng.o crypto/jitterentropy_rng.mod.o
