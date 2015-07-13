> From: [eLinux.org](http://eLinux.org/Pollux "http://eLinux.org/Pollux")


# Pollux



[![Pollux.gif](http://eLinux.org/images/3/3e/Pollux.gif)](http://eLinux.org/File:Pollux.gif)

## Contents

-   [1 Summary](#summary)
-   [2 Features](#features)
    -   [2.1 Core](#core)
    -   [2.2 Memory](#memory)
    -   [2.3 Storage](#storage)
    -   [2.4 3D Graphic Accelerator](#3d-graphic-accelerator)
    -   [2.5 Display Subsystem](#display-subsystem)
    -   [2.6 Integrated peripherals](#integrated-peripherals)
    -   [2.7 Power Management](#power-management)
    -   [2.8 Operating Temperature](#operating-temperature)
    -   [2.9 Operating System](#operating-system)
-   [3 Known Devices](#known-devices)

## Summary

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><p>The Pollux is a System on a Chip (SoC) that was manufactured by MagicEyes, whose intellectual property is now owned by Core Logic. Originally designed for LeapFrog as the LF1000, the 533MHz ARM926EJ core VR3520F has now made its way into several products running WinCE and Linux.</p>
<ul>
<li><a href="http://www.corelogic.co.kr/kor2/application/portable05.php">Core Logic Product Page</a></li>
<li><a href="http://elinux.org/images/c/cc/Pollux-brochure.pdf" title="Pollux-brochure.pdf">Pollux Brochure</a></li>
<li><a href="http://elinux.org/images/c/ca/Pollux-datasheet.pdf" title="Pollux-datasheet.pdf">Pollux VF3520F Datasheet</a></li>
<li><a href="http://thing1.linuxdevices.com/news/NS4648734230.html">MagicEyes Pollux SoC</a></li>
</ul></td>
</tr>
</tbody>
</table>

## Features

### Core

-   90 nm Process
-   288pin FBGA
-   15mm x 15mm
-   0.65mm pitch
-   High performance 32bit CPU Core
    -   ARM926EJ- 533MHz
    -   I Cache / D Cache:16KB/16KB
    -   Jazelle Java Hardware Accelerator

### Memory

-   DDR SDRAM Controller
    -   133MHz DDR SDRAM memory x 16bit
    -   Single DDR memory bank
    -   Up to 128MB
    -   Peak Memory Bandwidth : 533MByte/sec
    -   8 Channel DMA

### Storage

-   Static Bus controller
-   16 bit data bus
-   Supports 8 bit NAND flash and 8/16 bit SRAM
-   Supports SLC/ MLC NAND
-   Boot form NAND flash or NOR flash
-   IDE interface with PIO mode

### 3D Graphic Accelerator

-   3D Performance : 133M Texel/sec, 1.33M Polygon/sec
-   OpenGL ES 1.1 Compatible
-   512-depth instruction memory
-   256 Vector Input/Constant Registers
-   16 Vector General Purpose Registers
-   2x2 Sub-Pixel Accuracy
-   Per-Pixel Fogging
-   Hardware Dithering
-   Texture Features
-   Perspective Correction
-   Multi-Texturing
-   Bi-Linear Filtering
-   MIPMAP

### Display Subsystem

-   Supports screen size up to 1280 \* 1024@60Hz
-   Supports Flat Panel I/F: Color TFT at 16, 18, 24 bit//Pixel, STN-LCD
-   Display Layers
    -   RGB Layer : 2 Layer, 8/16/24bpp Format
    -   YUV Layer : YUV4:2:0, 2D/Linear Format, Scale Up/Down
-   Effects : Color Key, Priority, Alpha Blending(16 Levels)
-   Color Control : Brightness, Contrast, Hue, Saturation
-   Output Format
    -   CCIR 601/656, RGB, M-RGB(Multiplexed RGB)
    -   Supports NTSC/PAL Encoder with Analog DAC
    -   CVBS Output
    -   Independent Dual Display Output
-   Advanced 3D Graphics
    -   3D Performance : 133M Texel/sec, 1.33M Polygon/sec
    -   3D Texture Mapping, Lighting, Shading, Fogging
    -   Z-Buffer, Alpha Blending
    -   Open GL ES 1.1 support

### Integrated peripherals

-   USB 1.1 Host
    -   3 downstream ports
-   USB 2.0 Device
    -   Support FS/HS dual mode operation
-   SD/ MMC interface
    -   Two Channels of SD/MMC
    -   SD mem Version 2.00
    -   SDIO version 1.10
    -   MMC version 4.2
    -   Clock speed up to 52MHz
    -   PIO and DMA mode data transfer
-   NAND
-   I2C
    -   2 channel I2C-bus
    -   100Kbps \~ 1Mbps Speed
-   I2S
-   ADC
-   PWM
-   4Ch UART
-   SSP/SPI
-   JTAG

### Power Management

-   Individual block dynamic power controlller
-   Supports various power down mode
    -   Idle
    -   Stop

### Operating Temperature

-   0℃ \~ 70℃

### Operating System

-   Microsoft Windows CE 5.0/6.0
-   Linux

## Known Devices

Branded as LF1000

-   [Leappad Explorer](http://eLinux.org/Leappad_Explorer "Leappad Explorer")
-   [Leapster Explorer](http://eLinux.org/Leapster_Explorer "Leapster Explorer")
-   [Didj](http://eLinux.org/Didj "Didj")

[GP2X Wiz](http://eLinux.org/GP2X_Wiz "GP2X Wiz")

[GP2X Caanoo](http://en.wikipedia.org/wiki/GP2X_Caanoo)

[NC600 thin client](http://code.jeffkent.net/trac/nc600/)

[Cydle T43H HD radio/GPS](http://www.cydle.com/product_T43H.aspx)

[Augen\_eGo:\_OE-A730\_to\_OE-A733](http://eLinux.org/Augen_eGo:_OE-A730_to_OE-A733 "Augen eGo: OE-A730 to OE-A733")

[LMP881 NetPAD](http://lucasind-usa.com/lmp881.htm)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [Augen
    eGo](http://eLinux.org/index.php?title=Category:Augen_eGo&action=edit&redlink=1 "Category:Augen eGo (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

