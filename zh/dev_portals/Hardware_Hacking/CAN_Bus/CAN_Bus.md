> From: [eLinux.org](http://eLinux.org/CAN_Bus "http://eLinux.org/CAN_Bus")


# CAN Bus



## Contents

-   [1 Overview](#overview)
-   [2 CAN Support in Linux](#can-support-in-linux)
    -   [2.1 SocketCAN Supported
        Protocols](#socketcan-supported-protocols)
    -   [2.2 SocketCAN Supported
        Controllers](#socketcan-supported-controllers)
    -   [2.3 SocketCAN Support in Programming
        Languages/Environments](#socketcan-support-in-programming-languages-environments)
    -   [2.4 can4linux Supported
        Controllers](#can4linux-supported-controllers)
    -   [2.5 can4linux Support in Programming
        Languages/Environments](#can4linux-support-in-programming-languages-environments)
    -   [2.6 CAN Controllers Emulation
        (WIP/experimental)](#can-controllers-emulation-wip-experimental)
    -   [2.7 SocketCAN Bechmarking](#socketcan-bechmarking)
    -   [2.8 SocketCAN Tutorials](#socketcan-tutorials)

### Overview

The CAN bus is an ISO standard bus originally developed for vehicles. It
manages the Chassis Electrical System Control and is responsible for
critical activities like engine electrical, and skid control. This
system is also used to provide vehicle diagnostic information for
maintenance. A multi-star configuration seems typical of this bus with a
primary bus line that branches into sub bus lines at its extremities
then attaches to multiple device nodes. Differential voltage is applied
over twisted pair at 1.5 to 2.5V and 2.5 to 3.5V for noise resistant
signaling. Bit rates up to 1 Mbit/s are possible at network lengths
below 40 m. Decreasing the bit rate allows longer network distances
(e.g., 500 m at 125 kbit/s). (Jeremiah J. Flerchinger
[Source](http://eLinux.org/images/e/ed/Avc-lan.pdf "Avc-lan.pdf")) Controllers supporting
CAN FD, an enhanced CAN version with frames up to 64 byte and bit rates
up to 4 Mbit/s, will be available in the second half of 2014. A
can4linux version supportig CAN FD on a [IFI
CAN](http://www.ifi-pld.de/IP/CANFD/canfd.html) is ready to be used.

Although developed as car communication network CAN is used in many
other areas, industrial, medical, maritime laboratory and more. Most
often with a CAN based higher layer protocol like
[CANopen](http://en.wikipedia.org/wiki/CANopen) on top of it.


 Additional information can be found at:

[http://en.wikipedia.org/wiki/CAN\_bus](http://en.wikipedia.org/wiki/CAN_bus)

[SocketCAN News](https://plus.google.com/u/0/117660856159215855502)

CiA [CAN in Automation](http://www.can-cia.org) CAN user association

[CAN Wiki](http://www.can-wiki.info)

[CAN FD Specification Version
1.0](http://www.bosch-semiconductors.de/media/pdf_1/canliteratur/can_fd_spec.pdf)

### CAN Support in Linux

CAN is supported by Linux device drivers. Mainly two types exist.
Character device based drivers and network socket based drivers. The
Linux kernel supports CAN with the SocketCAN framework.

-   [SocketCAN
    Documentation](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;f=Documentation/networking/can.txt)
-   [mailing list for Linux Kernel CAN
    development](http://vger.kernel.org/vger-lists.html#linux-can)
-   [linux-can git
    repository](https://git.kernel.org/cgit/linux/kernel/git/mkl/linux-can.git)
-   [linux-can-next git
    repository](https://git.kernel.org/cgit/linux/kernel/git/mkl/linux-can-next.git)
-   [Berlios Project Page
    (obsolete)](http://developer.berlios.de/projects/socketcan/)

One of the character based drivers is can4linux.

-   [SourceForge project
    page](http://sourceforge.net/projects/can4linux/)
-   [German Wikipedia article](http://de.wikipedia.org/wiki/Can4linux)
-   [English Wikipedia article](http://en.wikipedia.org/wiki/Can4linux)

#### SocketCAN Supported Protocols

-   RAW: send & receive raw CAN frames
-   BCM: Broadcast manager, offload repetitive work to the Linux kernel
-   ISOTP ...
-   SAE [J1939](http://eLinux.org/J1939 "J1939")

#### SocketCAN Supported Controllers

-   Microchip MCP251x
-   Atmel AT91 SoCs
-   ESD 331 CAN Cards
-   NXP (Philips) SJA1000
-   Freescale MPC52xx SoCs
-   Bosch CC770
-   Intel AN82527
-   TIs SoCs
-   Serial/network devices utilizing ASCII protocol (slcan driver)

<table>
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<col width="14%" />
<thead>
<tr class="header">
<th align="left">Vendor</th>
<th align="left">Device Name</th>
<th align="left">Driver Module Name</th>
<th align="left">Controller</th>
<th align="left">Kconfig Option</th>
<th align="left">Linux Mainline</th>
<th align="left">Remarks</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><a href="http://vscom.de">VScom</a></td>
<td align="left"><a href="http://vscom.de/1_1_05_3.htm">NET-CAN</a></td>
<td align="left">slcan</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_SLCAN</td>
<td align="left">2.6.38</td>
<td align="left">needs slcand and socat</td>
</tr>
<tr class="even">
<td align="left"><a href="http://vscom.de">VScom</a></td>
<td align="left"><a href="http://vscom.de/1_1_05_4.htm">PCI-2CAN</a></td>
<td align="left">slcan</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_SLCAN</td>
<td align="left">2.6.38</td>
<td align="left">needs slcand</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://vscom.de">VScom</a></td>
<td align="left"><a href="http://vscom.de/1_1_05_1.htm">SER-CAN</a></td>
<td align="left">slcan</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_SLCAN</td>
<td align="left">2.6.38</td>
<td align="left">needs slcand</td>
</tr>
<tr class="even">
<td align="left"><a href="http://vscom.de">VScom</a></td>
<td align="left"><a href="http://vscom.de/1_1_05_2.htm">USB-CAN</a></td>
<td align="left">slcan</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_SLCAN</td>
<td align="left">2.6.38</td>
<td align="left">needs slcand</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://www.lawicel-shop.se">LAWICEL</a></td>
<td align="left"><a href="http://www.can232.com/?page_id=14">CAN232</a></td>
<td align="left">slcan</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_SLCAN</td>
<td align="left">2.6.38</td>
<td align="left">needs slcand</td>
</tr>
<tr class="even">
<td align="left"><a href="http://www.lawicel-shop.se‎">LAWICEL</a></td>
<td align="left"><a href="http://www.can232.com/?page_id=16">CANUSB</a></td>
<td align="left">slcan</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_SLCAN</td>
<td align="left">2.6.38</td>
<td align="left">needs slcand</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://www.peak-system.com">PEAK</a></td>
<td align="left"><a href="http://www.peak-system.com/PCAN-PCI.207.0.html">PCAN-PCI</a></td>
<td align="left">peak_pci</td>
<td align="left">sja1000</td>
<td align="left">CONFIG_CAN_PEAK_PCI</td>
<td align="left">3.2</td>
<td align="left">supports all PCAN-[mini]PCI[e][104] variants</td>
</tr>
<tr class="even">
<td align="left"><a href="http://www.peak-system.com">PEAK</a></td>
<td align="left"><a href="http://www.peak-system.com/PCAN-USB.199.0.html">PCAN-USB</a></td>
<td align="left">peak_usb</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_PEAK_USB</td>
<td align="left">3.4</td>
<td align="left">supports PCAN-USB[pro][hub] (no LIN support)</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://www.kvaser.com/">Kvaser</a></td>
<td align="left"><a href="http://www.kvaser.com/products-services/our-products/#?interfaces=mini-pci-express,pci104,pci,pci-express">PCIcanx</a></td>
<td align="left">kvaser_pci</td>
<td align="left">sja1000</td>
<td align="left">CONFIG_CAN_KVASER_PCI</td>
<td align="left">2.6.31</td>
<td align="left">supports all PCI-[mini]PCI[e][104] variants</td>
</tr>
<tr class="even">
<td align="left"><a href="http://www.kvaser.com/">Kvaser</a></td>
<td align="left"><a href="http://www.kvaser.com/products-services/our-products/#?interfaces=usb">Leaf</a></td>
<td align="left">kvaser_usb</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_KVASER_USB</td>
<td align="left">3.8</td>
<td align="left">supports USB Leaf / Memorator / Blackbird / R (see detailed USB device IDs in kvaser_usb.c)</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://www.kvaser.com/">Kvaser</a></td>
<td align="left"><a href="http://www.kvaser.com/products-services/our-products/#?interfaces=usb">USBCan-II</a></td>
<td align="left">kvaser_usb</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_KVASER_USB</td>
<td align="left"><a href="http://thread.gmane.org/gmane.linux.can/7570">commits pulled-in for the 3.20 release</a></td>
<td align="left">supports:
<ul>
<li>Kvaser USBCan-II HS/LS</li>
<li>Kvaser USBCan-II HS/HS</li>
<li>Kvaser USBcan Rugged (&quot;USBcan Rev B&quot;)</li>
<li>Kvaser Memorator HS/LS</li>
<li>Kvaser Memorator HS/HS</li>
<li>Scania VCI2 (if you have the Kvaser logo on top)</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><a href="http://www.ems-wuensche.com">EMS Wünsche</a></td>
<td align="left"><a href="http://www.ems-wuensche.com/product/datasheet/html/can-pccard-laptop-notebook-adapter-cpccard.html">CPC-Card</a></td>
<td align="left">ems_pcmcia</td>
<td align="left">sja1000</td>
<td align="left">CONFIG_CAN_EMS_PCMCIA</td>
<td align="left">3.2</td>
<td align="left">discontinued</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://www.ems-wuensche.com">EMS Wünsche</a></td>
<td align="left"><a href="http://www.ems-wuensche.com/product/datasheet/html/can-usb-adapter-converter-interface-cpcusb.html">CPC-USB/ARM7</a></td>
<td align="left">ems_usb</td>
<td align="left">(unknown)</td>
<td align="left">CONFIG_CAN_EMS_USB</td>
<td align="left">3.2</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left"><a href="http://www.ems-wuensche.com">EMS Wünsche</a></td>
<td align="left"><a href="http://www.ems-wuensche.com/product/datasheet/html/can-pci-plugincard-multiple-channels-cpcpci.html">CPC-PCI/PCIe</a></td>
<td align="left">ems_pci</td>
<td align="left">sja1000</td>
<td align="left">CONFIG_CAN_EMS_PCI</td>
<td align="left">3.2</td>
<td align="left">up to four channel</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://www.ems-wuensche.com">EMS Wünsche</a></td>
<td align="left"><a href="http://www.ems-wuensche.com/product/datasheet/html/can-pci-104-passive-plugincard-cpc104p.html">CPC-PC104P</a></td>
<td align="left">ems_pci</td>
<td align="left">sja1000</td>
<td align="left">CONFIG_CAN_EMS_PCI</td>
<td align="left">3.2</td>
<td align="left">up to four channel on a PC104+ board</td>
</tr>
<tr class="even">
<td align="left"><a href="http://8devices.com">8devices</a></td>
<td align="left"><a href="http://8devices.com/usb2can">USB2CAN</a></td>
<td align="left">usb_8dev</td>
<td align="left">(STR750FV2)</td>
<td align="left">CONFIG_CAN_8DEV_USB</td>
<td align="left">3.9</td>
<td align="left"><a href="https://github.com/krumboeck/usb2can">STR750FV2 Firmware</a></td>
</tr>
<tr class="odd">
<td align="left"><a href="http://www.softing.com">Softing</a></td>
<td align="left"><a href="http://automotive.softing.com/en/products/communication-interfaces-can.html">CANcard2</a></td>
<td align="left">softing_cs</td>
<td align="left">sja1000 or NEC-005(?)</td>
<td align="left">CONFIG_CAN_SOFTING_CS</td>
<td align="left">2.6.38</td>
<td align="left">Supports {CAN,EDIC}card{,SJA,2} PCMCIA cards
<p>Needs firmware <a href="http://www.gitorious.org/linux-can/can-misc">softing-fw-4.6-binaries.tar.gz</a></p></td>
</tr>
</tbody>
</table>

#### SocketCAN Support in Programming Languages/Environments

-   [Android](http://eLinux.org/Android "Android")
-   [Java](http://eLinux.org/Java "Java")
-   [Python](http://eLinux.org/Python_Can "Python Can")
-   [Python library for CAN](https://github.com/rscada/libcanopen/)
-   [Matlab/Simulink blocks to send and receive CAN
    messages](http://lintarget.sourceforge.net/can_bus/index.html)

#### can4linux Supported Controllers

-   [Allwinner A20](http://linux-sunxi.org/A20) with integrated CAN (on
    the popular [BananaPi](http://www.lemaker.org/) single-board
    computer.)
-   Analog Devices BlackFin BF537
-   Atmel AT91 SoCs
-   [Freescale](http://www.freescale.com/) FlexCAN (ColdFire 5282,
    i.MX25, i.MX28, i.MX35)
-   Intel 82527 (the replacement Bosch CC770 should work)
-   Microchip Stand Alone CAN MCP2515
-   NXP Stand Alone CAN
    [SJA1000](http://www.nxp.com/documents/data_sheet/SJA1000.pdf) (on
    different ISA or PCI/PCIe boards)
-   [Xilinx](http://www.xilinx.com/products/intellectual-property/DO-DI-CAN.htm)
    Zynq with XCAN
-   'virtual' CAN mode without CAN hardware
-   'virtual' CAN mode supporting [CAN
    FD](http://www.can-wiki.info/doku.php?id=can_fd)
-   [IFI CAN](http://www.ifi-pld.de/IP/CANFD/canfd.html) FPGA IP, in
    classic CAN mode and CAN FD mode

#### can4linux Support in Programming Languages/Environments

-   C - many examples and useful applications are provided with the
    package, check can4linux-examples/
-   [Tcl/Tk](http://eLinux.org/index.php?title=Tcl/Tk&action=edit&redlink=1 "Tcl/Tk (page does not exist)")
    also in can4linux-examples/
-   [Python](http://eLinux.org/index.php?title=Python&action=edit&redlink=1 "Python (page does not exist)")
    also in can4linux-examples/

#### CAN Controllers Emulation (WIP/experimental)

-   SJA1000 CAN controller based PCI board emulation for QEMU
    -   Cards models provided:
        -   Simple memory mapped SJA1000 in the first PCI BAR with
            ad-hoc PCI ID
        -   Kvaser PCIcan-S single I/O mapped SJA1000 model compatible
            with kvaser\_pci Linux driver on guest side
    -   The emulated CAN buses can be connected to virtual or physical
        SocketCAN interface if Linux is used as host system
    -   Project repository:
        [https://github.com/CTU-IIG/qemu](https://github.com/CTU-IIG/qemu)
    -   Work started by 2013 GSoC project when RTEMS project donated its
        slot to work on QEMU CAN support - see [RTEMS related
        page](https://devel.rtems.org/wiki/Developer/Simulators/QEMU/CANEmulation)
        for more info and use instructions

#### SocketCAN Bechmarking

-   [CAN gateway timing
    analysis](http://rtime.felk.cvut.cz/can/benchmark/3.0/) and
    [repository with benchmark
    infrastructure](http://rtime.felk.cvut.cz/gitweb/can-benchmark.git)

#### SocketCAN Tutorials

-   [Bringing CAN interface
    up](http://eLinux.org/Bringing_CAN_interface_up "Bringing CAN interface up")
-   [can-utils](http://eLinux.org/Can-utils "Can-utils")
-   [libsocketcan](http://eLinux.org/index.php?title=Libsocketcan&action=edit&redlink=1 "Libsocketcan (page does not exist)")
-   [libnl](http://eLinux.org/index.php?title=Libnl&action=edit&redlink=1 "Libnl (page does not exist)")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Networking](http://eLinux.org/Category:Networking "Category:Networking")

