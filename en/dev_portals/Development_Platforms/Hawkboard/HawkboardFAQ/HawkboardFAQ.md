> From: [eLinux.org](http://eLinux.org/HawkboardFAQ "http://eLinux.org/HawkboardFAQ")


# HawkboardFAQ





## Contents

-   [1 Camera Interface](#camera-interface)
-   [2 Kernel/uImage](#kernel-uimage)
-   [3 U-Boot](#u-boot)
-   [4 Ubuntu Rootfs](#ubuntu-rootfs)
-   [5 Angstrom Rootfs](#angstrom-rootfs)
-   [6 Booting Errors](#booting-errors)
-   [7 DSP](#dsp)
-   [8 Hawkboard](#hawkboard)

## Camera Interface

**Q**: How can I use/test camera interface of Hawkboard?

**A**: Due to color space issues it is a little bit tricky at the
moment. Not much software supports it out of the box. You can find test
procedure
[here](http://eLinux.org/Testing_Video_Input_of_Hawkboard "Testing Video Input of Hawkboard")

## Kernel/uImage

**Q**:What is uImage ?

**A**:Its the Linux kernel in special format ,which is compatible for
u-boot load it in RAM and execute.


 **Q**:How to see Kernel Message for debugging Purpose?

**A**:You can use earlyprintk=serial,uart0,115200 or earlyprintk=vga in
bootargs,you will also need to enable that in kernel by enabling
CONFIG\_EARLY\_PRINTK (CONFIG\_DEBUG\_LL, CONFIG\_DEBUG\_KERNEL) or

     Linux Kernel Configuration
         Kernel hacking  --->
           [*] Early printk


 **Q**:I need support for 800x600 Resolution ?

**A**:Apply following changes in drivers/video/da8xx-fb.c

       /* CRT Monitor or LCD Screen */
          [2] = {
        .name = "VGA_Monitor",
                   .width = 800,
                .height = 600,
            .hfp = 48,
            .hbp = 80,
            .hsw = 32,
            .vfp = 3,
            .vbp = 11,
            .vsw = 4,
            .pxl_clk = 37000000,
            .invert_pxl_clk = 1,
        },

A precompiled uImage with 800X600 Support can be downloaded from
[here](http://hawktool.googlecode.com/files/uImage_v3)


 **Q**:How do i compile the Kernel ?

**A**:Assuming you have setup the cross compiler as mentioned in the
[http://elinux.org/Hawkboard/Programming\_Guide\_-Linux(ARM)\#1.Codesourcery\_Toolchain](http://elinux.org/Hawkboard/Programming_Guide_-Linux(ARM)#1.Codesourcery_Toolchain)
Download Linux kernel Source from
[here](http://hawkboard.googlecode.com/files/linux-omapl1_ver1.tar.bz2)
Extract it . To compile follow steps below :

     export PATH=/home/<user>/arm-2009q3/bin:$PATH
     cd linux-omapl1
     make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- omapl138_hawkboard_defconfig uImage

This will create uImage in arch/arm/boot.

You may want to clear existing makes using

     make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- distclean

Note:To create uImage ,you need uboot-mkimage package which can be
installed using apt-get.

## U-Boot

**Q**:I am not getting U-BOOT Prompt/How do i recovery U-Boot ?

**A**:Please see recovery guide to Reflash uboot on Hawkboard
[Here](http://alokprasad.spaces.live.com/blog/cns!48CAA8345A2495B1!374.entry)


 **Q**:How to Do i autoboot Hawkboard with my RootFS on USB Drive.?

**A**:To Autoboot hawkboard kernel must reside on NAND & follow these

     setenv serverip 192.168.0.100
     setenv ipaddr 192.168.0.150
     tftpboot 0xc0700000 u-boot_nand_ais_v1.bin
     nand erase
     nand write.e 0xc0700000 0x20000 0x70000
     tftp c0700000 uImage
     nand write.e 0xc0700000 0x200000 0x200000
     setenv bootargs console=ttyS2,115200n8 console=tty1 noinitrd root=/dev/sda rootwait rw init=/sbin/init
     setenv bootcmd "setenv console=ttyS2,115200n8 console=tty1 noinitrd root=/dev/sda1 rootwait rw init=/sbin/init;nand read.e 0xc0700000 0x200000 0x200000;bootm 0xc0700000"
     saveenv


 **Q**:How Do i flash NAND with U-Boot without using TI's Host Utility
or any Linux Application exists?

**A**:You will need Mono package (DOT NET implementation for Linux) &
dvflashutils .Check below for more details
[http://processors.wiki.ti.com/index.php?title=Serial\_Boot\_and\_Flash\_Loading\_Utility](http://processors.wiki.ti.com/index.php?title=Serial_Boot_and_Flash_Loading_Utility)


 **Q**:Is there alternative to Load uImage beside TFTP or Flashing to
NAND

**A**:Yes there two more methods you could do

1.  Transfer uImage through NFS using:

<!-- -->

     hawkboard.org > nfs 0xc0700000 192.168.0.100:/nfsroot/uImage
     hawkboard.org > setenv bootargs ....
     hawkboard.org > bootm c0700000

1.  Transferring uImage through Serial Interface using Ymodem protocol

Check this thread
[http://groups.google.com/group/hawkboard/browse\_thread/thread/ecc57e1b964bc2c4/b0e1ad260a226bd1?lnk=gst&q=ymodem](http://groups.google.com/group/hawkboard/browse_thread/thread/ecc57e1b964bc2c4/b0e1ad260a226bd1?lnk=gst&q=ymodem)


 **Q**:I do not want to Load uImage each time through TFTP ,how can i do
so?

**A**:You can write the uImage to NAND Flash

1.load uImage to RAM through TFTP or NFS as below

    nfs 0xc0700000 192.168.0.100:/nfsroot/uImage
    or
    tftp c0700000 uImage

2.Write to flash nand write.e 0xc0700000 0x200000 0x200000

3.on booting you have to load it ram again followed by bootm

     read.e 0xc0700000 0x200000 0x200000
     bootm 0xc0700000


 **Q**:NAND Reads are too slow ?

**A**:Use mw 0x68000014 0x364200 before using any NAND Read command.


 **Q**:When i compile U-boot from sources from code.google.com it gives
following error .How to rectify?

    board.c:126: error: inline function 'coloured_LED_init' cannot be declared weak
    board.c:128: error: inline function 'red_LED_on' cannot be declared weak
    board.c:130: error: inline function 'red_LED_off' cannot be declared weak
    board.c:132: error: inline function 'green_LED_on' cannot be declared weak
    board.c:134: error: inline function 'green_LED_off' cannot be declared weak
    board.c:136: error: inline function 'yellow_LED_on' cannot be declared weak
    board.c:138: error: inline function 'yellow_LED_off' cannot be declared weak
    make[1]: *** [board.o] Error 1

**A**:Remove keyword 'inline' from the above lines of
"u-boot-omapl1/lib\_arm/board.c" and recompile.

## Ubuntu Rootfs

**Q**:How to Do i installed new packages in ubuntu jaunty rootfs?

**A**:If you have made the rootfs using rootstock with "apt" as one of
Seed paramter than you can use "apt-get install \<package\_name\> to
install required package.


 **Q**:How to know which packages should be added to 'SEED' parameter in
rootstock for creating ubuntu rootfs.?

**A**:There are 4 repos universe contains most common packages. Download
packages.bz2 it will a text file displaying packages available use that
as seed parameter.

1.  [http://ports.ubuntu.com/dists/jaunty/universe/binary-armel/Packages.bz2](http://ports.ubuntu.com/dists/jaunty/universe/binary-armel/Packages.bz2)
2.  [http://ports.ubuntu.com/dists/jaunty/main/binary-armel/Packages.bz2](http://ports.ubuntu.com/dists/jaunty/main/binary-armel/Packages.bz2)
3.  [http://ports.ubuntu.com/dists/jaunty/multiverse/binary-armel/Packages.bz2](http://ports.ubuntu.com/dists/jaunty/multiverse/binary-armel/Packages.bz2)
4.  [http://ports.ubuntu.com/dists/jaunty/restricted/binary-armel/Packages.bz2](http://ports.ubuntu.com/dists/jaunty/restricted/binary-armel/Packages.bz2)

## Angstrom Rootfs

**Q**:Whats the Default username/password for Rootfs created by angstrom
narcissus.?

**A**:User name is root and no password


 **Q**:How to login in X11 in angstrom rootfs?

**A**:Login in console using root and no password.Change password using
passwd .Now you can login to X11 using root and newpassword


 **Q**:What the packages available in angstrom ?

**A**:Follow are the packages available
[http://www.angstrom-distribution.org/feeds/2008/ipk/glibc/armv5te/](http://www.angstrom-distribution.org/feeds/2008/ipk/glibc/armv5te/)


 **Q**: how to configure OPKG for a particular repo ?

**A**:Under /etc/opkg you will find \*.conf files. Addresses are written
under those files.

## Booting Errors

**Q**:I am getting "Kernel panic - not syncing: VFS: Unable to mount
root fs ..." error how to resolve this?

**A**:Kernel panic occurs when kernel is not able to find rootfs(init
program ),either the bootargs is not correct or source of rootfs is not
available.

## DSP

**Q**:How do i start with DSP Programming on Hawkboard?

**A**:Read Thread

1.  [http://groups.google.com/group/hawkboard/browse\_thread/thread/3534c1590940688c/f7118c18635d8275](http://groups.google.com/group/hawkboard/browse_thread/thread/3534c1590940688c/f7118c18635d8275)
2.  [http://groups.google.com/group/hawkboard/browse\_thread/thread/661c1ce0f342b1f8/d4d617831983b78d](http://groups.google.com/group/hawkboard/browse_thread/thread/661c1ce0f342b1f8/d4d617831983b78d)

**A**: Use C6Run Project

-   The C6Run project has support for the Hawkboard platform and is
    probably the simplest way to get started with the DSP on TI's
    DSP+ARM platforms. See the [C6Run main page on the TI Embedded
    Processor wiki](http://processors.wiki.ti.com/index.php/C6Run) for
    more details.

## Hawkboard

**Q**:Does Hawkboard support SDHC Card?

**A**:Yes ,it supports SD & SDHC Card.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hawkboard](http://eLinux.org/Category:Hawkboard "Category:Hawkboard")
-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [DSP](http://eLinux.org/index.php?title=Category:DSP&action=edit&redlink=1 "Category:DSP (page does not exist)")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")

