SHELL=bash
ifndef PETALINUX
$(error "Error: PETALINUX environment variable not set.  Change to the root of your PetaLinux install, and source the settings.sh file")
endif

include $(PETALINUX)/etc/logging/logging.mk
include $(PETALINUX)/etc/build/plnx-common-functions.mk

dir_kernel_y:=
dir_u_boot_y:=
dir_arm_trusted_firmware_y:=
dir_rootfs_y:=
dir_generic_y:=
dir_bootloader_y:=
include Makefile.autoinclude

ifndef PROOT
$(error "PetaLinux project is not specified!")
endif

ifndef INSTANCE
$(error "Subsystem instance is not defined!")
endif

ifeq ($(SUBSYSTEM),)
$(error "Failed to build $(INSTANCE)! no Subsystem is specified!")
endif

ifeq ($(SUBSYSTEM_CONFIG),)
$(error "Failed to build $(INSTANCE)! no Subsystem configuration file is specified!")
endif

dir_y:=$(dir_device_tree_y) $(dir_kernel_y) $(dir_u_boot_y) $(dir_bootloader_y) $(dir_arm_trusted_firmware_y) $(dir_rootfs_y) $(dir_generic_y) 

KCONFIGFILE=$(CURDIR)/Kconfig
TYPE:=subsystem

all: pre-build build post-build pre-install install post-install package
.PHONY: pre-config config post-config pre-build build post-build pre-install install post-install package

SUB_DO:=$(addprefix sub_post-config_component_,$(dir_y))
SUB_DO+=$(addprefix sub_pre-build_component_,$(dir_y))
SUB_DO+=$(addprefix sub_build_component_,$(dir_y))
SUB_DO+=$(addprefix sub_post-build_component_,$(dir_y))
SUB_DO+=$(addprefix sub_pre-install_component_,$(dir_y))
SUB_DO+=$(addprefix sub_install_component_,$(dir_y))
SUB_DO+=$(addprefix sub_post-install_component_,$(dir_y))
SUB_DO+=$(addprefix sub_clean_component_,$(dir_y))

$(SUB_DO):
	$(eval TARGET:=$(subst sub_,,$(firstword $(subst _component_, ,$@))))
	$(eval SUBCOMPONENT:=$(subst sub_$(TARGET)_component_,,$@))
	$(eval SINSTANCE:=$(shell echo $@ | awk -F "/" '{print $$2}'))
	$(eval STYPE:=$(shell echo $@ | awk -F "/" '{print $$3}'))
	$(eval SMULTI:=$(shell echo $@ | awk -F "/" '{print $$4}'))
	$(eval SNAME:=$(shell echo $@ | awk -F "/" '{print $$5}'))
	if [ ! -z "$(SINSTANCE)" ] && [ ! "$(SINSTANCE)" == "none" ]; then \
		sinstance=$(SINSTANCE); \
		sbuild=$(SINSTANCE); \
	elif [ "$(SMULTI)" == "multi" ]; then \
		sinstance=$(SNAME); \
		sbuild=$(STYPE)/$(SNAME); \
	else \
		sinstance=$(STYPE); \
		sbuild=$(STYPE); \
	fi; \
	$(MAKE) INSTANCE=$(INSTANCE)/$${sinstance} -C $${sbuild} $(TARGET)

oldconfig: $(KCONFIGFILE)
	$(call do_info,"$@ $(INSTANCE)")
	$(call plnx_qpushd,$(PROOT)); yes "" | env KCONFIG_CONFIG="$(SUBSYSTEM_CONFIG)" conf "$(KCONFIGFILE)" || exit 255; $(call plnx_qpopd)

config: $(KCONFIGFILE)
	$(call do_info,"$@ $(INSTANCE)")
	env KCONFIG_CONFIG="$(SUBSYSTEM_CONFIG)" mconf "$(KCONFIGFILE)" || exit 255

ifeq ($(SYSTEM_HDF),)
empty-syshw-kconfig:
	echo "" > "$(CURDIR)/Kconfig.syshw"
	echo "" > "$(CURDIR)/plnx_syshw_data"

