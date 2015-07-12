> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel_3_0_rcx "http://eLinux.org/Panda_How_to_kernel_3_0_rcx")


# Panda How to kernel 3 0 rcx



## Contents

-   [1 Introduction](#introduction)
-   [2 rc1](#rc1)
-   [3 rc2](#rc2)
-   [4 rc3](#rc3)
-   [5 rc4](#rc4)
-   [6 rc5](#rc5)
-   [7 rc6](#rc6)
-   [8 rc7](#rc7)
-   [9 Building](#building)
    -   [9.1 MMC Patch](#mmc-patch)
    -   [9.2 DVI Patch](#dvi-patch)
-   [10 i2c character device driver](#i2c-character-device-driver)
    -   [10.1 I2C Patch](#i2c-patch)
-   [11 Testing:](#testing)
    -   [11.1 fbtest on DVI Port](#fbtest-on-dvi-port)
    -   [11.2 Switching primary display to the HDMI
        port](#switching-primary-display-to-the-hdmi-port)
    -   [11.3 Switching primary display to the DVI
        port](#switching-primary-display-to-the-dvi-port)
    -   [11.4 fbtest on HDMI Port](#fbtest-on-hdmi-port)
    -   [11.5 i2cdetect](#i2cdetect)

## Introduction

The 3.0-rc1 kernel has been released.

## rc1

There have been regressions since 2.6.39.

The kernel hangs waiting for the sd/mmc card.

Enabling USB results in very ugly kernel oops.

Something is amuck with the wl21xx support.

## rc2

Looks like Tony Lindgren's pull request to Linus missed the release of
-rc2 by a couple of hours, so no fixes got into -rc2. We will have to
wait a week or so for -rc3, an expanded mmc fix for the issue is
included.

## rc3

Well, -rc3 is out and the mmc issue is fixed, but the revert of commit
7e6502d577106fb5b202bbaac64c5f1b065e6daa is still necessary to let the
kernel boot with ehci enabled, however something else has broken as the
USB ethernet is not functional and DVI doesn't work either. It is of
interest to note that there have been massive changes to wl12xx to
support ap functionality, as well as massive changes in
drivers/video/omap2/dss/. So it seems that -rc3 is a further regression
from 2.6.39.

## rc4

-rc4 has fixed many of the issues introduced in rc3, however no progress
with the issues introduced in 3.0.

The reversion of commit 7e6502d577106fb5b202bbaac64c5f1b065e6daa is
still necessary.

The I2C patch is still necessary.

The DVI patch is still necessary.

The wl21xx still has problems, no temp fix available (yet).

## rc5

-rc5 has quite a few changes to omap4 code, but no additional fixes from
-rc4

The reversion of commit 7e6502d577106fb5b202bbaac64c5f1b065e6daa is
still necessary.

The I2C patch is still necessary.

The DVI patch is still necessary.

The wl21xx still has problems, no temp fix available (yet).

## rc6

A few OMAP and PandaBoard related changes in this update, none of the
work form linux-omap-2.6.git has made it into mainline yet.

## rc7

A bunch of OMAP related changes made it into this update, and with EHCI
enabled, the kernel boots! The kernel recognises a usb keyboard, mouse
and various other devices as well as its own usb-ethernet. The DVI
output works (at better resolution if you apply the DVI patch). The i2c
works with the i2c patch. This is certainly an improvement over -rc6.
The WLAN is still broken.

more to come...... Look for an update to building x-loader & u-boot for
PandaBoard in a few days (I hope, maybe I'll wait till 3.0 is released).


 A fix is available for the kernel (-rc1-rc5) oops by reverting commit
7e6502d577106fb5b202bbaac64c5f1b065e6daa. See
[http://www.spinics.net/lists/linux-omap/msg52043.html](http://www.spinics.net/lists/linux-omap/msg52043.html)
for details.

    git revert 7e6502d577106fb5b202bbaac64c5f1b065e6daa

Or use the patch from this post:
[http://www.spinics.net/lists/linux-omap/msg52058.html](http://www.spinics.net/lists/linux-omap/msg52058.html)
This will be required until the hwmod code is fixed. There is quite a
bit of hwmod work going on in linux-omap-2.6.git so help may be on the
way, but as of 6/29/2011 none of this work has made it into master of
linux-omap-2.6.git. As of 7/11/2011 it seems that sufficient hwmod
changes have been incorporated to to make the revert unnecessary.

the following messages are still present during bootup (from -rc1 to
-rc7):

    [    0.243896] machine_constraints_voltage: VUSB: failed to apply 3300000uV constraint
    [    0.245208] twl_reg twl_reg.46: can't register VUSB, -22
    [    0.245239] twl_reg: probe of twl_reg.46 failed with error -22

\\

A patch has been submitted to address this issue:
[http://www.spinics.net/lists/linux-omap/msg53134.html](http://www.spinics.net/lists/linux-omap/msg53134.html),
but as of 6/29/2011 it has not made it into linux-omap-2.6.git. As of
7/11/2011 this patch is no longer necessary.


 The mmc patch is required for -rc1/2, as are the dvi patch (if you want
anything other than 640x480) and the i2c patch.

## Building

Building 3.0-rc1, -rc2, -rc4, -rc5, or -rc7 is basically the same as
[How to build 2.6.38
kernel](http://eLinux.org/Panda_How_to_kernel_2_6_38 "Panda How to kernel 2 6 38"), but
of course you need the -rc1/2/4/5/7 sources. The omap2plus\_defconfig
works once the mmc patch is applied (for -rc1 & -rc2).
[config.3.0-rc2.1](http://eLinux.org/images/2/2f/Config.3.0-rc2.1 "Config.3.0-rc2.1")
works for the reverted commit, mmc patch, dvi patch and i2c patch. For
-rc5 with patched sources use
[config.3.0-rc5.1](http://eLinux.org/images/4/4d/Config.3.0-rc5.1 "Config.3.0-rc5.1").
For -rc7 use
[config.3.0-rc7.1](http://eLinux.org/images/c/cb/Config.3.0-rc7.1 "Config.3.0-rc7.1")
(with DVI & i2c patch).

### MMC Patch

A patch is available which addresses the mmc issue noted above, it is no
longer required for -rc3, -rc4, -rc5, or -rc7:

[0002-omap4-pandaboard-fix-mmc-support.patch](http://eLinux.org/images/b/be/0002-omap4-pandaboard-fix-mmc-support.patch "0002-omap4-pandaboard-fix-mmc-support.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0002-omap4-pandaboard-fix-mmc-support.patch


 The mmc issue has been fixed in linux-omap-2.6.git, as well as -rc3,
-rc4, -rc5 and -rc7 but the oopses are still present when EHCI is
enabled in .config, unless the above commit is reverted. --\>\>\> no
longer necessary for -rc7.

There is also an issue with the setting up of the wl12xx in
-rc1/2/4/5/7:

    [    0.181457] error setting wl12xx data

Which is a problem new to 3.0-rc1/2, still present in -rc3, -rc4, -rc5
and -rc7 as well as linux-omap-2.6.git. Although the error is not
present in the reverted -rc2/4/5 & linux-omap-2.6.git, or in -rc7, the
wlan does not appear to work.



### DVI Patch

This patch is no longer strictly necessary, but without it the dvi
output is 640x480. Applying it doesn't seem to hurt though.

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0001-omap4-pandaboard-fix-dvi-support.patch

Then use either of the following configs

    make ARCH=arm omap2plus_defconfig
            or
    make ARCH=arm panda_dvi_defconfig

Then compile with

    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi- uImage
         or
    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2010q1/bin/arm-none-linux-gnueabi- uImage



## i2c character device driver

    Ever since 2.6.38, the i2c character device driver support from user space has been broken for OMAP44xx.
    * A fix has been submitted for the linux-omap-2.6 branch, but it may be a while till it gets into an -rcx.
    See http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap-2.6.git;a=commit;h=39fe1a6fafe1e85c183379af9f3ceda7cd24bd65 for the commit.
    * A quick fix for this issue is available File:Omap44xx-i2c-fix.patch

### I2C Patch

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < Omap44xx-i2c-fix.patch

It applies with some fuzzes and offsets, but does apply successfully.
Then compile as above.



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



Stay tuned as the 3.0-rcx series evolves, where there needs to be some
serious bug squashing.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

