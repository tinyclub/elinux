> From: [eLinux.org](http://eLinux.org/Android_x86 "http://eLinux.org/Android_x86")


# Android x86



Android x86 is a software port to normal **pc** s. [Android x86
Homepage](http://www.android-x86.org/)

The current stable release is
[http://www.android-x86.org/releases/releasenote-3-2-rc2](http://www.android-x86.org/releases/releasenote-3-2-rc2)
Android-x86 3.2-r2], based upon Honeycomb.



## Contents

-   [1 ICS 4.0.3](#ics-4-0-3)
    -   [1.1 Build on ubuntu 11.10](#build-on-ubuntu-11-10)
    -   [1.2 Hardware](#hardware)
-   [2 DONUT 1.6 r2](#donut-1-6-r2)
-   [3 short steps to get a running
    system](#short-steps-to-get-a-running-system)
    -   [3.1 Running the system from boot medium CD or
        USB-Stick](#running-the-system-from-boot-medium-cd-or-usb-stick)
    -   [3.2 run the system from
        harddisk](#run-the-system-from-harddisk)
-   [4 details for a running system](#details-for-a-running-system)
    -   [4.1 SD-card](#sd-card)
    -   [4.2 navigation](#navigation)
    -   [4.3 sound](#sound)
    -   [4.4 video](#video)
    -   [4.5 application errors](#application-errors)
-   [5 Development](#development)
    -   [5.1 improvements/request for
        changes](#improvements-request-for-changes)
    -   [5.2 errors](#errors)
    -   [5.3 shell](#shell)
    -   [5.4 navigation/keyboard](#navigation-keyboard)
    -   [5.5 File Infos](#file-infos)
    -   [5.6 hand made changes on an usb-Stick Android 1.6
        r2](#hand-made-changes-on-an-usb-stick-android-1-6-r2)
    -   [5.7 sound](#sound-2)
    -   [5.8 yaffs2 - filesystem](#yaffs2-filesystem)
    -   [5.9 Links](#links)

## ICS 4.0.3

### Build on ubuntu 11.10

see [Building Android 4.0 on Ubuntu
11.10](http://www.android-dev.ro/2011/12/13/building-android-4-0-on-ubuntu-11-10/)

install old version of gcc 4.4 with : sudo apt-get install gcc-4.4
g++-4.4 g++-4.4-multilib gcc-4.4-multilib

run make with : make CC=gcc-4.4 CXX=g++-4.4 -j4 iso\_img
TARGET\_PRODUCT=generic\_x86



### Hardware

Fritz!Wlan

AVM GmbH AVM Fritz!WLAN N [Atheros AR9001U]



## DONUT 1.6 r2

## short steps to get a running system

### Running the system from boot medium CD or USB-Stick

-   download CD-Image
    [android-x86-1.6-r2.iso](http://www.android-x86.org/download) or
    USB-Image
    [android-x86-1.6-r2\_usb.img.gz](http://www.android-x86.org/download)
-   burn cd image or for the usb-image use the following commands on a
    linux box "gunzip
    [http://www.android-x86.org/download](http://www.android-x86.org/download)"
    and "dd if=android-x86-1.6-r2\_usb.img of=/dev/sda" (of=/dev/sda is
    depending on where your linux mounted your usb-stick)
-   boot from created medium and choose the first menu entry "Live USB -
    Run Android-x86 without Installation"
-   in android goto settings/sound & display/screen timeout and set to
    "never timeout"

### run the system from harddisk

s. as well the [installation section on
android-x86.org](http://www.android-x86.org/)

-   boot from CD or USB-Stick android x86 boot menu choose the fourth
    option "Installation - Install Android-x86 1.6-r2 to harddisk"
-   select "Create/Modify partitions" and create a bootable partition
    with cfdisk
-   select created partition e.g. sda1 and format with e.g. ext3
-   install GRUB by selecting 'yes'
-   reboot system and boot from harddisk and select the default menu
    entry "Android-x86 1.6-r2"
-   in android goto settings/sound & display/screen timeout and set to
    "never timeout"



## details for a running system

### SD-card

for mounting an sd card see
[[1]](http://www.android-x86.org/documents/sdcardhowto)

### navigation

-   HOME \<- windows key left
-   BACK \<- esc
-   MENU \<- menu-key

touchscreen or mouse

touch the right end of statusbar to activate or deactivate the following
functions

-   HOME \<- touch status bar
-   MENU \<- touch statusbar from left to right.
-   BACK \<- touch t statusbar from right to left.



### sound

**Keys on ASUS EeePC**

    Fn-F7, F8, F9,
    some models are
    Fn-F10, F11, F12

**Notebooks**

    Some notebooks also have volume adjustment hotkeys

**raise sound volume in shell**

    * change screen to console 1, press Alt+F1
    * enter
      "alsa_amixer cset numid=1 31" for 'Front Playback Volume' and/or
      "alsa_amixer cset numid=20 31" for 'Master Playback Volume'  and/or
      "alsa_amixer cset numid=3 31" for 'Speaker Playback Volume'
    * go back to graphic screen,  press Alt+F7

**x86 PCs with normal keyboard**

rear panel audio jack and front panel audio jack depend on the setting
of 'Front Playback Volume' alsa\_amixer sound setting

### video

### application errors

-   menu /settings/about phone/System tutorial -\> Sorry! The
    application settings (process com.android.settings) has stopped
    unexpectedly. Please try again.

## Development

### improvements/request for changes

-   set "settings/sound & display/screen timeout" to "never timeout" as
    for an x86 system there is no need to timeout an new users don't
    know what happens.

### errors

### shell

### navigation/keyboard

keyboard layouts see /system/usr/keylayout/

command to get events: getevent

[Keymaps and Keyboard Input, a detailed
description](http://www.kandroid.org/android_pdk/keymaps_keyboard_input.html)

### File Infos

1.  system.sfs - squash filesystem
2.  system.img - ext2 file Image
3.  ramdisk.img - gzip cpio file - extract in an empty folder with "gzip
    -d \< ramdisk.img |cpio -id"
4.  initrd.img - gzip cpio file - extract in an empty folder with "gzip
    -d \< initrd.img |cpio -id"

### hand made changes on an usb-Stick Android 1.6 r2

**File content of an usb-stick**

    ├── android-system
    │   ├── initrd.img
    │   ├── install.img
    │   ├── kernel
    │   ├── ramdisk.img
    │   └── system.sfs
    ├── android-x86.xpm.gz
    ├── cmdline
    ├── grub4dos
    ├── kernel -> grub4dos
    ├── lost+found
    ├── menu.lst
    └── ramdisk
    .
    2 directories, 11 files

steps to change files in system.sfs (system.img)

    * Ubuntu 10.4 box
    * change to shell, press strg+alt+F1
    * sudo -i
    * aptitude and install squashfs-tools
    * modprobe squashfs
    * cd /home/administrator
    * copy system.sfs (squash file system) to harddisk, in /home/administrator
    * mkdir systemsfs
    * mount ./system.sfs ./systemsfs -t squashfs -o loop
    * copy ./systemsfs/system.img /home/administrator/
    * mkdir systemimg
    * mount ./system.img ./systemimg -t ext2 -o loop

now cd to systemimg directory and make the changes

eg. change \*.kl files for sound F7 (scanncode=65) = mute; F8
(scanncode=66) = volume\_down; F9 (scanncode=67) = volume\_up

    * cd usr/keylayout
    * vi *.kl
    * change lines
      key 113   VOLUME_MUTE
      key 114   VOLUME_DOWN
      key 115   VOLUME_UP

      key 65   VOLUME_MUTE
      key 66   VOLUME_DOWN
      key 67   VOLUME_UP

### sound

s.

1.  [http://wiki.archlinux.org/index.php/Advanced\_Linux\_Sound\_Architecture](http://wiki.archlinux.org/index.php/Advanced_Linux_Sound_Architecture)
2.  [http://www.alsa-project.org/main/index.php/Main\_Page](http://www.alsa-project.org/main/index.php/Main_Page)

### yaffs2 - filesystem

    * download unyaffs2 http://code.google.com/p/yaffs2utils/downloads/list s. description http://code.google.com/p/yaffs2utils/ ; extract to yaffs2util
    * download snapshot as described in http://yaffs.net/node/346, extract the source file to directory yaffs2
    * change ~/yaffs2util/Makefile with vi and set "KERNELDIR   = /usr/src/linux-headers-2.6.32-21" ; depending on the location of your header files
    * execute make
    * goto subfolder ~/yaffs2util/src and copy mkyaffs2 and unyaffs2 to /home/administrator/bin
    * execute: PATH=$PATH:/home/administrator/bin
    *

### Links

[http://androidoniphone.blogspot.com/2010/04/install-android-on-iphone-guide.html](http://androidoniphone.blogspot.com/2010/04/install-android-on-iphone-guide.html)
[http://android-dls.com/wiki/index.php?title=Main\_Page](http://android-dls.com/wiki/index.php?title=Main_Page)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