generate-hw-kconfig $(CURDIR)/Kconfig.syshw: empty-syshw-kconfig
	@$(call do_info,"system XML file doesn't exist in the hardware description.")
	@$(call do_info,"device-tree/u-boot/kernel config files auto generation/modfication is disabled.")
	petalinux-linuxsys-utils empty_kconfig_syshw "$(SUBSYSTEM_CONFIG)"
else
generate-hw-kconfig:$(CURDIR)/Kconfig.syshw
$(CURDIR)/Kconfig.syshw:$(SYSTEM_HDF) hw-description/hw-description.tcl data/ipinfo.yaml
	TYPE=$(TYPE) INSTANCE=$(INSTANCE) PROOT=$(PROOT) petalinux-linuxsys-utils plnx_gen_hwconfig "$@" "$(SYSTEM_HDF)"
endif

.PHONY: $(KCONFIGFILE)
pre-config $(KCONFIGFILE): $(CURDIR)/Kconfig.syshw
	#generate Kconfig file
	TYPE=$(TYPE) INSTANCE=$(INSTANCE) PROOT=$(PROOT) petalinux-linuxsys-utils plnx_gen_sys_conf "$(SYSTEM_HDF)"

.PHONY: post-config-autoconfig post-config-auto-dts post-config-auto-bootloader
post-config-auto-config:
	if [ ! -f "$(SYSTEM_HDF)" ]; then \
		petalinux-linuxsys-utils empty_kconfig_syshw "$(SUBSYSTEM_CONFIG)"; \
	fi
	TYPE=$(TYPE) INSTANCE=$(INSTANCE) PROOT=$(PROOT) petalinux-linuxsys-utils plnx_post_sys_conf "$(SUBSYSTEM_CONFIG)" "$(LINUX_CONFIG)" "$(ROOTFS_CONFIG)" || exit 255
	$(call plnx_qpushd,$(PROOT)); yes "" | env KCONFIG_CONFIG="$(SUBSYSTEM_CONFIG)" conf "$(KCONFIGFILE)" || exit 255; $(call plnx_qpopd)

post-config-auto-dts: post-config-auto-config
	if grep -q "^CONFIG_SUBSYSTEM_AUTOCONFIG_DEVICE__TREE=y" "$(SUBSYSTEM_CONFIG)"; then \
		$(MAKE) INSTANCE=$(INSTANCE)/device-tree SUBSYSTEM=$(INSTANCE) -C device-tree autogen-dts; \
		if [ ! $$? -eq 0 ]; then \
			exit 255; \
		fi; \
	fi

post-config-auto-bootloader: post-config-auto-config
	if grep -q "^CONFIG_SUBSYSTEM_COMPONENT_BOOTLOADER_AUTO_FSBL=y" "$(SUBSYSTEM_CONFIG)"; then \
		$(MAKE) INSTANCE=$(INSTANCE)/bootloader SUBSYSTEM=$(INSTANCE) -C bootloader autogen-bsp; \
		if [ ! $$? -eq 0 ]; then \
			exit 255; \
		fi; \
	fi

post-config:| post-config-auto-config post-config-auto-dts post-config-auto-bootloader

pre-build:| $(addprefix sub_pre-build_component_,$(dir_y))
build:| $(addprefix sub_build_component_,$(dir_y))
post-build: | $(addprefix sub_post-build_component_,$(dir_y))
pre-install: | $(addprefix sub_pre-install_component_,$(dir_y))
install: | $(addprefix sub_install_component_,$(dir_y))
post-install: | $(addprefix sub_post-install_component_,$(dir_y))
clean: | $(addprefix sub_clean_component_,$(dir_y))

package:
	make INSTANCE=$(SUBSYSTEM) SUBSYSTEM=$(SUBSYSTEM) -f Makefile.package package-subsystem

package-%:
	make INSTANCE=$(SUBSYSTEM) SUBSYSTEM=$(SUBSYSTEM) -f Makefile.package $@

distclean:

mrproper:

help:
	@echo ""
	@echo "Quick reference for various supported build targets for $(INSTANCE)."
	@echo "----------------------------------------------------"
	@echo "  clean                  clean out build objects"
	@echo "  distclean              clean out build"
	@echo "  all                    build subsystem and generate final image"
	@echo "  build                  build subsystem"
	@echo "  install                install built objects to target subsystem host copy"
	@echo "  package                combine target file system and kernel into final image"
