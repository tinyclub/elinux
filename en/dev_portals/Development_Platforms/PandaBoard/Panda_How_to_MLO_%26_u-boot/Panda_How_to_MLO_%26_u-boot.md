> From: [eLinux.org](http://eLinux.org/Panda_How_to_MLO_%26_u-boot "http://eLinux.org/Panda_How_to_MLO_%26_u-boot")


# Panda How to MLO & u-boot



## Contents

-   [1 Introduction](#introduction)
-   [2 u-boot (linaro)](#u-boot-linaro)
-   [3 u-boot (mainline)](#u-boot-mainline)
    -   [3.1 boot.scr](#boot-scr)
-   [4 Creating a working SD card](#creating-a-working-sd-card)

## Introduction

A Panda board does not have any onboard flash, where many other
development or evaluation boards keep their bootloader. Rather, code
onboard the board (presumably in ROM) reads the second-stage bootloaders
from the MMC (SD card).

The first-stage bootloader runs directly on the board from power-up. I
don't know the name of this bootloader(From [TI official
wiki](http://processors.wiki.ti.com/index.php/Boot_Sequence), it called
Boot Rom). This bootloader initializes a minimal amount of CPU and board
hardware, then accesses the first partition of the SD card (which must
be in FAT format), and loads a file called "MLO", and executes it. "MLO"
is the second-stage bootloader.

The second-stage bootloader can apparently be one of either the X-loader
or SPL. This bootloader apparently also just reads the first partition
of the SD card, and loads a file called "u-boot.bin", and executes it.
"u-boot.bin" is the third-stage bootloader.

The third-stage bootloader is U-boot, which is a popular bootloader for
many different embedded boards and products. This bootloader has lots of
different features, including an interactive shell, variables, ability
to access the SD card and show its contents, etc. What happens next
depends on the version of U-boot you have for the Panda board, and how
it is configured. In a very simple configuration, U-Boot will look for
the file "uImage" in the root of the first partition of the SD card
(which, again, must be formatted as a FAT partition), and execute that.
This is the Linux kernel. U-Boot passes the kernel a command line
argument. Depending on how the kernel is configured it may accept the
command line from U-Boot, or use one that was compiled into it when it
was built.

Newer kernels require that you use a recent MLO (SPL) and u-boot. Note:
New u-boot with SPL replaces x-loader which you might find in other
howtos.

You can build these from source, or try to find binaries. One issue with
the binary route is that you might want to alter the kernel command line
embedded inside u-boot. Such as for experimenting with different
partition formats, or different filesystem types (ext3 vs ext2), etc. Of
course you could stop the autoboot and type it in yourself, but we will
build from source. An even better solution is to use a boot.scr file to
send parameters to u-boot, it's easy to create, see below.

For this How-to, we will use the Code Sourcery G++ version arm-2009q3.
It should already be installed on your system. MLO, u-boot and kernels
have also been successfully built with arm-2010q1.

You can get u-boot from either linaro or mainline. The linaro tree
usually has the latest patches.

Note: This is for Pandaboard, not Pandaboard ES. If you have a
Pandaboard ES try
[PandaBoard\_ES\_uboot\_howto](http://eLinux.org/PandaBoard_ES_uboot_howto "PandaBoard ES uboot howto")
instead.

## u-boot (linaro)

First, let's get the u-boot source code and build it.

    git clone git://git.linaro.org/boot/u-boot-linaro-stable.git

cd to the u-boot-linaro-stable directory and checkout tag 2011.11.2

    cd u-boot-linaro-stable
    git checkout 2011.11.2

Next, select the panda config. Make sure your cross compiler is in your
\$PATH:

    make CROSS_COMPILE=arm-none-linux-gnueabi- omap4_panda_config

Change ttyS2 to ttyO2 in the u-boot kernel command line in:
u-boot/include/configs/omap4\_panda.h

Now compile U-boot:

    make CROSS_COMPILE=arm-none-linux-gnueabi-

This should produce the files MLO and u-boot.img in the u-boot
directory. Copy both files to your sd card, you now should be able to
boot.

## u-boot (mainline)

Same as above but clone from denx.de:

    git clone git://git.denx.de/u-boot.git

And checkout tag v2011.09:

    git checkout v2011.09

You now should be able to boot.

Note: Tag v2011.09 from mainline might fail to boot on some Pandaboard
revisions, see
[http://lists.denx.de/pipermail/u-boot/2011-October/104842.html](http://lists.denx.de/pipermail/u-boot/2011-October/104842.html)
If this Image fails, you can try the Linaro version from above instead.

### boot.scr

This is optional, do this if you want to change Linux Bootargs or U-Boot
settings without recompiling.

Copy the following code to boot\_mmc.txt

    setenv bootargs 'root=/dev/mmcblk0p2 rw rootwait rootfstype=ext3 console=ttyO2,115200n8  vram=16M'
    fatload mmc 0 82000000 uImage
    bootm 82000000

Then run the following command from in same directory that you created
boot\_mmc.txt:

    mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "Panda SD Boot" -d boot_mmc.txt boot.scr

This will produce a boot.scr file.

Edit the boot\_mmc.txt file to suit your needs and re-run the mkimage
command to generate a new boot.scr, put it into the vfat partition along
with MLO and uboot.bin.

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


 If you have trouble with the pandaboards ROM CODE not liking your vfat
partition check it out with this program.

Thanks go to mru and av500 who have gone a long way to dispell the
cargo-cult fokelore surrounding the ROM CODE.



    #include <stdio.h>
    #include <sys/types.h>
    #include <unistd.h>
    #include <sys/types.h>
    #include <sys/stat.h>
    #include <fcntl.h>

    int main( int argc, char **argv )
    {
        if ( argc < 2 ) {
            printf("check /dev/sdX you must be root too \n");
            return 1;
        }
        int fd = open( argv[1], O_RDONLY );

        lseek( fd, 0 + 446 + 8, SEEK_SET );

        int start;
        int num_mbr;
        read( fd, &start, 4 );
        read( fd, &num_mbr, 4 );

        int num_bpb = 0;

        lseek( fd, start * 512 + 0x13, SEEK_SET );
        read( fd, &num_bpb, 2 );

        if( num_bpb == 0 ) {
            lseek( fd, start * 512 + 0x20, SEEK_SET );
            read( fd, &num_bpb, 4 );
        }

        printf( "start: %d  mbr: %d  bpb: %d -> %s\n",
            start, num_mbr, num_bpb,
            num_mbr == num_bpb ? "PASS" : "FAIL!" );

        return num_mbr == num_bpb;}




 Save the above text as sdtest.c and compile it with:

    gcc sdtest.c -o sdtest

I run it on the desktop that setup my sd card, if it reports failure
then something went wrong with the setup script.

No clue as to how to fix it (yet).

More to come....


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

