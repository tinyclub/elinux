> From: [eLinux.org](http://eLinux.org/Panda_How_to_kernel_2_6_39rel "http://eLinux.org/Panda_How_to_kernel_2_6_39rel")


# Panda How to kernel 2 6 39rel



## Contents

-   [1 Introduction](#introduction)
-   [2 Review of significant release
    candidates](#review-of-significant-release-candidates)
    -   [2.1 -rc1](#-rc1)
    -   [2.2 -rc3](#-rc3)
    -   [2.3 -rc6](#-rc6)
    -   [2.4 -rc7](#-rc7)
-   [3 Wlan](#wlan)
-   [4 Building](#building)
    -   [4.1 DVI Patch](#dvi-patch)
-   [5 i2c character device driver](#i2c-character-device-driver)
    -   [5.1 I2C Patch](#i2c-patch)
-   [6 Testing](#testing)

## Introduction

The 2.6.39 kernel has been released, There were many Pandaboard related
changes during the release candidate phase, including HDMI, DVI and
wl21xx support.

Looks like quite a bit of work on wl12xx scheduled for 2.6.40-rc1 as
indicated by what is in the 2.6.39-gitxx tree.... stay tuned. However it
looks like there will not be very many other (if any) board related
updates till 2.6.41 (2.8/3.0) or so:
[http://www.spinics.net/lists/linux-omap/msg51634.html](http://www.spinics.net/lists/linux-omap/msg51634.html)

## Review of significant release candidates

### -rc1

    * hdmi & dvi are broken due to some dss clocking issues, see: https://patchwork.kernel.org/patch/674062/ for details, a fix for dvi is available, see below.
    * abe sound is not supported.
    * Dave Anders patch to not configure the unused power regulators of VUSIM and VAUX1 is included.
    * wl12xx support is working to the extent that one can associate with an access point, get an IP address and ping out to the internet.

### -rc3

    * Rebooting is broken (there was a post suggesting that it was broken in -rc2 as well) follow
    this thread for more info: http://www.spinics.net/lists/linux-omap/msg49746.html.
    ** a simple fix is to turn off OMAP2 support, which is done in the .config below for -rc3.
    * What at first looked like interesting changes to /arch/arm/mach-omap2/ /drivers/net/wireless/wl12xx/ /drivers/video/omap2/dss/
    seemed to really be typo fixes in comments, Hopefully, some real fixes will be in -rc3.
    * New in -rc3 is that the usb ethernet adapter appears as eth0 rather than usb0.

### -rc6

    * lots of (real) changes for omap, see http://www.kernel.org/pub/linux/kernel/v2.6/testing/ChangeLog-2.6.39-rc6 for details.
    * Rebooting is still broken, so beware of using omap2plus_defconfig without changes. (see -rc3 above)
    * patching is still neccessary to get dvi working
    * wlan and ethernet both seem to work as in -rc3, -rc4 and -rc5
    * i2c chararacter device driver is still broken, the patch below still applies cleanly and resolves the issue.

### -rc7

    * No specific PandaBoard changes, but there was work done on /drivers/usb/host/ehci-omap.c
    * A new version of wlan firmware (see below) became available which might have working bluetooth.
    unfortunately, there is no BT support in the board file /arch/arm/mach-omap2/board-omap4panda.c
    * looks like some PandaBoard & OMAP4 specific changes queued up for the next .39-rcx (or maybe .40-rc1)



## Wlan

The proper firmware for wl12xx support is available from:
[git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git](git://git.kernel.org/pub/scm/linux/kernel/git/dwmw2/linux-firmware.git),
just clone that repository and copy the ti-connectivity directory to
/lib/firmware/.

-   This firmware includes a Bluetooth init script, which contains
    binary patches to the firmware that resides in ROM.
-   This OMAP35xx user guide has useful info:
    [http://processors.wiki.ti.com/index.php/OMAP35x\_Wireless\_Connectivity\_System\_Test\_Guidelines\_User%27s\_Guide](http://processors.wiki.ti.com/index.php/OMAP35x_Wireless_Connectivity_System_Test_Guidelines_User%27s_Guide)
-   This OMAP35xx App note also is interesting:
    [http://processors.wiki.ti.com/index.php/OMAP35x\_Wireless\_Connectivity\_WLAN\_Bluetooth\_Coexistence\_Application\_Note](http://processors.wiki.ti.com/index.php/OMAP35x_Wireless_Connectivity_WLAN_Bluetooth_Coexistence_Application_Note)
-   The firmware and wl1271 hardware is the same as on the PandaBoard,
    but there is no support in /arch/arm/mach-omap2/board-omap4panda.c
    for the gpio's that control BT\_EN (GPIO46) or BT\_WAKEUP (GPIO49),
    as well as the bt audio interface to MCBSP1. In addition, the latest
    Bluez (4.93) source for hidattach\_ti.c still assumes that the
    firmware (and bt init script) are in /lib/firmware/ rather than in
    /lib/firmware/ti-connectivity/.

<!-- -->

    # pwd
    /lib/firmware/ti-connectivity
    # ls -la
    total 1385
    drwxr-xr-x    2 root     root          1024 May  9  2011 .
    drwxr-xr-x    3 root     root          1024 Dec 31 17:36 ..
    -rw-r--r--    1 root     root         48909 May  9  2011 TIInit_7.2.31.bts
    -rw-r--r--    1 root     root        273252 May  9  2011 wl1271-fw-2.bin
    -rw-r--r--    1 root     root        272784 May  9  2011 wl1271-fw-ap.bin
    -rw-r--r--    1 root     root        271832 May  9  2011 wl1271-fw.bin
    -rwxr-xr-x    1 root     root          1113 May  9  2011 wl1271-nvs-example-wl128x.bin
    -rw-r--r--    1 root     root           912 May  9  2011 wl1271-nvs.bin
    -rw-r--r--    1 root     root        265196 May  9  2011 wl128x-fw-ap.bin
    -rwxr-xr-x    1 root     root        272748 May  9  2011 wl128x-fw.bin



## Building

Building 2.6.39 is basically the same as [How to build 2.6.38
kernel](http://eLinux.org/Panda_How_to_kernel_2_6_38 "Panda How to kernel 2 6 38"), but
of course you need the released sources. The omap2plus\_defconfig works,
but does not enable anything interesting.
[config.2.6.39.1](http://eLinux.org/images/c/cb/Config.2.6.39.1 "Config.2.6.39.1")
enables USB, it's ethernet adapter, wl12xx support, and dvi support,.
However using that config requires that the kernel sources be patched
with
[0001-omap4-pandaboard-fix-dvi-support.patch](http://eLinux.org/images/9/97/0001-omap4-pandaboard-fix-dvi-support.patch "0001-omap4-pandaboard-fix-dvi-support.patch")
The patch also provices panda\_dvi\_defconfig which just enables dvi.
The patche applies cleanly to the released sources.

### DVI Patch

Apply it like so: (from inside the kernel sources directory)

    patch -p1 < 0001-omap4-pandaboard-fix-dvi-support.patch

Then use either of the above configs or

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

Then compile as above.



## Testing

After booting run fbtest to see a nice test pattern from the dvi port.

[![Fbtest.jpg](http://eLinux.org/images/thumb/b/bc/Fbtest.jpg/240px-Fbtest.jpg)](http://eLinux.org/File:Fbtest.jpg)

Then you can run i2cdetect and the results should look like this:

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

Stay tuned for the 2.6.40-rcx series where there should be some new
features as well as some more bug squashing.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

