> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel_3_1_rcx "http://eLinux.org/Panda_How_to_kernel_3_1_rcx")


# Panda How to kernel 3 1 rcx



## Contents

-   [1 Introduction](#introduction)
-   [2 rc1](#rc1)
-   [3 rc2](#rc2)
-   [4 rc3](#rc3)
-   [5 rc4](#rc4)
-   [6 rc5](#rc5)
-   [7 rc6](#rc6)
-   [8 rc7](#rc7)
-   [9 git.kerenl.org](#git-kerenl-org)
-   [10 rc8](#rc8)
-   [11 rc9](#rc9)
-   [12 USB Performance improvement](#usb-performance-improvement)
-   [13 wlan12xx patch](#wlan12xx-patch)
-   [14 DVI Patch](#dvi-patch)
-   [15 I2C Patch](#i2c-patch)
-   [16 Building](#building)
-   [17 Testing](#testing)
    -   [17.1 fbtest on DVI Port](#fbtest-on-dvi-port)
    -   [17.2 Switching primary display to the HDMI
        port](#switching-primary-display-to-the-hdmi-port)
    -   [17.3 Switching primary display to the DVI
        port](#switching-primary-display-to-the-dvi-port)
    -   [17.4 fbtest on HDMI Port](#fbtest-on-hdmi-port)
    -   [17.5 i2cdetect](#i2cdetect)
    -   [17.6 wlan](#wlan)
    -   [17.7 USB Performance](#usb-performance)

## Introduction

Continuing Happy 20th Birthday Greetings to Linux!! The merge window for
3.1 is over and the 3.1-rc1 kernel has been released. Lots of work on
the omap platforms and on pandaboard. Let's see what -rc1 has brought.

## rc1

There is still an issue with the setting up of the wl12xx:

    [    0.181457] error setting wl12xx data

The extremely simple workaround available for 3.0, moved to
twl\_common.c in -rc1, doesn't produce the working wlan as in 3.0. But
applying that to the -rc2 code does result in a functional wl12xx
driver.

More to come as these issue are investigated.

## rc2

Yep, -rc2 is out and I haven't had the time to fiddle much with it as
yet, on to -rc3. In short, -rc2 fixes some of the wl12xx issues, but
still requires a patch to function. There is still an unresolved start
up issue with wl12xx, in that sometimes it will work, sometimes, not.
Same kernel, MLO, & u-boot and userspace.

## rc3

-rc3 is out and there are no OMAP or Panda changes. However there is a
boot issue with Panda as described here:
[https://lkml.org/lkml/2011/8/25/117](https://lkml.org/lkml/2011/8/25/117)

This issue has been resolved, so be sure to get this commit or later
from git:
[http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=69dd3d8e29e294caaf63eb5e8a72d250279f9e5f](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=69dd3d8e29e294caaf63eb5e8a72d250279f9e5f)

## rc4

-rc4 has been released and yet again there are no OMAP or Panda changes.
The issue introduced in -rc3 noted above, has been resolved.

If you build the wl12xx driver as a module, and modprobe it, the wlan
seems to start up fine every time, must be some sort of race when it is
compiled into the kernel.

## rc5

-rc5 has been released, and kernel.org is still sort of sick. Not to
worry, Linus has a github repository that you can pull from (if you
dare ;\>), see
[https://lkml.org/lkml/2011/9/4/92](https://lkml.org/lkml/2011/9/4/92)
for details. From the changelog, it doesn't look like any omap4 or
PandaBoard related changes, so we'll wait a bit to see if kernel.org
recovers after the holiday.

## rc6

-rc6 has been released, and kernel.org is still down. I cloned Linus's
github repo so as not to disturb my kernel.org repo (yes I know I could
have pulled from the github repo, and with a few other magic git
incantations resulted in the same thing...maybe...). There have been
some OMAP4 related changes, but applying the same patches as -rc4, a
working kernel as described below is the result.

## rc7

-rc7 has been released and Linus says that 3.1 won't happen till
kernel.org is back, so we may have a few more -rcx's ahead of us. No
OMAP or Panda related changes in -rc7, the same patches that worked for
-rc4 still work (some with a bit of an offset).

## git.kerenl.org

It's back, mostly, as of 10/3/2011. Stay tuned.



## rc8

Skipped

## rc9

With git.kerne.org back, Linus has resumed the 3.1-rcx series on
[http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git)

3.1 should be released soon, -rc9 is out which should be pretty close.
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

    patch -p1 < 0003-omap4-pandaboard-dvi720p.patch

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
    * A quick fix for this issue is available omap44xx-i2c-fix.patch



Apply it like so: (from inside the kernel sources directory)

    patch -p1 < Omap44xx-i2c-fix.patch

Compile as above.

## Building

Building 3.1-rc1 or -rc2 is basically the same as [How to build 2.6.38
kernel](http://eLinux.org/Panda_How_to_kernel_2_6_38 "Panda How to kernel 2 6 38"), but
of course you need the 3.1-rc1/rc2 sources. The omap2plus\_defconfig
works and illustrates the wl12xx issue, with or without a patch to
twl\_common.c.
[config.3.1-rc1.1](http://eLinux.org/images/f/f5/Config.3.1-rc1.1 "Config.3.1-rc1.1")
works with the dvi patch and i2c patch.

Building 3.1-rc4 -rc6/7 or -rc9 is a bit different if you want to have a
working wlan.

In order to ensure that the wlan starts up consistently, it is
recommended that the wl12xx driver be built as a module and started
after the PandaBoard has booted.

Grab the 3.1-rc4 or -rc6/7/9 sources and use
[config.3.1-rc4.1](http://eLinux.org/images/1/1f/Config.3.1-rc4.1 "Config.3.1-rc4.1"),
[config.3.1-rc6.1](http://eLinux.org/images/2/24/Config.3.1-rc6.1 "Config.3.1-rc6.1"),
[config.3.1-rc7.1](http://eLinux.org/images/1/11/Config.3.1-rc7.1 "Config.3.1-rc7.1") or
[config.3.1-rc9.1](http://eLinux.org/images/f/fb/Config.3.1-rc9.1 "Config.3.1-rc9.1")as
the .config (this requires you patch the dvi & i2c as above)

Then compile like so:

    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2010q1/bin/arm-none-linux-gnueabi- uImage

Then compile the modules like so:

    make ARCH=arm CROSS_COMPILE=/home/kenm/Panda/arm-2010q1/bin/arm-none-linux-gnueabi- modules

"Install" the modules to somewhere convenient:

    make ARCH=arm CROSS_COMPILE=/home/kenm/Panda/arm-2010q1/bin/arm-none-linux-gnueabi- INSTALL_MOD_PATH=../testlib_omap modules_install

Copy lib/modules/3.1.0-rc4-dirty/, lib/modules/3.1.0-rc6-dirty/,
lib/modules/3.1.0-rc7-dirty/ or lib/modules/3.1.0-rc9-dirty/ to your SD
card (as root), boot up the Pandaboard.



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

