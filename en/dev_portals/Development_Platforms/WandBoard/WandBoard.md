> From: [eLinux.org](http://eLinux.org/WandBoard "http://eLinux.org/WandBoard")


# WandBoard



<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left"><p><a href="http://elinux.org/File:Merge-arrows.png"><img src="http://elinux.org/images/9/9f/Merge-arrows.png" alt="Merge-arrows.png" /></a></p></td>
<td align="left">This page is may need to be merged with other page(s) including <a href="http://elinux.org/Wandboard" title="Wandboard">Wandboard</a>. Please help to merge the articles, or discuss the issue on the talk page.</td>
</tr>
</tbody>
</table>



The [[WandBoard](http://wandboard.org)] is a very low-cost development
platform based on the Freescale i.MX6 processor.

## Contents

-   [1 Hardware](#hardware)
    -   [1.1 EDM module](#edm-module)
    -   [1.2 Motherboard](#motherboard)
-   [2 Availability](#availability)
-   [3 Community](#community)

# Hardware

There are currently two versions of WandBoard, "Solo" and "Dual". The
WandBoard itself is a System-On-Module of the [EDM](http://eLinux.org/EDM "EDM") standard
that comes with a matching motherboard. The motherboard is quite trivial
and is the same for both versions of the WandBoard.

[![WandBoard
front.jpg](http://eLinux.org/images/e/e9/WandBoard_front.jpg)](http://eLinux.org/File:WandBoard_front.jpg)
[![WandBoard
back.jpg](http://eLinux.org/images/e/e2/WandBoard_back.jpg)](http://eLinux.org/File:WandBoard_back.jpg)



## EDM module

-   [Freescale](http://eLinux.org/index.php?title=Freescale&action=edit&redlink=1 "Freescale (page does not exist)")
    [i.MX6](http://eLinux.org/index.php?title=I.MX6&action=edit&redlink=1 "I.MX6 (page does not exist)")
    [CPU](http://eLinux.org/index.php?title=CPU&action=edit&redlink=1 "CPU (page does not exist)")
    ([ARM](http://eLinux.org/index.php?title=ARM&action=edit&redlink=1 "ARM (page does not exist)")
    Cortex A9)
    -   i.MX6 Solo (single core) on "Solo" version
    -   i.MX6 Dual Lite (dual core) on "Dual" version
    -   [Vivante](http://eLinux.org/index.php?title=Vivante&action=edit&redlink=1 "Vivante (page does not exist)")
        GPU:
        -   3D core: GC880 @ @ 533MHz, 1 shader core 4.8 GFLOPS
        -   2D core: GC320 composition engine
-   DDR3 RAM
    -   512 MB on "Solo" version (two 2Gbit chips)
    -   1 Gigabyte on "Dual" version (four 2Gbit chips)
-   MicroSD card slot (bootable, at SD3 of the CPU)
-   AR8031 Gigabit LAN
-   BCM4329 Wi-Fi+Bluetooth (at SD2, UART3, AUD5; unpopulated on "Solo"
    version)
-   Flat cable connector for camera (CSI, I2C2, GPIO)
-   Power circuit (5V input)



## Motherboard

-   Gigabit LAN connector
-   HDMI connector
-   USB host connector (USB3 for future use but currently in USB2 mode
    only)
-   USB OTG connector
-   MicroSD card slot (at SD1)
-   UART DB9 connector (at UART1 via ADM3202)
-   Audio I/O (at AUD3 via SGTL5000) and SPDIF (3.5mm jacks and optical)
-   5VDC power barrel connector
-   SATA connector (probably unpopulated, reserved for future use; no
    SATA on i.MX6 Solo and Dual Lite)
-   Four 1.27mm 2x10 expansion headers:
    -   LVDS0 (4 signal pairs + clock), +3V3
    -   Flat panel display data lines (24 bit total); no power or GND at
        this header
    -   Rest of FPD data lines, FPD control lines, +3V3, three I2C
        interfaces
    -   One SPI (with two CS), 8 GPIO lines, +5V



# Availability

As of Jan 17, 2013 preorder only. Prices are 69 USD for Solo and 89 USD
for Dual. First boards seem to be shipped to partner developers.



# Community

-   Website: [http://wandboard.org](http://wandboard.org)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [NeedsMerge](http://eLinux.org/Category:NeedsMerge "Category:NeedsMerge")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [Hardware](http://eLinux.org/Category:Hardware "Category:Hardware")
-   [SBC](http://eLinux.org/index.php?title=Category:SBC&action=edit&redlink=1 "Category:SBC (page does not exist)")
-   [ARM](http://eLinux.org/index.php?title=Category:ARM&action=edit&redlink=1 "Category:ARM (page does not exist)")

