> From: [eLinux.org](http://eLinux.org/Pollux:_FTDI_JTAG_How_To "http://eLinux.org/Pollux:_FTDI_JTAG_How_To")


# LeapFrog Pollux Platform: FTDI JTAG How To


(Redirected from [Pollux: FTDI JTAG How
To](http://eLinux.org/index.php?title=Pollux:_FTDI_JTAG_How_To&redirect=no "Pollux: FTDI JTAG How To"))


[![](http://eLinux.org/images/thumb/2/28/Didj_DLP_JTAG.JPG/350px-Didj_DLP_JTAG.JPG)](http://eLinux.org/File:Didj_DLP_JTAG.JPG)

[](http://eLinux.org/File:Didj_DLP_JTAG.JPG "Enlarge")

Didj FTDI2232 JTAG setup

## Contents

-   [1 Background](#background)
-   [2 Connecting](#connecting)
-   [3 Software Installation](#software-installation)
-   [4 Usage](#usage)
-   [5 Usage Examples](#usage-examples)
-   [6 Resources](#resources)
-   [7 References](#references)

## Background

I had been curious about JTAG ever since I started experimenting with
Didj. I had wondered about whether it could be used to investigate our
Pollux-based devices.

As we all progressed with our experimentation, Moogle [identified the
JTAG pads](http://wtfmoogle.com/?p=910) on Didj, and then bcav added [a
wiki entry](http://eLinux.org/Didj_JTAG_How_To "Didj JTAG How To") on how to use the JTAG
port to debug a bootloader on Didj with
[OpenOCD](http://openocd.berlios.de/web/) (Open On-Chip Debugger). We
later happily discovered that JTAG pads are clearly labeled on the
Leapster Explorer mainboard (in my book, its a Big Win whenever a
manufacturer acknowleges our [Fundamental
Rights!](http://cdn.makezine.com/make/MAKERS_RIGHTS.pdf))

I had JTAG experimentation on my list-of-things-to-try for a while, but
I didnt want to spend \$72 to buy the JTAG dongle bcav used in the wiki
entry. (I did have a home-made [wiggler
cable](http://nuwiki.openwrt.org/oldwiki/OpenWrtDocs/Customizing/Hardware/JTAG_Cable)
that I hacked together for use with WRT routers, but I wasn't confident
enough that it would fit the bill for this use case. Plus the speed over
a parallel port was not great)

Upon learning that that the ftdi2232 chip could be used to bitbang a
JTAG connection and that the same part powers many USB-based JTAG
cables, I purchased a \$30 breakout board that was based on that chip -
[DLP Design DLP-USB1232H](http://www.dlpdesign.com/usb/usb1232h.shtml)
([datasheet](http://www.dlpdesign.com/usb/usb1232h-ds-v13.pdf)).

What follows are the steps I used to make this breakout work with Didj,
LX, LPX, and the Pollux-based eGo netbooks.

**NOTE: if you aren't interested in wiring up your own usb JTAG using
the FT2232, you can purchase a [Flyswatter](http://eLinux.org/Flyswatter "Flyswatter")
from [TinCanTools](http://www.tincantools.com) for \$49.95**

## Connecting

[![](http://eLinux.org/images/thumb/9/9e/JTAG_PADS.jpg/150px-JTAG_PADS.jpg)](http://eLinux.org/File:JTAG_PADS.jpg)

[](http://eLinux.org/File:JTAG_PADS.jpg "Enlarge")

Didj JTAG pads

[![](http://eLinux.org/images/thumb/9/98/DidjTP103.png/150px-DidjTP103.png)](http://eLinux.org/File:DidjTP103.png)

[](http://eLinux.org/File:DidjTP103.png "Enlarge")

Didj nSRST pad on opposite side of mainboard from JTAG pads

[![](http://eLinux.org/images/thumb/f/f9/LX-JTAG.jpg/150px-LX-JTAG.jpg)](http://eLinux.org/File:LX-JTAG.jpg)

[](http://eLinux.org/File:LX-JTAG.jpg "Enlarge")

Leapster Explorer JTAG pads

[![](http://eLinux.org/images/thumb/9/94/LP-JTAG.png/150px-LP-JTAG.png)](http://eLinux.org/File:LP-JTAG.png)

[](http://eLinux.org/File:LP-JTAG.png "Enlarge")

LeapPad Explorer JTAG pads

[![](http://eLinux.org/images/thumb/0/00/Augen-eGo-732-JTAG-FRONT.png/150px-Augen-eGo-732-JTAG-FRONT.png)](http://eLinux.org/File:Augen-eGo-732-JTAG-FRONT.png)

[](http://eLinux.org/File:Augen-eGo-732-JTAG-FRONT.png "Enlarge")

Augen eGo 730-4 front JTAG pads

[![](http://eLinux.org/images/thumb/e/e7/Augen-eGo-732-JTAG-BACK.png/150px-Augen-eGo-732-JTAG-BACK.png)](http://eLinux.org/File:Augen-eGo-732-JTAG-BACK.png)

[](http://eLinux.org/File:Augen-eGo-732-JTAG-BACK.png "Enlarge")

Augen eGo 730-4 back JTAG pads

The table below illustrates how to connect the DLP-USB1232H device pins
to Didj, LX and the eGo. The pinout on the breakout is in the
[DLP-USB1232H datasheet](http://www.dlpdesign.com/usb1232h-ds-v12.pdf)
(pinout is on page 4 and page 7).

<table>
<thead>
<tr class="header">
<th align="left">Pin type</th>
<th align="left">DLP-USB1232H pin #</th>
<th align="left">Didj Test Pad label</th>
<th align="left">LX Test Pad label</th>
<th align="left">LPX Test Pad label</th>
<th align="left">eGo photo label</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><strong>TRST</strong></td>
<td align="left">17</td>
<td align="left">TP9</td>
<td align="left">RST</td>
<td align="left">RST</td>
<td align="left">nTRST</td>
</tr>
<tr class="even">
<td align="left"><strong>TDI</strong></td>
<td align="left">16</td>
<td align="left">TP10</td>
<td align="left">TDI</td>
<td align="left">TDI</td>
<td align="left">TDI</td>
</tr>
<tr class="odd">
<td align="left"><strong>TMS</strong></td>
<td align="left">5</td>
<td align="left">TP11</td>
<td align="left">TMS</td>
<td align="left">TMS</td>
<td align="left">TMS</td>
</tr>
<tr class="even">
<td align="left"><strong>TCK</strong></td>
<td align="left">18</td>
<td align="left">TP12</td>
<td align="left">TCK</td>
<td align="left">TCK</td>
<td align="left">TCK</td>
</tr>
<tr class="odd">
<td align="left"><strong>TDO</strong></td>
<td align="left">2</td>
<td align="left">TP13</td>
<td align="left">TDO</td>
<td align="left">TDO</td>
<td align="left">TDO</td>
</tr>
<tr class="even">
<td align="left"><strong>(S)RST</strong></td>
<td align="left">13</td>
<td align="left">TP103 [1]</td>
<td align="left">nRST</td>
<td align="left">nRST</td>
<td align="left">nPORST</td>
</tr>
<tr class="odd">
<td align="left"><strong>GND</strong></td>
<td align="left">Either 1 or 10</td>
<td align="left">TP14</td>
<td align="left">GND</td>
<td align="left">GND</td>
<td align="left">use any GND</td>
</tr>
</tbody>
</table>

**IMPORTANT:** You also need to **connect pins 8 and 9 together** on the
DLP-USB1232H module in order to configure it to be powered via USB.

[1] As an alternative to TP103, either side of R43 (jumper/0 Ohms) or
the right pad of R45 (unpopulated) works. This is near the other test
pads.

Also, the Didj or LX must be powered on.

## Software Installation

Install OpenOCD (examples are Ubuntu Lucid)

    $ sudo apt-get install openocd

Place this configuration file - name it dlp-usb1232h.cfg - into your
openocd /usr/share/openocd/scripts/interface directory:

` `

    #
    # DLP Design DLP-USB1232H USB-to-UART/FIFO interface module
    #
    # http://www.dlpdesign.com/usb/usb1232h.shtml
    #
    interface ft2232
    ft2232_device_desc "Dual RS232-HS"
    ft2232_layout usbjtag
    ft2232_vid_pid 0x0403 0x6010


 Place the file below, named openocd.cfg (originally described
[here](http://eLinux.org/Didj_JTAG_How_To "Didj JTAG How To")), into your home directory:
` `

    telnet port 4444
    source [find interface/dlp-usb1232h.cfg]
    jtag_khz 15000
    # length of reset signal: [ms]
    jtag_nsrst_assert_width 100
    # don't talk to JTAG after reset for: [ms]
    jtag_nsrst_delay 250
    reset_config trst_and_srst separate
    # end reset config
    if { [info exists CHIPNAME] } {
      set  _CHIPNAME $CHIPNAME
    } else {
      set  _CHIPNAME pollux
    }
    if { [info exists ENDIAN] } {
      set  _ENDIAN $ENDIAN
    } else {
      set  _ENDIAN little
    }
    if { [info exists CPUTAPID ] } {
      set _CPUTAPID $CPUTAPID
    } else {
      # force an error till we get a good number
      set _CPUTAPID 0x07926f0f
    }
    #jtag scan chain
    jtag newtap $_CHIPNAME cpu -irlen 4 -expected-id $_CPUTAPID
    set _TARGETNAME $_CHIPNAME.cpu
    target create $_TARGETNAME arm926ejs -endian $_ENDIAN -chain-position $_TARGETNAME -variant arm926ejs

## Usage

To launch OpenOCD from your home directory:

    $ sudo /usr/bin/openocd -s /usr/share/openocd/scripts


 To access OpenOCD directly, telnet to localhost port 4444:

    $ telnet localhost 4444

## Usage Examples

Read the registers using the 'mdw phys \<address\>' command in OpenOCD.
In this example we are reading the MLCCONTROL0 register:

` `

    >halt
    >mdw phys 0xc0004024
    0xc0004024: 86534024

To write registers, use 'mww phys \<address\> \<value\>' In this example
we are changing to the MLC to RGB888 mode, setting the H-stride and
V-stride appropriately, and then setting the dirty flag: ` `

    >halt
    >mww phys 0xc0004024 0x46534024
    >mww phys 0xc0004028 0x00000003
    >mww phys 0xc000402c 0x000003c0
    >mww phys 0xc0004024 0x4653d034

The reset command will restart the device:

    >reset

To debug bootloaders with GDB, see [Didj JTAG How
To](http://eLinux.org/Didj_JTAG_How_To "Didj JTAG How To").

## Resources

The DLP-USB1232H is available from various sources, e.g.:
[Digikey](http://digikey.com/scripts/dksus.dll?Detail&name=813-1026-ND),
[Mouser](http://mouser.com/Search/ProductDetail.aspx?qs=sGAEpiMZZMt/5FJRvmqHBjWi/VTYGDW6),
or [Saelig](http://www.saelig.com/product/UB068.htm).

The module can also be used as a cheap and simple [SPI BIOS chip
programmer](http://www.flashrom.org/FT2232SPI_Programmer) together with
the [flashrom](http://www.flashrom.org) utility.

## References

[Didj JTAG How To](http://eLinux.org/Didj_JTAG_How_To "Didj JTAG How To")

[DLP-USB1232H\_and\_OpenOCD\_based\_JTAG\_adapter](http://randomprojects.org/wiki/DLP-USB1232H_and_OpenOCD_based_JTAG_adapter)

[Low-cost Bitbang JTAG using the FTDI
FT232](http://vak.ru/doku.php/proj/bitbang/bitbang-jtag)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [Augen
    eGo](http://eLinux.org/index.php?title=Category:Augen_eGo&action=edit&redlink=1 "Category:Augen eGo (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

