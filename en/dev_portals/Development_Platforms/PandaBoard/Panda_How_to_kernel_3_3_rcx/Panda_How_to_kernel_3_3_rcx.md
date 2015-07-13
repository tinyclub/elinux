> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel_3_3_rcx "http://eLinux.org/Panda_How_to_kernel_3_3_rcx")


# Panda How to kernel 3 3 rcx



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
-   [10 wlan12xx](#wlan12xx)
-   [11 wlan12xx patch](#wlan12xx-patch)
-   [12 I2C Patch](#i2c-patch)
-   [13 Building](#building)
-   [14 Testing](#testing)
    -   [14.1 fbtest on DVI Port](#fbtest-on-dvi-port)
    -   [14.2 Switching primary display to the HDMI port -\> Currently
        not functional
        \<-](#switching-primary-display-to-the-hdmi-port-3e-currently-not-functional-3c)
    -   [14.3 Switching primary display to the DVI
        port](#switching-primary-display-to-the-dvi-port)
    -   [14.4 fbtest on HDMI Port -\> Currently not functional
        \<-](#fbtest-on-hdmi-port-3e-currently-not-functional-3c)
    -   [14.5 i2cdetect](#i2cdetect)
    -   [14.6 wlan](#wlan)
    -   [14.7 USB Performance](#usb-performance)

## Introduction

The merge window for 3.3 is over and we are currently at v3.3-rc4. Lots
of work on the OMAP platforms and on Pandaboard as well as the wl12xx
wlan driver . Let's see what the various release candidates have
provided.

You can download a tarball of the mainline kernel at
[http://kernel.org/](http://kernel.org/)

or you can clone a copy of mainline kernel with:

    git clone http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    cd linux
    git checkout v3.3-rcx

where x is the release candidate version.

**Important Note** There has been a lot of work done on the HDMI
interface and its related driver omapdrm. Between kernel 3.1 and 3.2-rc1
enough changed so that the Testing section on the HDMI interface is no
longer correct. The hdmi init functions are no longer in
arch/arm/mach\_omap2/board-omap4panda.c. When this situation stabilises,
the HDMI testing section below will be updated.

## rc1

**The following seems to be only true for the PandaBoard ES. Tests with
a PandaBoard EA3 confirm that the patch is still needed**

The WLAN no longer requires a patch! The WL12xx driver needs current
firmware. When the driver isn't happy, the error messages are somewhat
less than useful, however the drivers/firmware are being constantly
improved and it would not be a good idea to have the driver support
anything but the latest firmware. Still a work in progress.

## rc2

No PandaBoard changes, and with no patches required this is an easy
release to build.

## rc3

Skipped due to the HDMI changes which cropped up in 3.2-rc1 Lots of
changes working towards getting HDMI functional

## rc4

resolve nebulous 'Error setting wl12xx data' fix to PandaBoard. "This
should be fixed properly for the next merge window so we don't issue
error messages merely because a driver is not configured."

Devicetree-enabled kernels crash during boot due to the UART driver
([http://www.spinics.net/lists/linux-omap/msg64921.html](http://www.spinics.net/lists/linux-omap/msg64921.html)).
A patch has been proposed and should be merged before release.

## rc5

## rc6

## rc7

The WL12xx driver still needs the same patch as used for 3.1 and 3.2.
when the driver isn't happy, the error messages are somewhat less than
useful, however the drivers/firmware are being constantly improved and
it would not be a good idea to have the driver support anything but the
latest firmware. The race issue that required building as a module has
returned and with the modules built in, operation is not consistant.

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

## wlan12xx

## wlan12xx patch

This patch is still necessary to resolve the issue noted in 3.0, 3.1 and
3.2, the code was moved to twl\_common.c.

[0001a-omap4-pandaboard-wlan-fix.patch](http://eLinux.org/images/8/8d/0001a-omap4-pandaboard-wlan-fix.patch "0001a-omap4-pandaboard-wlan-fix.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0001a-omap4-pandaboard-wlan-fix.patch

The latest wlan firmware is available from git:
[git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git](git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git)
just copy the contents of the ti-connectivity folder to
/lib/firmware/ti-connectivity.

The patch is no longer necessary for the PandaBoard ES but does not seem
to hurt if applied. In addition, the race issue that required building
as a module has returned as of -rc2. As part of the code cleanup, the
wl12xx and wl12xx\_sdio drivers no longer depend on each other. This
creates an issue with systems that do not use udev or mdev (with as
somewhat fiddly & slow script) to load MODALIAS drivers. The quick
solution is to modprobe both, the order no longer matters. Just
modprobing wl12xx\_sdio will no longer automatically load wl12xx. It is
suggested that these 2 drivers be built as modules.

## I2C Patch

i2c character device driver patch that has been necessary is no longer
required, and the issues from kernel 3.2 have been resolved.

## Building

Building 3.3-rc1 or -rc2 is fairly straight forward.

Grab the 3.3-rc1 or 3.3-rc2 sources and use
[config.3.3-rc1.1](http://eLinux.org/images/a/a2/Config.3.3-rc1.1 "Config.3.3-rc1.1") or
[config.3.3-rc2.1](http://eLinux.org/images/7/7c/Config.3.3-rc2.1 "Config.3.3-rc2.1") as
the .config

The 3.3-rc1 .config enables Sound builtin and wl12xx as modules and the
3.3-rc2 enables Sound and the wl12xx drivers builtin, so the resulting
kernel will be a bit bigger than previously. The builtin sound does not
presently work, but the enabled configuration allows USB sound devices,
which function properly.

Then compile like so:

    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2010q1/bin/arm-none-linux-gnueabi- uImage

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

    modprobe wl12xx    ** only if you built the wl12xx drivers as modules
    modprobe wl12xx_sdio    ** only if you built the wl12xx drivers as module
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

