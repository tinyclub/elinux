> From: [eLinux.org](http://eLinux.org/Android_Porting "http://eLinux.org/Android_Porting")


# Android Porting



This page describes various effort to port Android to new boards and new
processors



## Contents

-   [1 Porting Overview](#porting-overview)
-   [2 Porting Tutorials](#porting-tutorials)
-   [3 Porting Issues](#porting-issues)
    -   [3.1 Android Hardware Abstraction
        Layer](#android-hardware-abstraction-layer)
-   [4 Porting to New Processors](#porting-to-new-processors)
-   [5 Virtualization environments](#virtualization-environments)

## Porting Overview

This overview of porting steps was seen on the android-porting list:
 See
[http://www.mail-archive.com/android-porting@googlegroups.com/msg06721.html](http://www.mail-archive.com/android-porting@googlegroups.com/msg06721.html)

This glosses over all the kernel work for a new board, and the
android-specific kernel patches, but has some good discussion about the
flash partitioning and file system bringup process.

    If the linux kernel is up and running with all drivers in.
    (particularly touchscreen and display) it shouldn't be too bad.

    IHMO, the easiest way to get you running is to aggregate the initial
    ramfs built into the kernel with the Android build, the root Android
    root filesystem (system), and the user data section (mounted as /data
    I believe) into one root filesystem.

    You can then take that root filesystem as one tarball.

    Modify the NAND partitioning of the kernel to set aside space for the
    whole Android rootfs, and of course rebuild the kernel. (Be sure yaffs
    support is in the kernel) Also no need for a ramfs at this point, just
    have the kernel look to mtd2 for it's root filesystem, which will be
    jffs2

    Create yourself a busybox root filesystem too. Make that into a jffs2
    image.

    So your partitioning would look something similar to this (you'll have
    to decide on the sizes of course):
    mtd0: bootloader
    mtd1: kernel
    mtd2: rootfs (jffs2)
    mtd3: Android rootfs.

    Erase everything on the NAND.
    Burn the normal Chumby bootloader to mtd0.
    Burn the the new kernel into mtd1.
    Burn the jffs2 rootfs image to mtd2.

    Boot the device. Hopefully you get yourself to a prompt.

    Once you have that prompt mount mtd3 to /mnt/android as a yaffs2
    partition.
    Untar your Android rootfs into /mnt/android.
    Chown and chgrp everything under /mnt/android to "root"
    chroot to that mount point "chroot /mnt/android /init"

    At this point you should see Android trying to run.


    I know that's a bit to chomp on, but it's more of an outline of what
    you will need to do. Of course it's assuming you have the ability to
    erase the whole nand and put down images amongst other assumptions,
    but it should help get your mind around a little bit of the
    requirements to get Android running on your device.

    Regarding your bootloader question, I'd just stick with the current
    one. You'll only need to modify that if/when you go into having
    everything compatible with the recovery system. Which is a completely
    different discussion.

## Porting Tutorials

-   [Porting Android to a new
    Device](http://www.linuxfordevices.com/c/a/Linux-For-Devices-Articles/Porting-Android-to-a-new-device/)
    - excellent and thorough paper on porting Android to the Nokia N810.
    -   Has a detailed list of kernel changes and annotated diffs.
-   [http://wiki.kldp.org/wiki.php/AndroidPortingOnRealTarget](http://wiki.kldp.org/wiki.php/AndroidPortingOnRealTarget)
-   [Android on OMAP](http://eLinux.org/Android_on_OMAP "Android on OMAP") - excellent
    tutorial covering lots of different issues for porting Android to
    platforms based on the TI OMAP (ARM) processor
-   Some cursory notes on a port to a PXA board are at:
    [http://letsgoustc.spaces.live.com/blog/cns!89AD27DFB5E249BA!320.entry](http://letsgoustc.spaces.live.com/blog/cns!89AD27DFB5E249BA!320.entry)
-   Adding a new device or changing the configuration of an existing
    device [Android Device](http://eLinux.org/Android_Device "Android Device")

## Porting Issues

-   Matt Porter (Mentor Graphics) gave a presentation on difficulties
    encountered while they were porting Android to MIPS and PPC
    processors at [ELC Europe
    2009](http://www.embeddedlinuxconference.com/elc_europe09/index.html).
    His talk was called "Mythbusters: Android" and has lots of good
    information.
    -   See
        [Mythbusters\_Android.pdf](http://eLinux.org/images/2/2d/Mythbusters_Android.pdf "Mythbusters Android.pdf")

-   [Dalvik porting
    guide](http://android.git.kernel.org/?p=platform/dalvik.git;a=blob_plain;f=docs/porting-guide.html;hb=HEAD)

-   Matthias Brugger presented his personal "war story" on porting
    Android at ELC Europe 2012. See his
    [slides](http://www.slideshare.net/MatthiasBrugger/porting-android-40toacustomboard)
    on slideshare.

### Android Hardware Abstraction Layer

Android talks to standard devices through its hardware abstraction
layer, which overlays the kernel interfaces to devices (e.g. devices
nodes, Linux system calls, etc.). To add support for your own hardware,
or, in particular, to add support to Android for some new type of
hardware, you need to understand this abstraction layer.

Karim Yaghmour has a good blog entry describing the Android HAL layer:
[http://www.opersys.com/blog/extending-android-hal](http://www.opersys.com/blog/extending-android-hal)

## Porting to New Processors

-   Mentor Graphics has ported Android to MIPS and PPC
-   Power.Org supported the work to port Android to PPC
    -   Nina Wilner talked about this work, and gave a demo at ELC
        Europe 2009
    -   see
        [Android\_On\_Power.pdf](http://eLinux.org/images/0/07/Android_On_Power.pdf "Android On Power.pdf")

## Virtualization environments

There are available some virtualization environments, which allow
Android applications (or the whole system) to run on other Linux-based
systems, such as MeeGo or Ubuntu.

Here is some information about different systems known to exist:

-   OpenMobile ACL (Application Compatibility Layer)
    -   LinuxDevices article:
        [http://www.linuxfordevices.com/c/a/News/OpenMobile-ACL-for-MeeGo/?kc=LNXDEVNL092811](http://www.linuxfordevices.com/c/a/News/OpenMobile-ACL-for-MeeGo/?kc=LNXDEVNL092811)
    -   OpenMobile product
        page:[http://openmobile.co/products.php](http://openmobile.co/products.php)
-   Myriad Alien Dalvik
    -   LinuxDevices article:
        [http://www.linuxfordevices.com/c/a/News/Myriad-Group-Myriad-Alien-Dalvik/](http://www.linuxfordevices.com/c/a/News/Myriad-Group-Myriad-Alien-Dalvik/)
    -   Myried Group page:
        [http://www.myriadgroup.com/Device-Manufacturers/Android-solutions/\~/media/D42B513FB5114FF2B4CA13A2D8CE313E.ashx](http://www.myriadgroup.com/Device-Manufacturers/Android-solutions/~/media/D42B513FB5114FF2B4CA13A2D8CE313E.ashx)
-   [FIXTHIS - should add tetsuyuki presentation about running Android
    on Ubuntu here]


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

