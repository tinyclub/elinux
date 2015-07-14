> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel_3_5_rcx "http://eLinux.org/Panda_How_to_kernel_3_5_rcx")


# Panda How to kernel 3 5 rcx



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 rc1](#rc1)
    -   [1.2 rc4](#rc4)
    -   [1.3 rc5](#rc5)
    -   [1.4 rc6](#rc6)
    -   [1.5 rc7](#rc7)
-   [2 PandaBoard ES](#pandaboard-es)
-   [3 wlan12xx](#wlan12xx)
-   [4 wlan12xx patch](#wlan12xx-patch)
-   [5 Building](#building)
-   [6 Testing](#testing)
    -   [6.1 CPU Frequency Control](#cpu-frequency-control)
    -   [6.2 i2cdetect](#i2cdetect)
    -   [6.3 wlan](#wlan)
        -   [6.3.1 WEP](#wep)
    -   [6.4 USB Performance](#usb-performance)

## Introduction

Kernel 3.5 merge window has closed and 3.5-rc1 has been released.

You can download a tarball of the mainline kernel at
[http://kernel.org/](http://kernel.org/)

or you can clone a copy of mainline kernel with:

    git clone http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    cd linux
    git checkout v3.5-rcx


 **Important Note** There has been a lot of work done on the HDMI
interface and its related driver omapdrm. Between kernel 3.1 and 3.2-rc1
enough changed so that the Testing section on the HDMI interface has
been removed from this How-To. The HDMI testing section below will
return when the code stabilises.

### rc1

Many changes in OMAP and Panda specific code since 3.4 was released. The
HDMI, DVI interfaces both work under certain circumstances and properly
read the EDID info from the monitor. HDMI sound is now functional.
Changes to the WLAN code continue, and WLAN does function as well under
the proper circumstances.

### rc4

-rc4 has a few omap4 related changes, but nothing specific to the
PandaBoard.

### rc5

-rc5 does not have any OMAP or PandaBoard specific changes.

### rc6

Several OMAP4 related changes, but not much, Closing in on the release
according to Linus.

### rc7

Quite a few OMAP changes including:

[http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=06b4ba529528fbf9c24ce37b7618f4b0264750e2](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=06b4ba529528fbf9c24ce37b7618f4b0264750e2)

Which disables the EHCI driver in omap2plus\_defconfig. The reasons
being:

    -warning dump during bootup
    -hang during suspend
    -prevents CORE powerdomain from entering retention during idle (even when no USB devices connected.)

I've never seen the warning dump during bootup on either PandaBoard or
PandaBoard ES and have never tested for the other issues. So, EHCI is
still enabled in the following .config.


 The WL12xx driver on a PandaBoard still needs the same patch as used
for 3.1 and 3.2. When the driver isn't happy, the error messages are
somewhat less than useful, however the drivers/firmware are being
constantly improved and it would not be a good idea to have the driver
support anything but the latest firmware. With the modules built in,
operation is not consistent. The PandaBoard ES does not need the patch.



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

This patch is still necessary to resolve the issue noted in 3.2 and
earlier

[0001a-omap4-pandaboard-wlan-fix.patch](http://eLinux.org/images/8/8d/0001a-omap4-pandaboard-wlan-fix.patch "0001a-omap4-pandaboard-wlan-fix.patch")

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0001a-omap4-pandaboard-wlan-fix.patch

NOTE: it applies with offsets which is ok.

The latest wlan firmware is available from git:
[git://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git](git://git.kernel.org/?p=linux/kernel/git/firmware/linux-firmware.git)
just copy the contents of the ti-connectivity folder to
/lib/firmware/ti-connectivity.


 The patch is no longer necessary for the PandaBoard ES but does not
seem to hurt if applied. In addition, the race issue that required
building as a module has returned. As part of the code cleanup, the
wl12xx and wl12xx\_sdio drivers no longer depend on each other. This
creates an issue with systems that do not use udev or mdev (with a
somewhat fiddly & slow script) to load MODALIAS drivers. The quick
solution is to modprobe both, the order no longer matters. Just
modprobing wl12xx\_sdio will no longer automatically load wl12xx.

Linaro has added the equivalent patch to their tilt tree:

    http://git.linaro.org/gitweb?p=landing-teams/working/ti/kernel.git;a=blobdiff;f=arch/arm/mach-omap2/twl-common.c;h=3335b76826f3747013dbff6b7ed4da0d51ff0902;hp=36e05feb92c7e5aae030e0a23f5ef4929797077f;hb=a4b44dff1342b8dfecfed2929ccd58a08bafa964;hpb=2483a772da8c728bc35adad444a14c9d5ded9e70

In -rc1 there is an issue with wl12xx\_sdio building as a module, so the
recommended way (as implememted in the .config) is to build wl12xx as a
single module which includes wl12xx, wl12xx\_sdio and wl12xx\_core. This
can then be modprobed on either PandaBoard (with patch) or PandaBoard
ES.



## Building

Building 3.5-rc1/rc4/rc5/rc6/rc7 is fairly straight forward. Grab the
3.5-rc1/4/5/6/7 sources and use
[config.3.5-rc1.1](http://eLinux.org/images/c/c1/Config.3.5-rc1.1 "Config.3.5-rc1.1"),
[config.3.5-rc4.1](http://eLinux.org/images/9/9e/Config.3.5-rc4.1 "Config.3.5-rc4.1"),
[config.3.5-rc5.1](http://eLinux.org/images/4/4f/Config.3.5-rc5.1 "Config.3.5-rc5.1"),
[config.3.5-rc6.1](http://eLinux.org/images/f/fb/Config.3.5-rc6.1 "Config.3.5-rc6.1") or
[config.3.5-rc7.1](http://eLinux.org/images/1/14/Config.3.5-rc7.1 "Config.3.5-rc7.1") as
the .config

The 3.5-rc1/4/5/6/7 .config enables Sound builtin and wl12xx as a single
module. The builtin sound works, as does HDMI sound. Note that the HDMI
monitor must be plugged in and enabled for the HDMI sound to work.

Then compile like so:

    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2010q1/bin/arm-none-linux-gnueabi- uImage

## Testing

### CPU Frequency Control

The 3.5-rc5/6/7 .config also enables SmartReflex as well as OMAP
frequency scaling. Default governor is set to performance so the CPU
will come up at 1008MHz.

Display the current cpu frequency.

    # cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
    1008000

Change to the ondemand governor which will reduce the cpu frequency to
300MHz when idle.

    echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    # cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
    300000

The cpu governor seems to work, and on 4430 get stats, but not on 4460
ie. all zeros.

    # ls /sys/devices/system/cpu/cpu0/cpufreq/stats/
    time_in_state  total_trans    trans_table

For 4460:

    # echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    # cat /sys/devices/system/cpu/cpu0/cpufreq/stats/*
    300000 0
    600000 0
    800000 0
    1008000 0
    0
      From  :    To
            :    300000    600000    800000   1008000
      300000:         0         0         0         0
      600000:         0         0         0         0
      800000:         0         0         0         0
     1008000:         0         0         0         0


 for 4430:

    # echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    # cat /sys/devices/system/cpu/cpu0/cpufreq/stats/*
    300000 299
    600000 0
    800000 1
    1008000 1755
    2
      From  :    To
            :    300000    600000    800000   1008000
      300000:         0         0         0         0
      600000:         0         0         0         0
      800000:         0         0         0         1
     1008000:         1         0         0         0

    # cat /sys/devices/system/cpu/cpu0/cpufreq/stats/*
    300000 546
    600000 0
    800000 1
    1008000 1755
    2
      From  :    To
            :    300000    600000    800000   1008000
      300000:         0         0         0         0
      600000:         0         0         0         0
      800000:         0         0         0         1
     1008000:         1         0         0         0

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

    modprobe wl12xx    ** only if you built the wl12xx drivers a module as recommended
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

#### WEP

Setting up a WEP key is fairly straightforward and is achieved by adding
the command:

    iwconfig wlan0 key C7EE546141233ECCF3FDF68897

after setting the essid

NOTE: the command:

    iwconfig wlan0 key s:panda

would seem to set the key using the ascii passphrase "panda" However,
the conversion is not implemented in iwlib (wireless-tools 30-pre9) and
will result an a bogus key being set in the wlan.

[http://www.powerdog.com/wepkey.cgi](http://www.powerdog.com/wepkey.cgi)
can generate hex keys from passphrases and was used to generate
C7EE546141233ECCF3FDF68897 from panda.



### USB Performance

Insert a USB memory stick into one of the usb ports

Run dmesg to see what sdx the stick was recognised as, then:

    hdparam -tT /dev/sdx

If you run the same command on a desktop Linux system, with the same USB
memory stick, the PandaBoard's speed should roughly be the same.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

