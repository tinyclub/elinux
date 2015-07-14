> From: [eLinux.org](http://eLinux.org/DHT-Walnut "http://eLinux.org/DHT-Walnut")


# DHT-Walnut



other DHT-Walnut pages:
[Flameman/dht-walnut](http://eLinux.org/Flameman/dht-walnut "Flameman/dht-walnut")

## Contents

-   [1 Overview](#overview)
-   [2 Bootloaders](#bootloaders)
-   [3 Linux Kernels](#linux-kernels)
-   [4 Userland](#userland)
-   [5 How-To's](#how-to-s)

## Overview

DHT-Walnut is a shortened name for the Digital Home Technologies PCB
01070201 Rev. 1.1. The DHT-Walnut board is based on the AMCC-Walnut
(still available, and still expensive :P). It is a more improved board
described at www.amcc.com. A "walnut" searching will inform about
schematic and software. Also keep attention @ DENX: they have developed
a lot for the AMCC-Walnut board, and you could find a linux patch for
your problem, prettier documentation, developer suit, and much more: in
case, you are suggested to have a look to their web pages.

currently available
[HERE](http://www.bgmicro.com/prodinfo.asp?prodid=COM1191) Oops, **sold
out** 2/6/2006


 The board consists of:

-   [PowerPC 405GP](http://eLinux.org/PPC405_GP "PPC405 GP") running at 266mhz
-   PC133 SDRAM slot, currently, only supports single sidded DIMMs
-   On-chip 405GP ethernet, board doesn't have an ethernet MAC address
-   DCE serial port, speeds up to 230k, only tested to 115200
-   two pci slots, keyed for 5V only cards
-   Promise Technologies [PDC20265](http://eLinux.org/PDC20265 "PDC20265") IDE
-   512k of boot flash AMD 29LV040B
    [datasheet](http://eLinux.org/images/0/0e/Amd29lv040b.pdf "Amd29lv040b.pdf")
-   12v dc powered
-   PPC40XX [JTAG](../../.././dev_portals/Glossary/JTAG/JTAG.md "JTAG") on J10
-   6.00" x 7.5" board size

The system's most common configuration seems to be:

-   System PCB
-   32M PC133 SDRAM DIMM
    -   Unknown PCI IEEE-1394 card supported by OHCI driver
    -   PPCBoot v.1.1.2 in flash

Hardware that is known to work (and not to work) with this board can be
found
[here](http://eLinux.org/DHT-Walnut_Known_Working_Hardware "DHT-Walnut Known Working Hardware")

GPSFan (Freenode IRC on \#edev) was helpful in providing an image of the
board:

[![Com1191.jpg](http://eLinux.org/images/5/5a/Com1191.jpg)](http://eLinux.org/File:Com1191.jpg)

Some info in the pdf [HERE](http://supernova.stanford.edu/dingdong/)


 Experimental hack to set a hardware breakpoint inside OCD Commander
[hardbreak.tgz](http://eLinux.org/images/d/d2/Hardbreak.tgz "Hardbreak.tgz")

-   OCD Commander macro file to dump the CPU configuration (all but PCI)
    [dump\_config.mac](http://eLinux.org/images/2/2f/Dump_config.mac "Dump config.mac")
-   OCD Commander macro file to configure the system for recovery
    [recovery\_config.mac](http://eLinux.org/images/5/5e/Recovery_config.mac "Recovery config.mac")
-   CPU configuration of the system after a warm reset
    [warm\_reset.config](http://eLinux.org/images/1/1d/Warm_reset.config "Warm reset.config")
-   CPU configuration of the system once ppcboot v1.1.2 is up and
    running
    [ppcboot.config](http://eLinux.org/images/b/bc/Ppcboot.config "Ppcboot.config")
-   CPU configuration of the system once ppcboot v1.1.6 is up and
    running
    [ppcboot\_116.config](http://eLinux.org/images/7/7a/Ppcboot_116.config "Ppcboot 116.config")
-   Example OCD logfile of the using the recovery macro to load ppcboot
    [ocd\_recovery\_log.txt](http://eLinux.org/images/2/2b/Ocd_recovery_log.txt "Ocd recovery log.txt")
-   Example console log from ppcboot v.1.1.6 running from ram after
    recovery macro
    [ocd\_recovery\_console\_log.txt](http://eLinux.org/images/b/b2/Ocd_recovery_console_log.txt "Ocd recovery console log.txt")

## Bootloaders

-   [ppcboot](http://eLinux.org/DHT-Walnut_PPCBoot "DHT-Walnut PPCBoot")

Here is the latest ppcboot 1.1.6 patch, as is, it will build for
flashing at 0xfff80000 as a replacement for the pcboot-1.1.2 that comes
with the board.

[patch-ppcboot-1.1.6-km2](http://eLinux.org/images/4/46/Patch-ppcboot-1.1.6-km2 "Patch-ppcboot-1.1.6-km2")

Original sources for ppcboot:
[[1]](ftp://ftp.denx.de/pub/ppcboot/ppcboot-1.1.6.tar.bz2)

Here is a binary for those without a toolchain.

[ppcboot1.1.6.1.bin](http://eLinux.org/images/9/91/Ppcboot1.1.6.1.bin "Ppcboot1.1.6.1.bin")
crc = 083fb0a3

To use this (at your own risk) see the detailed update procedure
description: [Installing the Updated
Bootloader](http://eLinux.org/DHT-Walnut_Installing_The_Updated_Bootloader "DHT-Walnut Installing The Updated Bootloader")

-   U-Boot

U-Boot is a significantly updated replacement for ppcboot. See: [U-Boot
for the DHT-Walnut](http://eLinux.org/DHT-Walnut_U_Boot "DHT-Walnut U Boot").

Just in case you make a brick, there is hope: [JTAG Bootloader
Installation](http://eLinux.org/DHT-Walnut_Jtag_Bootloader_Installation "DHT-Walnut Jtag Bootloader Installation")

## Linux Kernels

-   Version 2.4

(Mostly) working kernel binary and config from jbevren with matrox fbcon
and usb input support.

Current issues:

-   -   USB keyboard input doesnt seem to work, but events reach
        /dev/input/event0
    -   [Media:uImage](http://eLinux.org/images/c/c2/UImage "UImage")
    -   [Media:config](http://eLinux.org/images/f/fa/Config "Config")

-   Version 2.6

See: [2.6 Linux kernel for the
DHT-Walnut](http://eLinux.org/DHT-Walnut_2.6_Linux_Kernel "DHT-Walnut 2.6 Linux Kernel")

## Userland

-   [Debian GNU/Linux netboot
    installer](http://eLinux.org/DHT-Walnut_-Debian_Install "DHT-Walnut -Debian Install")
    -- Install Debian from the internet to a hard disk.

## How-To's

-   How To [replace the bootloader with ppcboot
    1.1.6](http://eLinux.org/DHT-Walnut_Installing_The_Updated_Bootloader "DHT-Walnut Installing The Updated Bootloader")
-   How To [replace the bootloader with U-boot
    1.1.4](http://eLinux.org/DHT-Walnut_U_Boot "DHT-Walnut U Boot")
-   How To [recover from
    "Brickage"](http://eLinux.org/DHT-Walnut_Jtag_Bootloader_Installation "DHT-Walnut Jtag Bootloader Installation")
-   How To [add the JTAG connector at
    J10](http://eLinux.org/DHT-Walnut_Add_J10 "DHT-Walnut Add J10")
-   How To [boot via
    tftp](http://eLinux.org/DHT-Walnut_Boot_Via_Tftp "DHT-Walnut Boot Via Tftp")
-   How To [boot from Hard
    Disk](http://eLinux.org/DHT-Walnut_Booting_From_Hdd "DHT-Walnut Booting From Hdd")
-   How To [do something useful with your
    board](http://eLinux.org/DHT-Walnut_Usefull_Projects "DHT-Walnut Usefull Projects")
-   How To [control the Green Media LED and
    J5](http://eLinux.org/DHT-Walnut_GPIO "DHT-Walnut GPIO")
-   More to come...


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

