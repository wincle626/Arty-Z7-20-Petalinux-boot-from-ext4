cmd_drivers/virtio/virtio.ko := arm-linux-gnueabihf-ld -EL -r  -T /home/yunwu/workspaces/gitworkspace/arty-z7/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/scripts/module-common.lds --build-id  -o drivers/virtio/virtio.ko drivers/virtio/virtio.o drivers/virtio/virtio.mod.o