SHELL=bash
ifndef PETALINUX
$(error You must source the petalinux/settings.sh script before working with PetaLinux)
endif

include apps.common.mk

APP = fwupgrade

# Add any other object files to this list below
APP_OBJS = fwupgrade.o

UPGRADE_SCRIPT=upgrade-firmware

all: $(APP)

$(APP): $(APP_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(APP_OBJS) $(LDLIBS)

clean:
	-rm -f $(APP) *.elf *.gdb *.o

.PHONY: install image

# Optionally strip the final file
ifndef CONFIG_USER_DEBUG
DO_STRIP=do_strip
endif

do_strip: all
	$(STRIP) $(APP)

install: all $(DO_STRIP)
	$(TARGETINST) -p 755 -d data/$(UPGRADE_SCRIPT) /bin/$(UPGRADE_SCRIPT)
	$(TARGETINST) -d $(APP) /bin/$(APP)

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<


