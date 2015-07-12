> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Technical_Details "http://eLinux.org/LeapFrog_Pollux_Platform:_Technical_Details")


# LeapFrog Pollux Platform: Technical Details



**Category**

[LeapFrog Pollux
Platform](http://eLinux.org/LeapFrog_Pollux_Platform "LeapFrog Pollux Platform")

**[Didj](http://eLinux.org/Didj "Didj")**

[![Didj.jpg](http://eLinux.org/images/thumb/c/cd/Didj.jpg/250px-Didj.jpg)](http://eLinux.org/File:Didj.jpg)

**[Leapster\_Explorer](http://eLinux.org/Leapster_Explorer "Leapster Explorer")**

[![LeapsterExplorer.jpg](http://eLinux.org/images/thumb/1/10/LeapsterExplorer.jpg/250px-LeapsterExplorer.jpg)](http://eLinux.org/File:LeapsterExplorer.jpg)

**[LeapPad1\_Explorer](http://eLinux.org/LeapPad1_Explorer "LeapPad1 Explorer")**

[![Leappad explorer
promo.jpg](http://eLinux.org/images/thumb/0/01/Leappad_explorer_promo.jpg/250px-Leappad_explorer_promo.jpg)](http://eLinux.org/File:Leappad_explorer_promo.jpg)

**\* Best Guess/Promotional Specs**

**CPU**

LeapFrog [LF-1000](http://eLinux.org/LF-1000 "LF-1000") branded MagicEyes [Pollux
VF3520F](http://eLinux.org/Pollux "Pollux")

ARM926ejs core

Clocked at 393MHz

**RAM**

32MB SDRAM

-   [QImonda
    HYB25DC25616OCE-5](http://eLinux.org/images/2/21/HYB25DC25616OCE-5.pdf "HYB25DC25616OCE-5.pdf")
-   or
-   Nanya NT5DS16M16CS-5T

64MB DDR SDRAM

-   [Nanya
    NT5DS32M16CS-5T](http://eLinux.org/images/e/e0/Nt5d32m16cs-5t.pdf "Nt5d32m16cs-5t.pdf")

64MB DDR SDRAM

-   [Nanya
    NT5DS32M16CS-5T](http://eLinux.org/images/e/e0/Nt5d32m16cs-5t.pdf "Nt5d32m16cs-5t.pdf")

**Storage**

256MB NAND

-   [Micron
    MT29F2G08AAC](http://eLinux.org/images/4/4f/MT29F2G08AAC.pdf "MT29F2G08AAC.pdf")
    (Rootfs, User Data)

512KB NOR

-   [SST SST39VF040](http://eLinux.org/images/0/0e/Sst39vf040.pdf "Sst39vf040.pdf") (Boot
    loader)

512MB NAND

-   [Micron
    MT29F4G08AAC](http://eLinux.org/images/4/4f/MT29F2G08AAC.pdf "MT29F2G08AAC.pdf")
    (Rootfs, User Data)

512KB NOR

-   [SST SST39VF040](http://eLinux.org/images/0/0e/Sst39vf040.pdf "Sst39vf040.pdf") (Boot
    loader)

2GB NAND

-   SM2683LT SD controller
-   Check sm2683lt.c in the kernel sources for more details

**Display**

320x240 TFT - 3.2"

-   Giantplus GPM758A0
-   [Pinouts and
    Specifications](http://www.giantplus.com.tw/en/p/34-color_stn_module-gpg0909_3.html)

320x240 TFT - 3.2" - Touch Screen

-   Giantplus GPM824A0 -
-   [IlI9322 TFT
    Driver](http://www.texim-europe.com/promotion/402/ili9322%20driver%20datasheet_te.pdf)

480x272 5" LCD 5" Touchscreen

**Graphics**

-   Display Modes: RGBA 565
-   MLC: Multi-layer controller provides HW compositing for up to three
    graphics layers
    -   One 24-bit 2D layers (no HW accel)
    -   One 16-bit 3D layer
    -   One YUV video layer (no HW accel)

-   Graphics API OpenGL ES 1.1.
-   Proprietary interface to Multi- Layer Display controller for 2D RGB
    and YUV video buffer support.
-   FreeType Font renderer.
-   Theora video codec plays OGG-Theora files.



**Audio**

[Cirrus Logic CS43L22](http://eLinux.org/images/b/bf/CS43L22.pdf "CS43L22.pdf")

[Cirrus Logic CS43L22](http://eLinux.org/images/b/bf/CS43L22.pdf "CS43L22.pdf")

-   Cirrus Logic CS43L22 audio codec
-   or
-   LFP100 custom leapfrog Audio chip

**Interface Types**

USB 2.0 device

UART [1]

SD/MMC [1]

External NAND [1]

USB 2.0 device

UART [1]

SD/MMC [1]

External NAND [1]

USB 1.1 host (Proprietary Connector)

USB 2.0 device

UART [1]

SD/MMC [1]

**Networking**

USB Ethernet [2]

-   Requires Kernel Module to [Enable
    Networking](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking")

USB Ethernet[2]

-   Nov. 2012 Update disables driver by default.

USB Ethernet[2]

-   Nov. 2012 Update disables driver by default.

**Physical Connectors**

[Cartridge](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "LeapFrog Pollux Platform: Cartridge")
socket

-   NAND, SDIO and UART

Mini USB B Device

DC Power

Headphone

Charging Socket

[Cartridge](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "LeapFrog Pollux Platform: Cartridge")
socket

-   NAND, SDIO and UART

Mini USB B Device

Camera (Proprietary USB Host) [Webcam
Information](http://eLinux.org/Leapster_explorer_webcam_info "Leapster explorer webcam info")

DC Power

Headphone

Charging Socket

[Cartridge](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "LeapFrog Pollux Platform: Cartridge")
socket

-   NAND, SDIO and UART

Mini USB B Device

DC Power

Headphone

Charging Socket

**Human Interface**

10 Buttons

D-Pad

Speaker/Headphones

10 Buttons

D-Pad

Speaker/Headphones

Touchscreen/stylus

Camera: Optional

3 Buttons

D-Pad

Touchscreen/stylus

Speaker/Headphones

Microphone

Accelerometer

-   [Bosch
    BMA220](http://eLinux.org/images/2/23/BST-BMA220-DS003-07.pdf "BST-BMA220-DS003-07.pdf")

Camera

**Linux Kernel**

2.6.20

2.6.31

2.6.31

**GUI**

Proprietary

-   Runs Games on Cartridges or Downloaded from LFConnect

Proprietary

-   Based on Flash Lite for the Digital Home
-   Runs Content on Cartridges or Downloaded from LFConnect
    -   Games
    -   Ebooks
    -   Videos

Proprietary

-   Based on Flash Lite for the Digital Home
-   Runs Content on Cartridges or Downloaded from LFConnect
    -   Games
    -   Ebooks
    -   Videos

**Oscillators**

27MHz Crystal Processor

12MHz Crystal USB

32.768KHz RTC

**Power**

Source

-   4x AA Batteries
-   9v 700maH AC Adapter

Hardware

-   1 Intersil ISL7665SACBAZ - Programmable Over/Under Voltage Detector
    [Datasheet](http://eLinux.org/images/6/66/Isl7665s.pdf "Isl7665s.pdf")
-   3 TI TPS62050 - Adjustable Step-Down Converter
    [Datasheet](http://eLinux.org/images/0/02/Tps62050.pdf "Tps62050.pdf")

[1] Requires [Adapter
Cartridge](http://eLinux.org/LeapFrog_Pollux_Platform:_Cartridge "LeapFrog Pollux Platform: Cartridge")
or
[Hardwiring](http://eLinux.org/LeapFrog_Pollux_Platform:_Hardwire_Serial_Connection "LeapFrog Pollux Platform: Hardwire Serial Connection")

[2] Requires [Host PC
Configuration](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking "LeapFrog Pollux Platform: Networking")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad1
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad1_Explorer&action=edit&redlink=1 "Category:LeapPad1 Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

