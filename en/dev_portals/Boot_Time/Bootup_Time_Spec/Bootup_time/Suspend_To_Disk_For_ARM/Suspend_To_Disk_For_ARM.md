> From: [eLinux.org](http://eLinux.org/Suspend_To_Disk_For_ARM "http://eLinux.org/Suspend_To_Disk_For_ARM")


# Suspend To Disk For ARM



Table Of Contents:



## Contents

-   [1 Description](#description)
-   [2 Target Environment](#target-environment)
    -   [2.1 Hardware Information](#hardware-information)
    -   [2.2 Software Information](#software-information)
-   [3 swsusp for ARM](#swsusp-for-arm)
    -   [3.1 build kernel](#build-kernel)
    -   [3.2 do swsusp](#do-swsusp)
    -   [3.3 Known Problems / FAQs](#known-problems-faqs)
-   [4 suspend2 for ARM](#suspend2-for-arm)
    -   [4.1 build kernel](#build-kernel-2)
    -   [4.2 do suspend2](#do-suspend2)
-   [5 snapshot boot for ARM](#snapshot-boot-for-arm)
    -   [5.1 what is it](#what-is-it)
    -   [5.2 build boot loader](#build-boot-loader)
    -   [5.3 install boot loader](#install-boot-loader)
    -   [5.4 build kernel](#build-kernel-3)
    -   [5.5 do snapshot boot](#do-snapshot-boot)
    -   [5.6 Startup comparison](#startup-comparison)

## Description

This page shows the result of applying suspend to disk feature for ARM
architecture. Related pages are:

-   [Sw Suspend](http://eLinux.org/Sw_Suspend "Sw Suspend") - Information about [Sw
    Suspend](http://eLinux.org/Sw_Suspend "Sw Suspend")
-   [Sw Suspend Porting
    Notes](http://eLinux.org/Sw_Suspend_Porting_Notes "Sw Suspend Porting Notes") - [Sw
    Suspend](http://eLinux.org/Sw_Suspend "Sw Suspend") quick-hack porting guide



## Target Environment

### Hardware Information

[OSK](http://eLinux.org/OSK "OSK") reference board is used.

Since OSK5912 board does not have disk to save suspend image to, flash
is used to store suspend image.

### Software Information

linux kernel 2.6.11 based kernel is used for swsusp, and 2.6.14 based
kernel is used for suspend2. Necessary patches are described in next
section.



## swsusp for ARM

### build kernel

Below is the kernel patch stack applied on top of vanilla 2.6.11 kernel.

-   patch-2.6.11-omap1 from [muru.com](http://www.muru.com/linux/omap/)
-   [swsusp-arm-2.6.11.patch](http://eLinux.org/images/d/da/Swsusp-arm-2.6.11.patch "Swsusp-arm-2.6.11.patch")
-   [swsusp-osk-2.6.11.patch](http://eLinux.org/images/c/cd/Swsusp-osk-2.6.11.patch "Swsusp-osk-2.6.11.patch")

To build kernel, do the following:

(assuming you have cross comiler for ARM)

-   enable CONFIG\_PM
-   enable CONFIG\_SOFTWARE\_SUSPEND
-   enable CONFIG\_SWSUSP\_MTDBLOCK\_FLUSH

This can be done for example by:

     $ make omap_osk_5912_defconfig
     $ make menuconfig

       General setup --->
          [*] Power Management Support
          [*] Software Suspend (EXPERIMENTAL)
          [*] Flush MTD Block

    also, NFS is used as rootfs

       File systems --->
          Network File Systems --->
             [*] Root file systems on NFS

     $ make uImage

also, check that CONFIG\_SYSFS is enabled. (which is default)

### do swsusp

Boot OSK board with above kernel. Issue following command as super user
to suspend to disk:

      (mount sysfs)
      $ mkdir /sys
      $ mount -t sysfs none /sys

      (enable flash as swap)
      $ mkswap /dev/mtdblock3
      $ swapon /dev/mtdblock3

      (run some applications)

      (trigger suspend to disk)
      $ echo disk > /sys/power/state

After the suspend to disk is triggered, messages are emitted to console,
and machine would halt.

On next bootup of the board, pass below additional argument to kernel:

-   -   resume=/dev/mtdblock3

Below is an example:

    OMAP5912 OSK # setenv bootargs console=ttyS0,115200n8 ip=dhcp root=/dev/nfs resume=/dev/mtdblock3
    OMAP5912 OSK # saveenv


 and then boot as usual.

At near end of booting kernel, system reads suspended image, and
resumes.



### Known Problems / FAQs

    - I would like to suspend image to different storage
      I have only tested with mtdblock3, and in swsusp-osk-2.6.11.patch, it is hard coded (sorry...)
      For other device (such as USB storage), I have not tested.

    - When the suspended image gets big, system does not resume
      This turned out to be misconfiguration of EMIFS_CS3 register at boot loader, if you are using
      u-boot. There are 2 solutions to this:

-   -   -   fix EMIFS\_CS3 value in u-boot and rebuild it
        -   set the correct value in kernel and rebuild it

<!-- -->

      u-boot fix for file u-boot-1.1.[123]/board/omap5912osk/platform.S or u-boot-1.1.4/omap5912osk/lowlevel_init.S:

     VAL_TC_EMIFS_CS3_CONFIG:
    -       .word 0x88011131
    +       .word 0x88013141



      kernel re-set the value for file arch/arm/mach-omap/board-osk.c

    + #define EMIFS_CS3_VAL   (0x88013141)
    static void __init osk_init(void)
    {
    +        /* Workaround for wrong CS3 (NOR flash) timing
    +         * There are some U-Boot versions out there which configure
    +         * wrong CS3 memory timings. This mainly leads to CRC
    +         * or similiar errors if you use NOR flash (e.g. with JFFS2)
    +         */
    +        if (EMIFS_CCS(3) != EMIFS_CS3_VAL)
    +                EMIFS_CCS(3) = EMIFS_CS3_VAL;

## suspend2 for ARM

### build kernel

Below is the kernel patch stack applied on top of vanilla 2.6.14 kernel.

-   patch-2.6.14-omap1 from [muru.com](http://www.muru.com/linux/omap/)
-   100-suspend2-2.2-rc14-for-2.6.14.patch from
    [suspend2.net](http://www.suspend2.net)
-   [suspend2-2.2-rc14-arm-fixups.patch](http://eLinux.org/images/3/35/Suspend2-2.2-rc14-arm-fixups.patch "Suspend2-2.2-rc14-arm-fixups.patch")
-   [suspend2-osk.patch](http://eLinux.org/images/0/00/Suspend2-osk.patch "Suspend2-osk.patch")

To build kernel, do the following: (assuming you have cross comiler for
ARM)

-   enable CONFIG\_PM
-   enable CONFIG\_SUSPEND2
-   enable CONFIG\_SUSPEND2\_CRYPTO
-   enable CONFIG\_CRYPTO
-   enable CONFIG\_CRYPTO\_LZF

This can be done for example by:

     $ make omap_osk_5912_defconfig
     $ make menuconfig

       Power management options --->
          [*] Suspend2 --->
             [*] File Writer
             [*] Swap Writer


       Cryptographic options --->
          [*] Cryptographic API
          <*> LZF compression algorithm

    also, change the OSK system timer to MPU Timer

       System Type --->
          TI OMAP Implementations --->
             System timer ---> use mpu timer

     $ make uImage

### do suspend2

Boot OSK board with above kernel. On bootup of the board, pass below
additional argument to kernel:

-   -   resume2=swap:/dev/mtdblock3

Below is an example:

    OMAP5912 OSK # setenv bootargs console=ttyS0,115200n8 ip=dhcp root=/dev/nfs resume2=swap:/dev/mtdblock3
    OMAP5912 OSK # saveenv



Install hibernate script into target system, which could be obtained
from suspend2 web page.

Issue following command as super user to suspend to disk:

      (enable flash as swap)
      $ mkswap /dev/mtdblock3
      $ swapon /dev/mtdblock3

      (trigger suspend2 to disk)
      $ hibernate

After the suspend to disk is triggered, messages are emitted to console,
and machine would halt.

Power the board again, make sure the kernel parameter contains
resume2=swap:/dev/mtdblock3.

At near the end of kernel boot, suspend2 resume operation begins, and
resumes from previously suspended state.



## snapshot boot for ARM

/\\ \* \* \* WARNING \* \* \* /\\ This feature is very experimental,
Your boot loader might get corrupted. /\\ To restore boot loader, refer
[osk page](http://eLinux.org/OSK "OSK")], "Flash Recovery Utility" section.

### what is it

Snapshot boot is similar to swsusp, but with much faster start up, by
kernel and boot loader working together. In swsusp, time taken to resume
is not very fast, since (a) it starts at \`late\_initcall', (b) snapshot
image is copied twice (swap -\> allocated mem -\> orig mem), and (c)
device state transfer from active -\> suspend -\> resume. In snapshot
boot, image is copied directly to orig mem addr, and jumps into kernel
resume point, not kernel entry point, and kernel handles device resume,
and thaw processes.

### build boot loader

Below is the patch stack applied on top of u-boot-1.1.4 from
[u-boot](http://sourceforge.net/projects/u-boot) web page. First three
patches are to build osk5912 target, rest are for snapshot boot.

-   [omap5912osk-fix-undef.patch](http://eLinux.org/images/f/f0/Omap5912osk-fix-undef.patch "Omap5912osk-fix-undef.patch")
-   [omap5912osk-fix-cfi-flash.patch](http://eLinux.org/images/1/1f/Omap5912osk-fix-cfi-flash.patch "Omap5912osk-fix-cfi-flash.patch")
-   [omap5912osk-fix-setup-val.patch](http://eLinux.org/images/4/40/Omap5912osk-fix-setup-val.patch "Omap5912osk-fix-setup-val.patch")
-   [snapshot-boot-core.patch](http://eLinux.org/images/d/d5/Snapshot-boot-core.patch "Snapshot-boot-core.patch")
-   [snapshot-boot-arm.patch](http://eLinux.org/images/6/69/Snapshot-boot-arm.patch "Snapshot-boot-arm.patch")
-   [snapshot-boot-osk.patch](http://eLinux.org/images/6/67/Snapshot-boot-osk.patch "Snapshot-boot-osk.patch")

To build u-boot, do the following:

     $ make CROSS_COMPILE=arm-linux- omap5912osk_config
     $ make CROSS_COMPILE=arm-linux- all

### install boot loader

If autoboot is set, hit any key to enter u-boot command prompt.

Below is example installation

    OMAP5912 OSK # tftp 0x10000000 u-boot.bin

    Take note of bytes that were transfered; take note of below message
    Bytes transferred = 96952 (17ab8 hex)

    OMAP5912 OSK # protect off 00000000 0001ffff
    OMAP5912 OSK # erase 00000000 0001ffff
    OMAP5912 OSK # cp.b 0x10000000 0x00000000 0x00017ab8
    OMAP5912 OSK # protect on 00000000 0001ffff
    OMAP5912 OSK # reset


 Again, if you are messed up, take a look at [osk page](http://eLinux.org/OSK "OSK")],
"Flash Recovery Utility" section.



### build kernel

Below is the kernel patch stack applied on top of vanilla 2.6.11 kernel.
First three patches are the same patches that were used in swsusp.

-   patch-2.6.11-omap1 from [muru.com](http://www.muru.com/linux/omap/)
-   [swsusp-arm-2.6.11.patch](http://eLinux.org/images/d/da/Swsusp-arm-2.6.11.patch "Swsusp-arm-2.6.11.patch")
-   [swsusp-osk-2.6.11.patch](http://eLinux.org/images/c/cd/Swsusp-osk-2.6.11.patch "Swsusp-osk-2.6.11.patch")
-   [swsusp-preserve-image.patch](http://eLinux.org/images/5/59/Swsusp-preserve-image.patch "Swsusp-preserve-image.patch")
-   [snapshot-core-2.6.11.patch](http://eLinux.org/images/5/57/Snapshot-core-2.6.11.patch "Snapshot-core-2.6.11.patch")
-   [snapshot-arm-2.6.11.patch](http://eLinux.org/images/f/f4/Snapshot-arm-2.6.11.patch "Snapshot-arm-2.6.11.patch")

To build kernel, do the following:

(assuming you have cross comiler for ARM)

     $ make omap_osk_5912_defconfig
     $ make menuconfig

       General setup --->

          PCCARD (PCMCIA/CardBus) support --->
             <*> PCCard (PCMCIA/CardBus) support
             <*> 16-bit PCMCIA support (NEW)
             <*> OMAP CompactFlash Controller

          [*] Power Management Support
          [*]   Software Suspend (EXPERIMENTAL)
          [*]     Flush MTD Block
          [*]     Preserve swsuspend image

    also, NFS is used as rootfs

       File systems --->
          Network File Systems --->
             [*] Root file systems on NFS

     $ make uImage

### do snapshot boot

On bootup of the board, pass below additional argument to kernel:

-   -   resume=/dev/mtdblock3
    -   prsv-img

Below is an example:

    OMAP5912 OSK # setenv bootargs console=ttyS0,115200n8 ip=dhcp root=/dev/nfs resume=/dev/mtdblock3 prsv-img
    OMAP5912 OSK # saveenv


 Boot OSK board with above kernel.

Issue following command as super user to suspend to disk: (These steps
are identical to swsusp)

      (mount sysfs)
      $ mkdir /sys
      $ mount -t sysfs none /sys

      (enable flash as swap)
      $ mkswap /dev/mtdblock3
      $ swapon /dev/mtdblock3

      (run some applications)

      (trigger suspend to disk)
      $ echo disk > /sys/power/state

After the suspend to disk is triggered, messages are emitted to console,
and machine would halt. Power off the board.

Power on the board, and hit any key to enter u-boot command prompt. From
u-boot, issue snapshot boot command.

    OMAP5912 OSK # bootss 0x00240000


 The snapshot boot will start, and system resumes from previously
suspended system state. Note that same image could be reused, (by
specifying prsv-img in kernel command line) and contribute to fast
startup of whole system.

### Startup comparison

Below is a comparison of swusps vs. snapshot boot startup time. Time is
measured using printk times, so there is some overhead due to
measurement. Rootfs is nfs, and application is mplayer, running mpeg
file. Application and userland is not optimized, prelink, XIP or other
startup improvement techniques are not applied, so refer the data with
relative time, not absolute time. Normal startup time without swsusp nor
snapshot boot is about 11 seconds.

Media:mplayer-swsusp.log Media:mplayer-ssboot.log

NOTE: The latter two log files were not found on the old CELF Pulic
Wiki, therefore links are broken here.


 [http://elinux.org/Tiny6410](http://elinux.org/Tiny6410)

[http://elinux.org/Micro2440](http://elinux.org/Micro2440)

[http://elinux.org/Mini210](http://elinux.org/Mini210)

[http://elinux.org/Tiny210](http://elinux.org/Tiny210)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

