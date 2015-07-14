> From: [eLinux.org](http://eLinux.org/Devkit8000 "http://eLinux.org/Devkit8000")


# Devkit8000



## Contents

-   [1 **Devkit8000 Board Overview**](#devkit8000-board-overview)
-   [2 **Hardware**](#hardware)
    -   [2.1 Onboard Interfaces and
        Connectors](#onboard-interfaces-and-connectors)
    -   [2.2 Hardware Features](#hardware-features)
    -   [2.3 Main Chip Introduction](#main-chip-introduction)
    -   [2.4 Video Display](#video-display)
        -   [2.4.1 DVI-D](#dvi-d)
        -   [2.4.2 S-video](#s-video)
        -   [2.4.3 LCD](#lcd)
    -   [2.5 USB OTG (Mini-AB) Wire
        Map](#usb-otg-mini-ab-wire-map)
    -   [2.6 Camera Interface](#camera-interface)
    -   [2.7 Expansion Interface](#expansion-interface)
    -   [2.8 LayOut](#layout)
    -   [2.9 Dimension Drawing](#dimension-drawing)
    -   [2.10 Function Block Diagram](#function-block-diagram)
    -   [2.11 Optional Function Modules](#optional-function-modules)
    -   [2.12 JTAG Tool](#jtag-tool)
-   [3 **Software**](#software)
    -   [3.1 Software Features](#software-features)
        -   [3.1.1 Linux and WinCE OS
            support](#linux-and-wince-os-support)
    -   [3.2 Ubuntu on Devkit8000 (for
        reference)](#ubuntu-on-devkit8000-for-reference)
    -   [3.3 Port QT on Devkit8000 (for
        reference)](#port-qt-on-devkit8000-for-reference)
    -   [3.4 Demo
        (Android/Angstrom/DVSDK)](#demo-android-angstrom-dvsdk)
        -   [3.4.1 Android](#android)
        -   [3.4.2 Angstrom](#angstrom)
        -   [3.4.3 DVSDK (DSP)](#dvsdk-dsp)
-   [4 **Devkit8000 Evaluation Kit
    Overview**](#devkit8000-evaluation-kit-overview)
    -   [4.1 Configurations](#configurations)
        -   [4.1.1 Standard Configuraiton](#standard-configuraiton)
        -   [4.1.2 Complete Configuration](#complete-configuration)
    -   [4.2 Product CD](#product-cd)
    -   [4.3 Optional accessories](#optional-accessories)
-   [5 **FAQ**](#faq)
-   [6 **Other Embest Products based on TI
    Processors**](#other-embest-products-based-on-ti-processors)

# **Devkit8000 Board Overview**

[Embest](http://www.armkits.com)
[DevKit8000](http://www.armkits.com/Product/devkit8000.asp) Evaluation
Board is a compact board using TI's
[OMAP3530](http://focus.ti.com/docs/prod/folders/print/omap3530.html)
600MHz ARM Cortex-A8 (600MHz ARM Cortex-A8 core paired with a 430MHz
TMS320C64x+ DSP core) microprocessor. It takes full features of this
processor and supports up to 256MByte DDR SDRAM and 256MByte NAND Flash
as well as high-speed USB2.0 OTG function. The board has exposed many
other hardware interfaces including RS232 serial port, LCD/TSP, DVI-D,
S-Video, Ethernet, SD, keyboard, camera, SPI, I2C and JTAG. The board
has two methods to boot the system from either SD card or NAND flash. It
is able to support WinCE and Linux OS and provided with WinCE6.0 BSP and
Linux2.6.28 BSP. Embest also provides demos of Google Android OS,
Angstrom (GPE) and DVSDK for user experience.

[![Devkit8000.jpg](http://eLinux.org/images/5/57/Devkit8000.jpg)](http://eLinux.org/File:Devkit8000.jpg)

[![Devkit8000
android.jpg](http://eLinux.org/images/b/b8/Devkit8000_android.jpg)](http://eLinux.org/File:Devkit8000_android.jpg)

Devkit8000 Evaluation Board

Devkit8000 + 4.3 inch LCD Android Demo Display

# **Hardware**

## Onboard Interfaces and Connectors

[![Devkit8000header.gif](http://eLinux.org/images/9/95/Devkit8000header.gif)](http://eLinux.org/File:Devkit8000header.gif)

## Hardware Features

-   Dimensions: 110mm x 95mm
-   Working temperature: 0°C to 70°C
-   Processor: TI OMAP3530 microprocessor with 600MHz ARM Cortex-A8 RISC
    Core
-   Power supply: +5V
-   256MB DDR SDRAM, 166MHz
-   256MB NAND Flash, 16bit
-   LCD/Touch Screen interface (50-pin FPC connector, support resolution
    up to 2048\*2048)
-   DVI high-resolution image output port (HDMI interface, support 720p,
    30fps signal)
-   S-Video display interface
-   One audio input interface (3.5mm audio jack)
-   One 2-channel audio output interface (3.5mm audio jack)
-   One 10/100M Ethernet interface (RJ45)
-   One High-speed USB2.0 OTG port (Mini USB type interface)
-   One High-speed USB2.0 Host port (USB A type interface)
-   Two serial ports (one 3-wire RS232 serial port led out from 2.54mm
    10-pin connector and one 5-wire TTL serial port led out from
    expansion connector)
-   SD card interface (supports 3.3V and 1.8V logic voltage)
-   One camera interface (30-pin FPC connector, support CCD or CMOS
    camera)
-   6\*6 keyboard interface
-   One 14-pin Jtag interface
-   Four buttons (Reset, Boot, User defined, On/Off)
-   One expansion connector (2.0mm 40-pin SMT Female Pin Header, McSPI,
    McBSP, I2C, HDQ, GPIO are led out from this connector)

## Main Chip Introduction

<table>
<tbody>
<tr class="odd">
<td align="left">DevKit8000</td>
<td align="left">Chip</td>
<td align="left">Remark</td>
</tr>
<tr class="even">
<td align="left">Processor</td>
<td align="left">OMAP3530CUS</td>
<td align="left">0.65mm CUS package</td>
</tr>
<tr class="odd">
<td align="left">Memory</td>
<td align="left">MT29C2G48MAKLCJA-6IT</td>
<td align="left">256MB DDR/256MB NAND Flash, 137-Ball TFBGA, Mark:JW305, Micron</td>
</tr>
<tr class="even">
<td align="left">Power Management Chip</td>
<td align="left">TPS65930BZCH</td>
<td align="left">Extended power management, RTC, USB OTG, Audio, 6*6 Keyboard</td>
</tr>
<tr class="odd">
<td align="left">DVI-D</td>
<td align="left">TFP410</td>
<td align="left">HDMI connector, output DVI-D signal, not including audio</td>
</tr>
<tr class="even">
<td align="left">Ethernet</td>
<td align="left">DM9000</td>
<td align="left">RJ45, 10M/100M adaptive, at present testing speed can reach 36M</td>
</tr>
<tr class="odd">
<td align="left">Serial port</td>
<td align="left">MAX3232 CSE</td>
<td align="left">RS232</td>
</tr>
</tbody>
</table>

## Video Display

### DVI-D

DVI high-resolution display (HDMI interface, 30fps signal), Embest
provides a HDMI to DVI-D cable in complete configuration for connection.
Signal does not include audio signal.

### S-video

S-video display, can output video signal but not including audio signal.

### LCD

24-bit LCD display, can output true-color RGB signal, R:B:G=8:8:8, can
support resolution up to 2048\*2048 pixels. (50-pin 0.5mm pitch FPC
connector.
 Interface Singal Type

<table>
<tbody>
<tr class="odd">
<td align="left">RGB data signal</td>
<td align="left">LCD control signal</td>
<td align="left">SPI signal</td>
<td align="left">IIC signal</td>
<td align="left">Touch Screen signal</td>
<td align="left">Voltage output</td>
</tr>
<tr class="even">
<td align="left">24bit</td>
<td align="left">6bit</td>
<td align="left">4bit</td>
<td align="left">2bit</td>
<td align="left">4bit</td>
<td align="left">5bit</td>
</tr>
<tr class="odd">
<td align="left">R:G:B=8:8:8</td>
<td align="left">row control signal</td>
<td align="left">standard spi signal</td>
<td align="left">2-bit IIC signal</td>
<td align="left">4-wire touch screen</td>
<td align="left">output voltage 5V, 3.3V, 1.8V</td>
</tr>
</tbody>
</table>

## USB OTG (Mini-AB) Wire Map

1: VB
 2: D-
 3: D+
 4: ID
 5: GND
 User needs only to short circuited 4 and 5.

## Camera Interface

[![DevKit8000
cam.jpg](http://eLinux.org/images/5/53/DevKit8000_cam.jpg)](http://eLinux.org/File:DevKit8000_cam.jpg)

## Expansion Interface

Embest Devkit8000 uses a 2.0mm 40-pin SMT Female Pin Header to bring out
McSPI, McBSP, I2C, HDQ, GPIO from this interface

<table>
<tbody>
<tr class="odd">
<td align="left">PIN</td>
<td align="left">Signal</td>
<td align="left">Function Description</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">GND</td>
<td align="left">GND</td>
</tr>
<tr class="odd">
<td align="left">2</td>
<td align="left">BSP1_DX</td>
<td align="left">Transmitted serial data 1</td>
</tr>
<tr class="even">
<td align="left">3</td>
<td align="left">BSP1_DR</td>
<td align="left">Received serial data 1</td>
</tr>
<tr class="odd">
<td align="left">4</td>
<td align="left">BSP1_CLKR</td>
<td align="left">Received clock 1</td>
</tr>
<tr class="even">
<td align="left">5</td>
<td align="left">BSP1_FSX</td>
<td align="left">Transmit frame synchronization 1</td>
</tr>
<tr class="odd">
<td align="left">6</td>
<td align="left">BSP1_CLKX</td>
<td align="left">Transmit clock 1</td>
</tr>
<tr class="even">
<td align="left">7</td>
<td align="left">BSP1_CLKS</td>
<td align="left">External clock input 1</td>
</tr>
<tr class="odd">
<td align="left">8</td>
<td align="left">BSP1_FSR</td>
<td align="left">Receive frame synchronization 1</td>
</tr>
<tr class="even">
<td align="left">9</td>
<td align="left">UART1_CTS</td>
<td align="left">UART1 clear to send</td>
</tr>
<tr class="odd">
<td align="left">10</td>
<td align="left">UART1_RTS</td>
<td align="left">UART1 request to send</td>
</tr>
<tr class="even">
<td align="left">11</td>
<td align="left">UART1_RX</td>
<td align="left">UART1 receive data</td>
</tr>
<tr class="odd">
<td align="left">12</td>
<td align="left">UART1_TX</td>
<td align="left">UART1 transmit data</td>
</tr>
<tr class="even">
<td align="left">13</td>
<td align="left">GND</td>
<td align="left">GND</td>
</tr>
<tr class="odd">
<td align="left">14</td>
<td align="left">MMC2_CLK</td>
<td align="left">MMC2 card clock</td>
</tr>
<tr class="even">
<td align="left">15</td>
<td align="left">MMC2_CMD</td>
<td align="left">MMC2 card command</td>
</tr>
<tr class="odd">
<td align="left">16</td>
<td align="left">MMC2_D0</td>
<td align="left">MMC2 card data 0</td>
</tr>
<tr class="even">
<td align="left">17</td>
<td align="left">MMC2_D1</td>
<td align="left">MMC2 card data 1</td>
</tr>
<tr class="odd">
<td align="left">18</td>
<td align="left">MMC2_D2</td>
<td align="left">MMC2 card data 2</td>
</tr>
<tr class="even">
<td align="left">19</td>
<td align="left">MMC2_D3</td>
<td align="left">MMC2 card data 3</td>
</tr>
<tr class="odd">
<td align="left">20</td>
<td align="left">MMC2_D4</td>
<td align="left">MMC2 card data 4</td>
</tr>
<tr class="even">
<td align="left">21</td>
<td align="left">MMC2_D5</td>
<td align="left">MMC2 card data 5</td>
</tr>
<tr class="odd">
<td align="left">22</td>
<td align="left">MMC2_D6</td>
<td align="left">MMC2 card data 6</td>
</tr>
<tr class="even">
<td align="left">23</td>
<td align="left">MMC2_D7</td>
<td align="left">MMC2 card data 7</td>
</tr>
<tr class="odd">
<td align="left">24</td>
<td align="left">BSP3_DX</td>
<td align="left">Transmitted serial data 3</td>
</tr>
<tr class="even">
<td align="left">25</td>
<td align="left">BSP3_DR</td>
<td align="left">Received serial data 3</td>
</tr>
<tr class="odd">
<td align="left">26</td>
<td align="left">BSP3_CLKX</td>
<td align="left">Transmit clock 3</td>
</tr>
<tr class="even">
<td align="left">27</td>
<td align="left">BSP3_FSX</td>
<td align="left">Transmit frame synchronization 3</td>
</tr>
<tr class="odd">
<td align="left">28</td>
<td align="left">GND</td>
<td align="left">GND</td>
</tr>
<tr class="even">
<td align="left">29</td>
<td align="left">IIC3_SCL</td>
<td align="left">IIC3 master serial clock</td>
</tr>
<tr class="odd">
<td align="left">30</td>
<td align="left">IIC3_SDA</td>
<td align="left">IIC3 serial bidirectional data</td>
</tr>
<tr class="even">
<td align="left">31</td>
<td align="left">SPI1_SIMO</td>
<td align="left">Slave data in, master data out</td>
</tr>
<tr class="odd">
<td align="left">32</td>
<td align="left">SPI1_SOMI</td>
<td align="left">Slave data out, master data in</td>
</tr>
<tr class="even">
<td align="left">33</td>
<td align="left">SPI1_CLK</td>
<td align="left">SPI1 clock</td>
</tr>
<tr class="odd">
<td align="left">34</td>
<td align="left">SPI1_CS0</td>
<td align="left">SPI enable 0</td>
</tr>
<tr class="even">
<td align="left">35</td>
<td align="left">SPI1_CS3</td>
<td align="left">SPI enable 3</td>
</tr>
<tr class="odd">
<td align="left">36</td>
<td align="left">HDQ_SIO</td>
<td align="left">Bidirectional HDQ</td>
</tr>
<tr class="even">
<td align="left">37</td>
<td align="left">VDD33</td>
<td align="left">3.3V</td>
</tr>
<tr class="odd">
<td align="left">38</td>
<td align="left">VDD18</td>
<td align="left">1.8V</td>
</tr>
<tr class="even">
<td align="left">39</td>
<td align="left">VDD50</td>
<td align="left">5V</td>
</tr>
<tr class="odd">
<td align="left">40</td>
<td align="left">VDD50</td>
<td align="left">5V</td>
</tr>
</tbody>
</table>

## LayOut

The Devkit8000 PCB has 6-layer design, each layer is layout as below:

<table>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">2</td>
<td align="left">3</td>
<td align="left">4</td>
<td align="left">5</td>
<td align="left">6</td>
</tr>
<tr class="even">
<td align="left">Top</td>
<td align="left">Ground</td>
<td align="left">Singal</td>
<td align="left">Power</td>
<td align="left">Ground</td>
<td align="left">Bottom</td>
</tr>
</tbody>
</table>



## Dimension Drawing

[![Devkit8000
chicun.JPG](http://eLinux.org/images/1/1f/Devkit8000_chicun.JPG)](http://eLinux.org/File:Devkit8000_chicun.JPG)



## Function Block Diagram

[![Devkit8000func.jpg](http://eLinux.org/images/c/ce/Devkit8000func.jpg)](http://eLinux.org/File:Devkit8000func.jpg)

## Optional Function Modules

-   **VGA Module**
    ([VGA8000](http://www.armkits.com/product/vga8000.asp))

[![VGA-P.jpg](http://eLinux.org/images/9/94/VGA-P.jpg)](http://eLinux.org/File:VGA-P.jpg)
 The VGA8000 module employs PHILIPS 74alvc164245 chip with 240MHz
maximum sample rate. It can output standard LCD signal and display
smoothly under 1024\*768 resolution.

-   **Analog Camera Module**
    ([CAM8000-A](http://www.armkits.com/product/camera8000.asp))

[![CAM8000-P.jpg](http://eLinux.org/images/9/97/CAM8000-P.jpg)](http://eLinux.org/File:CAM8000-P.jpg)
 The CAM8000-A module is designed for using on Devkit8000 Evaluation
Board with standard 720\*576 PAL resolution. It supports analog camera
with BNC connector and connects to Devkit8000 board through an 30-pin
FFC cable.



-   **USB WiFi Module**
    ([WF8000-U](http://www.armkits.com/product/WF8000-U.asp))

[![WIFI8000-P.jpg](http://eLinux.org/images/f/f3/WIFI8000-P.jpg)](http://eLinux.org/File:WIFI8000-P.jpg)
 The WF8000-U is a USB based WiFi module relying on the WiFi IEEE 802.11
standards. It is applied to be used on all Embest products which shall
have USB interface. This module is hgihly integrated with MAC/BBP and
2.4GHz RF chip and builds a wireless network between PCs or some other
terminals.

-   **GPS Module**
    ([GPS8000-S](http://www.armkits.com/product/GPS8000-S.asp))

[![GPS8000-P.jpg](http://eLinux.org/images/4/4a/GPS8000-P.jpg)](http://eLinux.org/File:GPS8000-P.jpg)
 The GPS8000-S is an ARM based embedded GPS module which allows to
connect to Devkit8000 board to get position and altitude. It is a high
sensitivity module with low power consumption. Devkit8000's UART (the
serial port) from the expansion connector is used to communicate with
the GPS through a tiny patch board.

-   **GPRS Module**
    ([GPRS8000-S](http://www.armkits.com/product/GPRS8000-S.asp))

[![GPRS8000-P.jpg](http://eLinux.org/images/2/2a/GPRS8000-P.jpg)](http://eLinux.org/File:GPRS8000-P.jpg)
 The GPRS8000-S is an ARM based embedded GPS module which allows to
connect to Embest Devkit8000 board for GSM/GPRS solution. Devkit8000's
UART (the serial port) from the expansion connector is used to
communicate with the GPRS module.

-   **CDMA8000-U Module**
    ([CDMA8000-U](http://www.armkits.com/product/CDMA8000-U.asp))
-   **WCDMA8000-U Module**
    ([WCDMA8000-U](http://www.armkits.com/product/WCDMA8000-U.asp))
-   **Digital Camera Module**
    ([CAM8100-U](http://www.armkits.com/product/CAM8100-U.asp))



## JTAG Tool

[![XDS100-P.jpg](http://eLinux.org/images/5/5f/XDS100-P.jpg)](http://eLinux.org/File:XDS100-P.jpg)

-   [XDS100v2](http://processors.wiki.ti.com/index.php/XDS100) - the
    second release of the XDS100 JTAG emulator technology supporting
    debug of a variety of TI devices.

Available from [Embest](http://www.armkits.com/product/xds100.asp)



# **Software**

## Software Features

### Linux and WinCE OS support

[Embest](http://www.armkits.com)
[DevKit8000](http://www.armkits.com/Product/devkit8000.asp) supports for
both Linux2.6.28 and WinCE6.0 operating systems.

<table border="1" cellspacing="0" cellpadding="0" width="90%">
            <tr>
              <td valign="top">OS </td>
              <td valign="top">Item </td>
              <td valign="top">Features </td>
              <td valign="top">Description</td>
            </tr>
            <tr>
              <td rowspan="11">Linux </td>
              <td rowspan="3">Boot  </td>
              <td> Version  </td>
              <td valign="top"> x-load-1.41, u-boot 1.3.3 </td>
            </tr>
            <tr>
              <td> Boot Mode  </td>
              <td valign="top">Boot Linux from SD card, NAND Flash or Ethernet</td>
            </tr>

            <tr>
              <td> Image Update  </td>
              <td valign="top"> Support updating image from SD card or Ethernet</td>
            </tr>
            <tr>
              <td rowspan="3"> Kernel and Drivers  </td>
              <td> Version  </td>
              <td valign="top"> Linux 2.6.28 </td>
            </tr>
            <tr>
              <td> Support file systems  </td>
              <td valign="top"> ROM/CRAM/EXT2/EXT3/FAT/NFS/JFFS2/UBIFS </td>
            </tr>
            <tr>

              <td> Drivers  </td>
              <td valign="top"> Serial, RTC, NET, Nand, LCD, Touch Screen, SD, USB Host, USB OTG, DVI, Keypad, LED, Audio </td>
            </tr>
            <tr>
              <td rowspan="2"> File system  </td>
              <td> Format </td>
              <td valign="top"> Ramdisk, UBI  </td>
            </tr>
            <tr>
              <td> Characteristic  </td>
              <td valign="top"> Provided Lib (ALSA -lib, tslib, glibc), udev support </td>
            </tr>
            <tr>
              <td rowspan="3"> Demo </td>
              <td> Angstrom </td>
              <td valign="top"> Audio (XMMS), network (firefox), graphics editor (gimp) and document processing software (Abiword) </td>
            </tr>
            <tr>
              <td> Android </td>
              <td valign="top">Google developed a platform based on Linux open-source mobile phone operating system.  </td>
            </tr>

            <tr>
              <td> DVSDK </td>
              <td valign="top">Support MPEG4, MPEG2, H264, mp3, aac audio/video formats and Codecs </td>
            </tr>
            <tr>
              <td rowspan="11"> WinCE </td>
              <td rowspan="3"> Boot  </td>
              <td> Version  </td>
              <td valign="top"> x-load-1.41, Eboot </td>
            </tr>
            <tr>
              <td> Boot Mode </td>
              <td valign="top"> Boot WinCE from SD card, NAND Flash or Ethernet   </td>
            </tr>

            <tr>
              <td> Image Update  </td>
              <td valign="top">Support updating image from SD card or Ethernet </td>
            </tr>
            <tr>
              <td rowspan="8"> System  </td>
              <td> Characteristic </td>
              <td valign="top"> KITL kernel debug, Reboot, Watchdog, RTC</td>
            </tr>
            <tr>
              <td rowspan="2"> Drivers </td>
              <td valign="top"> Display driver（DVI, TFT LCD） </td>
            </tr>
            <tr>

              <td valign="top"> SD card, Keyboard, McSPI, McBSP, Audio, NET, NLED, USB Host, USB OTG, WiFi, GPS, GPRS, CDMA </td>
            </tr>
            <tr>
              <td rowspan="3"> Function </td>
              <td valign="top"> Power Management (backlight drive, battery-driven, sleep/wake-up function) </td>
            </tr>
            <tr>

              <td valign="top">Hive registry support </td>
            </tr>
            <tr>
              <td valign="top">ROM file system support</td>
            </tr>
            <tr>
              <td rowspan="2">Software features</td>
              <td valign="top"> Mediaplayer 9.0, Word and Internet Explorer 6.0</td>
            </tr>
            <tr>
              <td height="20" valign="top">.NET Compact Framework 3.5</td>
            </tr>
</table>

Now Linux2.6.29 is ported. Source code download from
[here](http://code.google.com/p/devkit8000/wiki/DVSDK_3_00_02_44_linux_2_6_29?ts=1264641072&updated=DVSDK_3_00_02_44_linux_2_6_29)

## Ubuntu on Devkit8000 (for reference)

Please refer to [Devkit8000
Ubuntu](http://eLinux.org/Devkit8000_Ubuntu "Devkit8000 Ubuntu").

## Port QT on Devkit8000 (for reference)

Please refer to [Devkit8000 QT](http://eLinux.org/Devkit8000_QT "Devkit8000 QT") on how
to port QT on Devkit8000.

## Demo (Android/Angstrom/DVSDK)

### Android

[![Devkit8000
android.jpg](http://eLinux.org/images/b/b8/Devkit8000_android.jpg)](http://eLinux.org/File:Devkit8000_android.jpg)
 The DevKit8000 can support Android which is a software platform and
operating system for mobile devices, based on the Linux kernel,
developed by Google and later the Open Handset Alliance. The board can
run various applications based on Android. It supports 4.3" and 7" TFT
LCD display and touch panel function. It can use the built-in audio
player of Android to play kinds of audio files and transfer data through
SD card or USB OTG.
 Please refer to [Devkit8000
Android](http://eLinux.org/Devkit8000_Android "Devkit8000 Android") on how to use and
port.

### Angstrom

[![DevKit8000
angstrom.jpg](http://eLinux.org/images/b/bb/DevKit8000_angstrom.jpg)](http://eLinux.org/File:DevKit8000_angstrom.jpg)
 DevKit8000 can display Angstrom system on a DVI\_D monitor running 720p
videos at 30fps. DevKit8000 can use various software of Angsrtom to
implement file editing, internet surfing, audio and video files playing
and graphics editing and more other functions. User can use USB mouser
to operate on Angstrom system.
 Please refer to [Devkit8000
Angstrom](http://eLinux.org/Devkit8000_Angstrom "Devkit8000 Angstrom") on how to use and
port.

### DVSDK (DSP)

[![Devkit8000
dsp.jpg](http://eLinux.org/images/b/b2/Devkit8000_dsp.jpg)](http://eLinux.org/File:Devkit8000_dsp.jpg)
 [DevKit8000](http://www.armkits.com/Product/devkit8000.asp) supports
DVSDK package which includes following functions:
 Supports 2D/3D graphics acceleration;
 Supports DSP codec (Supports audio and video hardware decoding);
 Supports S-Video output.
 Please refer to
[Devkit8000\_DVSDK](http://eLinux.org/Devkit8000_DVSDK "Devkit8000 DVSDK") on how to use
and port.

# **Devkit8000 Evaluation Kit Overview**

[Embest](http://www.armkits.com)
[DevKit8000](http://www.armkits.com/Product/devkit8000.asp) Evaluation
Kit includes the
[DevKit8000](http://www.armkits.com/Product/devkit8000.asp) evaluation
board and all necessary accessories to help users start their design of
multimedia applications. The board is preloaded with Linux OS in NAND
flash and WinCE OS in SD card. User can display the subsystem using a
4.3" TFT LCD and Touch screen or using a DVI-D monitor through an HDMI
to DVI-D cable, or using TV for NTSC/PAL video out. The USB OTG
interface can also be used as USB Host function with a Mini-A to
Standard-A cable, or used as USB Device function with a Mini-B to
Standard-A cable. Along with the kit, [Embest](http://www.armkits.com)
provides user manual, schematic drawing and datasheet documents to help
customers better understand and use the kit.

[![Devkit8000suite.jpg](http://eLinux.org/images/4/49/Devkit8000suite.jpg)](http://eLinux.org/File:Devkit8000suite.jpg)

## Configurations

[Embest](http://www.armkits.com)
[DevKit8000](http://www.armkits.com/Product/devkit8000.asp) Evaluation
Kit has two configurations:

### Standard Configuraiton

The standard configuration is focused on evaluating the basic functions
of Devkit8000 board.

[![Devkit8000standard.gif](http://eLinux.org/images/3/31/Devkit8000standard.gif)](http://eLinux.org/File:Devkit8000standard.gif)

### Complete Configuration

The complete configuration includes complete accessories for Devkit8000
which is convenient for special application development.

[![Devkit8000access.gif](http://eLinux.org/images/6/62/Devkit8000access.gif)](http://eLinux.org/File:Devkit8000access.gif)

## Product CD

The Devkit8000 product CD contains following contents:

-   Linux2.6.28 source code (including driver, kernel, startup code and
    file system)
-   WinCE6.0 BSP (including driver, kernel, startup code and file system
    all in source code)
-   Schematic in PDF format
-   Onboard chip datasheet
-   Linux cross-compile toolchains
-   User manual

## Optional accessories

-   [CAM8000-A](http://www.armkits.com/Product/camera8000.asp) analog
    camera module
-   [Analog camera](http://www.armkits.com/Product/camera8000.asp)
-   [VGA8000](http://www.armkits.com/Product/vga8000.asp) VGA module
-   [WF8000-U](http://www.armkits.com/Product/WF8000-U.asp) USB WiFi
    module
-   [CAM8100-U](http://www.armkits.com/Product/CAM8100-U.asp) digital
    camera module
-   [GPS8000-S](http://www.armkits.com/Product/GPS8000-S.asp) GPS module
-   [GPRS8000-S](http://www.armkits.com/Product/GPRS8000-S.asp) GPRS
    module
-   [CDMA8000-U](http://www.armkits.com/Product/CDMA8000-U.asp) USB 3G
    module (CDMA2000 standard)
-   [WCDMA8000-U](http://www.armkits.com/Product/WCDMA8000-U.asp) USB 3G
    module (WCDMA standard)
-   [XDS100v2](http://www.armkits.com/Product/xds100.asp) USB JTAG
    emulator

# **FAQ**

If you have got some problems when using Devkit8000, please refer to
[Devkit8000 FAQ](http://eLinux.org/Devkit8000_FAQ "Devkit8000 FAQ").

# **Other [Embest](http://www.armkits.com) Products based on TI Processors**

[Embest](http://www.armkits.com) has designed several products based on
TI's ARM9 and ARM Cortex-A8 processors.
[Embest](http://www.armkits.com)also offers customer design service
according to customer's requirements. Whether you need to reduce, add or
modify to existing hardwares or generate a new solution, Embest will
help customers with expert competence and rich experience.

-   [DevKit8500](http://eLinux.org/DevKit8500 "DevKit8500") Evalution Board based on TI's
    DM3730 or AM3715 ARM Cortex-A8 processor
-   [SBC8530](http://www.armkits.com/product/sbc8530.asp) Single Board
    Computer based on TI's DM3730 ARM Cortex-A8 processor
-   [SBC8100 Plus](http://www.armkits.com/product/sbc8100.asp) Single
    Board Computer based on TI's DM3730 ARM Cortex-A8 processor
-   [SBC8018](http://www.armkits.com/product/sbc8018.asp) Single Board
    Computer based on TI's AM1808 ARM926EJ-S processor
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
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [Devkit8000](http://eLinux.org/Category:Devkit8000 "Category:Devkit8000")
-   [DevKit8500](http://eLinux.org/Category:DevKit8500 "Category:DevKit8500")

