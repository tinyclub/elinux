> From: [eLinux.org](http://eLinux.org/Flyswatter2 "http://eLinux.org/Flyswatter2")


# Flyswatter2



## Contents

-   [1 Introduction](#introduction)
-   [2 Purchase](#purchase)
-   [3 Features](#features)
    -   [3.1 Supported Devices](#supported-devices)
-   [4 JTAG Interface](#jtag-interface)
    -   [4.1 JTAG Connector Pinout](#jtag-connector-pinout)
-   [5 Serial Port Interface](#serial-port-interface)
-   [6 Flyswatter2 How To Guides](#flyswatter2-how-to-guides)
    -   [6.1 Olimex LPC-P2148 - Linux](#olimex-lpc-p2148-linux)
    -   [6.2 Olimex LPC-P2148 - Windows](#olimex-lpc-p2148-windows)
    -   [6.3 Olimex PIC-P32MX - Linux](#olimex-pic-p32mx-linux)
    -   [6.4 Olimex PIC-P32MX - Windows](#olimex-pic-p32mx-windows)
    -   [6.5 Beagleboard - Linux](#beagleboard-linux)
    -   [6.6 Beagleboard - Windows](#beagleboard-windows)
    -   [6.7 Beagleboard XM - Linux](#beagleboard-xm-linux)
    -   [6.8 Beagleboard XM - Windows](#beagleboard-xm-windows)
    -   [6.9 BeagleBone - Linux](#beaglebone-linux)
    -   [6.10 Pandaboard - Linux](#pandaboard-linux)
    -   [6.11 Pandaboard - Windows](#pandaboard-windows)
    -   [6.12 RouterStation Pro - Linux](#routerstation-pro-linux)
    -   [6.13 RouterStation Pro - Windows](#routerstation-pro-windows)

# Introduction

The TinCanTools Flyswatter2 is an high performance
[USB](http://eLinux.org/index.php?title=USB&action=edit&redlink=1 "USB (page does not exist)")
to [JTAG](http://eLinux.org/JTAG "JTAG") in-circuit debugger and programmer designed for
use with
[ARM](http://eLinux.org/index.php?title=ARM&action=edit&redlink=1 "ARM (page does not exist)")
and
[MIPS](http://eLinux.org/index.php?title=MIPS&action=edit&redlink=1 "MIPS (page does not exist)")
target devices. It uses the open source [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD")
(Open On-Chip Debugger) software to provide debugging and in-system
programming of embedded target devices.

[![Flyswatter2.png](http://eLinux.org/images/4/48/Flyswatter2.png)](http://eLinux.org/File:Flyswatter2.png)



# Purchase

The Flyswatter2 is available for purchase directly from

[TinCanTools](http://tincantools.com/) (
[http://www.tincantools.com/JTAG/Flyswatter2.html](http://www.tincantools.com/JTAG/Flyswatter2.html)
) or from one of several
[Distributors](http://tincantools.com/pages.php?pageid=12)



# Features

-   USB 2.0 Hi-speed device interface (480 Mbits/sec)
-   Can be used to debug and program all ARM and MIPS processors
    supported by [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD")
-   Provides a standard ARM 20-pin JTAG interface connector (Male
    shrouded header, 2 rows x 10 pins)
-   Adds a virtual RS232 serial port to your computer or laptop with
    full modem signals: TXD, RXD, RTS, CTS, DTR, DSR, DCD, RI
-   Supports target voltages of: 5.0V, 3.3V, 2.5V, 1.8V, 1.6V (voltage
    range: 1.6V to 5.0V)
-   No external power supply required – the Flyswatter2 gets its power
    from the computer's USB port
-   Uses open source software: OpenOCD - Open On-Chip Debugger debugger
    software
-   Package Includes: Flyswatter2, USB Cable, 12 inch serial cable, and
    8 inch 20-pin JTAG ribbon cable
-   Compact Size: 3.15 inches (width) x 2.7 inches (length) x 0.8 inches
    (height)



## Supported Devices

OpenOCD supports the following ARM cores:

<table>
<thead>
<tr class="header">
<th align="left">ARM CORE</th>
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
</tbody>
</table>


 OpenOCD also supports the following MIPS cores (requires a ARM20MIPS14
MIPS JTAG Adapter):

<table>
<thead>
<tr class="header">
<th align="left">MIPS CORE</th>
<th align="left">EXAMPLE PROCESSORS</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">MIPS</td>
<td align="left">M4K, MIPS32</td>
</tr>
</tbody>
</table>



# JTAG Interface

The Flyswatter provides a standard ARM-compatible 20-pin JTAG interface.
The JTAG interface connects to the target device with a 20-pin ribbon
cable. This connection enables access to the on-chip debug module which
is integrated into the ARM CPU. The debug module enables a programmer to
debug the software on an embedded target system.

The second purpose of the JTAG interface is to allow the programming of
[NOR](http://eLinux.org/index.php?title=NOR&action=edit&redlink=1 "NOR (page does not exist)")
and
[NAND](http://eLinux.org/index.php?title=NAND&action=edit&redlink=1 "NAND (page does not exist)")
[FLASH](http://eLinux.org/index.php?title=FLASH&action=edit&redlink=1 "FLASH (page does not exist)")
memory devices that are connected to or embedded within the target
[CPU](http://eLinux.org/index.php?title=CPU&action=edit&redlink=1 "CPU (page does not exist)").



## JTAG Connector Pinout

# Serial Port Interface

The Flyswatter2's serial port provides you with an independent
functional "USB to RS-232" serial device. The serial port is completely
independent from OpenOCD on both Linux and Windows. You can use the
Flyswatter2's serial port without having to use OpenOCD or JTAG, or you
can use it together with OpenOCD and have both a serial port and JTAG
interface operating at the same time for debugging and communicating
with your target device.

For Linux, the RS232 driver for the FT2232 is part of the main kernel
tree and is provided in most standard Linux distributions. In Windows,
you have to load the Windows driver for the FT2232. Once the driver is
loaded, Windows will assign a virtual COM port to the Flyswatter2's
serial port. It operates just like a standard COM port. You can use the
Flyswatter2's serial port on laptops or PC's that do not have a 9-pin
legacy serial connector.

Supports all standard baud rates: 300, 1200, 2400, 4800, 9600, 19200,
38400, 57600, 115200

You can use [Minicom](http://eLinux.org/Minicom "Minicom") to communicate with the
Flyswatter2's serial port on Linux. See the
[Minicom](http://eLinux.org/Minicom "Minicom") page for setup instructions.



# Flyswatter2 How To Guides

[![Fs2 lpc2148
connected.png](http://eLinux.org/images/thumb/8/8d/Fs2_lpc2148_connected.png/250px-Fs2_lpc2148_connected.png)](http://eLinux.org/File:Fs2_lpc2148_connected.png)

### [Olimex LPC-P2148 - Linux](http://eLinux.org/Flyswatter2_LPC2148_How_To "Flyswatter2 LPC2148 How To")

### [Olimex LPC-P2148 - Windows](http://eLinux.org/Flyswatter2_LPC2148_Windows_How_To "Flyswatter2 LPC2148 Windows How To")

These guides walk a first time user through connecting the Flyswatter2
to the [Olimex LPC-P2148 Prototype
Board](http://www.olimex.com/dev/lpc-p2148.html), and installing and
running [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD") and [GDB
Debugger](http://eLinux.org/GDB_Debugger "GDB Debugger").



[![Fs2 pic32mx
connected.png](http://eLinux.org/images/b/b0/Fs2_pic32mx_connected.png)](http://eLinux.org/File:Fs2_pic32mx_connected.png)

### [Olimex PIC-P32MX - Linux](http://eLinux.org/Flyswatter2_PIC32MX_How_To "Flyswatter2 PIC32MX How To")

### [Olimex PIC-P32MX - Windows](http://eLinux.org/Flyswatter2_PIC32MX_Windows_How_To "Flyswatter2 PIC32MX Windows How To")

These guides walk a first time user through connecting the Flyswatter2
to the [Olimex PIC-P32MX
board](http://www.olimex.com/dev/pdf/PIC/PIC-32MX.pdf), and installing
and running [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD") and [GDB
Debugger](http://eLinux.org/GDB_Debugger "GDB Debugger").



[![Fs2 beagle
bothcables.png](http://eLinux.org/images/thumb/3/34/Fs2_beagle_bothcables.png/250px-Fs2_beagle_bothcables.png)](http://eLinux.org/File:Fs2_beagle_bothcables.png)

### [Beagleboard - Linux](http://eLinux.org/Flyswatter2_Beagleboard_How_To "Flyswatter2 Beagleboard How To")

### [Beagleboard - Windows](http://eLinux.org/Flyswatter2_Beagleboard_Windows_How_To "Flyswatter2 Beagleboard Windows How To")

These guides provide a first time user with instructions for the
Beagleboard, and installing and running [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD")
and [GDB Debugger](http://eLinux.org/GDB_Debugger "GDB Debugger").



[![Fs2 beaglexm
bothcables.png](http://eLinux.org/images/thumb/e/e1/Fs2_beaglexm_bothcables.png/250px-Fs2_beaglexm_bothcables.png)](http://eLinux.org/File:Fs2_beaglexm_bothcables.png)

### [Beagleboard XM - Linux](http://eLinux.org/Flyswatter2_Beagleboard_XM_How_To "Flyswatter2 Beagleboard XM How To")

### [Beagleboard XM - Windows](http://eLinux.org/Flyswatter2_Beagleboard_XM_Windows_How_To "Flyswatter2 Beagleboard XM Windows How To")

These guides provide a first time user with instructions for the [TI
Beagleboard XM](http://beagleboard.org/static/BBxMSRM_latest.pdf), and
installing and running [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD") and [GDB
Debugger](http://eLinux.org/GDB_Debugger "GDB Debugger").

[![Fs2 bone
connected.jpg](http://eLinux.org/images/thumb/c/cb/Fs2_bone_connected.jpg/250px-Fs2_bone_connected.jpg)](http://eLinux.org/File:Fs2_bone_connected.jpg)

### [BeagleBone - Linux](http://eLinux.org/Flyswatter2_BeagleBone_How_To "Flyswatter2 BeagleBone How To")

This guide provides a first time user with instructions for the [TI
Beagleboard XM](http://beagleboard.org/static/BBxMSRM_latest.pdf), and
installing and running [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD") and [GDB
Debugger](http://eLinux.org/GDB_Debugger "GDB Debugger").

[![Fs2 panda
bothcables.png](http://eLinux.org/images/a/aa/Fs2_panda_bothcables.png)](http://eLinux.org/File:Fs2_panda_bothcables.png)

### [Pandaboard - Linux](http://eLinux.org/Flyswatter2_Pandaboard_How_To "Flyswatter2 Pandaboard How To")

### [Pandaboard - Windows](http://eLinux.org/Flyswatter2_Pandaboard_Windows_How_To "Flyswatter2 Pandaboard Windows How To")

These guides provide a first time user with instructions for the [TI
Pandaboard](http://www.pandaboard.org/), and installing and running
[OpenOCD](http://eLinux.org/OpenOCD "OpenOCD") and [GDB
Debugger](http://eLinux.org/GDB_Debugger "GDB Debugger").



[![Fs2 rspro
bothcables.png](http://eLinux.org/images/3/30/Fs2_rspro_bothcables.png)](http://eLinux.org/File:Fs2_rspro_bothcables.png)

### [RouterStation Pro - Linux](http://eLinux.org/Flyswatter2_RouterStationPro_How_To "Flyswatter2 RouterStationPro How To")

### [RouterStation Pro - Windows](http://eLinux.org/Flyswatter2_RouterStationPro_Windows_How_To "Flyswatter2 RouterStationPro Windows How To")

These guides walk a first time user through connecting the Flyswatter2
to the [Ubiquiti RouterStation
Pro](http://www.mips.com/products/development-kits/linux-starter-kit/),
and installing and running [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD") and [GDB
Debugger](http://eLinux.org/GDB_Debugger "GDB Debugger").


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")
-   [OpenOCD](http://eLinux.org/Category:OpenOCD "Category:OpenOCD")

