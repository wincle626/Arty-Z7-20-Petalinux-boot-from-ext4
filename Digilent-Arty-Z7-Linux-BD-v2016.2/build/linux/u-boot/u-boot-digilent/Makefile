# Automatically generated by /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/download/u-boot-digilent/scripts/mkmakefile: don't edit

VERSION = 2016
PATCHLEVEL = 07

lastword = $(word $(words $(1)),$(1))
makedir := $(dir $(call lastword,$(MAKEFILE_LIST)))

ifeq ("$(origin V)", "command line")
VERBOSE := $(V)
endif
ifneq ($(VERBOSE),1)
Q := @
endif

MAKEARGS := -C /home/yunwu/workspaces/gitworkspace/arty-z7/Arty-Z7-20-Petalinux-boot-from-ext4/Digilent-Arty-Z7-Linux-BD-v2016.2/build/linux/u-boot/download/u-boot-digilent
MAKEARGS += O=$(if $(patsubst /%,,$(makedir)),$(CURDIR)/)$(patsubst %/,%,$(makedir))

MAKEFLAGS += --no-print-directory

.PHONY: __sub-make $(MAKECMDGOALS)

__sub-make:
	$(Q)$(MAKE) $(MAKEARGS) $(MAKECMDGOALS)

$(filter-out __sub-make, $(MAKECMDGOALS)): __sub-make
	@:
