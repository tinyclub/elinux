> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel_3_0_rel "http://eLinux.org/Panda_How_to_kernel_3_0_rel")


# Panda How to kernel 3 0 rel



## Contents

-   [1 Introduction](#introduction)
-   [2 DVI Patch](#dvi-patch)
-   [3 I2C Patch](#i2c-patch)
-   [4 Building](#building)
-   [5 Testing:](#testing)
    -   [5.1 fbtest on DVI Port](#fbtest-on-dvi-port)
    -   [5.2 Switching primary display to the HDMI
        port](#switching-primary-display-to-the-hdmi-port)
    -   [5.3 Switching primary display to the DVI
        port](#switching-primary-display-to-the-dvi-port)
    -   [5.4 fbtest on HDMI Port](#fbtest-on-hdmi-port)
    -   [5.5 i2cdetect](#i2cdetect)

## Introduction

Happy 20th Birthday Linux!! The 3.0 kernel has been released.

Most of the regressions seen in 3.0-rcx have been addressed. There is
still an issue with the setting up of the wl12xx:

    [    0.181457] error setting wl12xx data

An extremely simple workaround is available

[0001-omap4-pandaboard-wlan-fix.patch](http://eLinux.org/images/8/87/0001-omap4-pandaboard-wlan-fix.patch "0001-omap4-pandaboard-wlan-fix.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0001-omap4-pandaboard-wlan-fix.patch

Then compile with

    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi- uImage
         or
    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2010q1/bin/arm-none-linux-gnueabi- uImage

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
    See http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap-2.6.git;a=commit;h=39fe1a6fafe1e85c183379af9f3ceda7cd24bd65 for the commit.
    * A quick fix for this issue is available File:Omap44xx-i2c-fix.patch

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < Omap44xx-i2c-fix.patch

Compile as above.

## Building

Building 3.0 is basically the same as [How to build 2.6.38
kernel](http://eLinux.org/Panda_How_to_kernel_2_6_38 "Panda How to kernel 2 6 38"), but
of course you need the 3.0 sources. The omap2plus\_defconfig works and
illustrates the wl12xx issue
[config.3.0.1](http://eLinux.org/images/e/e2/Config.3.0.1 "Config.3.0.1") works with the
wlan patch, dvi patch and i2c patch.

## Testing:

### fbtest on DVI Port

After booting run fbtest to see a nice test pattern from the dvi port.

[![Fbtest.jpg](http://eLinux.org/images/thumb/b/bc/Fbtest.jpg/240px-Fbtest.jpg)](http://eLinux.org/File:Fbtest.jpg)

### Switching primary display to the HDMI port

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


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

