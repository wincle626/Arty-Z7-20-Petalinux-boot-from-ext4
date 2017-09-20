cmd_kernel/trace/built-in.o :=  arm-linux-gnueabihf-ld -EL    -r -o kernel/trace/built-in.o kernel/trace/trace_clock.o kernel/trace/ring_buffer.o 
