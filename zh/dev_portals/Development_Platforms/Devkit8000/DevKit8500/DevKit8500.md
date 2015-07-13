> From: [eLinux.org](http://eLinux.org/DevKit8500 "http://eLinux.org/DevKit8500")


# DevKit8500



[elinux\_Devkit8500\_中文版本页面](http://www.elinux.org/Devkit8500)

## Contents

-   [1 **Devkit8500D/A Board
    Overview**](#devkit8500d-a-board-overview)
-   [2 **Hardware**](#hardware)
    -   [2.1 Onboard Interfaces and
        Connectors](#onboard-interfaces-and-connectors)
    -   [2.2 Hardware Features](#hardware-features)
        -   [2.2.1 Mechanical Parameters](#mechanical-parameters)
        -   [2.2.2 Processor](#processor)
        -   [2.2.3 Memory and Storage](#memory-and-storage)
        -   [2.2.4 Audio/Video Interfaces](#audio-video-interfaces)
        -   [2.2.5 Data Transfer Interfaces](#data-transfer-interfaces)
        -   [2.2.6 Input/Output Interfaces and Other
            Facilities](#input-output-interfaces-and-other-facilities)
-   [3 Extension Modules/Emulator
    Support](#extension-modules-emulator-support)
-   [4 **FAQ**](#faq)
-   [5 **Other Embest Products based on TI
    Processors**](#other-embest-products-based-on-ti-processors)

# **Devkit8500D/A Board Overview**

[Embest](http://www.armkits.com)
[DevKit8500D](http://www.armkits.com/Product/devkit8500d.asp) Evaluation
Board takes full features of the 1GHz [Texas Instruments'
DM3730](http://focus.ti.com/docs/prod/folders/print/dm3730.html) ARM
Cortex-A8 DaVinci™ digital media processor and supports up to 512MByte
DDR SDRAM and 512MByte NAND Flash as well as a reserved iNAND design to
expand the flash storage capabilities. The board has exposed many other
hardware interfaces including serial ports, LCD/TSP, DVI-D, S-Video,
Ethernet, USB, TF, keyboard, camera, SPI, I2C and JTAG. The board is
able to support for Linux 2.6.32 and WinCE 6.0 operating systems. It has
two methods to boot Linux and WinCE systems from either TF card or NAND
flash. Besides, it is provided with Android 2.2 demo with driver source
code. [Embest](http://www.armkits.com) gives instructions on how to boot
Android demo image from NAND flash with TF card.

The board supports using
[XDS100v2](http://www.armkits.com/Product/xds100.asp) USB JTAG Emulator
for debugging which is available from [Embest](http://www.armkits.com).
[Embest](http://www.armkits.com) also offers 4.3-inch or 7-inch LCD with
touch screen and various modules for options including VGA, WiFi, Analog
Camera, GPS, GPRS, 3G and Digital Camera modules which greatly extends
the functions of the board and would be flexible for customer selection
to meet their own needs.

The [TI's
DM3730](http://focus.ti.com/docs/prod/folders/print/dm3730.html)
processor is pin-to-pin compatible with [TI's
AM3715](http://www.ti.com/product/am3715) processor, Embest also
supplies the board with the AM3715 CPU and this board is called
[DevKit8500A](http://www.armkits.com/Product/devkit8500d.asp).

[![Devkit8500d.gif](http://eLinux.org/images/7/7b/Devkit8500d.gif)](http://eLinux.org/File:Devkit8500d.gif)

# **Hardware**

## Onboard Interfaces and Connectors

[![Devkit8500header.gif](http://eLinux.org/images/0/02/Devkit8500header.gif)](http://eLinux.org/File:Devkit8500header.gif)

## Hardware Features

### Mechanical Parameters

-   Dimensions: 136.2mm x 105.3mm
-   Power Supply: +5V
-   Working Temp.: 0\~70°C
-   TI DM3730 DaVinci Digital Media Processor (pin-to-pin compatible
    with TI AM3715)

### Processor

- Up to 1-GHz ARM® Cortex™-A8 Core, also supports 300, 600, and 800-MHz
operation
 - Up to 800-MHz TMS320C64x+™ DSP Core, Also supports 260, 520 and
660-MHz operation
 - NEON™ SIMD Coprocessor (DM3730 only)
 - POWERVR SGX™ Graphics Accelerator
 - ARM: 32KB I-Cache; 32KB D-Cache; 256KB L2 Cache
 - Onchip 32KB ROM and 64KB Shared SDRAM

### Memory and Storage

-   512MB DDR SDRAM, 32bit, 200MHz
-   512MB NAND Flash, 16bit
-   2GB iNAND, 4bit (Default: not soldered, optional, reserved for
    soldering)

### Audio/Video Interfaces

-   LCD/Touch Screen interface (50-pin FPC connector, support resolution
    up to 2048\*2048)
-   DVI high-resolution image output port (HDMI interface, support 720p,
    30fps signal)
-   One S-Video display interface
-   One audio input interface (3.5mm audio jack)
-   One 2-channel audio output interface (3.5mm audio jack)
-   One camera interface (30-pin FPC connector, support CCD or CMOS
    camera)

### Data Transfer Interfaces

-   One 5 line Debug serial port, RS232 (DB9 connector)
-   One 10/100M Ethernet interface (RJ45)
-   One High-speed USB2.0 OTG port (Mini USB type interface)
-   Four High-speed USB2.0 Host port (USB A type interface)
-   TF card slot

### Input/Output Interfaces and Other Facilities

-   6\*6 keyboard interface
-   One 14-pin Jtag interface
-   Four buttons (One for Reset, one for Wakeup and two for User
    defined)
-   One expansion connector (2.0mm 40-pin SMT Female Pin Header)

- Two 5 line serial ports, TTL voltage
 - One channel McSPI Interface (Multichannel Serial Port Interface)
 - One channel McBSP interface (Multi-Channel Buffered Serial Port)
 - One channel I2C interface
 - One channel HDQ interface (HDQ/1-Wire)

-   GPIO (there are total 33 GPIOs if the expansion interface pins are
    all used for GPIOs)

# Extension Modules/Emulator Support

**PS: \*=provided with source code, \#=no source code provided**

<table>
<tbody>
<tr class="odd">
<td align="left">Item</td>
<td align="left">Linux</td>
<td align="left">Android</td>
<td align="left">WinCE</td>
<td align="left">Remark</td>
</tr>
<tr class="even">
<td align="left">VGA8000 (RGB converts to VGA module) <br /><a href="http://elinux.org/File:VGA-P.jpg"><img src="http://elinux.org/images/9/94/VGA-P.jpg" alt="VGA-P.jpg" /></a></td>
<td align="left">YES*</td>
<td align="left">NO</td>
<td align="left">YES*</td>
<td align="left">Provided in DevKit8500 DVD</td>
</tr>
<tr class="odd">
<td align="left">WF8000-U (WiFi USB module) <br /><a href="http://elinux.org/File:WIFI8000-P.jpg"><img src="http://elinux.org/images/f/f3/WIFI8000-P.jpg" alt="WIFI8000-P.jpg" /></a></td>
<td align="left">YES*</td>
<td align="left">YES*</td>
<td align="left">YES#</td>
<td align="left">Provided in single CD</td>
</tr>
<tr class="even">
<td align="left">GPRS8000-S (Supports SIM card Dial, message sending) <br /><a href="http://elinux.org/File:GPS8000-P.jpg"><img src="http://elinux.org/images/4/4a/GPS8000-P.jpg" alt="GPS8000-P.jpg" /></a></td>
<td align="left">YES*</td>
<td align="left">NO</td>
<td align="left">YES*</td>
<td align="left"><a href="http://www.timll.com/chinese/uploadFile/GPRS8000.rar">Click and Download</a></td>
</tr>
<tr class="odd">
<td align="left">GPS8000-S (Real-time acquisition of GPS signal)<br /><a href="http://elinux.org/File:GPRS8000-P.jpg"><img src="http://elinux.org/images/2/2a/GPRS8000-P.jpg" alt="GPRS8000-P.jpg" /></a></td>
<td align="left">YES*</td>
<td align="left">YES*</td>
<td align="left">YES*</td>
<td align="left"><a href="http://www.timll.com/chinese/uploadFile/GPS8000.rar">Click and Download</a></td>
</tr>
<tr class="even">
<td align="left">CAM8000-A (Real-time acquisition of analog camera signal, PAL/NTSC, BT.656 communication)<br /><a href="http://elinux.org/File:CAM8000-P.jpg"><img src="http://elinux.org/images/9/97/CAM8000-P.jpg" alt="CAM8000-P.jpg" /></a></td>
<td align="left">YES*</td>
<td align="left">NO</td>
<td align="left">YES*</td>
<td align="left">Provided in DevKit8500 DVD</td>
</tr>
<tr class="odd">
<td align="left">CAM8000-D (Real-time acquisition of digital camera singal, 2 megapixel, BT.601 communication)<br /></td>
<td align="left">YES#</td>
<td align="left">YES#</td>
<td align="left">YES*</td>
<td align="left">Provided in single CD</td>
</tr>
<tr class="even">
<td align="left">CAM8100-U (Real-time acquisition of digital camera singal, 1.3 megapixel, USB communication)<br /></td>
<td align="left">YES*</td>
<td align="left">YES*</td>
<td align="left">YES#</td>
<td align="left">Provided in single CD</td>
</tr>
<tr class="odd">
<td align="left">CDMA8000-U (supports CDMA internet surf）</td>
<td align="left">YES*</td>
<td align="left">YES*</td>
<td align="left">YES#</td>
<td align="left"><a href="http://www.timll.com/chinese/uploadFile/cdma8000.rar">Click and Download</a></td>
</tr>
<tr class="even">
<td align="left">WCDMA8000-U (supports WCDMA internet surf)</td>
<td align="left">YES*</td>
<td align="left">YES*</td>
<td align="left">YES#</td>
<td align="left"><a href="http://www.timll.com/chinese/uploadFile/WCDMA8000.zip">Click and Download</a></td>
</tr>
<tr class="odd">
<td align="left">COM8018-S(Extension serial port module: extend SPI to serial ports)</td>
<td align="left">YES*</td>
<td align="left">YES*</td>
<td align="left">YES#</td>
<td align="left">Provided in single CD</td>
</tr>
<tr class="even">
<td align="left">XDS100V2 Emulator (supports non-OS ARM and DSP debugging) <br /><a href="http://elinux.org/File:XDS100-P.jpg"><img src="http://elinux.org/images/5/5f/XDS100-P.jpg" alt="XDS100-P.jpg" /></a></td>
<td align="left">N/A</td>
<td align="left">N/A</td>
<td align="left">N/A</td>
<td align="left">Provided in single CD</td>
</tr>
<tr class="odd">
<td align="left">TDS560PLUS (supports non-OS ARM and DSP debugging) <br /><a href="http://elinux.org/File:TDS560-P.jpg"><img src="http://elinux.org/images/3/3b/TDS560-P.jpg" alt="TDS560-P.jpg" /></a></td>
<td align="left">N/A</td>
<td align="left">N/A</td>
<td align="left">N/A</td>
<td align="left">Provided in single CD</td>
</tr>
</tbody>
</table>

# **FAQ**

If you have got some problems when using
[DevKit8500D/A](http://www.armkits.com/Product/devkit8500d.asp) board,
please refer to [Devkit8500FAQ](http://eLinux.org/Devkit8500FAQ "Devkit8500FAQ").

# **Other [Embest](http://www.armkits.com) Products based on TI Processors**

[Embest](http://www.armkits.com) has designed several products based on
TI's ARM9 and ARM Cortex-A8 processors.
[Embest](http://www.armkits.com)also offers customer design service
according to customer's requirements. Whether you need to reduce, add or
modify to existing hardwares or generate a new solution, Embest will
help customers with expert competence and rich experience.

-   [SBC8530](http://www.armkits.com/product/sbc8530.asp) Single Board
    Computer based on TI's DM3730 ARM Cortex-A8 processor
-   [SBC8100 Plus](http://www.armkits.com/product/sbc8100.asp) Single
    Board Computer based on TI's DM3730 ARM Cortex-A8 processor
-   [SBC8018](http://www.armkits.com/product/sbc8018.asp) Single Board
    Computer based on TI's AM1808 ARM926EJ-S processor
-   [Devkit8000](http://eLinux.org/Devkit8000 "Devkit8000") Evalution Board based on TI's
    OMAP3530 ARM Cortex-A8 processor
-   [SBC8100](http://www.armkits.com/product/sbc8100.asp) Single Board
    Computer based on TI's OMAP3530 ARM Cortex-A8 processor
-   [SOC8200](http://www.armkits.com/product/soc8200.asp) Single Board
    Computer based on TI's AM3517 Sitara ARM Cortex-A8 processor
-   [Mini8510](http://www.armkits.com/product/mini8510.asp) Processor
    Card based on TI's DM3730 ARM Cortex-A8 processor
-   [Mini8100](http://www.armkits.com/product/mini8100.asp) Processor
    Card based on TI's OMAP3530 ARM Cortex-A8 processor


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [DevKit8500](http://eLinux.org/Category:DevKit8500 "Category:DevKit8500")
-   [Devkit8000](http://eLinux.org/Category:Devkit8000 "Category:Devkit8000")

