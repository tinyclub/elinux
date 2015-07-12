> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel "http://eLinux.org/Panda_How_to_kernel")


# Panda How to kernel



-Kernel building-

But if you want to try building your own kernel.... ;\>))

Make sure the [above](http://eLinux.org/Panda_How_to_buildroot "Panda How to buildroot")
all works first, then try the following:

    git clone git://gitorious.org/pandaboard/kernel-omap4.git

then cd to the /kernel-omap4 dir and do:

    git checkout -b experimental remotes/origin/L24.9

    make ARCH=arm omap4_panda_defconfig

    make ARCH=arm menuconfig

Import an alternate config from
[config.kernel](http://eLinux.org/images/1/1a/Config.kernel "Config.kernel") as it has
somewhat different parameters that the panda defconfig which you will
need.

edit a file so as to have some uncomitted changes ie. the git archive
needs to be "dirty" This is because the sdio.ko and tiwlan\_drv.ko were
compiled with a kernel with "version magic" of '2.6.35-g6d019da-dirty
SMP preempt mod\_unload ARMv7' and if that ain't it the modules won't
load.

    make -j10 ARCH=arm CROSS_COMPILE=/path_to_your/buildroot-2010.11/output/staging/usr/bin/arm-linux- uImage

You might want to change the -j10 to suite your CPU's capability.

Put the uImage on your vfat partion in place of the kernel from the
validation image

boot up and login in as root with no password.

try out wlan-test.sh again it should work as it did with the validation
image kernel.

Links

-   [https://www.google.com/search?sitesearch=lkml.org&q=panda](https://www.google.com/search?sitesearch=lkml.org&q=panda)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

