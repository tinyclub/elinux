> From: [eLinux.org](http://eLinux.org/A13_OLinuXino-MICRO "http://eLinux.org/A13_OLinuXino-MICRO")


# A13 OLinuXino-MICRO





## Contents

-   [1 JTAG support](#jtag-support)
    -   [1.1 Cabling](#cabling)
    -   [1.2 BDI-2000/3000](#bdi-2000-3000)
    -   [1.3 Flyswatter 2 / OpenOCD](#flyswatter-2-openocd)
-   [2 Boot Layout](#boot-layout)

## JTAG support

The A13 OLinuXino-MICRO has JTAG support brought out to an unpopulated
6-pin header next to the headphone jack. Solder a piece of header strip
and it's ready to go.

### Cabling

The table below shows the pinout for the proprietary JTAG header on the
board. All pins are clearly silkscreened on the bottom of the board.

<table>
<thead>
<tr class="header">
<th align="left">A13 OLinuXino JTAG</th>
<th align="left">Pin</th>
<th align="left">JTAG Signal</th>
<th align="left">ARM 20-pin JTAG</th>
<th align="left">ARM 14-pin</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">GND</td>
<td align="left">1</td>
<td align="left">GND</td>
<td align="left">10</td>
<td align="left">10</td>
</tr>
<tr class="even">
<td align="left">TDO</td>
<td align="left">2</td>
<td align="left">TDO</td>
<td align="left">13</td>
<td align="left">11</td>
</tr>
<tr class="odd">
<td align="left">TCK</td>
<td align="left">3</td>
<td align="left">TCK</td>
<td align="left">9</td>
<td align="left">9</td>
</tr>
<tr class="even">
<td align="left">TMS</td>
<td align="left">4</td>
<td align="left">TMS</td>
<td align="left">7</td>
<td align="left">7</td>
</tr>
<tr class="odd">
<td align="left">TDI</td>
<td align="left">5</td>
<td align="left">TDI</td>
<td align="left">5</td>
<td align="left">5</td>
</tr>
<tr class="even">
<td align="left">3.3V</td>
<td align="left">6</td>
<td align="left">3.3V</td>
<td align="left"> 1</td>
<td align="left">1</td>
</tr>
</tbody>
</table>

### BDI-2000/3000

The [A13 OLinuXino-MICRO BDI config
file](https://github.com/ohporter/bdi_configs/blob/master/a13-olinuxino-micro.cfg)
can be used with a BDI configured with the ARM11/Cortex-An firmware and
the standard BDI ARM/Xscale 20-pin JTAG cable.

[![BDI2000 to A13 OLinuXino JTAG
cabling](http://eLinux.org/images/thumb/d/d4/Bdia13jtag.jpg/600px-Bdia13jtag.jpg)](http://eLinux.org/File:Bdia13jtag.jpg "BDI2000 to A13 OLinuXino JTAG cabling")

### Flyswatter 2 / OpenOCD

The [A13 OLinuXino OpenOCD config
file](https://github.com/ohporter/openocd_configs/blob/master/a13-olinuxino.cfg)
can be used with a [Flyswatter](../../.././dev_portals/Hardware_Hacking/Flyswatter/Flyswatter.md "Flyswatter"),
[OpenOCD](http://eLinux.org/OpenOCD "OpenOCD"), and the ARM 20-pin JTAG on the Flyswatter
2.

Usage:

     openocd -f interface/flyswatter2.cfg -f /tmp/a13-olinuxino.cfg

[![Flyswatter 2 to A13 OLinuXino JTAG
cabling](http://eLinux.org/images/thumb/c/cd/Fs2a13jtag.jpg/600px-Fs2a13jtag.jpg)](http://eLinux.org/File:Fs2a13jtag.jpg "Flyswatter 2 to A13 OLinuXino JTAG cabling")

## Boot Layout

The device doesn't have internal storage and boots from the SD-card. The
second and third stage loader (SPL and U-Boot) are loaded from the start
of the MMC (not on a file system). The default configuration is to
create two partitions the first is a FAT formatted one where u-boot will
load files from and the second one probably a ext2 partition. But given
the bootloaders are not on the FAT you need to reserve some space at the
start (I leave 2048 512 byte blokcs at the start as this is the default
fdisk offers).

The layout looks something like this:

<table>
<thead>
<tr class="header">
<th align="left">NAME</th>
<th align="left">start block</th>
<th align="left">size</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">MBR</td>
<td align="left">0</td>
<td align="left">1 block</td>
</tr>
<tr class="even">
<td align="left">sunxi-spl.bin</td>
<td align="left">16</td>
<td align="left">20K</td>
</tr>
<tr class="odd">
<td align="left">u-boot.bin</td>
<td align="left">64</td>
<td align="left">170K</td>
</tr>
<tr class="even">
<td align="left">FAT</td>
<td align="left">2048</td>
<td align="left">20M</td>
</tr>
<tr class="odd">
<td align="left">EXT2</td>
<td align="left">---</td>
<td align="left">Rest</td>
</tr>
</tbody>
</table>


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Flyswatter](http://eLinux.org/index.php?title=Category:Flyswatter&action=edit&redlink=1 "Category:Flyswatter (page does not exist)")
-   [HOWTOs](http://eLinux.org/Category:HOWTOs "Category:HOWTOs")

