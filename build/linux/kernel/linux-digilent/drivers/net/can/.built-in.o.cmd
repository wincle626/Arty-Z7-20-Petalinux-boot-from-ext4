cmd_drivers/net/can/built-in.o :=  arm-linux-gnueabihf-ld -EL    -r -o drivers/net/can/built-in.o drivers/net/can/can-dev.o drivers/net/can/spi/built-in.o drivers/net/can/usb/built-in.o drivers/net/can/softing/built-in.o drivers/net/can/xilinx_can.o 