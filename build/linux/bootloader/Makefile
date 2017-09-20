SHELL=bash
ifndef PETALINUX
$(error "Error: PETALINUX environment variable not set.  Change to the root of your PetaLinux install, and source the settings.sh file")
endif

include $(PETALINUX)/etc/logging/logging.mk

include Makefile.autoinclude

override TYPE:=bootloader

ifndef PROOT
$(error "Failed to build $(TYPE). No PetaLinux project is specified")
endif

ifndef INSTANCE
$(error "Failed to build $(TYPE). No instance specified")
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

include $(PETALINUX)/etc/build/common.mk

ifndef ARCH
$(error "Failed to build $(INSTANCE). No ARCH specified!")
endif

ifndef ENDIAN
$(error "Failed to build $(INSTANCE). No endian specified")
endif

dir_y:=$(dir_bootloader_y)
ifeq ($(dir_y),)
$(error "Failed to build $(INSTANCE). No selected $(INSTANCE)")
endif

BOOTLOADER_NAME=$(shell basename $(dir_y))
BOOTLOADER_SRC_DIR=$(PROOT)/components/$(TYPE)/$(BOOTLOADER_NAME)

SUBMAKEENV=ARCH=$(ARCH) ENDIAN=$(ENDIAN)
SUBMAKEENV+=PROOT=$(PROOT) SUBSYSTEM=$(SUBSYSTEM)
SUBMAKEENV+=PETALINUX_SEARCH_ROOT=$(PETALINUX_SEARCH_ROOT)

HSM_TCL_SCRIPT=$(PETALINUX)/etc/hsm/scripts/petalinux_hsm_bridge.tcl

update_ps_init= \
	if grep -q "^CONFIG_SUBSYSTEM_COMPONENT_BOOTLOADER_AUTO_PS_INIT=y" "$(SUBSYSTEM_CONFIG)"; then \
		ps_init=""; \
		if [ -f "$(BOOTLOADER_SRC_DIR)/ps7_init.c" ]; then \
			ps_init=ps7_init; \
		elif [ -f "$(BOOTLOADER_SRC_DIR)/psu_init.c" ]; then \
			ps_init=psu_init; \
		fi; \
		if [ ! -z "$${ps_init}" ]; then \
			if [ -f "$(HW_DESCRIPTION)/$${ps_init}.c" ] && [ "$${ps_init}" == "psu_init" ]; then \
				rsync "$(HW_DESCRIPTION)/$${ps_init}.c" "$(BOOTLOADER_SRC_DIR)/"; \
				rsync "$(HW_DESCRIPTION)/$${ps_init}.h" "$(BOOTLOADER_SRC_DIR)/"; \
			elif [ -f "$(HW_DESCRIPTION)/psinit/$${ps_init}.c" ]; then \
				rsync "$(HW_DESCRIPTION)/psinit/$${ps_init}.c" "$(BOOTLOADER_SRC_DIR)/"; \
				rsync "$(HW_DESCRIPTION)/psinit/$${ps_init}.h" "$(BOOTLOADER_SRC_DIR)/"; \
			fi; \
		fi; \
	fi

.PHONY: all build pre-build post-build config pre-config post-config clean distclean mrproper

all: build post-build

.PHONY: autogen-bsp
autogen-bsp: $(SUBSYSTEM_CONFIG) $(SYSTEM_HDF)
	# Generate the BSP
	@$(call do_info, "generate BSP for $(BOOTLOADER_NAME)")
	env XILINX_SDK=$(PETALINUX)/tools/xsdk hsi -mode batch -source $(HSM_TCL_SCRIPT) -notrace -nojournal -nolog -tclargs "-c $(SUBSYSTEM_CONFIG) -a $(BOOTLOADER_NAME) -hdf $(SYSTEM_HDF) -o $(BOOTLOADER_SRC_DIR) -d $(PETALINUX)/etc/hsm/data" || exit 255
	$(call update_ps_init)

$(BOOTLOADER_SRC_DIR):
	# Generate the bootloader
	@$(call do_info, "generate $@")
	env XILINX_SDK=$(PETALINUX)/tools/xsdk hsi -mode batch -source $(HSM_TCL_SCRIPT) -notrace -nojournal -nolog -tclargs "-c $(SUBSYSTEM_CONFIG) -a $(BOOTLOADER_NAME) -hdf $(SYSTEM_HDF) -o $(BOOTLOADER_SRC_DIR) -d $(PETALINUX)/etc/hsm/data" || exit 255
	$(call update_ps_init)

.PHONY: $(CURDIR)/$(BOOTLOADER_NAME)
$(CURDIR)/$(BOOTLOADER_NAME): $(BOOTLOADER_SRC_DIR)
	rsync -a "$(BOOTLOADER_SRC_DIR)/" "$@/"

oldconfig:
config:

pre-build:

build: $(IMAGEROOT) $(BOOTLOADER_SRC_DIR) $(CURDIR)/$(BOOTLOADER_NAME)
	@$(call do_info, "build $(BOOTLOADER_NAME)")
	if [ -f $(BOOTLOADER_NAME)/$(BOOTLOADER_NAME)_bsp/Makefile ]; then \
		make -C $(BOOTLOADER_NAME)/$(BOOTLOADER_NAME)_bsp all || exit 255; \
	fi
	make -C $(BOOTLOADER_NAME) all
	rsync -a $(BOOTLOADER_NAME)/executable.elf $(IMAGEROOT)/$(BOOTLOADER_NAME).elf

post-build:

clean:
	make -C $(BOOTLOADER_NAME) clean

pre-install:
install: $(IMAGEROOT)

post-install:

$(IMAGEROOT):
	mkdir -p "$@"

help:
	@echo ""
	@echo "Quick reference for various supported build targets for u-boot."
	@echo "----------------------------------------------------"
	@echo "  clean               clean out compiled files, but not config"
	@echo "  distclean           clean out all build files"
	@echo "  build               build u-boot"
	@echo "  install               install u-boot images to images/ directory"
	@echo "  <UBOOT_TARGET>_only make a specific u-boot target"
	@echo "  all                 configure build environment and build"


