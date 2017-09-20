SHELL=bash
ifndef PETALINUX
$(error "Error: PETALINUX environment variable not set.  Change to the root of your PetaLinux install, and source the settings.sh file")
endif

TYPE:=rootfs

dir_packages_repo_y:=
dir_modules_y:=
dir_libs_y:=
dir_apps_y:=

include Makefile.autoinclude

ifndef INSTANCE
$(error "instance is not defined!")
endif

ifeq ($(SUBSYSTEM),)
$(error "Failed to build $(INSTANCE)! no Subsystem is specified!")
endif

ifeq ($(SUBSYSTEM_CONFIG),)
$(error "Failed to build $(INSTANCE)! no Subsystem configuration file is specified!")
endif

ifeq ($(CONFIGFILE),)
$(error "Failed to build $(INSTANCE)! no configuration file is specified!")
endif

ifeq ($(ROOTFS),)
$(error "Failed to build $(INSTANCE)! no rootfs is specified")
endif

ifeq ($(ROOTFS_CONFIG),)
$(error "Failed to build $(INSTANCE)! no rootfs configuration file is specified")
endif

ifeq ($(TARGETDIR),)
$(error "Failed to build $(INSTANCE)! no target directory is specified")
endif

ifeq ($(STAGEDIR),)
$(error "Failed to build $(INSTANCE)! no stage directory is specified")
endif

ifeq ($(TARGETINST),)
$(error "Failed to build $(INSTANCE)! no target installer is specified")
endif

ifeq ($(LINUX_KERNEL),)
$(err "Failed to build $(INSTANCE)! no kernel is specified")
endif

include $(PETALINUX)/etc/build/common.mk
include $(PETALINUX)/etc/build/plnx-common-functions.mk
include smart-pkgs-common.mk

DEVICES:=console,c,5,1
ifeq ($(shell grep -e "^[[:space:]]*CONFIG_ROOTFS_PACKAGES_BUSYBOX_MDEV=" $(ROOTFS_CONFIG) 2>/dev/null),)
MANUAL_CREATE_DEVS=y
include $(CURDIR)/manual_mdev.mak
endif

KCONFIGFILE:=$(CURDIR)/Kconfig

dir_y:=$(dir_packages_repo_y) $(dir_modules_y) $(dir_libs_y) $(dir_apps_y)

.PHONY: all pre-config config post-config pre-build build post-build pre-install install post-install clean

all: pre-build build post-build pre-install install post-install

do_kmodules_build:
	if [ ! -f "$(PROOT)/build/$(LINUX_KERNEL)/link-to-kernel-build/Module.symvers" ]; then \
		$(call do_info,"Not going to build kernel modules since kernel hasn't been built."); \
		exit 0; \
	fi; \
	$(call do_info,"build kernel in-tree modules"); \
	$(MAKE) INSTANCE=$(LINUX_KERNEL) -C $(PROOT)/build/$(LINUX_KERNEL) modules_only

do_kmodules_install:
	if [ ! -f "$(PROOT)/build/$(LINUX_KERNEL)/link-to-kernel-build/Module.symvers" ]; then \
		$(call do_info,"Not going to install kernel modules since kernel hasn't been built."); \
		exit 0; \
	fi; \
	$(call do_info,"install kernel in-tree modules"); \
	$(MAKE) INSTANCE=$(LINUX_KERNEL) INSTALL_MOD_PATH=$(TARGETDIR) -C $(PROOT)/build/$(LINUX_KERNEL) modules_install_only

$(addprefix sub_build_component_,$(dir_libs_y) $(dir_apps_y)):| check_multiarch do_gen_sysroot
$(addprefix sub_build_component_,$(dir_modules_y)):| do_kmodules_build
$(addprefix sub_install_component_,$(dir_modules_y)):| do_kmodules_install
$(addprefix sub_install_component_,$(dir_libs_y) $(dir_apps_y)):| do_gen_baserootfs sys_init_install
sys_init_install: do_gen_baserootfs

sys_init_install: $(addprefix sub_install_component_,$(dir_packages_repo_y)) check_multiarch
	@$(call do_info,"install sys_init")
	$(MAKE) INSTANCE=$(INSTANCE)/sys_init SUBSYSTEM=$(SUBSYSTEM) -C $(CURDIR)/sys_init install

check_multiarch:
	$(call postprocess_multiarch,$(STAGEDIR))


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

