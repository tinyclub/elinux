> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel_3_2_rcx "http://eLinux.org/Panda_How_to_kernel_3_2_rcx")


# Panda How to kernel 3 2 rcx



## Contents

-   [1 Introduction](#introduction)
-   [2 rc1](#rc1)
-   [3 rc2](#rc2)
-   [4 rc3](#rc3)
-   [5 rc4](#rc4)
-   [6 rc5](#rc5)
-   [7 rc6](#rc6)
-   [8 rc7](#rc7)
-   [9 PandaBoard ES](#pandaboard-es)
-   [10 wlan12xx patch](#wlan12xx-patch)
-   [11 DVI Patch](#dvi-patch)
-   [12 I2C Patch](#i2c-patch)
-   [13 USB Performance improvement](#usb-performance-improvement)
-   [14 Building](#building)
-   [15 Testing](#testing)
    -   [15.1 fbtest on DVI Port](#fbtest-on-dvi-port)
    -   [15.2 Switching primary display to the HDMI port -\> Currently
        not functional
        \<-](#switching-primary-display-to-the-hdmi-port-3e-currently-not-functional-3c)
    -   [15.3 Switching primary display to the DVI
        port](#switching-primary-display-to-the-dvi-port)
    -   [15.4 fbtest on HDMI Port -\> Currently not functional
        \<-](#fbtest-on-hdmi-port-3e-currently-not-functional-3c)
    -   [15.5 i2cdetect](#i2cdetect)
    -   [15.6 wlan](#wlan)
    -   [15.7 USB Performance](#usb-performance)

## Introduction

The merge window for 3.2 is over and we are currently at v3.2-rc6. Lots
of work on the OMAP platforms and on Pandaboard. Let's see what the
various release candidates have provided.

You can download a tarball of the mainline kernel at
[http://kernel.org/](http://kernel.org/)

or you can clone a copy of mainline kernel with:

    git clone http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    cd linux
    git checkout v3.2-rcx

where x is the release candidate version.

**Important Note** There has been a lot of work done on the HDMI
interface and its related driver omapdrm. Between kernel 3.1 and 3.2-rc1
enough changed so that the Testing section on the HDMI interface is no
longer correct. The hdmi init functions are no longer in
arch/arm/mach\_omap2/board-omap4panda.c. When this situation stabilises,
the HDMI testing section below will be updated.



## rc1

There are several issues requiring new patches. The WL12xx driver needs
newer firmware, and the same patch as used for 3.1. when the driver
isn't happy, the error messages are somewhat less than useful, however
the drivers/firmware are being constantly improved and it would not be a
good idea to have the driver support anything but the latest firmware.
Still a work in progress.

## rc2

There are no changes to OMAP or PandaBoard related code in the -rc2
release, or any fixes that would eliminate any of the patches required
for -rc1, so we'll skip testing this release for a bit.

## rc3

There were no changes to OMAP or PandaBoard related code in the -rc3
release. The same patches required for -rc1 work for the -rc3 sources,
and the kernel works as does the -rc1.

## rc4

There were quite a few updates to OMAP code, but no PandaBoard related
changes. The same patches required for -rc1 & -rc3 work for the -rc4
sources, and the kernel works as does the -rc1 & -rc3.

## rc5

There were no changes to OMAP or PandaBoard related code in the -rc5
release. The same patches required for -rc1, -rc3 & -rc4 work for the
-rc5 sources, and the kernel works as well.

## rc6

There were no changes to PandaBoard related code in the -rc6 release.
The same patches required for -rc1, -rc3, -rc4 & -rc5 work for the -rc6
sources, and the kernel works as well.

## rc7

Inching towards the 3.2 release. There were no changes to PandaBoard
related code in the -rc7 release, although there was an OMAP change
relating to I2c. The same patches required for -rc1, -rc3, -rc4, -rc5
and -rc6 work for the -rc7 sources, and the kernel works as well.

## PandaBoard ES

There is now a PandaBoard ES
[http://pandaboard.org/content/pandaboard-es](http://pandaboard.org/content/pandaboard-es)
which includes an OMAP 4460 at up to 1.2GHz. Several important
differences make it important (at the present time) that the [MLO/u-boot
be specifically crafted for the
4460](http://eLinux.org/PandaBoard_ES_uboot_howto "PandaBoard ES uboot howto"). The
thermal management is not in the mainline 4430 code as yet and therefore
the max clock frequency when running the OMAP4460 on the PandaBoard ES
with the mainline kernel is 920MHz(same as the OMAP4430).


 The latest wlan firmware is available from git:
[git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git](git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git)
just copy the contents of the ti-connectivity folder to
/lib/firmware/ti-connectivity.

## wlan12xx patch

This patch is necessary to resolve the issue noted in 3.0 and 3.1, the
code was moved to twl\_common.c and a patch is supposed to be in -rc2 or
-rc3.

[0001a-omap4-pandaboard-wlan-fix.patch](http://eLinux.org/images/8/8d/0001a-omap4-pandaboard-wlan-fix.patch "0001a-omap4-pandaboard-wlan-fix.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0001a-omap4-pandaboard-wlan-fix.patch

## DVI Patch

A patch is no longer necessary to make 720p resolution available. The
DVI driver now reads the EDID and sets the resolution on bootup if the
display is plugged into the DVI connector. If the display is not plugged
in on bootup it will default to 640 x 480.

## I2C Patch

i2c character device driver patch that has been necessary is no longer
required, however a couple of issues still need patching, so a new patch
is required

[0002a-omap4-pandaboard-i2c.patch](http://eLinux.org/images/f/ff/0002a-omap4-pandaboard-i2c.patch "0002a-omap4-pandaboard-i2c.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0002a-omap4-pandaboard-i2c.patch

## USB Performance improvement

This patch fixs one performance bug on ARM Cortex A9 dual core platform,
which has been reported on quite a few ARM machines (OMAP4, Tegra 2,
snowball...), see details from link of
[https://bugs.launchpad.net/bugs/709245](https://bugs.launchpad.net/bugs/709245).

[0006-omap4-usb-improvement.patch](http://eLinux.org/images/4/48/0006-omap4-usb-improvement.patch "0006-omap4-usb-improvement.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0006-omap4-usb-improvement.patch

## Building

Building 3.2-rc1,3,4,5,6,7 is a bit different from previous How-To's if
you want to have a working wlan.

In order to ensure that the wlan starts up consistently, it is
recommended that the wl12xx driver be built as a module and started
after the PandaBoard has booted.

Grab the 3.2-rc1,3,4,5,6,7 sources and use
[config.3.2-rc1.1](http://eLinux.org/images/2/21/Config.3.2-rc1.1 "Config.3.2-rc1.1"),
[config.3.2-rc3.1](http://eLinux.org/images/d/d4/Config.3.2-rc3.1 "Config.3.2-rc3.1"),
[config.3.2-rc4.1](http://eLinux.org/images/c/c5/Config.3.2-rc4.1 "Config.3.2-rc4.1"),
[config.3.2-rc5.1](http://eLinux.org/images/0/0f/Config.3.2-rc5.1 "Config.3.2-rc5.1"),
[config.3.2-rc6.1](http://eLinux.org/images/a/ae/Config.3.2-rc6.1 "Config.3.2-rc6.1") or
[config.3.2-rc7.1](http://eLinux.org/images/e/ed/Config.3.2-rc7.1 "Config.3.2-rc7.1") as
the .config (you should apply all the above patches)

Then compile like so:

    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2010q1/bin/arm-none-linux-gnueabi- uImage

Then compile the modules like so:

    make ARCH=arm CROSS_COMPILE=/home/kenm/Panda/arm-2010q1/bin/arm-none-linux-gnueabi- modules

"Install" the modules to somewhere convenient:

    make ARCH=arm CROSS_COMPILE=/home/kenm/Panda/arm-2010q1/bin/arm-none-linux-gnueabi- INSTALL_MOD_PATH=../testlib_omap modules_install

Copy lib/modules/3.2.0-rc1-dirty/ to your SD card (as root), boot up the
Pandaboard. After 3.2-rc1, the kernel versioning was changed and the
modules for -rc4,5,6,7 are now located in
lib/modules/3.2.0-rc4-00002-gd3aebaf/ the last digits will change as the
sources are edited, so your version numbers may differ.



## Testing

### fbtest on DVI Port

After booting run fbtest to see a nice test pattern from the dvi port.

[![Fbtest.jpg](http://eLinux.org/images/thumb/b/bc/Fbtest.jpg/240px-Fbtest.jpg)](http://eLinux.org/File:Fbtest.jpg)

### Switching primary display to the HDMI port --\> Currently not functional \<--

Make sure that a monitor is plugged into the HDMI port before doing the
following:

    # Enable HDMI
    echo "1" > /sys/devices/platform/omapdss/display1/enabled

    # Disable overlay0 (an overlay must be disabled before changing its properties)
    echo "0" > /sys/devices/platform/omapdss/overlay0/enabled

    # Set the manager of overlay0 to display1 which is HDMI
    echo "tv" > /sys/devices/platform/omapdss/overlay0/manager

    # Enable overlay0
    echo "1" > /sys/devices/platform/omapdss/overlay0/enabled

And content on overlay 0 of primary lcd would be transferred to HDMI. It
works similarly for all other overlay's.

### Switching primary display to the DVI port

See:
[http://omappedia.org/wiki/Bootargs\_for\_enabling\_display](http://omappedia.org/wiki/Bootargs_for_enabling_display)
for lots of useful info on the display subsystem. Be aware that the
display, manager and overlay numbers don't match the panda
configuration.

Make sure that a monitor is plugged into the DVI port before doing the
following:

    # Disable HDMI
    echo "0" > /sys/devices/platform/omapdss/display1/enabled

    # Disable overlay0 (an overlay must be disabled before changing its properties)
    echo "0" > /sys/devices/platform/omapdss/overlay0/enabled

    # Set the manager of overlay0 to display0 which is DVI
    echo "lcd2" > /sys/devices/platform/omapdss/overlay0/manager

    # Enable overlay0
    echo "1" > /sys/devices/platform/omapdss/overlay0/enabled

The above commands should be run from the serial console and the cable
should be in the destination port before running the commands.

### fbtest on HDMI Port --\> Currently not functional \<--

Run fbtest to see a nice test pattern from the HDMI port.

[![Fbtest2.jpg](http://eLinux.org/images/thumb/3/34/Fbtest2.jpg/240px-Fbtest2.jpg)](http://eLinux.org/File:Fbtest2.jpg)

### i2cdetect

You can run i2cdetect and the results should look like this:

    # i2cdetect -y -r 1
        0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:          -- -- -- -- -- -- -- -- -- -- -- -- --
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    40: -- -- -- -- -- -- -- -- UU UU UU UU -- -- -- --
    50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    70: -- -- -- -- -- -- -- --

### wlan

Run the following commands after the PandaBoard is booted:

    modprobe wl12xx_sdio
    ifconfig wlan0 up
    iwconfig wlan0 essid "Your AccessPoint Name"
    udhcpc -i wlan0

If your network is set up to provide DHCP services, the PandaBoard will
get all the "right stuff(tm)" and you will be able to access the
Internet.

    # ping www.google.com
    PING www.google.com (74.125.73.99): 56 data bytes
    64 bytes from 74.125.73.99: seq=0 ttl=43 time=62.683 ms
    64 bytes from 74.125.73.99: seq=1 ttl=43 time=54.077 ms
    64 bytes from 74.125.73.99: seq=2 ttl=43 time=51.484 ms
    64 bytes from 74.125.73.99: seq=3 ttl=43 time=54.108 ms

### USB Performance

Insert a USB memory stick into one of the usb ports

Run dmesg to see what sdx the stick was recognised as, then:

    hdparam -tT /dev/sdx

If you did this on a kernel without the patch you will see some
improvement, if you run the same command on a desktop Linux system, with
the same USB memory stick, the PandaBoard's speed should roughly be the
same.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

