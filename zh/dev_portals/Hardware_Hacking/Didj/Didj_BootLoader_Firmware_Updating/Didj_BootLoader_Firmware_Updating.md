> From: [eLinux.org](http://eLinux.org/Didj_BootLoader_Firmware_Updating "http://eLinux.org/Didj_BootLoader_Firmware_Updating")


# Didj BootLoader Firmware Updating



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Programs Needed](#programs-needed)
-   [4 Hardware Needed](#hardware-needed)
-   [5 Software Needed](#software-needed)
-   [6 Update With Console Access](#update-with-console-access)
    -   [6.1 Using Built in Tools](#using-built-in-tools)
    -   [6.2 Manually](#manually)
-   [7 Update With Out Console Access](#update-with-out-console-access)
    -   [7.1 Force Update with Custom SCSI
        Commands](#force-update-with-custom-scsi-commands)
-   [8 Update With OpenLFConnect](#update-with-openlfconnect)
-   [9 Update With LFConnect](#update-with-lfconnect)

## Summary

There are several ways to commit your firmware, or bootloader to NAND.
These methods can update your Didj with a fresh firmware, or a modified
one with proper packaging.

**Caution** Make sure your batteries are charged, or you have an A/C
adapter. Also that you understand, there is a certain level of risk
making these modifications. Make sure you read through it first, and
understand what is being done, before proceeding. Its best to first test
these methods with a known working firmware or bootloader. And reading
through [U-Boot NAND
Flashing](http://eLinux.org/Didj_U-Boot_NAND_Flashing "Didj U-Boot NAND Flashing") to
make sure you can recover if things go wrong.

## Prerequisites

-   [Didj USB Mount](http://eLinux.org/Didj_USB_Mounting "Didj USB Mounting")
-   [Extract lfp
    Archives](http://eLinux.org/LeapFrog_Pollux_Platform:_Extract_Archives "LeapFrog Pollux Platform: Extract Archives")

## Programs Needed

Terminal program: Hyperterminal or equivalent

## Hardware Needed

-   [Console
    Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

## Software Needed

-   DIDJ-0x000E0002-000001.lfp (bootloader)
-   DIDJ-0x000E0003-000001.lfp (firmware)

## Update With Console Access

#### Using Built in Tools

This method will use a few built in programs that come with the Didj for
updating the firmware and bootloader. You will need to copy, or create a
folder, and certain files in it for this to work It is easiest to
extract the folder from the lfp archives and modify it as needed.

**Firmware**

For firmware this method will install into the opposite partitions, than
the one you are on, so if you are on RFS0, the update will be installed
to RFS1. And the Didj will be configured to boot from that one.

The firmware folder should be named firmware-LF\_LF1000.

Mount your Didj and copy you're prepared folder to the /Didj/Base
directory on your Didj.

After loading your folder onto the Didj, its best to run the check
program, to make sure it can find it.

*On Didj*

    # fwcheck
    /Didj/Base/firmware-LF_LF1000

This should return the path to your folder, indicating it was found.

Now you can run the actual update program:

    # fwupdate /Didj/Base/firmware-LF_LF1000/ > /dev/console
    Found /Didj/Base/firmware-LF_LF1000/
    Package Integrity Test Passed
    Installing kernel.bin in Kernel1 (mtd5)
    Kernel install successful.
    Installing erootfs.jffs2 in Linux_RFS1 (mtd6)
    Rootfs install successful.
    Switching from RFS0 to RFS1

**Bootloader**

The folder must be prefixed with 'bootstrap-' (ex. bootstrap-LF1000).

The only files that are needed are:

    lightning-boot.bin
    lightning-boot.md5

Check that the updater can find your folder.

*On Didj*

    # blcheck
    /Didj/Base/bootstrap-LF_LF1000

Then run:

    # blupdate /Didj/Base/bootstrap-LF_LF1000 > /dev/console
    Found /Didj/Base/bootstrap-LF_LF1000/
    Package Integrity Test Passed
    Installing lightning-boot.bin in LF1000_uniboot (mtd0)
    Bootloader install successful.

**Caution**

-   If you keep getting the Tune Up screen after ejecting your device,
    you'll need to remove firmware-LF\_LF1000/ and/or
    bootstrap-LF\_LF1000 from /Didj/Base on the device. As it will keep
    thinking it needs an update.

#### Manually

This method is for the advanced user. You must understand the partition
layouts. Copy your file to /Didj/Base and run the following commands:

    flash_eraseall /dev/mtd0
    nandwrite -p /dev/mtd0 /Didj/Base/lightning-boot.bin

## Update With Out Console Access

#### Force Update with Custom SCSI Commands

This update can be done with out a console connection, and mimics how
LFConnect handles the task. Both updates can be done at the same time.
This is exactly like **With Built in Tools** except we trigger the Didj
to run those commands for us, by giving our package a higher version
number and telling the Didj to eject. This is nice if you do not have
console access to the device.

There are two ways to do trigger the update with the eject command.

-   [SCSI Commands](http://eLinux.org/Didj_SCSI_Commands "Didj SCSI Commands") for how to
    use SCSI Commands.
-   [OpenLFConnect](http://eLinux.org/LeapFrog_Pollux_Platform:_OpenLFConnect "LeapFrog Pollux Platform: OpenLFConnect")

If you want to do both at the same time, load both folders into
/Didj/Base then run the command to eject.

**Bootloader**

For bootloader create a folder in /Didj/Base called prefixed with
'bootstrap-' (ex. bootstrap-LF\_LF1000)

It should have the same files as the lfp package.

Make sure meta.inf has a version number higher than
Version="1.35.2.4222" or if you've changed the version number in your
file system, higher than that one.

**Firmware**

For the firmware create a folder in /Didj/Base called
firmware-LF\_LF1000

It should have the same files as in LFP package DIDJ-0x000E0003-000001

Make sure meta.inf has a version number higher than
Version="1.35.2.4222" or if you've changed the version number in your
file system, higher than that one.

**Trigger Update With SCSI Commands**

If you're on Linux run the sync command, to flush the filesystem
buffers.

Then run the SCSI Command C6 "Disconnect Ok", which will cause it to say
its "Learning New Tricks" before saying its okay to disconnect your
Didj.

Then turn the Didj off.

This processes causes the Didj state machine to look for a folder called
firmware-LF\_LF1000, if its a newer version, which is found in meta.inf
and compared to /etc/version on the Didj, it will update the files with
the new ones.

## Update With OpenLFConnect

Once OpenLFConnect is installed and set up, you can update the firmware
and or boot loader by using its specific commands and pointing them at
the files to use. This is basically a python script that runs the
necessary sg3\_utils programs on Windows or Linux.

Mount Didj

    local>didj_mount
    ... device info ...

Run firmware update command giving it a path.

    remote>didj_update_firmware /path/to/firmware-LF_LF1000

Didj will upload the firmware, then eject when files have synced.

For bootloader its the same process.

    local>didj_mount
    ... device info ...
    remote>didj_update_bootloader /path/to/bootstrap-LF_LF1000

Or us just plain didj\_update and point it to the parent directory of
both.

Once the Didj has rebooted after the update.

    local>didj_mount
    ... device info ...
    remote>didj_update_cleanup

This will delete the update directories from the Didj, to prevent
updates from running every time it is didj\_eject is run.

## Update With LFConnect

If you are using Windows, and have LFConnect installed, you may find
this way suites your needs. There is no special programs or need to run
commands on the device itself.

[LFConnect Force Firmware
Updates](http://eLinux.org/LeapFrog_Pollux_Platform:_LFConnect#Force_Firmware_Updates "LeapFrog Pollux Platform: LFConnect")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

