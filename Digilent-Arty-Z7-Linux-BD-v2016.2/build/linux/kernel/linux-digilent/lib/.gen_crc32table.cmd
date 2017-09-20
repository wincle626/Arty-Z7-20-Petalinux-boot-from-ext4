cmd_lib/gen_crc32table := gcc -Wp,-MD,lib/.gen_crc32table.d -Ilib -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89 -o lib/gen_crc32table /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/lib/gen_crc32table.c  

source_lib/gen_crc32table := /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/lib/gen_crc32table.c

deps_lib/gen_crc32table := \
  /usr/include/stdc-predef.h \
  /usr/include/stdio.h \
  /usr/include/features.h \
  /usr/include/x86_64-linux-gnu/sys/cdefs.h \
  /usr/include/x86_64-linux-gnu/bits/wordsize.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs.h \
  /usr/include/x86_64-linux-gnu/gnu/stubs-64.h \
  /usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h \
  /usr/include/x86_64-linux-gnu/bits/types.h \
  /usr/include/x86_64-linux-gnu/bits/typesizes.h \
  /usr/include/libio.h \
  /usr/include/_G_config.h \
  /usr/include/wchar.h \
  /usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h \
  /usr/include/x86_64-linux-gnu/bits/stdio_lim.h \
  /usr/include/x86_64-linux-gnu/bits/sys_errlist.h \
  /usr/include/x86_64-linux-gnu/bits/stdio.h \
  /usr/include/x86_64-linux-gnu/bits/stdio2.h \
  /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/kernel/download/linux-digilent/lib/crc32defs.h \
    $(wildcard include/config/crc32/sliceby8.h) \
    $(wildcard include/config/crc32/sliceby4.h) \
    $(wildcard include/config/crc32/sarwate.h) \
    $(wildcard include/config/crc32/bit.h) \
    $(wildcard include/config/64bit.h) \
  /usr/include/inttypes.h \
  /usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h \
  /usr/include/stdint.h \
  /usr/include/x86_64-linux-gnu/bits/wchar.h \

lib/gen_crc32table: $(deps_lib/gen_crc32table)

$(deps_lib/gen_crc32table):
