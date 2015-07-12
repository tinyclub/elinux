> From: [eLinux.org](http://eLinux.org/OpenOCD "http://eLinux.org/OpenOCD")


# OpenOCD



## Contents

-   [1 Introduction](#introduction)
-   [2 Supported Cores Types](#supported-cores-types)
-   [3 Technical Support](#technical-support)
-   [4 Installing OpenOCD](#installing-openocd)
-   [5 Running OpenOCD](#running-openocd)
    -   [5.1 General Instructions](#general-instructions)
    -   [5.2 OpenOCD Configuration Files](#openocd-configuration-files)
    -   [5.3 Board Specific Instructions](#board-specific-instructions)
-   [6 External Links](#external-links)

## Introduction

This page builds on content from the main
[OpenOCD](http://openocd.sourceforge.net/) project site.

OpenOCD (Open On-Chip Debugger) is open-source software that interfaces
with a hardware debugger's [JTAG](http://eLinux.org/JTAG "JTAG") port. OpenOCD provides
debugging and in-system programming for embedded target devices. OpenOCD
provides the ability to flash NAND and NOR FLASH memory devices that are
attached to the processor on the target system. Flash programming is
supported for external CFI compatible flashes (Intel and AMD/Spansion
command set) and several internal flashes (LPC2000, AT91SAM7, STR7x,
STR9x, LM3 and STM32x).

OpenOCD was originally developed by Dominic Rath at the University of
Applied Sciences Augsburg. The OpenOCD source code is now available
through the GNU General Public License (GPL).

## Supported Cores Types

OpenOCD supports the following cores:

<table>
<thead>
<tr class="header">
<th align="left">CORE TYPE</th>
<th align="left">EXAMPLE PROCESSORS</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">ARM7TDMI</td>
<td align="left">LPC2148, AT91SAM7</td>
</tr>
<tr class="even">
<td align="left">ARM720T</td>
<td align="left">LH79520, EP7312</td>
</tr>
<tr class="odd">
<td align="left">ARM9TDMI</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ARM920T</td>
<td align="left">S3C2410, S3C2440</td>
</tr>
<tr class="odd">
<td align="left">ARM922T</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ARM926EJS</td>
<td align="left">S3C2412, STN8811, STN8815</td>
</tr>
<tr class="odd">
<td align="left">ARM966E</td>
<td align="left">STR91XF</td>
</tr>
<tr class="even">
<td align="left">ARM11</td>
<td align="left">S3C6400, OMAP2420, MSM7200</td>
</tr>
<tr class="odd">
<td align="left">ARM1136</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">ARM1156</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">ARM1176</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CORTEX-M3</td>
<td align="left">LM3S series, STM32 series</td>
</tr>
<tr class="odd">
<td align="left">CORTEX-A8</td>
<td align="left">OMAP3530 BeagleBoard</td>
</tr>
<tr class="even">
<td align="left">CORTEX-A8</td>
<td align="left">DM3730 BeagleBoard-xM</td>
</tr>
<tr class="odd">
<td align="left">CORTEX-A9</td>
<td align="left">OMAP4430 PandaBoard</td>
</tr>
<tr class="even">
<td align="left">XSCALE</td>
<td align="left">PXA255, PXA270, IXP42X</td>
</tr>
<tr class="odd">
<td align="left">MARVEL</td>
<td align="left">FEROCEON CPU CORE</td>
</tr>
<tr class="even">
<td align="left">MIPS</td>
<td align="left">M4K</td>
</tr>
</tbody>
</table>

## Technical Support

-   [OpenOCD website](http://openocd.org/)
-   [OpenOCD User Support mailing
    list](https://lists.sourceforge.net/lists/listinfo/openocd-user/)
-   [OpenOCD Development mailing
    list](https://lists.sourceforge.net/lists/listinfo/openocd-devel)
-   [Sparkfun.com OpenOCD
    forum](http://forum.sparkfun.com/viewforum.php?f=18)
-   [OpenOCD User's
    Guide](http://openocd.sourceforge.net/doc/html/index.html)
-   \#openocd channel on irc.freenode.net

## Installing OpenOCD

-   [Compiling OpenOCD](http://eLinux.org/Compiling_OpenOCD "Compiling OpenOCD")
-   [OpenOCD Ubuntu
    Package](http://eLinux.org/OpenOCD_Ubuntu_Package "OpenOCD Ubuntu Package")
-   [OpenOCD Patches](http://eLinux.org/OpenOCD_Patches "OpenOCD Patches")
-   [OpenOCD Config Files](http://eLinux.org/OpenOCD_Config_Files "OpenOCD Config Files")
-   [libFDTI vs. libFTD2xx](http://eLinux.org/Libftdi_vs_FTD2XX "Libftdi vs FTD2XX")
    license and performance comparison
-   [The GNU ARM Eclipse
    OpenOCD](http://gnuarmeclipse.livius.net/blog/openocd/) - new
    OpenOCD distribution, with better Eclipse integration

## Running OpenOCD

#### General Instructions

-   [Running OpenOCD](http://eLinux.org/Running_OpenOCD "Running OpenOCD")
-   [Running OpenOCD on
    Linux](http://eLinux.org/Running_OpenOCD_on_Linux "Running OpenOCD on Linux")
-   [Running OpenOCD on
    Windows](http://eLinux.org/Running_OpenOCD_on_Windows "Running OpenOCD on Windows")
-   [OpenOCD
    Troubleshooting](http://eLinux.org/OpenOCD_Troubleshooting "OpenOCD Troubleshooting")

#### OpenOCD Configuration Files

-   [OpenOCD Configuration Files
    Overview](http://eLinux.org/OpenOCD_Configuration_Files_Overview "OpenOCD Configuration Files Overview")
-   [How To Write an Interface Configuration
    Script](http://eLinux.org/index.php?title=How_To_Write_an_Interface_Configuration_Script&action=edit&redlink=1 "How To Write an Interface Configuration Script (page does not exist)")
-   [How To Write a Board Configuration
    Script](http://eLinux.org/How_To_Write_a_Board_Configuration_Script "How To Write a Board Configuration Script")
-   [How To Write a Target Configuration
    Script](http://eLinux.org/index.php?title=How_To_Write_a_Target_Configuration_Script&action=edit&redlink=1 "How To Write a Target Configuration Script (page does not exist)")

#### Board Specific Instructions

-   [BeagleBoard](http://eLinux.org/Running_OpenOCD_on_Linux_with_the_Beagleboard "Running OpenOCD on Linux with the Beagleboard")
-   [Beagleboard
    xM](http://eLinux.org/Running_OpenOCD_on_Linux_with_the_Beagleboard_xM "Running OpenOCD on Linux with the Beagleboard xM")
-   [BeagleBone](http://eLinux.org/Running_OpenOCD_on_Linux_with_the_Beaglebone "Running OpenOCD on Linux with the Beaglebone")
-   [PandaBoard](http://eLinux.org/OpenOCD_PandaBoard "OpenOCD PandaBoard")
-   [Snowball](http://eLinux.org/OpenOCD_Snowball "OpenOCD Snowball")

## External Links

[OpenOCD](http://openocd.sourceforge.net/) project.

[OpenOCD
source](http://openocd.git.sourceforge.net/git/gitweb.cgi?p=openocd/openocd;a=summary)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")
-   [OpenOCD](http://eLinux.org/Category:OpenOCD "Category:OpenOCD")

