cmd_drivers/video/fbdev/core/built-in.o :=  arm-linux-gnueabihf-ld -EL    -r -o drivers/video/fbdev/core/built-in.o drivers/video/fbdev/core/fb_notify.o drivers/video/fbdev/core/fb_cmdline.o drivers/video/fbdev/core/fb.o drivers/video/fbdev/core/cfbfillrect.o drivers/video/fbdev/core/cfbcopyarea.o drivers/video/fbdev/core/cfbimgblt.o drivers/video/fbdev/core/sysfillrect.o drivers/video/fbdev/core/syscopyarea.o drivers/video/fbdev/core/sysimgblt.o drivers/video/fbdev/core/fb_sys_fops.o 
