> From: [eLinux.org](http://eLinux.org/Flyswatter "http://eLinux.org/Flyswatter")


# Flyswatter



## Contents

-   [1 Introduction](#introduction)
-   [2 Supported Devices](#supported-devices)
-   [3 JTAG Adapters](#jtag-adapters)
-   [4 Serial Port](#serial-port)
-   [5 Serial Port Interface](#serial-port-interface)
-   [6 Flyswatter How To](#flyswatter-how-to)
-   [7 Flyswatter2](#flyswatter2)

## Introduction

The Flyswatter [JTAG](../../.././dev_portals/Glossary/JTAG/JTAG.md "JTAG") board is a low cost
[USB](http://eLinux.org/index.php?title=USB&action=edit&redlink=1 "USB (page does not exist)")
based JTAG programmer for the Hammer
[CPU](http://eLinux.org/index.php?title=CPU&action=edit&redlink=1 "CPU (page does not exist)")
board. It can be used with all
[ARM](http://eLinux.org/index.php?title=ARM&action=edit&redlink=1 "ARM (page does not exist)")
processors that are supported by [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD"). It is
based upon
[FTDI](http://eLinux.org/index.php?title=FTDI&action=edit&redlink=1 "FTDI (page does not exist)")'s
popular
[FT2232](http://eLinux.org/index.php?title=FT2232&action=edit&redlink=1 "FT2232 (page does not exist)")
[USB](http://eLinux.org/index.php?title=USB&action=edit&redlink=1 "USB (page does not exist)")
[UART](http://eLinux.org/index.php?title=UART&action=edit&redlink=1 "UART (page does not exist)")/[FIFO](http://eLinux.org/index.php?title=FIFO&action=edit&redlink=1 "FIFO (page does not exist)")
IC. The Flyswatter provides a standard JTAG interface as well as a
standard
[RS232](http://eLinux.org/index.php?title=RS232&action=edit&redlink=1 "RS232 (page does not exist)")
port with support for full
[modem](http://eLinux.org/index.php?title=Modem&action=edit&redlink=1 "Modem (page does not exist)")
signals.

[![640px-Flyswatter OpenOCd
debugger.jpg](http://eLinux.org/images/3/35/640px-Flyswatter_OpenOCd_debugger.jpg)](http://eLinux.org/File:640px-Flyswatter_OpenOCd_debugger.jpg)

available from [TinCanTools](http://www.tincantools.com/) at
[http://www.tincantools.com/JTAG/Flyswatter.html](http://www.tincantools.com/JTAG/Flyswatter.html)

Features:

-   [USB](http://eLinux.org/index.php?title=USB&action=edit&redlink=1 "USB (page does not exist)")
    2.0 Full Speed device (12 Mbits/sec) interface
-   Can be used to debug and program all ARM processors supported by
    OpenOCD
-   Provides a standard 2x7 pin JTAG interface
-   Adds a virtual RS232 serial port to your computer or laptop with
    full modem signals: TXD, RXD, RTS, CTS, DTR, DSR, DCD, RI
-   Supports ARM target voltages of: 3.3V, 2.5V, 1.8V, 1.5V, 1.2V
    (voltage range: 1.2V to 3.6V)
-   Adds a virtual RS232 serial port to your computer or laptop with all
    of the modem signals: DTR, DSR, DCD, RTS, CTS, Rx, Tx
-   No external power supply required – it runs off of the USB voltage
    from the computer
-   Open hardware – complete schematic provided
-   Open software - software supported by OpenOCD (open source) debugger
-   Included CD comes with OpenOCD for Linux
-   Dimensions: 2.5 inches (width) x 3.0 inches (height)
-   Package Includes: Flyswatter board, USB Cable, 8 inch JTAG ribbon
    cable (14 pin - 2x7)



## Supported Devices

OpenOCD supports the following
[ARM](http://eLinux.org/index.php?title=ARM&action=edit&redlink=1 "ARM (page does not exist)")
cores:

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


 OpenOCD also supports the following
[MIPS](http://eLinux.org/index.php?title=MIPS&action=edit&redlink=1 "MIPS (page does not exist)")
cores (requires a MIPS 14-Pin JTAG Adapter):

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
<td align="left">M4K</td>
</tr>
</tbody>
</table>

## JTAG Adapters

JTAG Adapters plug into the ARM 14-pin connector located on the
Flyswatter and change the pin-out to a different JTAG interface. Three
JTAG adapters are available for the Flyswatter:



[![](http://eLinux.org/images/thumb/d/d0/ARM_20-Pin_Adapter.jpg/150px-ARM_20-Pin_Adapter.jpg)](http://eLinux.org/File:ARM_20-Pin_Adapter.jpg)

[](http://eLinux.org/File:ARM_20-Pin_Adapter.jpg "Enlarge")

ARM 20 pin JTAG Adapter

**ARM 20-Pin JTAG Adapter -**This adapter converts the Flyswatter's JTAG
interface into a standard ARM 20-pin configuration. The package also
includes 14-pin ribbon cable.










[![](http://eLinux.org/images/thumb/f/f0/BeagleBoard_Adapter.jpg/150px-BeagleBoard_Adapter.jpg)](http://eLinux.org/File:BeagleBoard_Adapter.jpg)

[](http://eLinux.org/File:BeagleBoard_Adapter.jpg "Enlarge")

BeagleBoard JTAG Adapter

**BeagleBoard JTAG Adapter -**This adapter converts the Flyswatter's
JTAG interface into a standard TI 14-pin JTAG configuration. The package
also includes a serial adapter board that converts the DB-9 Male
connector located on the Flyswatter to a 10-Pin ribbon cable. This
ribbon cable is used on the BeagleBoard Rev B/C boards to interface to
the serial port. The 10-pin ribbon cable is included in the package.








[![](http://eLinux.org/images/thumb/0/05/MIPS_14-Pin_Adapter.jpg/150px-MIPS_14-Pin_Adapter.jpg)](http://eLinux.org/File:MIPS_14-Pin_Adapter.jpg)

[](http://eLinux.org/File:MIPS_14-Pin_Adapter.jpg "Enlarge")

MIPS 14-Pin JTAG Adapter

**MIPS 14-Pin JTAG Adapter -**This adapter converts the Flyswatter's
JTAG interface into a standard MIPS 14-pin JTAG configuration. The
package also includes 14-pin ribbon cable.



## Serial Port

The Flyswatter's serial port provides you with an independent functional
"USB to RS-232" serial device. The serial port is completely independent
from OpenOCD on both Linux and Windows. You can use the Flyswatter's
serial port and never have to use OpenOCD or JTAG, or you can use it
together with OpenOCD and have both a serial port and JTAG interface
operating at the same time for debugging your target device.

For Linux, the RS232 driver for the FT2232 is part of the main kernel
tree and is provided in most standard Linux distributions. In Windows,
you have to load the Windows driver for the FT2232. Once the driver is
loaded, Windows will assign a virtual COM port to the Flyswatter's
serial port. It operates just like a standard COM port. You can use the
Flyswatter's serial port on laptops or PC's that do not have a 9-pin
legacy serial connector.



## Serial Port Interface

You can use [Minicom](http://eLinux.org/Minicom "Minicom") to communicate with the
Flyswatter's serial port on Linux. See the [Minicom](http://eLinux.org/Minicom "Minicom")
page for setup instructions.

Documents:

-   [JTAG Connector Pin
    Assignments](http://eLinux.org/images/b/b2/Jtag_pin_assignments.pdf "Jtag pin assignments.pdf")
-   [Flyswatter schematic
    diagram](http://eLinux.org/images/4/46/Flyswatter-schematic.pdf "Flyswatter-schematic.pdf")

Source Code:

-   [OpenOCD Source](http://eLinux.org/images/8/80/Openocd.tar.gz "Openocd.tar.gz")
-   [LibFTD2xx library
    files](http://eLinux.org/images/1/11/Libftd2xx0.4.13.tar.gz "Libftd2xx0.4.13.tar.gz")

available from
[TinCanTools](http://www.tincantools.com/product.php?productid=16134&cat=0&page=1&featured)

Devices that have been tested:

-   [Hammer](../../.././dev_portals/Development_Platforms/Hammer_Board/Hammer_Board.md "Hammer Board"): Supported by the software
    kit/tools that come with the Hammer
-   NSLU2: requires a [JTAG](../../.././dev_portals/Glossary/JTAG/JTAG.md "JTAG") connection to be added to the
    [NSLU2](http://www.nslu2-linux.org/wiki/Info/PinoutOfJTAGPort) and
    nslu2.cfg, nslu2.ocd and Debug\_handler.bin files. You can use these
    [samples](http://eLinux.org/images/f/fc/Nslu2.tar.gz "Nslu2.tar.gz"), but may need to
    edit the nslu2.ocd as appropriate.
-   [Zipit Z2](http://zipit2system.sourceforge.net/): requires soldering
    directly to the [Z2 board](http://eLinux.org/images/9/91/Z2jtag.jpg "Z2jtag.jpg"),
    and using [z2.cfg](http://eLinux.org/images/1/11/Z2cfg.cfg "Z2cfg.cfg") and following
    this [how-to](http://eLinux.org/images/2/29/Jtag.z2.txt "Jtag.z2.txt").



## [Flyswatter How To](http://eLinux.org/Flyswatter_How_To "Flyswatter How To")

The [Flyswatter How To](http://eLinux.org/Flyswatter_How_To "Flyswatter How To") and
[Flyswatter Windows How
To](http://eLinux.org/Flyswatter_Windows_How_To "Flyswatter Windows How To") guides show
a new user how to connect the Flyswatter to the Beagleboard, and how to
install and run [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD") and [GDB
Debugger](http://eLinux.org/GDB_Debugger "GDB Debugger"). To reach the guide, follow the
link in the section title.



## [Flyswatter2](http://eLinux.org/Flyswatter2 "Flyswatter2")

[TinCanTools](http://www.tincantools.com/) has a new JTAG debugger at
[Flyswatter2](http://www.tincantools.com/product.php?productid=16153&cat=0&page=1&featured)
that has support for OpenOCD and ARM Cortex A8 processors: OMAP3530
BeagleBoard and DM3730 BeagleBoard-xM. The Flyswatter2 is 5 to 10 times
faster than the original Flyswatter.

They also have a [ARM20TI14 JTAG
Adapter](http://www.tincantools.com/product.php?productid=16154&cat=251&page=1).
This JTAG adapter board works with the
[BeagleBoard](../../../hardware_pages/BeagleBoard/BeagleBoard.md "BeagleBoard") and BeagleBoard-xM.

The Flyswatter2 can be used with
[OpenOCD](../../../hardware_pages/BeagleBoard/BeagleBoard.mdJTAG#Open_source_JTAG_software "BeagleBoardJTAG")
(Beagle (OMAP3xx) support is complete).

To use the Flyswatter2 under Ubuntu (and derivatives) without superuser
rights, place this in /etc/udev/rules.d/60-flyswatter2.rules (or
whatever name you like):

    SUBSYSTEM=="usb", ACTION=="add", ENV{DEVTYPE}=="usb_device", \
    SYSFS{idVendor}=="0403", SYSFS{idProduct}=="6010", MODE="0666"

Maybe it also works for the original Flyswatter, but not yet verified.
If not, the idVendor and idProduct values must be adjusted.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")
-   [Flyswatter](http://eLinux.org/index.php?title=Category:Flyswatter&action=edit&redlink=1 "Category:Flyswatter (page does not exist)")

