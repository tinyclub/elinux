> From: [eLinux.org](http://eLinux.org/Didj_Emerald_Boot "http://eLinux.org/Didj_Emerald_Boot")


# Didj Emerald Boot



## Contents

-   [1 Description](#description)
-   [2 Prerequisites](#prerequisites)
-   [3 Software Needed](#software-needed)
-   [4 Compile Emerald Boot](#compile-emerald-boot)
-   [5 Manual Installation](#manual-installation)
-   [6 OpenLFConnect Installation](#openlfconnect-installation)

## Description

This page describes how to apply a source code patch and installation of
Emerald Boot, the Leapster Explorer boot program, to run from NAND on
the [Didj](http://eLinux.org/Didj "Didj") device. This will allow you to [USB
Boot](http://eLinux.org/Leapster_Explorer:_USB_Boot "Leapster Explorer: USB Boot") a
[Surgeon](http://eLinux.org/LeapFrog_Pollux_Platform:_Surgeon#Didj_Patches "LeapFrog Pollux Platform: Surgeon")
firmware, for updating to the newer [Kernel and
RootFS](http://eLinux.org/Didj_2.6.31_Generic_Buildroot "Didj 2.6.31 Generic Buildroot")
firmware.

**!!Warning!!**

There is a possibility of bricking your Didj doing this, as it will be
flashing a new bootloader, if anything goes wrong, this will leave you
unable to boot the device. It is possible to save it with an [SD capable
Cartridge](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "LeapFrog Pollux Platform: Cartridge")
using [uboot](http://eLinux.org/Didj_U-Boot "Didj U-Boot"). You've been warned.

It will also require a new Kernel and RootFS specific to this build.

## Prerequisites

-   [Didj\_USB\_Mounting](http://eLinux.org/Didj_USB_Mounting "Didj USB Mounting")
-   [Set up build
    environment](http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment "LeapFrog Pollux Platform: Build Environment")



## Software Needed

-   [LeapPad Explorer Sources
    LF-Linux-2826-20111215-1417.tar.gz](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#LeapPad_Explorer "LeapFrog Pollux Platform: Source Code")
-   [Emerald Boot v2.2.2
    Patch](http://eLinux.org/Leapster_Explorer:_Emerald_Boot#Version_2.2.2 "Leapster Explorer: Emerald Boot")
-   [Surgeon for
    Didj](http://eLinux.org/LeapFrog_Pollux_Platform:_Surgeon#Didj_Patches "LeapFrog Pollux Platform: Surgeon")

## Compile Emerald Boot

Extract the contents of the Patch and Source Code archives. Move inside
the source folder, you should see emerald-boot, linux-2.6, etc. Copy
packages/ from the patch archive to the source folder, along with
host\_tools/. If you get complaints during the build about not finding
images, it is more than likely because of these two folders. Test the
patch.

    $ patch --dry-run -p1 < path/to/emerald-boot-supplement_v2.2.2.patch

If everything goes okay, apply it

    $ patch -p1 < path/to/emerald-boot-supplement_v2.2.2.patch

You can now build it. Make sure your environment variables are set up,
per the build environment tutorial, and compile

    $ DIDJ=1 ./install.sh

This will build Emerald Boot for the Didj, if you would like to test it
using UART and micromon add MICRO=1 to the command line.

You will find it created a file, either in emerald-boot/ or
\<sources\>/target/tftp called emerald-boot\_DIDJ.bin. This is the file
we will be placing on the Didj.

## Manual Installation

You will be mounting your Didj as a USB drive, and replacing the
/Base/bin/AppManager binary with a shell script, and adding
emerald-boot\_DIDJ.bin in the same folder.

First you'll need to create the shell script, AppManager. Make sure you
don't give it the extension .sh. There are two things to configure in
this script. Both are on the line starting with mtd\_debug. First is
0x48001, this is the filesize in hex format. Make sure you change this
if it differs for your emerald-boot\_DIDJ.bin file. Also, insure the
path name is correct, it should be the full path to your emerald boot
file. Which on the Device is /Didj/Base/bin/\<filename\> Don't forget
the Didj/ part.

    #!/bin/sh
    set -e
    set -x
    echo "Flash EB"
    flash_eraseall /dev/mtd0
    flash_eraseall /dev/mtd1
    mtd_debug write /dev/mtd0 0x0 0x48001 /Didj/Base/bin/emerald-boot_DIDJ.bin
    echo "Flash EB Done"
    exit 0

Copy your AppManager script to /Base/bin, which you'll find when you
mount the Didj as USB storage. This will replace a file called
AppManager already in the folder. You can back that file up if you want,
but after running the script it won't be needed.

With both files in place, eject the Didj, and unplug the USB cord. This
is your last chance, if it is booted with the USB plugged in the script
will not run, once it boots, it will start flashing the NAND. This is
the part where it could brick if the script is wrong, or something else
fails like loosing power. Double check everything!

Now boot up the Didj normally. It should go into its normal routine but
before the user interface comes up, it will reboot. Restart the Didj,
and you should see the Emerald Boot screen now appearing.

## OpenLFConnect Installation

[OpenLFConnect](http://eLinux.org/LeapFrog_Pollux_Platform:_OpenLFConnect "LeapFrog Pollux Platform: OpenLFConnect")
can be used for this process also, as it includes a command that moves
the files and creates the script necessary. It creates the path name and
file size in the script, and also double checks you compiled a DIDJ
version of the patched emerald-boot.

Plug in the USB and power on your Didj and open OpenLFConnect

    $ didj_mount
    $ didj_update_eb path/to/emerald-boot_DIDJ.bin

The Didj will then power down. Unplug the USB and power it back up. It
will again shut itself down. Turn it on again and the emerald boot
screen should appear. Emerald-boot will panic since there is no kernel
for it to find on the NAND. You can boot a surgeon.cbf file from here if
you like

    $ surgeon_boot path/to/surgeon.cbf

If you have console access you can use it to configure networking, or
you can compile your own surgeon with changed networking, as the
Explorer and LeapPad surgeon networkings depend on a serial number that
is not on the Didj.


