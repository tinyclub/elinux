> From: [eLinux.org](http://eLinux.org/Didj_2.6.31_Kernel "http://eLinux.org/Didj_2.6.31_Kernel")


# Didj 2.6.31 Kernel



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Software Needed](#software-needed)
-   [4 Hardware needed](#hardware-needed)
-   [5 Driver patching and Kernel
    Configuration](#driver-patching-and-kernel-configuration)

## Summary

This tutorial will take you through the basic steps to get the 2.6.31
Kernel (LF-Linux-2503-20110602-1237.tar.gz) loading on your Didj. This
will only deal with the kernel, and will be set up to run completely
from SD, rootfs included.

## Prerequisites

[Kernel
Configuration](http://eLinux.org/LeapFrog_Pollux_Platform:_Kernel_Configuration "LeapFrog Pollux Platform: Kernel Configuration")

## Software Needed

[Leapster Explorer
Source](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#Leapster_Explorer "LeapFrog Pollux Platform: Source Code")
(LF-Linux-2503-20110602-1237.tar.gz)

[Example Config
File](http://dl.dropbox.com/u/12747635/Didj_LX/explorer_madrid/mmc/host/lf1000_didj_defconfig)

[Example Binary
zImage](http://dl.dropbox.com/u/12747635/Didj_LX/explorer_madrid/mmc/host/zImage)

[lf1000.c JFFS2/Partions
Enabled](http://dl.dropbox.com/u/12747635/Didj_LX/explorer_madrid/mmc/host/lf1000.c)

[mes\_sdhc.c explorer/didj updated mmc
driver](http://dl.dropbox.com/u/12747635/Didj_LX/explorer_madrid/mmc/host/mes_sdhc.c)

## Hardware needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

## Driver patching and Kernel Configuration

Here we will configure the kernel for compiling, currently if you are
using Lightning Boot 1.4 to 2.1 there is a problem with the bootloaders
framebuffer and where the kernel is loaded. Two ways currently around
this, create a kernel \< 2mb or boot it manually with uboot and a lower
address. This tutorial uses the \< 2mb method, which is easy to achieve
after all the modules for things Didj doesn't have are removed and we've
set a couple of things up like tux boot image.

Unpack your sources to a suitable dir, download the mes\_sdhc.c
explorer/didj updated mmc driver from the link in the software needed
section, copy it to linux-2.6/drivers/mmc/host overwriting the original
version. This enables the sd0 port to be enabled at boot time for the
didj and explorer.


 Now download the lf1000.c JFFS2/Partions Enabled file from the software
needed section, copy it to linux-2.6/drivers/mtd/nand/, this will allow
us to see and mount the didj partitions once we've got the kernel
booted.

Now download the Example Config file from the software needed section,
copy it to linux-2.6/arch/arm/configs, this will give you the kernel
.config that we know works with all versions of lightning boot from
1.4-2.1. If you want to see what we've done compare the
lf1000\_didj\_defconfig you downloaded to lf1000\_ts\_defconfig for more
details.

This will disable a few things, such as Touch Screen, Acellerometer,
Camera, USB Host, 3d etc. but it will also add tux while it boots and
still produces a kernel that it 1.8MB well below the limits set by
lightning boot.

at the command line do:

    make lf1000_didj_defconfig

this will load the defconfig into our .config file, almost ready to
compile the kernel :)


 Next we need to change the Mach Type in
*/linux-2.6/arch/arm/tools/mach-types* the number has changed to 2028 -
but the boot loader only knows about 1235:

    #zir2412       MACH_ZIR2412        ZIR2412         1235
    didj            MACH_DIDJ       DIDJ            1235
    ...
    ...

    #didj           MACH_DIDJ       DIDJ            2028


 Then just run the install script from linux-2.6/ directory.

    ./install.sh

zImage will be found in the path defined with \$TFTP\_PATH in your
Environmental Variables

or you can just do:

    make zImage

zImage will be in linux-2.6/arch/arm/boot

Of course if you don't want to do all that you can download a prebuilt
kernel from the software needed section.

To Do:

    Fixup the audio driver?  Might just need the right rootfs on the card :D
    fixup the volume button
    writeup putting a rootfs on the sd card
    fixup the divide by zero error in the kernel boot messages, I think its the mtd_part_size thing in the nand driver changes, it uses a null flag to tell the driver to do from that point to the end of the remaining nand without having to work things out.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

