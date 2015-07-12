> From: [eLinux.org](http://eLinux.org/OSK "http://eLinux.org/OSK")


# OSK



## Contents

-   [1 OMAP 5912 Starter Kit](#omap-5912-starter-kit)
-   [2 LCD Modules](#lcd-modules)
    -   [2.1 Q-VGA from Mistral](#q-vga-from-mistral)
    -   [2.2 Aditec Graphic LCD
        Module(AGLM)](#aditec-graphic-lcd-module-aglm)
-   [3 Files](#files)
-   [4 Links](#links)
-   [5 Hardware Features](#hardware-features)
-   [6 Software Features](#software-features)
-   [7 What's Included](#what-s-included)
-   [8 Flash Recovery Utility](#flash-recovery-utility)
-   [9 HOWTOs and FAQs](#howtos-and-faqs)
-   [10 TODO list](#todo-list)

## OMAP 5912 Starter Kit

[![Osk.jpg](http://eLinux.org/images/a/a6/Osk.jpg)](http://eLinux.org/File:Osk.jpg)
[![Osk-back.jpg](http://eLinux.org/images/b/b0/Osk-back.jpg)](http://eLinux.org/File:Osk-back.jpg)

[OMAP5912 Starter
Kit](http://www.spectrumdigital.com/cgi/catalog.cgi?show_product=701875)
is a development board available from [Spectrum
Digital](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/OSK/Spectrum_Digital/Spectrum_Digital.md "Spectrum Digital") for \$US295. It does not
include a display but there is a Q-VGA LCD Module (below) and a [Wire
Wrap Prototyping
Module](http://www.spectrumdigital.com/cgi/catalog.cgi?show_product=701837)

## LCD Modules

### Q-VGA from Mistral

[![Qvga.jpg](http://eLinux.org/images/7/71/Qvga.jpg)](http://eLinux.org/File:Qvga.jpg)
[![Qvga-back.jpg](http://eLinux.org/images/8/82/Qvga-back.jpg)](http://eLinux.org/File:Qvga-back.jpg)

Mistral Software [Q-VGA LCD
Module](http://www.mistralsoftware.com/html/product/omap_products/products-omap5912_starterkit.php)
for OMAP5912 Starter Kit.

Note: a [hardware
modification](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/OSK/OSK_Mistral_wakeup_button_mod/OSK_Mistral_wakeup_button_mod.md "OSK Mistral wakeup button mod")
is required to use the wakeup button.

### Aditec Graphic LCD Module(AGLM)

Aditec Graphic [LCD
Module](http://www.aditec.co.kr/ADITEC/e-html/product-3.htm) (AGLM)

From the website:

-   CMOS Sensor Input, LCD Output
-   Touch Screen, Navigation Switch
-   Camera Input(2 Channel), TV Output

## Files

The Angstrom distribution provides a replacement kernel and root file
system for the OSK, based on the 2.6 kernel.

[http://www.angstrom-distribution.org/releases/2007.12/images/omap5912osk/](http://www.angstrom-distribution.org/releases/2007.12/images/omap5912osk/)

Instructions for flashing these files:

[http://ossie.wireless.vt.edu/trac/wiki/OSKNotes](http://ossie.wireless.vt.edu/trac/wiki/OSKNotes)

Please report bugs to:
[http://bugs.openembedded.org/](http://bugs.openembedded.org/) and
include omap5912osk in the bug report.

Contact philip at balister dot org with questions.

## Links

-   [http://www.ti.com/omap5912osk](http://www.ti.com/omap5912osk)
    -   [purchase](http://www.ti-estore.com/Merchant2/merchant.mvc?Screen=PROD&Product_Code=TMDXOSK5912)
        from TI for \$US295
    -   [Purchase](http://www.spectrumdigital.com/product_info.php?cPath=27&products_id=39)
        from Spectrum Digital for \$US295
    -   [Wire Wrap Prototyping
        Module](http://www.spectrumdigital.com/product_info.php?cPath=33_78&products_id=98)
        - for \$US99
    -   [USB
        gender-bender](http://www.microcenter.com/single_product_results.phtml?product_id=0151901)
        - get one of these to use the USB client mode, or a different
        nonstandard part: a USB A-to-A cable
    -   [Q-VGA
        Module](http://mistralsoftware.com/html/product/omap_products/products-omap5912_starterkit.php)
        from [Mistral Software](http://mistralsoftware.com/) - for
        \$US799
-   [http://omap.spectrumdigital.com/](http://omap.spectrumdigital.com/)
-   [http://focus.ti.com/docs/general/splashdsp.jhtml?&path=templatedata/cm/splashdsp/data/linux\_com\_downloads](http://focus.ti.com/docs/general/splashdsp.jhtml?&path=templatedata/cm/splashdsp/data/linux_com_downloads)
-   [MontaVista Linux Preview Kit](http://www.mvista.com/previewkit/) -
    sign up and download (Linux 2.4)
-   [TI's OMAP Linux website](http://linux.omap.com) has goodies
    including:
    -   [2.6.8-rc3\_080804.tar.bz2](http://linux.omap.com/pub/kernel/osk/2.6.8-rc3_080804.tar.bz2)
        - a relatively old snapshot of the 2.6 OMAP kernel (warning:
        \~150MB download)
    -   [u-boot](http://linux.omap.com/pub/bootloader/osk/) binaries and
        source - note that old versions use the Innovator-1510 board id,
        but U-Boot 1.1.2 should is used with 2.6
    -   [rootfsosk.tar.bz2](http://linux.omap.com/pub/filesystem/rootfsosk.tar.bz2)
    -   [toolchain](http://linux.omap.com/pub/toolchain/)
    -   [omap5912osk\_2.6.pdf](http://linux.omap.com/pub/documentation/osk/omap5912osk_2.6.pdf)
        - How to Build Linux for the OMAP5912 Processor
-   For [current
    code](http://source.mvista.com/git/gitweb.cgi?p=linux-omap-2.6.git;a=log)
    (2.6.13-rc1-omap1 at this edit) install GIT and run the following
    command:
    -   -   `git clone git://source.mvista.com/git/linux-omap-2.6.git`
            -   (This might take a while, the tree is big)
        -   or just get [OMAP-Linux
            patches](http://www.muru.com/linux/omap) less current than
            the linux-omap GIT tree, against various older
            [http://kernel.org](http://kernel.org) kernels
        -   you might be able to use kernel.org kernels directly, but
            some important drivers haven't yet made it upstream

-   Use [buildroot](http://buildroot.uclibc.org/) to quickly make a
    toolchain and rootfs
-   [http://oskfordummies.hp.infoseek.co.jp/](http://oskfordummies.hp.infoseek.co.jp/)
    - helpful OSK info
-   [http://oskfordummies.hp.infoseek.co.jp/howto/audio.html](http://oskfordummies.hp.infoseek.co.jp/howto/audio.html)
    - audio help
-   `#OL` on irc.freenode.net is an omap-linux dedicated IRC channel,
    and has some OSK developers. See
    [http://irchelp.org/](http://irchelp.org/) for information on IRC.

## Hardware Features

-   Texas Instruments TMS320C55xx DSP core operating at 192 Mhz.
-   ARM926EJ-S core operating at 192 Mhz.
-   TLV320AIC23 codec with mic-in, line-in, and headphone jacks
-   32 Mbyte mobile DDR RAM
-   32 Mbyte on board NOR Flash ROM
-   4 Expansion connectors (bottom side)
    -   Compatible with Mistral's Q-VGA LCD/touchscreen card
    -   Compatible with Spectrum Digital's OSK wire Wrap Prototype Card
-   RS-232 serial port
-   10 MBPS Ethernet port
-   USB host port (usable as peripheral, with nonstandard cabling)
-   CompactFlash socket (type I or II), for storage ONLY (no WLAN etc)
-   On board IEEE 1149.1 JTAG connector for optional emulation
-   +5 Volt operation, power supply included
-   Size: 5.55" x 3.54" (141 x 90 mm), 0.062 thick, 8 layers

## Software Features

-   Compatible with [Monta Vista](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/OSK/Monta_Vista/Monta_Vista.md "Monta Vista") Linux for
    OSK5912
-   Compatible with OMAP Code Composer Studio from Texas Instruments
-   Runs Linux 2.6 quite nicely
    -   Current development is focused on the 2.6 kernels
    -   Note that you should first install u-boot-1.1.2.

## What's Included

-   OMAP5912 OSK board
-   [Monta Vista](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/OSK/Monta_Vista/Monta_Vista.md "Monta Vista") Linux 2.4 for OMAP5912 OSK
-   Documentation CD
-   RS-232 cable
-   Ethernet cable
-   Audio cable
-   AC Power cord(s) and Power supply
-   Quick Start Guide

## Flash Recovery Utility

-   (free as in water) [Flash Recovery
    Utility](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/OSK/Flash_Recovery_Utility/Flash_Recovery_Utility.md "Flash Recovery Utility") for the
    OSK5912 allows reflashing over USB - works with revision C boards
-   (free as in speech, GPL) OMAP Flash Loader - link on bottom of
    [Flash Recovery
    Utility](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/OSK/Flash_Recovery_Utility/Flash_Recovery_Utility.md "Flash Recovery Utility")
-   (\$79/\$89 USD, supported product)
    [FlashRecoveryUtility](http://www.softwaredesignsolutions.com/) for
    OSK5912 from SDS Inc - works with revision C and D boards

## HOWTOs and FAQs

This section tries to summarize various HOWTOs and FAQs existing for
OMAP Linux and/or OSK.

-   [General OMAP Linux
    readme](http://source.mvista.com/git/gitweb.cgi?p=linux-omap-2.6.git;a=blob_plain;h=f8ffb68e8588c5ad43a72c3534c5f963aa7c91af;f=Documentation/arm/OMAP/README),
    also available in each kernel tree in Documentation/arm/OMAP/README
-   [OMAP GPIO usage
    HOWTO](http://source.mvista.com/git/gitweb.cgi?p=linux-omap-2.6.git;a=blob;h=fd6363cd7f54d292d51428f3d12f2e5d2fce00b1;hb=1eee43329dbdbf86a1af43fa18ce563bced4e6fb;f=Documentation/arm/OMAP/gpio),
    also available in each kernel tree in Documentation/arm/OMAP/gpio
-   [Collection of OSK
    HOWTOs](http://oskfordummies.hp.infoseek.co.jp/howto.html)
-   [UBoot for
    OSK](http://tree.celinuxforum.org/CelfPubWiki/OSK_2fuboot)
-   [Spectrum digital OSK5912
    FAQ](http://omap.spectrumdigital.com/osk5912/osk5912_faq.html)
-   [OSK5912 Audio
    driver](http://oskfordummies.hp.infoseek.co.jp/howto/audio.html)
-   [USB Camera
    HOWTO](http://oskfordummies.hp.infoseek.co.jp/howto/usb_camera.html)
-   [X on OMAP
    tutorial](http://marc.info/?l=linux-omap&m=119634411325523&w=2)
-   [OSK for dummies](http://oskfordummies.hp.infoseek.co.jp/)
-   [Building Linux for the Innovator Development Kit for OMAP
    Platform](http://focus.ti.com/docs/apps/catalog/resources/appnoteabstract.jhtml?abstractName=swpa011)
-   [Building Linux for the OMAP5912
    OSK](http://linux.omap.com/pub/documentation/osk/omap5912osk_2.6.pdf)
-   [OSK5912 Newbie
    Guide](http://www.capgo.com/Resources/SoftwareDev/osk-newbie-guide.pdf)
-   [Readme GIT for
    OMAP](http://www.muru.com/linux/omap/README_OMAP_GIT)
-   [Submitting OMAP
    patches](http://www.muru.com/linux/omap/README_OMAP_PATCHES)
-   [Linux OMAP Open Source Mailing
    List](http://vger.kernel.org/vger-lists.html#linux-omap), the
    searchable archive is available at
    [http://marc.info/?l=linux-omap](http://marc.info/?l=linux-omap).
-   [LCD output from
    decompressor](http://marc.info/?l=linux-omap&m=119634447930300&w=2):
    If you care about the first impression your kernel makes :-) , or
    your device has no serial ports, you might want to have the
    decompressor output its messages through LCD, like on a VGA.
-   [Flash u-boot using USB OTG on
    H3](http://marc.info/?l=linux-omap&m=119634448730363&w=2) (sorry,
    not OSK, but H3 related ;) )
-   [Suspend To Disk For
    ARM](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/Suspend_To_Disk_For_ARM.md "Suspend To Disk For ARM")
-   Execute kernel in place (XIP) from flash [Kernel
    XIP](../../../.././dev_portals/Boot_Time/Kernel_XIP/Kernel_XIP.md "Kernel XIP")

## TODO list

-   Flash Recovery Utility (FRU) available above is uses an undocumented
    usb interface and is only for windows
    -   Zach Welch wants the protocol specs so a scriptable version can
        be created for Linux
    -   GPL'd OMAP Flash Loader listed above duplicates the protocol,
        but does not document it.
-   u-boot sources with correct arch number (515 as listed on
    [http://www.arm.linux.org.uk/developer/machines/](http://www.arm.linux.org.uk/developer/machines/))
    should be available from
    [http://u-boot.sourceforge.net](http://u-boot.sourceforge.net); or
    use u-boot 1.1.1 with
    [Media:u-boot-1.1.1-osk.diff](http://eLinux.org/images/f/f5/U-boot-1.1.1-osk.diff "U-boot-1.1.1-osk.diff")
-   [OE](http://openembedded.org/) should build complete flash image
-   [uClibc](http://uClibc.org/) rootfs should be available
-   find/post patch info for 2.4 (2.6 is listed above)
-   [Tim Riker](../../../.././dev_portals/Boot_Time/Suspend_To_Disk_For_ARM/OSK/User:TimRiker/User:TimRiker.md "User:TimRiker") thinks it would be nice
    to have a uclibc/tuxscreen style buildroot too. ;))


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")

