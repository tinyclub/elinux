> From: [eLinux.org](http://eLinux.org/Didj_Make_ATAP "http://eLinux.org/Didj_Make_ATAP")


# Didj Make ATAP



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Software Needed](#software-needed)
-   [4 Hardware Needed](#hardware-needed)
-   [5 Preparing the Didj](#preparing-the-didj)
-   [6 Preparing the MTD Partitions](#preparing-the-mtd-partitions)
-   [7 Flash the NAND](#flash-the-nand)
-   [8 Notes](#notes)

## Summary

This tutorial explains how to create a usable NAND if you have a
modified [LeapFrog Cartridge or
Homebrew](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "LeapFrog Pollux Platform: Cartridge"),
this is by no means complete but should get you well on your way to
creating your own recovery cartridge. It will also show you the
beginnings of being able to create your own partition structure for the
NAND devices, which in turn should eventually lead us to being able to
run a full kernel and rootfs without having to do too much to the
codebase.

## Prerequisites

[Mount Didj USB Partition on
Host](http://eLinux.org/Didj_USB_Mounting "Didj USB Mounting")

[Extract lfp
Files](http://eLinux.org/LeapFrog_Pollux_Platform:_Extract_Archives "LeapFrog Pollux Platform: Extract Archives")

## Software Needed

[LeapFrog\_Pollux\_Platform:\_Source\_Code\#Didj 2009 Didj
Sources](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#Didj_2009_Didj_Sources "LeapFrog Pollux Platform: Source Code")

[Extract
Archives](http://eLinux.org/LeapFrog_Pollux_Platform:_Extract_Archives "LeapFrog Pollux Platform: Extract Archives")

ATAP Files
/Didj-Linux-4222-20090422-1236/packages/mfg-cart/Base2ATAP/Atap\_FW

-   bootstrap-LF\_LF1000-0.33.5.3186\_ATAP.lfp
-   firmware-LF\_LF1000-0.33.5.3186-ATAP.lfp

## Hardware Needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

Read/Write NAND Cartridge

## Preparing the Didj

We need to get a custom firmware onto the Didj so that it can 'see' the
extra mtd partitions on the cart, fortunately for us, LeapFrog provided
those in the form of the bootstrap/firmware ATAP.lfp files in
/Didj-Linux-4222-20090422-1236/packages/mfg-cart/Base2ATAP/Atap\_FW

Mount the Didj Partition on the host PC

Extract each of the ATAP lfp files into /Base/

You'll end up with 2 extra folders in /Base:

    /Didj/Base/bootstrap-LF_LF1000/
    /Didj/Base/firmware-LF_LF1000/

The bootstrap directory contains a Lightning-Boot and firmware contains
the kernel and rootfs files.

Make sure you are booted from RFS0 (we'll keep this as the original for
now) and make sure the Didj knows that you've got a mfcart in the unit,
once done reboot:

    echo RFS0 > /flags/rootfs
    touch /flags/mfcart
    reboot

Flashing the Didj with the ATAP files will load a bootloader kernel1 and
RFS1 to your didj's nand.

I'm not certain that you need to update the bootloader but for the sake
of completeness I did, on the Didj do the following to update the
bootloader and firmware:

    blupdate
    fwupdate

Reboot and you should now be in the ATAP firmware on RFS1, you should
see an extra 9 mtd partitions being created.

    NAND device: Manufacturer ID: 0x2c, Chip ID: 0xda (ST Micro NAND 256MiB 3,3V 8-bit)
    Scanning device for bad blocks
    lf1000-nand: cartridge ECC mode: <6>software
    NAND device: Manufacturer ID: 0x20, Chip ID: 0xdc (ST Micro NAND 512MiB 3,3V 8-bit)
    Scanning device for bad blocks
    9 cmdlinepart partitions found on MTD device lf1000-cart
    Creating 9 MTD partitions on "lf1000-base":
    0x00000000-0x00020000 : "LF1000_uniboot"
    0x00020000-0x00100000 : "Atomic_Boot_Flags"
    0x00100000-0x00200000 : "Manufacturing_Data"
    0x00200000-0x00400000 : "Kernel0"
    0x00400000-0x01200000 : "Linux_RFS0"
    0x01200000-0x01400000 : "Kernel1"
    0x01400000-0x02200000 : "Linux_RFS1"
    0x02200000-0x10000000 : "Brio"
    0x10000000-0x10000000 : "EXT"
    mtd: partition "EXT" is out of reach -- disabled
    Creating 9 MTD partitions on "lf1000-cart":
    0x00000000-0x00020000 : "prg_LF1000_uniboot"
    0x00020000-0x00100000 : "prg_Atomic_Boot_Flags"
    0x00100000-0x00200000 : "prg_Manufacturing_Data"
    0x00200000-0x00400000 : "prg_Kernel0"
    0x00400000-0x01200000 : "prg_Linux_RFS0"
    0x01200000-0x01400000 : "prg_Kernel1"
    0x01400000-0x02200000 : "prg_Linux_RFS1"
    0x02200000-0x10000000 : "prg_Brio"
    0x10000000-0x20000000 : "prg_EXT"

Doing a cat /proc/mtd shows us that the mappings are not direct 1:1, our
Brio/Didj partition gets moved all the way to mtd18 for some reason, not
sure why it does this but I think it creates an ubi volume it then
creates an extra mtd partition and mounts either the ubi volume to it or
the new mtd partition to the ubi volume. It does more of the same to the
cart once its formatted correctly. More on this later.

    # cat /proc/mtd
    dev:    size   erasesize  name
    mtd0: 00020000 00020000 "LF1000_uniboot"
    mtd1: 000e0000 00020000 "Atomic_Boot_Flags"
    mtd2: 00100000 00020000 "Manufacturing_Data"
    mtd3: 00200000 00020000 "Kernel0"
    mtd4: 00e00000 00020000 "Linux_RFS0"
    mtd5: 00200000 00020000 "Kernel1"
    mtd6: 00e00000 00020000 "Linux_RFS1"
    mtd7: 0de00000 00020000 "Brio"
    mtd8: 00000000 00020000 "EXT"
    mtd9: 00020000 00020000 "prg_LF1000_uniboot"
    mtd10: 000e0000 00020000 "prg_Atomic_Boot_Flags"
    mtd11: 00100000 00020000 "prg_Manufacturing_Data"
    mtd12: 00200000 00020000 "prg_Kernel0"
    mtd13: 00e00000 00020000 "prg_Linux_RFS0"
    mtd14: 00200000 00020000 "prg_Kernel1"
    mtd15: 00e00000 00020000 "prg_Linux_RFS1"
    mtd16: 0de00000 00020000 "prg_Brio"
    mtd17: 10000000 00020000 "prg_EXT"
    mtd18: 0d812000 0001f800 "ubi_Brio"

## Preparing the MTD Partitions

mkbase.sh will flash the nhe cart with the same nand layout as the didj
nand, at this moment in time the partitions don't exist, so it will
fail, the flash\_eraseall functions don't seem to work correctly so we
do it ourselves.

We need to erase the following partitions:

    mtd13: 00e00000 00020000 "prg_Linux_RFS0"
    mtd15: 00e00000 00020000 "prg_Linux_RFS1"
    mtd16: 0de00000 00020000 "prg_Brio"
    mtd17: 10000000 00020000 "prg_EXT"

I'll show you the first one (prg\_Linux\_RFS0) as an example, to do this
we use mtd\_debug on the Didj to get mtd.size:

    # mtd_debug info /dev/mtd13
    mtd.type = MTD_NANDFLASH
    mtd.flags = MTD_CAP_NANDFLASH
    mtd.size = 14680064 (14M)
    mtd.erasesize = 131072 (128K)
    mtd.writesize = 2048 (2K)
    mtd.oobsize = 64
    regions = 0

Convert the mtd.size to something we can use in mtd\_debug: *On Host*

    # echo 'obase=16; 14680064' | bc E00000

*On Didj*

    mtd_debug erase /dev/mtd13 0 0x00E00000

Repeat this whole process for mtd15,16 and 17, then reboot the didj, you
will see it complain that it couldn't find something on prg\_EXT, and it
will format it for you (it might do the same to mtdblock16) if not then
do:

    mkfs.vfat -n Didj -S 512 /dev/mtdblock16

## Flash the NAND

At this point you should be ready for mkbase.sh to run to completion.
give it a try, from the didj do:

*On Didj*

    # mkbase.sh
    Mounting /dev/mtdblock18 on /Didj as rw
    Mounting /dev/mtdblock19 on /opt/prg_mfg as rw
    /dev/mtd9 is the bootstrap partition
    /dev/mtd12 and /dev/mtd14 are the kernel partitions
    /dev/mtd13 and /dev/mtd15 are the root partitions
    /dev/mtd11 is the manufacturing partition
    /dev/mtdblock11 is the manufacturing partition block device
    /dev/mtd10 is the flags partition
    /dev/mtdblock10 is the flags partition block device
    /dev/mtd16 is the brio partition
    /dev/mtdblock2
    11 is the base mfg partition
    /dev/mtd17 is the extended partition
    /dev/mtdblock17 is the extended partition mount device
    10000000 is the extended partition size
    I have found a development cartridge
    Making a manufacturing cartridge
    BOOTLDR=/Didj/Base/bootstrap-LF_LF1000/lightning-boot.bin
    FLAGS=/Didj/Base/bootstrap-LF_LF1000/bootflags.jffs2
    KERNEL=/Didj/Base/firmware-LF_LF1000/kernel.bin
    ROOTFS=/Didj/Base/firmware-LF_LF1000/erootfs.jffs2
    Boot sector programmed successfully
    Flag partition programmed successfully
    Linux Kernel partition 0 programmed successfully
    Linux Kernel partition 1 programmed successfully
    Skipping manufacturing partition
    Root filesystem partition 0 programmed successfully
    Root filesystem partition 1 programmed successfully
    End of root filesystem setup
    Configuring your manufacturing cartridge...
    Empty flash at 0x0000007c ends at 0x00000800
    No startup scripts.  Cartridge will be a bare boot cartridge.
    No files found to preload the ATAP cartridge with.
    Programming complete

As you can see, there are a couple of issues, No Startup scripts and No
files found to preload proably mean there are some more bits we need to
to fill in to make this a completely working atap cartridge.

You should now do a reboot, check whether the cart prg\_EXT partition
has been mounted on the didj:

*On Didj*

    # mount
    rootfs on / type rootfs (rw)
    /dev/root on / type jffs2 (rw)
    none on /proc type proc (rw)
    sysfs on /sys type sysfs (rw)
    /dev/ram0 on /tmp type tmpfs (rw)
    /dev/mtdblock1 on /flags type jffs2 (rw,sync,noatime)
    /dev/mtdblock2 on /mfgdata type jffs2 (rw,sync,noatime)
    /dev/mtdblock18 on /Didj type vfat (rw,noatime,fmask=0022,dmask=0022,codepage=cp437,iocharset=i)
    /dev/mtdblock19 on /opt/prg_mfg type vfat (rw,noatime,fmask=0022,dmask=0022,codepage=cp437,ioch)

Our prg\_EXT partition was on mtd17, its now been mounted as an ubi
volume to mtdblock19 you can find it in /opt/prg\_mfg, this is similar
behavour to the Brio:/Didj partition, it starts on mtd7, without a cart
its put onto mtdblock9 as an ubi volume, with a cart /Didj ends up on
mtdblock18.

Reboot, then plug your usb cable in and mount the partitions.

You should now see both the Brio:/Didj partition and the
prg\_EXT:/opt/prg\_mfg partitions, /Didj will be 'DIDJ' and
/opt/prg\_mfg will be 'MFG\_PAYLOAD'

I think we need to look at all of the /scripts files to glean more
information about how to truly make an ATAP cart, I think
make\_release.sh shows us how to package some files for the mfg-cart
ATAP stuff so they can be installed on the Didj, I think we can probably
make up the rest of the files needed from mfg-cart and leapfrog lfp
files.

## Notes

Whats next?

It would obviously be nice to make the prg\_Brio partition show up
automatically, I'd like to work out how we can get it to show up as an
ubi volume, not entirely sure what the mechanism is there yet.

We should be able to boot from the cart, not sure how that works yet
either, but something along the lines of:

    echo RFS2 > /flags/rootfs

should be enough, it will be in the sources, just need to track it down
(lightning boot uses RFS0, RFS1, NFS0, NFS1 currently, will probably
need extra flags)

I'd like to make a full cart, there are some bits missing, which I think
are in the mfg-cart folders or at least the info.

I think we've learnt how to format a nhe cart, with the same partition
structure as a didj nand unit, so we now know how to roughly deal with
rebuilding a didj, so by extension we are not that far removed from
being able to rebuild an LX partartition structure on a didj.

If you do cat /proc/cmdline you will notice that it builds the mtd
partition structure for the cart in there, I think we should be able to
use the same technique to make a custom SD booting kernel that can see a
cart, this way we probably wouldn't need to flash the didj at all with
the atap firmware. we can use root=31:04 technique to boot from the NHE,
for instance from 31:12 :) once we know that we can boot from a cart we
should be able to leverage an lx kernel with sufficient mtd2/ubi utils
(will need to make ubiformat etc. ourselves from the new-utils).

We should probably look at a lot more of the scripts that are dotted all
over the sources, the emeraldmfgtest folder found on an original lx
firmware gives us some hints, as does make\_release.sh, mkbase.sh
mkSuperATAP.sh and many others.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

