> From: [eLinux.org](http://eLinux.org/Panda_How_to_Barebox "http://eLinux.org/Panda_How_to_Barebox")


# Panda How to Barebox



## Contents

-   [1 Introduction](#introduction)
-   [2 What is Barebox?](#what-is-barebox-3f)
    -   [2.1 Warning](#warning)
-   [3 MLO](#mlo)
-   [4 Barebox](#barebox)
-   [5 Creating a working SD card](#creating-a-working-sd-card)

## Introduction

For this How-to, we will use the Code Sourcery G++ version arm-2009q3.
It should already be installed on your system. MLO, u-boot and kernels
have also been successfully built with arm-2010q1.

## What is Barebox?

Barebox is what was once u-boot V2, see the homepage for more details.

    http://barebox.org/

You can get the sources from:
[http://git.pengutronix.de/?p=barebox.git;a=summary](http://git.pengutronix.de/?p=barebox.git;a=summary)



### Warning

There is no 4460 specific code as yet in Barebox and the 4430 code that
sets up the CPU dpll and the VCORE1/3 is not correct for the 4460.



## MLO

First, let's get the x-loader source code and build it. But the
difference with Barebox is that the x-loader is just a down size of
Barebox it self

    git clone git://git.pengutronix.de/git/barebox.git

Next, select the panda config:

    mkdir MLO
    make mrproper
    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi-  O=MLO panda_xload_defconfig

Now compile MLO:

    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi- O=MLO

This should produce the MLO file as MLO/barebox.bin.

## Barebox

Now for Barebox:

Next, select the panda config:

    mkdir boot
    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi- O=boot panda_defconfig

Now compile Barebox:

    make ARCH=arm CROSS_COMPILE=Path_to_your/arm-2009q3/bin/arm-none-linux-gnueabi- O=boot

This should produce boot/barebox.bin

## Creating a working SD card

Use this script to prepare an SD card with the small vfat partition and
the larger ext2/3 partition (it has been posted many places, I take no
credit for it btw, the card needs to be larger than 64Mbytes since this
original script wants to make a 64Mbyte vfat partition) You may need to
be root for some of the following operations. For the feint of heart,
you can use sudo instead in the right places.

    #!/bin/sh
    if [ ! "$1" = "/dev/sda" ] ; then
        DRIVE=$1
        if [ -b "$DRIVE" ] ; then
            dd if=/dev/zero of=$DRIVE bs=1024 count=1024
            SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
            echo DISK SIZE - $SIZE bytes
            CYLINDERS=`echo $SIZE/255/63/512 | bc`
            echo CYLINDERS - $CYLINDERS
            {
            echo ,9,0x0C,*
            echo ,,,-
            } | sfdisk -D -H 255 -S 63 -C $CYLINDERS $DRIVE
            mkfs.vfat -F 32 -n "boot" ${DRIVE}1
            mke2fs -j -L "rootfs" ${DRIVE}2
        fi
    fi

When SD card partitioning is ready you need to copy binaries to SD card
boot partition.

Copy first MLO:

    cp MLO/barebox.bin.itf /media/boot/MLO

Then copy barebox:

    cp boot/barebox.bin /media/boot/

Then you're ready. Plug your SD card to Pandaboard and enjoy barebox.

More to come....


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

