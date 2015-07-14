> From: [eLinux.org](http://eLinux.org/PandaBoard "http://eLinux.org/PandaBoard")


# PandaBoard



The [PandaBoard](http://www.pandaboard.org) is an
[OMAP4430](http://eLinux.org/OMAP4430 "OMAP4430") ([Cortex](http://eLinux.org/Cortex "Cortex")-A9) based
low cost development platform.

## Contents

-   [1 Hardware](#hardware)
-   [2 Availability](#availability)
    -   [2.1 Rev A3](#rev-a3)
    -   [2.2 Rev A1/A2](#rev-a1-a2)
    -   [2.3 Rev EA1/EA2](#rev-ea1-ea2)
    -   [2.4 Rev ES](#rev-es)
-   [3 Accessories](#accessories)
-   [4 Recommended Reading Material](#recommended-reading-material)
-   [5 How To's](#how-to-s)
    -   [5.1 Older How To's](#older-how-to-s)
-   [6 Community](#community)

# Hardware

-   OMAP4 (Cortex-A9) CPU based open development platform.
    -   OMAP4430 Application processor
    -   1GB low-power DDR2
    -   Display HDMI v1.3 Connector (Type A) to drive HD displays, DVI-D
        Connector (can drive a 2nd display, simultaneous display;
        requires HDMI to DVI-D adapter), LCD expansion header
    -   3.5" audio in/out and HDMI Audio out
    -   Full size SD/MMC card
    -   Built in 802.11 & Bluetooth v2.1+EDR
    -   Onboard 10/100 Ethernet
    -   Expansion: 1xUSB OTG, 2xUSB HS host ports, General purpose
        expansion header (I2C, GPMC, USB, MMC, DSS, ETM)
    -   JTAG, UART/RS-232, 2 status LEDs, 1GPIO button

More details can be found [here](http://pandaboard.org/content/platform)

-   PandaBoard EA1 Front

[![PandaBoard
front.png](http://eLinux.org/images/thumb/4/48/PandaBoard_front.png/320px-PandaBoard_front.png)](http://eLinux.org/File:PandaBoard_front.png)

A hi resolution picture of the PandaBoard EA1 front is available here:
[http://elinux.org/images/d/d4/Panda\_front.jpg](http://elinux.org/images/d/d4/Panda_front.jpg)

-   PandaBoard EA1 Back

[![Panda
back.jpg](http://eLinux.org/images/thumb/f/f1/Panda_back.jpg/240px-Panda_back.jpg)](http://eLinux.org/File:Panda_back.jpg)

# Availability

PandaBoard are in production and can be ordered from [Worldwide
distributors](http://pandaboard.org/content/buy). You can also easily
identify the board you have using [Board revision
id](http://omappedia.org/wiki/PandaBoard_Revisions)

## Rev A3

Latest version of the board.

## Rev A1/A2

[Details](http://omappedia.org/wiki/PandaBoard_Revisions#Rev_A2)

## Rev EA1/EA2

These were limited number of 'Early Adopter' boards that built prior to
production versions. [more
details](http://omappedia.org/wiki/PandaBoard_Revisions#Rev_EA1)

## Rev ES

There is now a
[PandaBoard-ES](http://pandaboard.org/content/pandaboard-es) which
includes an OMAP 4460 at up to 1.2GHz. Several important differences
make it important (at the present time) that the MLO/u-boot/kernel be
specifically crafted for the 4460. The thermal management is not in the
mainline 4430 code as yet and could cause unwanted thermal problems. So
BEWARE of running any code built for the non -ES PandaBoard on the -ES
model.

# Accessories

-   [Bamboo Board](http://eLinux.org/Panda_Bamboo "Panda Bamboo")
-   [Trainer Board](http://eLinux.org/BeagleBoard_Trainer "BeagleBoard Trainer")
-   [Acrylic case](https://specialcomp.com/pandaboard/order.htm)
-   [10" LCD LVDS plug-and-play bundle with capacitance touchscreen and
    ambient light sensor](http://bb-lvds.blogspot.com)
-   [![](http://eLinux.org/images/thumb/7/7e/Beadaframe.jpg/200px-Beadaframe.jpg)](http://eLinux.org/File:Beadaframe.jpg)
    [](http://eLinux.org/File:Beadaframe.jpg "Enlarge")
    BeadaFrame
    [BeadaFrame](http://www.nxelec.com/products/hmi/beadaframe-pandaboard)
    7" LCD display kit
    -   7" 800x480 TFT LCD screen
    -   PWM Backlight control
    -   Resistive touch panel
    -   RTC time keeper
    -   Plastic frame



-   [![](http://eLinux.org/images/thumb/7/71/IM-001a-kit1.jpg/200px-IM-001a-kit1.jpg)](http://eLinux.org/File:IM-001a-kit1.jpg)
    [](http://eLinux.org/File:IM-001a-kit1.jpg "Enlarge")
    Inti Media for Pandaboard
    [Inti Media](http://www.inti-innovations.co.uk/products/inti-media)
    an expansion board with 10" LCD - watch in action [here (multipoint
    capacitive touch
    screen)](http://www.youtube.com/watch?v=L9IN68DeEDQ) or [here
    (resistive touch
    screen)](http://www.youtube.com/watch?v=f5n0lesLyRQ)
    -   10.1 WXGA LCD with multipoint project capacitive touch panel
    -   10.1 WSVGA LCD with resistive touch panel
    -   4 additional USB ports
    -   5 user controlled LEDs
    -   5 user controlled push buttons
    -   expansion ports with 3V3 I2C, SPI, Serial




# Recommended Reading Material

-   [Embedded\_Linux\_System\_Design\_and\_Development](http://eLinux.org/Embedded_Linux_System_Design_and_Development "Embedded Linux System Design and Development")
-   [Embedded\_linux\_primer](http://eLinux.org/Embedded_linux_primer "Embedded linux primer")
-   [Building\_Embedded\_Linux\_Systems](http://eLinux.org/Building_Embedded_Linux_Systems "Building Embedded Linux Systems")
-   [Essential\_Linux\_Device\_Drivers](http://eLinux.org/Essential_Linux_Device_Drivers "Essential Linux Device Drivers")
-   [Linux\_Device\_Drivers](http://eLinux.org/Linux_Device_Drivers "Linux Device Drivers")

# How To's

-   [Build SDR for
    Pandaboard](http://eLinux.org/Panda_How_to_build_SDR "Panda How to build SDR")
-   [Add a GPIO Button](http://eLinux.org/PandaBoard_Button "PandaBoard Button")
-   [How to build MLO and
    u-boot](http://eLinux.org/Panda_How_to_MLO_%26_u-boot "Panda How to MLO & u-boot")
    for the PandaBoard **--\>\> Updated 7/23/2011**
-   [How to build Barebox](http://eLinux.org/Panda_How_to_Barebox "Panda How to Barebox")
    for the PandaBoard **--\>\> Updated 11/12/2011**
-   [How to build u-boot and
    SPL](http://eLinux.org/PandaBoard_ES_uboot_howto "PandaBoard ES uboot howto") for
    PandaBoard and PandaBoard ES **--\>\> Updated 12/27/2011**
-   [How to build 3.2
    kernel](http://eLinux.org/Panda_How_to_kernel_3_2_rel "Panda How to kernel 3 2 rel")
    for the PandaBoard **--\>\> Updated 2/18/2012**
-   [How to build 3.3-rcx
    kernel](http://eLinux.org/Panda_How_to_kernel_3_3_rcx "Panda How to kernel 3 3 rcx")
    for the PandaBoard **--\>\> Updated 2/18/2012**
-   [How to build 3.3
    kernel](http://eLinux.org/Panda_How_to_kernel_3_3_rel "Panda How to kernel 3 3 rel")
    for the PandaBoard **--\>\> Updated 3/19/2012**
-   [How to build 3.4
    kernel](http://eLinux.org/Panda_How_to_kernel_3_4_rel "Panda How to kernel 3 4 rel")
    for the PandaBoard **--\>\> NEW 6/3/2012**
-   [How to build 3.5-rcx
    kernel](http://eLinux.org/Panda_How_to_kernel_3_5_rcx "Panda How to kernel 3 5 rcx")
    for the PandaBoard **--\>\> Updated 7/16/2012**
-   [How to add two additional USB
    connections](http://eLinux.org/Panda_How_to_add_2_USBs "Panda How to add 2 USBs") to
    the PandaBoard
-   [How to add a power
    switch](http://eLinux.org/Panda_How_to_add_Power_Switch "Panda How to add Power Switch")
    to the PandaBoard **--\>\> WIP**
-   [PandaBoard Power
    Measurements](http://eLinux.org/PandaBoard_Power_Measurements "PandaBoard Power Measurements")
-   [Miscellaneous Tips for using the Pandaboard under
    Ubuntu](http://eLinux.org/PandaBoard/Ubuntu_Tips "PandaBoard/Ubuntu Tips")
-   [Build the latest kernel and run it on
    Pandaboard](http://eewiki.net/display/linuxonarm/PandaBoard)

## Older How To's

-   [How to build a minimal file system using
    buildroot](http://eLinux.org/Panda_How_to_buildroot "Panda How to buildroot") for the
    PandaBoard
-   [How to build a kernel using the buildroot toolchain from
    above](http://eLinux.org/Panda_How_to_kernel "Panda How to kernel") for the
    PandaBoard
-   [How to build 2.6.38-rcx
    kernels](http://eLinux.org/Panda_How_to_kernel_new "Panda How to kernel new") for the
    PandaBoard **--\>\> Updated 3/15/2011**
-   [How to build 2.6.38
    kernel](http://eLinux.org/Panda_How_to_kernel_2_6_38 "Panda How to kernel 2 6 38")
    for the PandaBoard **--\>\> Updated 3/16/2011**
-   [How to build 2.6.39-rcx
    kernel](http://eLinux.org/Panda_How_to_kernel_2_6_39 "Panda How to kernel 2 6 39")
    for the PandaBoard **--\>\> Updated 5/12/2011**
-   [How to build 2.6.39
    kernel](http://eLinux.org/Panda_How_to_kernel_2_6_39rel "Panda How to kernel 2 6 39rel")
    for the PandaBoard **--\>\> Updated 5/27/2011**
-   [How to build 3.0
    kernel](http://eLinux.org/Panda_How_to_kernel_3_0_rel "Panda How to kernel 3 0 rel")
    for the PandaBoard **--\>\> Updated 7/29/2011**
-   [How to build 3.0-rcx
    kernel](http://eLinux.org/Panda_How_to_kernel_3_0_rcx "Panda How to kernel 3 0 rcx")
    for the PandaBoard **--\>\> Updated 7/11/2011**
-   [How to build 3.1-rcx
    kernel](http://eLinux.org/Panda_How_to_kernel_3_1_rcx "Panda How to kernel 3 1 rcx")
    for the PandaBoard **--\>\> Updated 10/5/2011**
-   [How to build 3.1
    kernel](http://eLinux.org/Panda_How_to_kernel_3_1_rel "Panda How to kernel 3 1 rel")
    for the PandaBoard **--\>\> Updated 10/31/2011**
-   [How to build 3.2-rcx
    kernel](http://eLinux.org/Panda_How_to_kernel_3_2_rcx "Panda How to kernel 3 2 rcx")
    for the PandaBoard **--\>\> Updated 2/18/2012**

# Community

-   Website: [http://pandaboard.org](http://pandaboard.org)
-   IRC: \#pandaboard @irc.freenode.net
-   Mailing List:
    [pandaboard@googlegroups.com](http://groups.google.com/group/pandaboard)
-   [panda on
    linux-omap@vger.kernel.org](http://www.mail-archive.com/search?a=1&l=linux-omap%40vger.kernel.org&haswords=panda&date=&order=datenewest&search=Search)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Omap4430](http://eLinux.org/Category:Omap4430 "Category:Omap4430")
-   [PandaBoard](http://eLinux.org/Category:PandaBoard "Category:PandaBoard")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")