.PHONY: $(KCONFIGFILE)
$(KCONFIGFILE): $(PKGS_WORK_ROOT)/Kconfig.pkgs ${PKGS_WORK_ROOT}/Kconfig.pkgs.default
	#generate Kconfig file
	$(eval DEFAULT_PACKAGE_REPO:=plnx-repo)
	@(echo "mainmenu \"$(INSTANCE) Configuration\""; \
	echo "config ARCH_$(shell $(call fix_kconfig_name,$(ARCH)))"; \
	echo "	bool"; \
	echo "	default y"; \
	echo "menu \"Filesystem Packages\""; \
	echo "source \"$(PKGS_WORK_ROOT)/Kconfig.pkgs.default\""; \
	echo "source \"$(PKGS_WORK_ROOT)/Kconfig.pkgs\""; \
	echo "endmenu"; \
	echo "menu \"Libs\""; \
	$(call generate_component_config_multi,$(TYPE),libs,); \
	echo "endmenu"; \
	echo "menu \"Apps\""; \
	$(call generate_component_config_multi,$(TYPE),apps,); \
	echo "endmenu"; \
	echo "menu \"Modules\""; \
	$(call generate_component_config_multi,$(TYPE),modules,); \
	echo "endmenu"; \
	cat Kconfig.part) > $(KCONFIGFILE)

oldconfig: $(KCONFIGFILE) update_rootfs_config_pkgs
	$(call do_info,"$@ $(INSTANCE)")
	$(call plnx_qpushd,$(PROOT)); yes "" | env KCONFIG_CONFIG="$(ROOTFS_CONFIG)" conf "$(KCONFIGFILE)" || exit 255; $(call plnx_qpopd)
	touch $(PKGS_BASEROOT_LIST)

config: $(KCONFIGFILE)
	$(call do_info,"$@ $(INSTANCE)")
	env KCONFIG_CONFIG="$(ROOTFS_CONFIG)" mconf "$(KCONFIGFILE)" || exit 255

post-config:

$(addprefix sub_pre-build_component_,$(dir_y)): config_checksum

CONFIGMD5SUM=$(shell grep ^CONFIG_ "$(ROOTFS_CONFIG)" 2>/dev/null | md5sum - | cut -d " " -f 1)
BUILDCONFIGMD5SUM=$(shell head -n 1 config_checksum 2>/dev/null)

.PHONY: config_checksum
config_checksum:
	if [ -z "$(CONFIGMD5SUM)" ]; then \
		echo "ERROR: cannot calculate checksum of $(INSTANCE) config file."; \
		echo "ERROR: Please run petalinux-config -c $(INSTANCE) first."; \
		exit 255; \
	elif [ -z "$(BUILDCONFIGMD5SUM)" ]; then \
		echo "$(CONFIGMD5SUM)" > "$@"; \
	elif [ ! "$(CONFIGMD5SUM)" == "$(BUILDCONFIGMD5SUM)" ]; then \
		echo "$(CONFIGMD5SUM)" > "$@"; \
		$(MAKE) INSTANCE=$(INSTANCE) clean; \
	fi

pre-build:| $(addprefix sub_pre-build_component_,$(dir_y))
build:| $(addprefix sub_build_component_,$(dir_y)) do_kmodules_build
post-build:| $(addprefix sub_post-build_component_,$(dir_y))
pre-install:| $(addprefix sub_pre-install_component_,$(dir_y))

post-install:$(addprefix sub_post-install_component_,$(dir_y))
clean:$(addprefix sub_clean_component_,$(dir_y)) do_smart_clean
	rm -rf "$(TARGETDIR)" "$(STAGEDIR)"

install: | do_gen_baserootfs sys_init_install $(addprefix sub_install_component_,$(dir_y)) do_kmodules_install
	$(call postprocess_multiarch,$(TARGETDIR))
	# Mount point for devpts filesystem
	mkdir -p $(TARGETDIR)/dev/pts

	env TARGETDIR=$(TARGETDIR) $(TARGETINST) -s /var/tmp /tmp

	for i in $(DEVICES); do \
		touch $(TARGETDIR)/dev/@$$i; \
	done
ifeq ($(MANUAL_CREATE_DEVS),y)
	# these permissions are needed for openpty and family to work
	# on non-ptmx ptys
	chmod 622 $(TARGETDIR)/dev/@[pt]ty[pqrsPQRS][0-9a-f],*
	for i in $(NET_DEVICES); do \
		mkdir -p $(TARGETDIR)/dev/net; \
		touch $(TARGETDIR)/dev/net/@$$i; \
	done

	# make I2C nodes if necessary
	if grep -q "^CONFIG_I2C=y" $(LINUX_CONFIG) 2>/dev/null; then \
		for i in 0 1 2 3 4 5 6 7; do \
			touch $(TARGETDIR)/dev/@i2c-$$i,c,$(I2C_MAJOR),$$i; \
		done; \
	fi
endif # CONFIG_ROOTFS_PACKAGES_BUSYBOX_MDEV

help:
	@echo ""
	@echo "Quick reference for various supported make commands for $(INSTANCE)."
	@echo "----------------------------------------------------"
	@echo "clean          clean out compiled files, but not config"
	@echo "distclean      clean out all generated build files"
	@echo "config         configure $(INSTANCE) build environment"
	@echo "build          build $(INSTANCE)"
	@echo "install        install all files to target filesystem host copy"
