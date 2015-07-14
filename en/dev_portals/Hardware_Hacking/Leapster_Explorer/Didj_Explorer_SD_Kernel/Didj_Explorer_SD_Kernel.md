> From: [eLinux.org](http://eLinux.org/Didj_Explorer_SD_Kernel "http://eLinux.org/Didj_Explorer_SD_Kernel")


# Didj Explorer SD Kernel



## Contents

-   [1 Booting a didj using an explorer framebuffer kernel and rootfs
    from
    SD](#booting-a-didj-using-an-explorer-framebuffer-kernel-and-rootfs-from-sd)
-   [2 Kernel Preparation](#kernel-preparation)
-   [3 Patch the MMC/SD,ext3 and nand
    drivers](#patch-the-mmc-sd-ext3-and-nand-drivers)
-   [4 Patch the cmdline in .config](#patch-the-cmdline-in-config)
-   [5 Patch the buttons in the
    .config](#patch-the-buttons-in-the-config)
-   [6 Patch the Framebuffer](#patch-the-framebuffer)
-   [7 Prepare and Populate the SD
    card](#prepare-and-populate-the-sd-card)
-   [8 Partition and format](#partition-and-format)
-   [9 Populate the partitions](#populate-the-partitions)
-   [10 Test everything](#test-everything)
-   [11 Notes](#notes)
-   [12 To Do](#to-do)

## Booting a didj using an explorer framebuffer kernel and rootfs from SD

**PREREQUISITES**

    working toolchain
    the latest kernel sources for the leapster explorer: LF-Linux-8291-20101026-1425.tar.gz 99MB
    the latest erootfs obtained via lfconnect (from the lfps)
    some patches (rcS, kconfig,makefiles, source code patches?)
    Sources
    A djhi or other means of connecting an SD/uSD card to a didj
    a reasonable sized SD card partitioned with a Vfat partition and ext3 partition in that order (tested on a 2GB uSD, will probably work on 64MB but > 512MB is probably best)
    a patched defconfig (goes in arch/arm/configs with the other lf1000 defconfigs)
    Updated lightning-boot version 1.6 - lightning-boot-1.6NAND.tar.gz 17KB
    pre-built kernel (zImage) and rootfs image - kernel_rootfs.tar.gz 35MB
    prebuilt kernel to burn to nand SDkernel.tar.gz 1.6MB

This document lays out what I went through to patch the leapfrog
explorer 2.6.31 kernel to work on a didj with the kernel and rootfs on
an uSD card, you don't have to follow the whole article as I will wrap
it all up in patches/source code but you may find it useful for
reference for driver/module patching in the future.

## Kernel Preparation

I based my defconfig on leapfrogs new
arch/arm/lf1000\_ts\_fb\_defconfig, simply running **make clean** then
**make lf1000\_ts\_fb\_defconfig** however you do not need to do this
yourself if you are using my defconfig and supplied patches.

Download the latest explorer kernel source code from the link above and
untar it to your hdd, make sure you set your paths as per any of the
other didj/explorer kernel compilation tutorials on the main pages.
unpack the pre\_patched\_kernel.tar (link to tar file) into the
LX-Linux-8291-20101026-1425/linux-2.6/ folder

If you're not bothered about whats been done to get the kernel patched
you can just make the kernel now by running:

    make clean
    make lf1000_fb_sd_defconfig

And skip down to **Prepare and Populate the SD card**

I used the ridgerun toolchain to build my kernel but I seem to have
issues building a full erootfs image with it, hence preparing the rootfs
image from leapfrogs pre-built update files.

I'm pretty certain that its building against the wrong version of uclibc
as the module numbering is 9.29 on mine as opposed to 9.30 for leapfrogs
modules. With a little investigation I'll have this sorted and we will
be able to produce a complete SD based rootfs image ourselves. Just to
be clear, I can build a full kernel and rootfs image myself but the
rootfs \*doesn't\* mount :/

## Patch the MMC/SD,ext3 and nand drivers

first thing we need to do is patch the MMC stuff, as it stands, you can
put them in as built in but it will stall the kernel when it tries to
bring everything up, if you leave it long enough it clears its issue
(pending frags in the audio dma buffers?) but this doesn't help as the
system doesn't bring up the other core mmc modules with the lf1000
stuff. The lf1000-mmc is obviously clashing with something so we need to
look in the makefile, in the makefile we find that its been randomly
placed in the list and looking at what leapfrog tend to do I simply
moved the mmc object to the end of the list, which immediately cleared
the kernel stalling issue :)

Now we've cleared the stalling issue we can get on to the rest of the
mmc module bringup, it was suggested to me that I should try adding the
lf1000, mmc block and ext3 modules to each others dependency lists in
the respective kconfig file, having done this the lf1000 mmc driver now
comes up correctly with the kernel :) use the supplied mmc patch to
patch the relevant makefile and kconfig files and the kernel source code
patches.



## Patch the cmdline in .config

thats the MMC drivers patched, but we need a custom cmdline
configuration to actually see the rootfs partition on the SD card, this
is taken care of in the deconfig that I've supplied:

    CONFIG_CMDLINE="mem=16M root=179:02 rw rootfstype=ext3 rootdelay=2 debug=1 init=/sbin/init console=ttyS0,115200 ubi.mtd=Brio"

You'll notice that the cmdline is a bit sparse compared to the usual
one, I've removed the mtd.ubi references as they are unecessary for this
purpose and simply make the boot time longer as the nand driver tries to
find non-existent partitions. I've patched the 2.6.31 nand driver to use
the didj mtd partition layout and I improved nirvous fantastic original
2.6.31 didj kernel patch by patching the kconfig file to have use the
same layout. use the supplied patch(es) to patch the nand driver and
kconfig files.

This kernel \*DOES NOT\* automatically mount any didj partitions but
they can still be accessed by the usual mount commands, the didj
partitions are not necessary but I made the changes so they are
accessible so that in theory you can rebuild a dead didj using just a
djhi, lightning-boot1.4-uart and a prepared SD card. Be aware that
whilst they aren't mounted the didj partitions can still be overwritten
by the standard flashing tools that are supplied by leapfrog, you have
been warned :)



## Patch the buttons in the .config

thats the MMC and nand sorted but there is still a little way to go. we
need to setup the buttons so that they are recognised correctly at boot
time, this can be mostly achieved by setting

    CONFIG_LF1000_OVERRIDE_BOARD_ID=y
    CONFIG_LF1000_OVERRIDE_BOARD_ID_VALUE=3

This fixes the majority of the button recognition but leaves the volume
buttons unrecognised, however the volume slider does still work, the
drivers need patching to complete this setup, that will be for a later
update.



## Patch the Framebuffer

We also need to patch the framebuffer settings, leapfrog very kindly
supplied a newer framebuffer driver and a defconfig to go with it, I
based my defconfig around this, unfortunately its setup for an explorer
with 64MB of ram, fortunately its an easy fix, the start address is in
the wrong place, in the defconfig I made the following change:

    CONFIG_FB_LF1000_START_ADDR=0x01200000


 that's pretty much it for the kernel preparation, you can compile it
now if you like, then all that is left to do is prepare the SD card and
populate it.



## Prepare and Populate the SD card

As previously mentioned, you will need a uSD card and a djhi, you can
probably build this on a 64MB card but \> 512MB would be much more
sensible, I used a 2GB card.



## Partition and format

You'll need to partition the SD card into 2 partitions, 1 vfat partition
and 1 ext3 partition, the vfat partition needs to be first, its entirely
up to you what size they are as long as the vfat partition is big enough
to hold at least 1 kernel zImage (about 2MB) and the ext3 partition is
big enough to hold a full rootfs (about 40MB).



## Populate the partitions

Once the card is formatted you can now populate the partitions with the
necessary files.

You will need the erootfs.ubi file mentioned in the prerequisites, once
you've downloaded it you need to mount the image on your host PC, to
mount the leapfrog erootfs.ubi file use this tutorial: [How to Extract
Files From the Firmware LFP
file](http://eLinux.org/LeapFrog_Pollux_Platform:_Extract_Archives "LeapFrog Pollux Platform: Extract Archives")

Once you have the erootfs.ubi image mounted copy the contents onto your
ext3 partition on the SD card, copy across the supplied patched files to
the ext3 partition and copy your zImage to the vfat partition on the uSD
card, if you are using the patched lightning boot then make sure you
name your zImage appropriately (zImage or zImage2).

## Test everything

If everything has gone smoothly you should be able to put the SD card
into your djhi, start lightning boot and choose 'Load zImage from SD',
you should see the counter increase in the bottom right corner of the
screen, once it stops you should see the console start outputting as the
kernel probes all the built in modules.



## Notes

**1. Leapfrog and my changes**

Leapfrog have changed the way they do things now, most of the hardware
stuff is created via the kernel module probing and mdev. Most of the
/etc/init.d/rcS stuff was for communicating with leapfrog for updates or
recovering from crashes, I have left it so you get a minimal boot, all
of the networking stuff still works, you just have to do it by hand for
now until we decide exactly what resources are necessary at boot up, we
may well be able to do NFS boot on the didj via g\_ether usb gadget
drivers.


 **2. Mounting the /Didj nand partition and the mmc vfat partition**

I've left the /Didj ubi.mtd=Brio partition in the cmdline, the nand
drivers attach it for us, all you need to do is mount it if you need
access to it, it will be on /dev/mtdblock8, unless you have an NHE cart
in which case it will be on the mtd device named ubi\_Brio, to find out
which partition that is do:

    cat /proc/mtd

Translate that to the appropriate mtdblocknumber and mount that device
with the following (change the 8 to the appropriate number):

    mount -tvfat -orw,noatime /dev/mtdblock8 /mnt2

You can mount the vfat partition on the didj with:

    mount -tvfat -orw,noatime /dev/mmcblk0p2 /mnt

**3. Mass Storage access for file transfer and kernel updates**

I have written a pair of simple scripts to allow the vfat SD partition
to be available over the g\_file\_storage module, this makes it act as
if it were a usb stick in its own right. I have it configured so that I
can plug in the usb cable, run the appropriate script and the drive
automatically mounts on my dev box. This makes it very simple to update
the kernel and transfer it to the device, run the disable script and
reboot into your new kernel.

The scripts are called massenable and massdisable, to setup the didj so
that it automounts on the host I have done the following on the didj:

    # echo -e "ENABLED\nUNLOCKED\n" > /flags/usb_mass_storage
    you can enable the mass storage by running:
    # massenable
    you can disable the mass storage by running:
    # massdisable

at the moment it is only setup for the vfat partition but there is
nothing to stop you using the existing script to learn how mount any
partition on a host PC.

**4. using the framebuffer**

I have done minimal testing on the framebuffer, we get the tux logo and
leapfrog have supplied a new app. called imager-fb, make sure you are
using the correct mode, RGB 565,888, RGBA 8888 (16,24,32bit) via
bits\_per\_pixel :

    echo 24 > /sys/devices/platform/lf1000-fb/graphics\:fb0/bits_per_pixel
    imager-fb /LF/Base/L3B_Art/UI_TitleSplash.png

should set the mode up for RGB888 and display the splash screen.

The backlight seems to have a timeout on it if the unit hasn't had a
button press in XX seconds (I think its about 5mins), I haven't found
out where this is set but it seems to turn off the backlight and clear
the framebuffer, if you press a button the backlight comes back on but
doesn't restore the framebuffer, the framebuffer however still works,
this will be on the todo list.

**5. a new version of oss called osshh**

In an effort to quieten down some of the messages that are spammed to
the console on boot I edited out all the messaging that I could from oss
and called it osshh (oss, SHH!!) if you need feedback as to why a sound
didn't play properly use the normal oss to test it.

## To Do

Writeup a similar but simpler article for the explorer :)

Reclaim some ram, we don't currently use 3d so we could easily release
that ram for other stuff, we only use fb0 so we can cut the fb memory
down to about 2x300kb (2 buffers for page flipping), this would give us
about 13.5MB of ram back :) We could provide another defconfig with the
3d turned on if necessary for didj's that have the 64MB ram mod or
explorers.

The volume buttons need sorting out so that the system recognises them
properly at boot, as mentioned they work but still give a pin/port
undefined error.

There is a black square on the splash screen, I think this comes from
either the touchscreen mouse pointer or the frambuffer pointer/cursor,
probably one of the latter as the touchscreen/mouse support should be
disabled.

Find out how to enable/disable the backlight timeout or handle it
properly, Notes, 4.

/dev complains about being in use when the system tries umount -a at
rebooted/shutdown, I suspect this is because its mounted early on a
ramdisk, I suspect its not a major issue as /dev is then populated from
a tar created on first boot of a new rootfs but it would be good to
confirm.

We need to quieten down the messages the drivers send to the console,
some of it is kernel/error messages which can be turned off via debug
settings (I think) and setting log levels? in the kernel cmdline, but
turning off some things that produce messages like
CONFIG\_LF1000\_AUDIO\_STATS breaks the driver.

Add code to lightning boot or emerald boot to allow booting from a
simple text configuration file on the vfat partition, this will allow
for simple CONFIG\_CMDLINE changes that don't require recompilation of
the kernel. This will be useful for testing the SD rootfs based kernels
and normal didj/explorer kernels or adding a 2nd partition for dual
booting from the SD etc.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

