> From: [eLinux.org](http://eLinux.org/Didj_U-Boot_NAND_Flashing "http://eLinux.org/Didj_U-Boot_NAND_Flashing")


# Didj U-Boot NAND Flashing



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Programs Needed](#programs-needed)
-   [4 Hardware Needed](#hardware-needed)
-   [5 Software Needed](#software-needed)
-   [6 Preparing](#preparing)
-   [7 Lightning Boot](#lightning-boot)
-   [8 Kernel](#kernel)
-   [9 File System](#file-system)
-   [10 Finish Restoring](#finish-restoring)

## Summary

This is a tutorial on how to recover your Didj from absolute failure. It
will take a Didj whose NAND has been completely erased, and bring it
back to fully functional. But it can also be used to install specific
things, like just a bootloader, or just the kernel.

**Caution**

Read this tutorial completely before attempting. This will be erasing
the operating system and bootloader from your device, any one of these
steps, if not completed correctly, could leave your Didj useless. It is
recommended if at all possible, use the Didj's built in updating
abilities [Bootloader and Firmware
Updating](http://eLinux.org/Didj_BootLoader_Firmware_Updating "Didj BootLoader Firmware Updating")

## Prerequisites

-   [U-Boot Command
    Reference](http://eLinux.org/Didj_uboot#NAND_Command_Reference "Didj uboot")
-   You'll want to follow this tutorial up to and including loading
    U-Boot.[UART Boot](http://eLinux.org/Didj_UART_Boot "Didj UART Boot")

## Programs Needed

Terminal Program (Hyperterminal or equivalent) set to 115200 8/n/1

## Hardware Needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

[Cartridge](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "LeapFrog Pollux Platform: Cartridge")

SD Card Reader/Writer

## Software Needed

[uboot.bin](http://eLinux.org/Didj_uboot "Didj uboot")

[Lightning Boot](http://eLinux.org/Didj_Lightning_Boot "Didj Lightning Boot")

kernel.bin

erootfs.jffs2

## Preparing

Load kernel.bin, u-boot.bin, and lightning-boot-UART.bin onto your SD
card.

Some Lightning Boot's are created specifically for UART booting, and
some for NAND. You will need one that is the UART type, and a NAND
version of the one you want to permanently install.

If you are unsure about what type your Lightning Boot is, run this
command and check the output. The two options are UART and NAND.

    # hexdump -C -n 16 lightning-boot.bin
    00000000  00 00 00 ea 55 41 52 54  04 d0 9f e5 01 00 00 eb  |....UART........|
    00000010

**Caution**, if you get excessive bad erase block messages, while
erasing parts of the nand, try using nandscrub to deal with them, but
this should be a last resort, as it will destroy all data on your NAND,
and you will have to put it all back. This also has the side effect of
erasing your bad block data, which could cause complications.

Gather the Files Needed and transfer them to the main directory of the
SD Card, they can not be in a folder. U-Boot is the only file you will
always need. Lightning Boot, Kernel, or Rootfs is on an as needed basis.

-   lightning-boot.bin NAND Version
-   u-boot.bin
-   kernel.bin
-   erootfs.jffs2

You are now going to need to load a bootloader with [UART
Boot](http://eLinux.org/Didj_UART_Boot "Didj UART Boot") but stop after loading U-Boot

Once at the U-Boot prompt, we can start writing the files to the Didj.

## Lightning Boot

Initialize SD capabilities.

    LF1000# mmcinit
    SD ver 2.0
    SD found : Size = 3866624 KBytes


 Load lighting boot into memory at address 0x1800000

    LF1000# fatload mmc 0 1800000 lightning-boot.bin
    reading lightning-boot.bin
    Why block_cnt == 0??
    16384 bytes read


 Erase the area you plan to write to "nand erase \<location\>
\<length\>"

    LF1000 # nand erase 0 4000
    NAND erase: device 0 offset 0x0, size 0x4000
    Erasing at 0x0 -- 800% complete.
    OK


 Write from RAM to NAND "nand write \<from\> \<to\> \<length\>"

    LF1000 # nand write 1800000 0 4000
    NAND write: device 0 offset 0x0, size 0x4000
    16384 bytes written: OK


 lightning-boot.bin v1.4 should now be on your Didj. Turn it off, and
back on, and you should see the blue screen with menu choices come up
and we can move on to installing the kernel. If not, double check your
numbers, its easy to put in an extra 0 or leave one out.

## Kernel

From the bootloader screen, chose Load uboot from SD

Initialize SD capabilities.

    LF1000# mmcinit
    SD ver 2.0
    SD found : Size = 3866624 KBytes


 Load kernel.bin into memory at address 0x1400000 and write down how
many bytes read.

    LF1000# fatload mmc 0 1400000 kernel.bin
    reading kernel.bin
    Why block_cnt == 0??
    1310720 bytes read  <== *Write this number down*


 Erase the area you plan to write to "nand erase \<location\>
\<length\>"

0x00200000 Kernel0 Start location

0x01200000 Kernel1 Start location

0x200000 Length of Kernel space

    LF1000 # nand erase 200000 200000
    NAND erase: device 0 offset 0x00200000, size 0x200000
    Erasing at 0x00200000 -- 800% complete.
    OK


 Write from RAM to NAND "nand write \<from\> \<to\> \<length\>"

The length is the hex value of the number you wrote down earlier, in
this case 1310720, the easiest way is to open up your calculator into
scientific mode, make sure its set to decimal, and enter the number,
then switch it over to hex, it'll convert the number automatically.
Alternatively, on linux the 'bc' commandline calculator can do base
conversions easily: "echo 'obase=16; 1310720' | bc"



    LF1000 # nand write 1400000 0x00200000 140000
    NAND write: device 0 offset 0x00200000, size 0x140000
    1310720 bytes written: OK


 If you want, repeat nand erase, and nand write, but for Kernel1.

## File System

Initialize SD capabilities. (Skip this step if you did not reboot after
writing the kernels)

    LF1000# mmcinit
    SD ver 2.0
    SD found : Size = 7077888 KBytes


 Load erootfs.jffs2 into memory at address 0x1400000 and write down how
many bytes read.

    LF1000# fatload mmc 0 1400000 erootfs.jffs2
    reading erootfs.jffs2
    Why block_cnt == 0??
    7077888 bytes read  <== *Write this number down*


 Erase the area you plan to write to "nand erase \<location\>
\<length\>"

0x00400000 Linux\_RFS0 Start location

0x01400000 Linux\_RFS1 Start location

0xE00000 Length of Kernel space

    LF1000 # nand erase 400000 E00000
    NAND erase: device 0 offset 0x00400000, size 0xE00000
    Erasing at 0x00400000 -- 800% complete.
    OK


 Write from RAM to NAND "nand write \<from\> \<to\> \<length\>"

The length is the hex value of the number you wrote down earlier, in
this case 7077888, the easiest way is to open up your calculator into
scientific mode, make sure its set to decimal, and enter the number,
then switch it over to hex, it'll convert the number automatically.
Alternatively, on linux the 'bc' commandline calculator can do base
conversions easily: "echo 'obase=16; 7077888' | bc"



    LF1000 # nand write 1400000 0x00400000 6C0000
    NAND write: device 0 offset 0x00400000, size 0x6C0000
    7077888 bytes written: OK

You can now reboot your Didj.

Watch the terminal window while the Didj boots up. Depending on why your
Didj required being recovered, you may get various errors.


 **If booting fails**

A kernel panic means something went wrong with writing the files, make
sure you got the addresses correct, and your kernel.bin and
erootfs.jffs2 were good working copies, then try again.

If it stops at line "fw= bl= pkg=0" you should have command line access,
the next step in booting is the Didj AppManager. I had a problem where
the size of erootfs.jffs2 was too short, causing certain programs to not
be available, double check your calculations and try again.

## Finish Restoring

At this point if everything else went okay, its possible only the /Didj
/dev/mtdblock9 USB part is left to be dealt with. Possible issues could
be /Didj brazenly refuses to mount because of needs\_repair flags, left
UNLOCKED because a serial number could not be found, or any number of
issues. Best case scenario, plugging in the USB cable starts up
LFConnect if you're on Windows, and it fixes the Didj the rest of the
way. It may require you needing to create a profile first, in which case
you will have to manually fix the Didj the rest of the way.

**No Serial Number**

From on the didj. Disable and lock mass\_storage

    # usbctl -d mass_storage -a disable
    # usbctl -d mass_storage -a lock

This should make /Didj mount and be accessible from inside the Didj.
Open vi with UnitID.txt as the file name

    # vi /Didj/UnitID.txt

You'll need to include your Didj's serial number into that file. If
you've got previous boot logs, its in there, if you've loaded LFConnect,
it created a folder in /All Users/Application Data/Leapfrog/Mnt/\<Serial
Number\> Save the file, and reboot, it should recognize your serial
number.

**Needs Repair**

This will be solved if you can plug into LFConnect, and it is able to
sync your Didj. If not, on the Didj

    # echo 0 > /sys/devices/platform/lf1000-usbgadget/gadget/gadget-lun0/needs_repair

Or you can attempt deleting

    # rm /flags/needs_repair

There could be more potential problems and solutions, but you should at
least have a bootable Didj and working Operating System by this point.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

