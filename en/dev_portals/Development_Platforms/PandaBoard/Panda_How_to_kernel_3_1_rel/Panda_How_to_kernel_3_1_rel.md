> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel_3_1_rel "http://eLinux.org/Panda_How_to_kernel_3_1_rel")


# Panda How to kernel 3 1 rel



## Contents

-   [1 Introduction](#introduction)
-   [2 Highlites of the -rc series](#highlites-of-the-rc-series)
    -   [2.1 rc1](#rc1)
    -   [2.2 rc2](#rc2)
    -   [2.3 rc3](#rc3)
    -   [2.4 rc4](#rc4)
    -   [2.5 rc6](#rc6)
    -   [2.6 rc7](#rc7)
    -   [2.7 git.kerenl.org](#git-kerenl-org)
    -   [2.8 rc9](#rc9)
-   [3 USB Performance improvement](#usb-performance-improvement)
-   [4 wlan12xx patch](#wlan12xx-patch)
-   [5 DVI Patch](#dvi-patch)
-   [6 I2C Patch](#i2c-patch)
-   [7 Building Kernel 3.1](#building-kernel-3-1)
-   [8 Testing](#testing)
    -   [8.1 fbtest on DVI Port](#fbtest-on-dvi-port)
    -   [8.2 Switching primary display to the HDMI
        port](#switching-primary-display-to-the-hdmi-port)
    -   [8.3 Switching primary display to the DVI
        port](#switching-primary-display-to-the-dvi-port)
    -   [8.4 fbtest on HDMI Port](#fbtest-on-hdmi-port)
    -   [8.5 i2cdetect](#i2cdetect)
    -   [8.6 wlan](#wlan)
    -   [8.7 USB Performance](#usb-performance)

## Introduction

Kernel 3.1 has been released, and welcome back git.kernel.org,
kernel.org still is not fully functional though.



you can download a tarball of the mainline kernel at
[http://kernel.org/](http://kernel.org/)

or you can clone a copy of mainline kernel with:

    git clone http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    cd linux
    git checkout v3.1

## Highlites of the -rc series

### rc1

Still had issues with the setting up of the wl12xx:

### rc2

-rc2 fixes some of the wl12xx issues, but still requires a patch to
function. There is still an unresolved start up issue with wl12xx, in
that sometimes it will work, sometimes, not. Same kernel, MLO, & u-boot
and userspace.

### rc3

-rc3 had no OMAP or Panda changes. However there was a boot issue with
Panda as described here:
[https://lkml.org/lkml/2011/8/25/117](https://lkml.org/lkml/2011/8/25/117)

### rc4

-rc4 had no OMAP or Panda changes. The issue introduced in -rc3 noted
above, was resolved.

Figured out you need to build the wl12xx driver as a module, and
modprobe it, the wlan seems to start up fine every time, must be some
sort of race when it is compiled into the kernel.

### rc6

-rc6 had some OMAP4 related changes, but applying the same patches as
-rc4, a working kernel as described below is the result.

### rc7

-rc7 had no OMAP or Panda related changes, the same patches that worked
for -rc4 still work (some with a bit of an offset).

### git.kerenl.org

Came back, mostly, as of 10/3/2011.

### rc9

The same patches that worked for -rc4 still work (some with a bit of an
offset).



## USB Performance improvement

This patch fixs one performance bug on ARM Cortex A9 dual core platform,
which has been reported on quite a few ARM machines (OMAP4, Tegra 2,
snowball...), see details from link of
[https://bugs.launchpad.net/bugs/709245](https://bugs.launchpad.net/bugs/709245).

[0006-omap4-usb-improvement.patch](http://eLinux.org/images/4/48/0006-omap4-usb-improvement.patch "0006-omap4-usb-improvement.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0006-omap4-usb-improvement.patch

## wlan12xx patch

This patch is necessary to resolve the issue noted in 3.0 and 3.1-rc1
above, however the code has moved to twl\_common.c and so an new patch
is presented here.

[0001a-omap4-pandaboard-wlan-fix.patch](http://eLinux.org/images/8/8d/0001a-omap4-pandaboard-wlan-fix.patch "0001a-omap4-pandaboard-wlan-fix.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0001a-omap4-pandaboard-wlan-fix.patch

## DVI Patch

This patch is necessary to make 720p resolution available.

[0003-omap4-pandaboard-dvi720p.patch](http://eLinux.org/images/d/d4/0003-omap4-pandaboard-dvi720p.patch "0003-omap4-pandaboard-dvi720p.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0001-omap4-pandaboard-dvi720p.patch

Then use either of the following configs

    make ARCH=arm omap2plus_defconfig
            or
    make ARCH=arm panda_dvi_defconfig

Compile as above.

## I2C Patch

i2c character device driver

    Ever since 2.6.38, the i2c character device driver support from user space has been broken for OMAP44xx.
    * A fix has been submitted for the linux-omap-2.6 branch, but it may be a while till it gets into an -rcx.
    See http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap.git;a=commit;h=39fe1a6fafe1e85c183379af9f3ceda7cd24bd65 for the commit.
    * A quick fix for this issue is available File:Omap44xx-i2c-fix.patch

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < Omap44xx-i2c-fix.patch

Compile as above.

## Building Kernel 3.1

Building 3.1 is basically the same as [How to build 2.6.38
kernel](http://eLinux.org/Panda_How_to_kernel_2_6_38 "Panda How to kernel 2 6 38"), but
of course you need the 3.1 sources. The omap2plus\_defconfig works.

Building is a bit different if you want to have a working wlan.

In order to ensure that the wlan starts up consistently, it is
recommended that the wl12xx driver be built as a module and started
after the PandaBoard has booted.

Use [config.3.1.1](http://eLinux.org/images/6/64/Config.3.1.1 "Config.3.1.1") as the
.config (this requires you patch the dvi, wlan & i2c as above)

Then compile like so:

    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2010q1/bin/arm-none-linux-gnueabi- uImage

Then compile the modules like so:

    make ARCH=arm CROSS_COMPILE=/home/kenm/Panda/arm-2010q1/bin/arm-none-linux-gnueabi- modules

"Install" the modules to somewhere convenient:

    make ARCH=arm CROSS_COMPILE=/home/kenm/Panda/arm-2010q1/bin/arm-none-linux-gnueabi- INSTALL_MOD_PATH=../testlib_omap modules_install

Copy lib/modules/3.1-dirty/ to your SD card (as root), boot up the
Pandaboard.



## Testing

### fbtest on DVI Port

After booting run fbtest to see a nice test pattern from the dvi port.

[![Fbtest.jpg](http://eLinux.org/images/thumb/b/bc/Fbtest.jpg/240px-Fbtest.jpg)](http://eLinux.org/File:Fbtest.jpg)

### Switching primary display to the HDMI port

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

### fbtest on HDMI Port

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

