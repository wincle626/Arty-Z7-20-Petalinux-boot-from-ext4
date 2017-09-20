SHELL=bash
ifndef PETALINUX
$(error "Error: PETALINUX environment variable not set.  Change to the root of your PetaLinux install, and source the settings.sh file")
endif

include $(PETALINUX)/etc/logging/logging.mk

TYPE:=device-tree

include Makefile.autoinclude

ifndef PROOT
$(error "Failed to build $(TYPE). No PetaLinux project is specified")
endif

ifndef INSTANCE
$(error "Failed to build $(TYPE). No instance is specified")
endif

ifndef CONFIGROOT
$(error "Failed to build $(INSTANCE). No configuration root directory is specified")
endif

ifndef IMAGEROOT
$(error "Failed to build $(INSTANCE). No image directory is specified")
endif

ifndef SUBSYSTEM_CONFIG
$(error "Failed to build $(INSTANCE). No subsystem configuration file is specified")
endif

ifndef HW_DESCRIPTION
$(error "Failed to build $(INSTANCE). No hw-description is sepecified")
endif

ifndef DTS_DIR
$(error "Failed to build $(INSTANCE). No DTS directory is sepecified")
endif

include $(PETALINUX)/etc/build/common.mk

DTG_TCL_SCRIPT=$(PETALINUX)/etc/hsm/scripts/petalinux_hsm_bridge.tcl

.PHONY: 

all: build install

pre-config:

oldconfig:
config:

.PHOHY: autogen-dts
autogen-dts:
	@$(call do_info, "generate DTS to $(DTS_DIR)")
	hsi -mode batch -source $(DTG_TCL_SCRIPT) -notrace -nojournal -nolog -tclargs "-c $(SUBSYSTEM_CONFIG) -a device-tree -hdf $(SYSTEM_HDF) -o $(DTS_DIR) -d $(PETALINUX)/etc/hsm/data"

post-config:

pre-build:

ifeq ($(ARCH),aarch64)
build: system.dtb xen.dtb
else
build: system.dtb
endif

system.dtb: $(wildcard $(DTS_DIR)/*.dtsi) $(wildcard $(DTS_DIR)/*.dts) $(SUBSYSTEM_CONFIG)
	@$(call do_info, "build $@")
	padding_size=$$(grep "^CONFIG_SUBSYSTEM_DTB_PADDING_SIZE=" "$(SUBSYSTEM_CONFIG)" | cut -d "=" -f 2); \
	dtc_include=$$(eval echo $$(grep "SUBSYSTEM_DEVICE_TREE_INCLUDE_DIR=" "$(SUBSYSTEM_CONFIG)" | cut -d "=" -f 2 | cut -d "\"" -f 2)); \
	if [ -z "$${dtc_include}" ]; then \
		dtc_include="$(CURDIR)"; \
	fi; \
	$(CPP) $(CPPFLAGS) -nostdinc -Ulinux -I"$(DTS_DIR)" -I"$${dtc_include}" -x assembler-with-cpp -o "$(CURDIR)/pre-system-top.dts" "$(DTS_DIR)/system-top.dts"; \
	dtc -O dtb -o "$(CURDIR)/$@" -b 0 -p $$(($${padding_size})) -I dts -i "$(DTS_DIR)" -i "$${dtc_include}" "$(CURDIR)/pre-system-top.dts" || exit 255; \

xen.dtb: $(wildcard $(DTS_DIR)/*.dtsi) $(wildcard $(DTS_DIR)/*.dts) $(SUBSYSTEM_CONFIG)
ifneq ("$(wildcard $(DTS_DIR)/xen.dts)","")
	@$(call do_info, "build $@")
	padding_size=$$(grep "^CONFIG_SUBSYSTEM_DTB_PADDING_SIZE=" "$(SUBSYSTEM_CONFIG)" | cut -d "=" -f 2); \
	dtc_include=$$(eval echo $$(grep "SUBSYSTEM_DEVICE_TREE_INCLUDE_DIR=" "$(SUBSYSTEM_CONFIG)" | cut -d "=" -f 2 | cut -d "\"" -f 2)); \
	if [ -z "$${dtc_include}" ]; then \
		dtc_include="$(CURDIR)"; \
	fi; \
	$(CPP) $(CPPFLAGS) -nostdinc -Ulinux -I"$(DTS_DIR)" -I"$${dtc_include}" -x assembler-with-cpp -o "$(CURDIR)/pre-xen.dts" "$(DTS_DIR)/xen.dts"; \
	dtc -O dtb -o "$(CURDIR)/$@" -b 0 -p $$(($${padding_size})) -I dts -i "$(DTS_DIR)" -i "$${dtc_include}" "$(CURDIR)/pre-xen.dts" || exit 255;
endif

$(IMAGEROOT):
	mkdir -p $@

post-build:

pre-install:

install: build $(IMAGEROOT)
	@$(call do_info, "install device trees")
	rsync system.dtb "$(IMAGEROOT)"/
ifeq ($(ARCH),aarch64)
ifneq ("$(wildcard $(DTS_DIR)/xen.dts)","")
	rsync xen.dtb "$(IMAGEROOT)"/
endif
endif

post-install:

clean:
	rm -rf system.dtb
ifeq ($(ARCH),aarch64)
	rm -rf xen.dtb
endif

mrproper distclean:

help:
	@echo ""
	@echo "Quick reference for various supported build targets for $(INSTANCE)."
	@echo "----------------------------------------------------"
	@echo "  clean          clean out compiled files"
	@echo "  mrproper       clean out all non-distributed files"
	@echo "  distclean      clean out all non-distributed files"
	@echo "  build          build $(INSTANCE)"
	@echo "  all            build $(INSTANCE) and copy DTB to images/ directory"
