SHELL=bash
ifndef PETALINUX
$(error "Error: PETALINUX environment variable not set.  Change to the root of your PetaLinux install, and source the settings.sh file")
endif

PKGS_WORK_ROOT?=$(CURDIR)/packages-repo
SMART?=WORK_ROOT=$(PKGS_WORK_ROOT) $(CURDIR)/smart-wrapper.sh
SMART_ARCH?=$(shell MACHINE=$(MACHINE) $(CURDIR)/scan-architecture.sh $(ARCH_CPUFLAGS))
SMART_REPO?=$(shell $(SMART) plnx_locate_repo "$(SUBSYSTEM_CONFIG)")
SMART_REPO_OPT=$(addprefix -u ,$(SMART_REPO))

SMART_CHECK_ROOTFS=$(PKGS_WORK_ROOT)/
PKGS_SYSROOT_LIST=$(PKGS_WORK_ROOT)/pkgs_sysroot_list
PKGS_BASEROOT_LIST=$(PKGS_WORK_ROOT)/pkgs_baseroot_list
PKGS_INFO_BRIEF=$(PKGS_WORK_ROOT)/available_pkgs_info_brief.txt

SMART_CHECK_OPT=-r $(PKGS_WORK_ROOT)/rootfs -a $(SMART_ARCH) $(SMART_REPO_OPT)
SMART_SYSROOT_OPT=-r $(STAGEDIR) -a $(SMART_ARCH) $(SMART_REPO_OPT)
SMART_BASEROOT_OPT=-r $(TARGETDIR) -a $(SMART_ARCH) $(SMART_REPO_OPT)
ROOTFS_CONFIG_DIR=$(dir $(ROOTFS_CONFIG))
export ROOTFS_CONFIG_DIR TARGETDIR

.PHONY: $(PKGS_WORK_ROOT)/Kconfig.pkgs $(PKGS_WORK_ROOT)/Kconfig.pkgs.default update_rootfs_config_pkgs
$(PKGS_WORK_ROOT)/Kconfig.pkgs $(PKGS_WORK_ROOT)/Kconfig.pkgs.default:$(PKGS_WORK_ROOT)/.setup-smart
	@$(call do_info,"$@")
	$(SMART) gen_kconfig_file $(SMART_CHECK_OPT)

ifneq ($(shell $(SMART) repos_is_different "$(SUBSYSTEM_CONFIG)" $(PKGS_WORK_ROOT)/.setup-smart),)
.PHONY: $(PKGS_WORK_ROOT)/.setup-smart
endif
$(PKGS_WORK_ROOT)/.setup-smart:
	if [ ! -d $(PKGS_WORK_ROOT) ]; then \
		mkdir -p $(PKGS_WORK_ROOT); \
	fi; \
	rm -rf $(PKGS_WORK_ROOT)/rootfs $(PKGS_WORK_ROOT)/rootfs-tmp
	$(SMART) setup $(SMART_CHECK_OPT) || exit 255
	grep "^CONFIG_SUBSYSTEM_COMPONENT_ROOTFS_PACKAGE_REPO_URL" "$(SUBSYSTEM_CONFIG)" > $@

update_rootfs_config_pkgs $(PKGS_BASEROOT_LIST): $(PKGS_WORK_ROOT)/.setup-smart $(ROOTFS_CONFIG)
	@$(call do_info,"$@")
	$(SMART) get_pkgs_to_targetroot $(ROOTFS_CONFIG) $(PKGS_BASEROOT_LIST) $(SMART_CHECK_OPT) || exit 255


.PHONY: do_gen_sysroot do_gen_baserootfs
do_gen_sysroot: $(PKGS_BASEROOT_LIST) $(PKGS_SYSROOT_LIST) $(PKGS_WORK_ROOT)/.sysroot-setup-smart
	@$(call do_info,"$@")
	$(SMART) install_pkgs "$(PKGS_BASEROOT_LIST)" n $(SMART_SYSROOT_OPT) || exit 255
	$(SMART) install_pkgs "$(PKGS_SYSROOT_LIST)" y $(SMART_SYSROOT_OPT)

do_gen_baserootfs: $(PKGS_BASEROOT_LIST) $(PKGS_WORK_ROOT)/.baseroot-setup-smart
	@$(call do_info,"$@")
	$(SMART) install_pkgs "$(PKGS_BASEROOT_LIST)" n $(SMART_BASEROOT_OPT) || exit 255
ifneq ($(shell egrep "^CONFIG_ROOTFS_PACKAGES_PYTHON_SMARTPM=y" $(ROOTFS_CONFIG)),)
	$(SMART) rm_channels $(SMART_BASEROOT_OPT)
endif

$(PKGS_SYSROOT_LIST): $(PKGS_BASEROOT_LIST) $(PKGS_WORK_ROOT)/.sysroot-setup-smart
	@$(call do_info,"building $@")
	$(SMART) get_dev_pkgs "$(PKGS_BASEROOT_LIST)" $@ $(SMART_CHECK_OPT) || exit 255

$(PKGS_INFO_BRIEF): $(PKGS_WORK_ROOT)/.setup-smart
	$(SMART) gen_pkgs_info_brief_file $(SMART_CHECK_OPT)

$(PKGS_WORK_ROOT)/.baseroot-setup-smart: $(PKGS_WORK_ROOT)/.setup-smart $(ROOTFS_CONFIG)
	if [ ! -d $(PKGS_WORK_ROOT) ]; then \
		mkdir -p $(PKGS_WORK_ROOT); \
	fi; \
	rm -rf $(TARGETDIR) $(TARGETDIR)-tmp
	$(SMART) setup $(SMART_BASEROOT_OPT) || exit 255
	touch $@

$(PKGS_WORK_ROOT)/.sysroot-setup-smart: $(PKGS_WORK_ROOT)/.setup-smart $(ROOTFS_CONFIG)
	if [ ! -d $(PKGS_WORK_ROOT) ]; then \
		mkdir -p $(PKGS_WORK_ROOT); \
	fi; \
	rm -rf $(STAGEDIR) $(STAGEDIR)-tmp
	$(SMART) setup $(SMART_SYSROOT_OPT) || exit 255
	touch $@

.PHONY: do_smart_clean
do_smart_clean:
	rm -rf $(PKGS_WORK_ROOT)/.baseroot-setup-smart $(PKGS_WORK_ROOT)/.sysroot-setup-smart
