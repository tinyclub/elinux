> From: [eLinux.org](http://eLinux.org/Panda_How_to_buildroot "http://eLinux.org/Panda_How_to_buildroot")


# Panda How to buildroot



Building a minimal root file system using Buildroot

Why use buildroot? Because you can build everything you need in a very
short time and the resulting rootfs fits on a 32Mb sd card with plenty
of room to spare. Be careful of using small SD cards, there is a lot of
folklore about how the OMAP4 ROM CODE operates and it may or may not
like your vfat partition.


 This is a high level How-To, it assumes that the reader is familiar
with linux and compiling software packages, over time it may evolve to
be a bit more newbie friendly.

-Buildroot-

Go get:

[http://buildroot.uclibc.org/downloads/buildroot-2010.11.tar.bz2](http://buildroot.uclibc.org/downloads/buildroot-2010.11.tar.bz2)

Unpack it a dir of your choice.

use the .config file provided here
[config.buildroot](http://eLinux.org/images/6/66/Config.buildroot "Config.buildroot")
which will build a tar.bz2 of the rootfs.

The .config uses BR2\_JLEVEL = 8. You may want to change this to suit
you CPUs capability.



-SD card prep-

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

        return num_mbr == num_bpb;


 Save the above text as sdtest.c and compile it with:

    gcc sdtest.c -o sdtest

I run it on the desktop that setup my sd card, if it reports failure
then something went wrong with the setup script.

No clue as to how to fix it (yet).


 -Add the bootloader & kernel to the vfat partition-


 Use the MLO, u-boot.bin and uImage from:

    https://gforge.ti.com/gf/download/frsrelease/418/4171/L24.9-PandaBoard_validation_environment.tar.gz

(Untar it someplace convienient)

and copy them to the vfat partition.

There will be other tutorials on how to build MLO, u-boot, the kernel
and wifi drivers, but for now we will use stuff from there.


 -Add the rootfs stuff that buildroot built for you to the ext2/ext3
partition-


 untar /buildroot-2010.11/output/images/rootfs.tar.bz2 to the sd card's
ext2/3 partition and then edit the inittab and securetty files in /etc.


 -Fix what is likely a busybox bug-


 Change the sysinit part of /etc/inittab to look like this:

    null::sysinit:/bin/mount -t proc proc /proc
    null::sysinit:/bin/mkdir -p /dev/pts
    null::sysinit:/bin/mount -o remount,rw /
    # null::sysinit:/bin/mount -a

This maybe due to a bug in the current version of busybox, if you don't
fix it, the rootfs will be mounted ro and things won't work.


 -Fix the serial port config-


 Change the serial port part thusly:

    ttyO2::respawn:/sbin/getty -L ttyO2 115200 vt100 # GENERIC_SERIAL

This is because the serial port name for the Pandaboard is ttyO2 not one
of the other choices.

Add the following line to /etc/securetty:

    ttyO2

This is so you can login as root over the serial port, the standard
securetty doesn't include serial port names for the Pandaboard.


 -Copy stuff from the validatation image so that wifi will work-


 Copy the whole /lib/firmware dir from the validadition image to the sd
card's /lib/firmware.

Copy the whole /usr/share/tiwlan dir from the validadition image to the
sd card's /usr/share/tiwlan.

Copy /bin/wlan-test.sh from the validation image to the sd card's /bin
directory.


 The above is neccessary since the sdio and tiwlan driver needs the
exact version of the kernel they were compiled for.


 Insert the SD card, add a USB keyboard, optionally a wired ethernet
connection, mouse and Monitor.

Power up the board and watch it boot up over the serial port using your
choice of terminal emulator, I use minicom.

There will also be a login on the display, you can login over either as
root with no password, if the serial port one doesn't work, you probably
didn't fix securetty (properly).


 run wlan-test.sh and watch the wifi come to life. If you have an open
access point in range, the pandaboard will associate with the
accesspoint and use dhcp and get an address and other stuff. you should
be able to ping to the internet, and iwconfig will show you some useful
info:

    # iwconfig
    lo        no wireless extensions.

    usb0      no wireless extensions.

    tiwlan0   IEEE 802.11ABG  ESSID:"Your_Access_Points_ESSID"
              Mode:Managed  Frequency:11 kHz  Access Point: XX:XX:XX:XX:XX:XX
              Tx-Power:-51   Sensitivity=-80 dBm
              RTS thr=4096 B   Fragment thr=4096 B
              Encryption key:off
              Link Quality=0/0  Signal level=-45 dBm
              Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
              Tx excessive retries:0  Invalid misc:0   Missed beacon:0


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")

