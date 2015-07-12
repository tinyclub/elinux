> From: [eLinux.org](http://eLinux.org/NaviEngine "http://eLinux.org/NaviEngine")


# NaviEngine



[NEC's](http://www.necel.com/micro/en/) [NaviEngine
1](http://www.nec.co.jp/techrep/en/journal/g07/n04/070409.html) is a SoC
product based on [ARM's](http://www.arm.com/)
[ARM11MPCore](http://www.arm.com/products/CPUs/ARM11MPCoreMultiprocessor.html).
It's for car navigation systems that adopts the SMP (Symmetrical
Multicore Processor). The chip delivers high-speed parallel processing
performance of up to 1920MIPS at 400 MHz. In addition, NaviEngine1 has
2D and 3D graphics using the POWERVR SGX 535 graphics core by
Imagination Technologies. Volume production is scheduled to begin in
March 2009.

## Contents

-   [1 Hardware](#hardware)
    -   [1.1 Chip](#chip)
    -   [1.2 Eval board](#eval-board)
-   [2 Software](#software)
    -   [2.1 Operating systems](#operating-systems)
    -   [2.2 QEMU](#qemu)
-   [3 Resources](#resources)

# Hardware

## Chip

A [block
diagram](http://www.nec.co.jp/techrep/en/journal/g07/n04/070409-130.html)
shows the internals of [NaviEngine1
chip](http://www.fareastgizmos.com/entry_images/1007/04/NEC.jpg).

## Eval board

An [evaluation
board](http://www.t-engine4u.com/pictures/mp_t-kernel_ne1_f.png) is
available:

-   NEC uPD35001 System-on-chip (ARM11 MPCore x4)
-   DDR2 SDRAM (256MB)
-   NOR Flash memory (64MB)
-   NAND Flash memory (256MB)
-   Three on-chip UARTs
-   LAN9118 Ethernet adapter
-   On-chip LCD controller
-   USBH2.0, ATA6, PCI, CSI, SPDIF, I2S, etc

It's available from [Personal Media
Corporation](http://www.personal-media.co.jp/index-e.html) for 312.900
Yen. See [specification
page](http://translate.google.de/translate?js=y&prev=_t&hl=en&ie=UTF-8&u=http%3A%2F%2Fwww.t-engine4u.com%2Fproducts%2Fmp_t-kernel_ne1.html&sl=ja&tl=en&history_state0=)
and (japanese) [product
sheet](http://www.t-engine4u.com/archive/mp_t-kernel_ne1.pdf).

# Software

## Operating systems

The following operating systems are running on NaviEngine:

-   [eT-Kernel Multi-Core
    Edition](http://edageek.com/2007/10/03/esol-nec/)
-   [Symbian](http://www.flickr.com/photos/james_nash/2964240888/in/photostream/)
    (on multicore)
-   WinCE
-   Linux (?)

[Demo](http://www.youtube.com/watch?v=2oVwUHbMHsc) running eT-Kernel on
one CPU and WinCE on the three other ARM11 cores. Demonstrates graphic
performance, too.

## QEMU

QEMU emulation for NaviEngine is part of 2008.05 OpenSolaris. It
emulates

-   DDR2 SDRAM (256MB)
-   NOR Flash memory (64MB)
-   Three on-chip UARTs

See OpenSolaris release note section [1.2
Architecture](http://www.opensolaris.org/os/project/osarm/200805/relnotes/)
for details and OpenSolaris installation section [6.1 Setup
QEMU](http://www.opensolaris.org/os/project/osarm/200805/installation/).

# Resources

-   [NaviEngine 1, System LSI for SMP-Based Car Navigation
    Systems](http://www.nec.co.jp/techrep/en/journal/g07/n04/070409.pdf)
-   [NaviEngine Multicore Platform and its role in the evolution of car
    navigation
    systems](http://www.necel.com/magazine/en/vol_0075/vol_0075.pdf)
-   [K2L MOST starter kit for
    NaviEngine](http://www.k2l.de/fileadmin/user_upload/downloads/k2l_MOST_Starter_Kit_NEC_new.pdf)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")

