> From: [eLinux.org](http://eLinux.org/Didj_Explorer_Kernel "http://eLinux.org/Didj_Explorer_Kernel")


# Didj Explorer Kernel



## Contents

-   [1 Prerequisites](#prerequisites)
-   [2 Software Needed](#software-needed)
-   [3 Hardware needed](#hardware-needed)
-   [4 Kernel Configuration](#kernel-configuration)

## Prerequisites

[Kernel
Configuration](http://eLinux.org/LeapFrog_Pollux_Platform:_Kernel_Configuration "LeapFrog Pollux Platform: Kernel Configuration")

## Software Needed

[Leapster Explorer
Source](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#Leapster_Explorer "LeapFrog Pollux Platform: Source Code")

## Hardware needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

## Kernel Configuration

**This is a work in progress** Explains what to change in order to build
the 2.6.31 LF Explorer kernel for Didj. Use your DJHI to boot the zImage
from uSD.

1. make lf1000\_ts\_defconfig

2. edit .config. (we are enabling jffs2 and giving the right bootargs):

``

CONFIG\_CMDLINE="mem=18M mlc\_fb=0x01200000,0x01200000 init=/sbin/init
console=ttyS0,115200 root=31:06 ro rootflags=noatime rootfstype=jffs2
ubi.mtd=Brio ubi.mtd=prg\_Brio ubi.mtd=Cartridge"

CONFIG\_JFFS2\_FS=y

3. edit line 184 of linux2.6/Makefile to point to your cross compiler
(or comment it out if you know the varaible is set elsewhere).

4. edit include/asm/mach-types.h (the number has changed to 2028 - but
the boot loader only knows about 1235)

(you may need to 'make' once and ctrl-c to get the mach-types file
generated the first time.) ``

//define MACH\_TYPE\_ZIR2412 1235

define MACH\_TYPE\_DIDJ 1235

...

//define MACH\_TYPE\_DIDJ 2028

4.1 instead of editig mach-types.h you can edit the file that it is
generated from, mach-types (no.h!) in /linux-2.6/arch/arm/tools, edit
the file and look for 2028, copy everything on the line upto 2028:

**didj MACH\_DIDJ DIDJ**

comment out the 2028 line and now search for 1235 and replace the line
with the above, make sure you add 1235 to the end:

**didj MACH\_DIDJ DIDJ 1235**

This allows you to do 'make clean' without having to re-edit
mach-types.h each time, if you also own an explorer you might not want
to do this.

5. edit drivers/mtd/nand/lf1000.c (using didj's 9 partition scheme)

[Unified diff 0f changes to
drivers/mtd/nand/lf1000.c](http://pastie.org/1056564)

[Alternate site: Unified Diff of changes to
drivers/mtd/nand/lf1000.c](http://pastebin.com/FX0SbZzM)

6. Edit arch\\arm\\mach-lf1000\\include\\mach\\mlc.h

1.  define MLC\_MAJOR 251
2.  define MLC\_LAYER\_MAJOR 250

This will enable the mlc driver to work with /dev/mlc

7. make

zImage is found in arch/arm/boot

To mount /Didj:

` mount -t vfat -o async,noatime /dev/mtdblock9 /Didj`

For framebuffer configuration see
[Leapster\_Explorer\_Framebuffer\_Driver](http://eLinux.org/Leapster_Explorer_Framebuffer_Driver "Leapster Explorer Framebuffer Driver")

For MMC Card configuration see
[Didj\_and\_Explorer\_MMC\_Patch](http://eLinux.org/Didj_and_Explorer_MMC_Patch "Didj and Explorer MMC Patch")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

