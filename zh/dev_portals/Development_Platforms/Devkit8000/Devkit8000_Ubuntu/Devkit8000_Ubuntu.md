> From: [eLinux.org](http://eLinux.org/Devkit8000_Ubuntu "http://eLinux.org/Devkit8000_Ubuntu")


# Devkit8000 Ubuntu





## Contents

-   [1 SD-CARD](#sd-card)
-   [2 Kernel and RootFS](#kernel-and-rootfs)
-   [3 System configuartion](#system-configuartion)
-   [4 System Deveplopment
    Environment](#system-deveplopment-environment)
-   [5 u-boot env](#u-boot-env)
-   [6 Booting](#booting)
-   [7 Ubuntu](#ubuntu)
-   [8 Touchscreen support](#touchscreen-support)
-   [9 Troubleshoot Touchscreen](#troubleshoot-touchscreen)

# SD-CARD

First create an SD card with partition. Please get some instruction from
below site:
[http://www.elinux.org/BeagleBoardBeginners\#SD\_card\_setup](http://www.elinux.org/BeagleBoardBeginners#SD_card_setup)

NOTE: After formatting SD card, you must pull out SD card and insert it
into the computer, then unpack and install rootfs, otherwise it may
appear the phenomenon which can not mount EXT3 partition. It's better
that the capacity of SD Card bigger than 2G.

Short Version:

    255 Heads 63 Sectors nn cylinders
    cylinders = Byte/255/63/512
    Round down the cylinders
    Create 1 FAT32 Partition (LABEL1)
    Create 1 Linux Partition (LABEL2)
    Create FAT File System
    mkfs.msdos -F 32 /dev/sdx1 -n LABEL1
    /dev/sdx1 has to be your SD Card
    Create EXt3 File System
    mkfs.ext3 -L LABEL2 /dev/sdix2
    /dev/sdx2 has to be your SD Card

# Kernel and RootFS

After you created the SD-Card go to the directory of the devkit8000
Distribution on the CD\\devkit8000\\linux\\image.

    Copy MLO,uboot.bin and uImage from CD to /media/LABEL1  (FAT32 Partition)

Get a Ubuntu rootfs from here:

    http://www.elinux.org/BeagleBoardUbuntu#Demo_Image

Unpack and install rootfs

    7za x ubuntu-9.10-minimal-armel.tar.7z
    tar xvf ubuntu-9.10-minimal-armel-1.1.tar
    cd ubuntu-9.10-minimal-armel-1.1
    tar xvf armel-rootfs-200912081224.tgz -C /media/LABEL2/ (EXT3 Partition)

# System configuartion

Edit /etc/network/interfaces add:

    auto eth0
    iface eth0 inet dhcp

or edit /media/2/etc/network/interfaces add:

    auto eth0
    iface eth0 inet static
    address 192.192.12.17
    netmask 255.255.255.0
    gateway 192.192.12.101

To get a IP on startup.

Edit /etc/rc.local add:

    ntpdate-debian

This sets the clock while booting.

Edit /media/2/etc/resolv.conf add:

    nameserver 202.96.134.133

This sets the DNS,determined based on your area

# System Deveplopment Environment

Put the SD Card、7inch LCD、Serial Line 、5V power supply and net Cable
in the DEVKIT8000.

# u-boot env

Power on DEVKIT8000 and boot,press Spacebar while bootdelay.

On the DEVKIT8000 u-boot commandline edit the Bootcmd and Bootargs Env
Var.

    setenv bootcmd 'mmcinit;fatload mmc 0 80300000 uImage;bootm 80300000'
    setenv bootargs 'console=ttyS2,115200n8 root=/dev/mmcblk0p2 rw rootwait video=omapfb:mode:7inch_LCD'
    saveenv
    boot

# Booting

You should see the one Pinguin, after that the Screen goes blank. Wait.
After a while you get the Login Screen.

# Ubuntu

If you are using the above mentioned rootfs, login as ubuntu, Password
temppwd

Start root user

    sudo passwd root

Update the System

    sudo apt-get update

Upgrade the System

    sudo apt-get upgrade

Install vim

    sudo apt-get install vim

Install gdm

    sudo apt-get install gdm

Install xfce desktop(it need about 1.4G space)

    sudo apt-get install xfce4

After execute above steps,restart the system

# Touchscreen support

Remove the Synaptics Driver

    sudo apt-get remove xserver-xorg-input-synaptics

Install the tslib driver and the tslib tools

    sudo apt-get install xserver-xorg-input-tslib libts-bin

Now we have to calibrate the Touchscreen Type in Terminal

    TSLIB_TSDEVICE=/dev/input/event2
    TSLIB_CONFFILE=/etc/ts.conf
    export TSLIB_TSDEVICE TSLIB_CONFFILE
    ts_calibrate

This will start the calibration Process for the Touchscreen. After that
we have to restart the X-Server. In the Terminal type:

    sudo /usr/sbin/gdm  stop

Now you have to Login again. After you are logged in type:

    sudo /usr/sbin/gdm  start

This will start the X-Server. Now the Touchscreen should work

# Troubleshoot Touchscreen

Check if the Touchscreen respons: cat /dev/input/event2 If you touch the
Screen the should be some garbage Output


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [Devkit8000](http://eLinux.org/Category:Devkit8000 "Category:Devkit8000")

