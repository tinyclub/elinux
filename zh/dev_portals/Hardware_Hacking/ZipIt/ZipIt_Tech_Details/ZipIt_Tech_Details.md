> From: [eLinux.org](http://eLinux.org/ZipIt_Tech_Details "http://eLinux.org/ZipIt_Tech_Details")


# ZipIt Tech Details



## Contents

-   [1 ZipIt wireless IM device](#zipit-wireless-im-device)
-   [2 Hardware](#hardware)
-   [3 Source Code](#source-code)
-   [4 Serial Port Access](#serial-port-access)
-   [5 How to find the Firmware
    Version](#how-to-find-the-firmware-version)
-   [6 What's in ROM](#what-s-in-rom)
-   [7 Linux](#linux)
-   [8 init script](#init-script)
-   [9 ramdisk - custom app "Zipit"](#-ramdisk-custom-app-zipit)
-   [10 Release history](#release-history)

## [ZipIt](http://eLinux.org/ZipIt "ZipIt") wireless IM device

-   Discussion of [ZipIt](http://eLinux.org/ZipIt "ZipIt") modification
    [http://groups.yahoo.com/group/zipitwireless](http://groups.yahoo.com/group/zipitwireless)
-   Details on how to flash new firmware into [ZipIt](http://eLinux.org/ZipIt "ZipIt")
    [http://aibohack.com/zipit/](http://aibohack.com/zipit/)
-   Info on adding MMC memory to [ZipIt](http://eLinux.org/ZipIt "ZipIt")
    [ZipIt\_MMC](http://eLinux.org/ZipIt_MMC "ZipIt MMC")
-   large [scan of main board](http://rikers.org/tmp/zipit.png)
-   really large [scan of main
    board](http://www.hakman.dyn.dhs.org/zipitboard.png)
-   directory listing Media:ls-lR.txt slightly out of date
    -   `/bin/busybox` appears static linked to uClibc
    -   `/sbin/iwconfig` is static linked to uClibc
    -   `/usr/bin/Zipit` is the main binary, static linked to glibc and
        likely more
-   Made by [Aeronix](http://www.aeronix.com/) and imported
-   GPL/LGPL sources are available or documented
    -   Note: object file for Zipit binary is not available for
        re-linking so they are in violation of the LGPL license for
        glibc
    -   [http://www.zipitwireless.com/linux.html](http://www.zipitwireless.com/linux.html)
-   [ZipIt\_Peeks\_&\_Pokes](http://eLinux.org/ZipIt_Peeks_%26_Pokes "ZipIt Peeks & Pokes")

## Hardware

-   [Cirrus
    EP7312](http://www.cirrus.com/en/products/pro/detail/P139.html)
-   2M flash - MX 29LV160ATxBC-70
-   16M SDRAM - Hynix HY5V26D
-   320x240x4 LCD (grayscale)
-   Agere [WiFi](http://eLinux.org/WiFi "WiFi") chip - WL600114LY (basically "WL60011", a
    Wavelan Hermes-II)
-   Wolfson Micro
    [WM8751L](http://www.wolfsonmicro.com/uploads/documents/WM8751L.pdf)
    Stereo DAC

[amazon](http://www.amazon.com/exec/obidos/redirect?tag=darrensautocropa&path=tg%2Fdetail%2F-%2FB0002XR9IQ%2Fqid%3D1101255239%2Fsr%3D8-2%2Fref%3Dsr_8_xs_ap_i2_xgl23%3Fv%3Dglance%26s%3Delectronics%26n%3D507846)
[http://www.elkgrovewireless.com/zipit/zipit.jpg](http://www.elkgrovewireless.com/zipit/zipit.jpg)
[http://www.elkgrovewireless.com/zipit/](http://www.elkgrovewireless.com/zipit/)

## Source Code

-   Zipit Wireless Messenger Release 1.00-1.12
-   [http://kernel.org/pub/linux/kernel/v2.4/linux-2.4.21.tar.bz2](http://kernel.org/pub/linux/kernel/v2.4/linux-2.4.21.tar.bz2)
    -   [patch-2.4.21-rmk1.bz2](ftp://ftp-old.arm.linux.org.uk/pub/armlinux/source/kernel-patches/v2.4/patch-2.4.21-rmk1.bz)
    -   [http://www.zipitwireless.com/linux/patch-2.4.21-rmk1-zipit.gz](http://www.zipitwireless.com/linux/patch-2.4.21-rmk1-zipit.gz)
-   [http://ftp.sf.net/pcmcia-cs/pcmcia-cs-3.2.1.tar.gz](http://ftp.sf.net/pcmcia-cs/pcmcia-cs-3.2.1.tar.gz)
-   [http://www.agere.com/mobility/docs/wl\_lkm\_722\_abg.tar.gz](http://www.agere.com/mobility/docs/wl_lkm_722_abg.tar.gz)
    - Agere Wireless Driver
-   [http://www.zipitwireless.com/linux/patch-wl\_lkm\_abg\_alfa2-zipit.gz](http://www.zipitwireless.com/linux/patch-wl_lkm_abg_alfa2-zipit.gz)
    - Aeronix Patch
-   [http://busybox.net/downloads/legacy/busybox-1.00-pre1.tar.bz2](http://busybox.net/downloads/legacy/busybox-1.00-pre1.tar.bz2)
-   [http://uclibc.org/downloads/old-releases/uClibc-0.9.15.tar.bz2](http://uclibc.org/downloads/old-releases/uClibc-0.9.15.tar.bz2)
-   [http://ftp.gnu.org/gnu/glibc/glibc-2.2.5.tar.gz](http://ftp.gnu.org/gnu/glibc/glibc-2.2.5.tar.gz)
-   [http://www.hpl.hp.com/personal/Jean\_Tourrilhes/Linux/wireless\_tools.26.tar.gz](http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.26.tar.gz)
-   Note: as stated above the LGPL license requires that the object file
    for the Zipit binary be made available for re-linking with glibc and
    this has **not** happened.

## Serial Port Access

-   ground on GND
-   debug on DBG
-   `RxD1` on left side of R121
-   `RxD2` on right side of R122
-   `TxD2` on unlabeled point near midpoint from R42 and R53
-   `TxD1` is not available
-   you will need a [level
    shifter](http://www.aibohack.com/zipit/zipit5_schematic.gif) circuit
    with something like the MAX233A or
    [MAX233](http://www.jameco.com/webapp/wcs/stores/servlet/ProductDisplay?langId=-1&storeId=10001&catalogId=10001&productId=119873)
    to convert to to rs232 signal levels.

## How to find the Firmware Version

*\<to be supplied\>*

## What's in ROM

From Zipit Pet's post on the subscriber only Yahoo group:
[http://groups.yahoo.com/group/zipitwireless](http://groups.yahoo.com/group/zipitwireless)

Updated to 1.16 version

The [ZipIt](http://eLinux.org/ZipIt "ZipIt") device has 2MB or Flash ROM and 16MB of RAM

The Flash ROM contains a small boot loader, a zImage compressed Linux
kernel and gzip compressed ramdisk. These get expanded to RAM when the
device boots. At the end of the Flash ROM is a small area where settings
are saved (eg: passwords, [SSIDs](http://eLinux.org/SSID "SSID") etc).

[Flash ROM](http://eLinux.org/Flash_ROM "Flash ROM") Memory Map: (version 1.16)

<table>
<tbody>
<tr class="odd">
<td align="left">00000000</td>
<td align="left">boot loader (no GPL source)</td>
</tr>
<tr class="even">
<td align="left">00002000</td>
<td align="left">start of kernel zImage compressed bootloader</td>
</tr>
<tr class="odd">
<td align="left">000045B0+-</td>
<td align="left">start of gzipped Linux data (inside zImage)</td>
</tr>
<tr class="even">
<td align="left">00090000</td>
<td align="left">start of gzipped Linux ramdisk image (over 4MB expanded)</td>
</tr>
<tr class="odd">
<td align="left">001F0000</td>
<td align="left">Flash stored properties -- &quot;Aer Media Properties&quot;</td>
</tr>
<tr class="even">
<td align="left">001FFFFF</td>
<td align="left">end of <a href="http://elinux.org/Flash_ROM" title="Flash ROM">Flash ROM</a> (2MB)</td>
</tr>
</tbody>
</table>

## Linux

The linux kernel build string is:

`Linux version 2.4.21-rmk1 (root@sambaman) (gcc version 3.2) #15 Wed Apr 21 16:01:33 UTC 2004`

Most components were built a long time ago (2002 or 2003). Not
customized for the [ZipIt](http://eLinux.org/ZipIt "ZipIt").

in /lib/modules are a few dynamic loaded modules:

-   audiodrv.o [audio, not GPL],
-   wlags49\_h25\_cs.o [[[WiFi]], GPL]

[http://www.agere.com/mobility/wireless\_lan\_drivers.html](http://www.agere.com/mobility/wireless_lan_drivers.html)

## init script

The brief init script, /sbin/init



    [a bunch of echo statements]
    /bin/mount /proc
    /sbin/ifconfig lo 127.0.0.1
    insmod /lib/modules/audiodrv.o

    cd /usr/bin
    /bin/ash &
    ./Zipit
    /bin/ash

## ramdisk - custom app "Zipit"

The /usr/bin/Zipit app is \~1.6MB program that has all the goodies in
it. It uses a number of support files for the user interface

-   Sounds are in standard WAV format (http://eLinux.org/usr/bin/Sounds)
-   Images are in standard BMP format (http://eLinux.org/usr/bin/GUI)
-   The user interface is stored in .SDF data files for the different
    pages (http://eLinux.org/usr/bin/SDFs) Looks like a proprietary format
-   The string "insmod /lib/modules/wlags49\_h25.o" is buried inside
    /usr/bin/Zipit

## Release history

A URL for a checking/getting a release looks like:

[http://www.zipitwireless.net/\~zippy/90300089.txt](http://www.zipitwireless.net/~zippy/90300089.txt)
\<- with different numbers on the end.

[Tim Riker](http://eLinux.org/User:TimRiker "User:TimRiker") only has partial info, but
wishes we kept track so here's a start:

<table>
<tbody>
<tr class="odd">
<td align="left">version</td>
<td align="left">filename</td>
<td align="left">date</td>
<td align="left">md5</td>
<td align="left">comments</td>
</tr>
<tr class="even">
<td align="left">1.99</td>
<td align="left">bootrom.9IU7Y6TDK.bin</td>
<td align="left">20041015</td>
<td align="left"><code>4776E21028E8BF6B6817D8CACC8FA360</code></td>
<td align="left">00000000.txt</td>
</tr>
<tr class="odd">
<td align="left">1.99</td>
<td align="left">bootrom.4D02IZ8E.bin</td>
<td align="left">20050214</td>
<td align="left"><code>934A1B789ACE66F6B24116964C3C604B</code></td>
<td align="left">00000000.txt</td>
</tr>
<tr class="even">
<td align="left">t2.1.0</td>
<td align="left">bootrom.t2.1.0.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">t2.1.01</td>
<td align="left">bootrom.t2.1.01.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">t2.1.04</td>
<td align="left">bootrom.t2.1.04.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">t2.1.05</td>
<td align="left">bootrom.t2.1.05.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">t2.1.06</td>
<td align="left">bootrom.t2.1.06.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">t2.1.08</td>
<td align="left">bootrom.t2.1.08.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">1.0</td>
<td align="left">bootrom.t3.1.0.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">1.03</td>
<td align="left">bootrom.t3.1.03.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">1.04</td>
<td align="left">bootrom.t3.1.04.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">1.05</td>
<td align="left">bootrom.t3.1.05.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">1.06</td>
<td align="left">bootrom.t3.1.06.bin</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">1.08</td>
<td align="left">bootrom.t3.1.08.bin</td>
<td align="left">20041224</td>
<td align="left"><code>AB2178653406C18908E20FA40E15B391</code></td>
<td align="left"> ?</td>
</tr>
<tr class="even">
<td align="left">1.12</td>
<td align="left">bootrom.P4A85DK4.bin</td>
<td align="left">20050111</td>
<td align="left"><code>7AFF3A1AD8B036C95FAFCD07E64F6171</code></td>
<td align="left"> ?</td>
</tr>
<tr class="odd">
<td align="left">1.16</td>
<td align="left">bootrom.4D02IZ8E.bin</td>
<td align="left">20050214</td>
<td align="left"><code>934A1B789ACE66F6B24116964C3C604B</code></td>
<td align="left">Yahoo messenger, shoutout</td>
</tr>
<tr class="even">
<td align="left">1.21</td>
<td align="left">bootrom.4KD8G8NA.bin</td>
<td align="left">20050321</td>
<td align="left"><code>609BDD07C8169305A2550A3010D658F2</code></td>
<td align="left">more Yahoo fixes</td>
</tr>
<tr class="odd">
<td align="left">1.22</td>
<td align="left">bootrom.S73HS0O1.bin</td>
<td align="left">20050825</td>
<td align="left"><code>9146A4C0D370EB0524838E7B06AED343</code></td>
<td align="left"> ?</td>
</tr>
</tbody>
</table>


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

