> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_How_To_Make_a_NAND_Cartridge "http://eLinux.org/Leapster_Explorer:_How_To_Make_a_NAND_Cartridge")


# Leapster Explorer: How To Make a NAND Cartridge



## Contents

-   [1 Summary](#summary)
-   [2 Hardware Requirements](#hardware-requirements)
-   [3 Hardware Instructions](#hardware-instructions)
-   [4 Software Instructions](#software-instructions)

## Summary

This tutorial documents the steps to follow in order to replace a
Leapster Explorer cartridge's One-Time-Programmable memory chip with a
rewritable NAND memory chip, create a UBIFS partition/volume on the
NAND, and mount the volume in Linux.

## Hardware Requirements

Leapster Explorer game cartridge.

NAND chip - a 512MB chip was used for this tutorial (2 GB max)

Soldering equipment (incl. solder paste and wick)

**Strongly recommended:** A microscope or similar high-powered
magnifier.

## Hardware Instructions

-   Open the cartridge's plastic casing, remove the PCB, and Desolder
    the OTP part from the PCB

[![LeapFrog Cartridge
Stock.jpg](http://eLinux.org/images/thumb/5/55/LeapFrog_Cartridge_Stock.jpg/320px-LeapFrog_Cartridge_Stock.jpg)](http://eLinux.org/File:LeapFrog_Cartridge_Stock.jpg)

-   Clean the OTP pads on the PCB using solder wick

[![LeapFrog Cartridge
Desoldered.jpg](http://eLinux.org/images/thumb/f/f3/LeapFrog_Cartridge_Desoldered.jpg/320px-LeapFrog_Cartridge_Desoldered.jpg)](http://eLinux.org/File:LeapFrog_Cartridge_Desoldered.jpg)

-   Apply solder paste to the nand pads, and apply soldering iron on
    pads to melt solder; the surface tension will draw the solder onto
    the pads. Clean up excess.

-   Place nand onto board on the soldered pads and align the dot with
    the upper left. (A dot of 'fun-tack' putty underneath the NAND is
    useful to help keep the part in place)

-   Solder one corner pin on each side to tack the NAND down by melting
    the solder on the pad

-   Melt the solder on the other pins to fully solder the nand in place

[![LeapFrog Cartridge NAND
Replaced.jpg](http://eLinux.org/images/thumb/b/bf/LeapFrog_Cartridge_NAND_Replaced.jpg/320px-LeapFrog_Cartridge_NAND_Replaced.jpg)](http://eLinux.org/File:LeapFrog_Cartridge_NAND_Replaced.jpg)

-   Use a continuity checker DMM to verify good contact between the pads
    and NAND pins. (repair joints as necessary)

-   Desolder R4 and R5 and resolder them as pullups on the alternate
    pads.
    -   For more info [Cartridge
        Settings](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge_Settings "LeapFrog Pollux Platform: Cartridge Settings")



## Software Instructions

Make sure CartManager is running

    CartManager &

Insert the cart and format the Nand with ubi

    ubiformat /dev/mtd10 -s 512

Attach the ubifs partition

    ubiattach /dev/ubi_ctrl -m 10 -O 2048 -d 2

Create a ubifs volume

    ubimkvol /dev/ubi2 -N Cartridge -s 490MiB

Mount the drive

    mount -t ubifs ubi2:Cartridge /LF/Cart


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")

