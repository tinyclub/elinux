> From: [eLinux.org](http://eLinux.org/Processors "http://eLinux.org/Processors")


# Processors



Here is a list of different processor families, with miscellaneous notes
for development information:

See also [Hardware Hacking](http://eLinux.org/Hardware_Hacking "Hardware Hacking") for a
list of systems that include these processors.

## Contents

-   [1 ARC](#arc)
-   [2 ARM](#arm)
-   [3 MIPS](#mips)
-   [4 SuperH](#superh)
    -   [4.1 Renesas SuperH Overview](#renesas-superh-overview)
    -   [4.2 Devices](#devices)
-   [5 PowerPC](#powerpc)
    -   [5.1 Processors](#processors)
    -   [5.2 Tools](#tools)
    -   [5.3 RT Patches](#rt-patches)
    -   [5.4 Documents](#documents)
-   [6 XScale](#xscale)
-   [7 x86](#x86)
-   [8 AVR32](#avr32)
-   [9 Blackfin](#blackfin)
-   [10 m68k](#m68k)
-   [11 Further reading](#further-reading)

## ARC

The [ARC
770D](http://www.synopsys.com/IP/ProcessorIP/ARCProcessors/ARC700)
32-bit RISC processor from the [DesignWare ARC Processor IP
family](http://www.synopsys.com/IP/ProcessorIP) is optimized for running
Linux. The latest version of ARC Linux is available from
[kernel.org](http://kernel.org) and older versions as well as the GNU
toolchain and several other packages like U-boot and Buildroot for ARC
are available via
[GitHub](https://github.com/foss-for-synopsys-dwc-arc-processors).


 More information from Synopsys:

-   [ARC Linux](http://www.synopsys.com/dw/ipdir.php?ds=sw_linux)
-   [GNU Toolchain for ARC
    processors](http://www.synopsys.com/dw/ipdir.php?ds=sw_jtag_gnu)



## ARM

See [ARM website](http://www.arm.com) and the [Wikipedia ARM
article](http://en.wikipedia.org/wiki/ARM_architecture) for information
about the ARM architecture and processor family.

From the Linux perspective, there are 2 very different kinds of ARM
chips:

-   ARM processors that include a memory management unit (MMU), and can
    run standard Linux
-   ARM processors without MMU. These can run a modified version of
    Linux called uClinux ( [http://uclinux.org/](http://uclinux.org/) ),
    enabling Linux to run on MMUless platforms or embedded processors
    with memory protection unit (MPU). These include ARM processors such
    as ARM7TDMI, ARM1156T2(F)-S or ARM Cortex-R4(F) for instance.

Please note that because of security considerations for MMU-less
processors, it is unwise to use them when 3rd-party or untrusted code
will be running on the device. For locked-down, single function devices,
MMU-less processors may be appropriate. They are usually less expensive
than processors with MMU.

Some major ARM platforms/SOCs are:

-   [Sitara](http://eLinux.org/Sitara "Sitara"), [DaVinci](http://eLinux.org/DaVinci "DaVinci") and
    [OMAP](http://eLinux.org/OMAP "OMAP") from [Texas
    Instruments](http://www.ti.com/corp/docs/landing/davinci/firstproducts.html)
    -   TI lists where to find the Linux kernel GIT repositories for the
        broad market devices on their [applications processors
        cross-reference](http://wiki.davincidsp.com/index.php/Applications_Processors_Crossreference)
    -   There is also an [OMAP Linux kernel
        project](http://omappedia.org/wiki/Linux_OMAP_Kernel_Project)
-   i.MX - by FreeScale
    -   Freescale's GIT repository for i.MX Linux support is at:
        [http://opensource.freescale.com](http://opensource.freescale.com)
        -   Info about this repository, as of April 2007 is at:
            [http://www.spinics.net/lists/arm-kernel/msg39771.html](http://www.spinics.net/lists/arm-kernel/msg39771.html)
-   [ARM
    RealView](http://www.arm.com/products/DevTools/Hardware_Platforms.html)
    platforms - by ARM Ltd.
    -   Linux BSP and resources available at
        [http://www.arm.com/linux](http://www.arm.com/linux) with
        associated [GIT tree](http://www.linux-arm.org/git)
-   XScale/PXA - by Marvell (formerly Intel) -- has MMU
    -   PXA255/PXA26x - Cotulla/Dalhart
    -   PXA27x - Bulverde
    -   PXA3xx - Monahans family
        -   Linux PXA255/PXA26x/PXA27x BSPs are available in mainline
            kernel. You can find PXA3xx BSP from
            [Marvell](http://www.marvell.com/). Marvell team is working
            hard to get PXA3xx patches accepted by the mainline.
-   Orion - by Marvell
    -   Linux BSP for Orion-2 SoC available on [ARM Linux Mailing
        List](http://marc.info/?l=linux-arm-kernel&m=117869744222933&w=2).
-   Philips LPC21xx series of ARM processors are currently the
    lowest-cost ARM processors available. But they have no MMU.
-   [JuiceBox](http://eLinux.org/JuiceBox "JuiceBox") uses a ARM S3C44B0X. It runs
    uClinux.
-   AT91 - by Atmel
    -   [AT91RM9200](http://www.atmel.com/devices/RM9200.aspx) - ARM920T
        based -- has MMU
    -   [AT91SAM9
        Series](http://www.atmel.com/products/microcontrollers/arm/default.aspx)
        - ARM926EJ-S based -- has MMU
    -   [SAMA5D3
        Series](http://www.atmel.com/products/microcontrollers/ARM/sama5.aspx#SAMA5D3_series)
        - Cortex-A5 based -- has MMU
    -   [SAMA5D4
        Series](http://www.atmel.com/products/microcontrollers/arm/sama5.aspx#SAMA5D4_series)
        - Cortex-A5 based -- has MMU
    -   Linux gateway : [www.linux4sam.org](http://www.linux4sam.org)
    -   Github for Linux-based systems : [linux4sam.org
        github](https://github.com/linux4sam)
-   Cirrus Logic ([Linux forum and download
    site](http://arm.cirrus.com/))
    -   EP73xx - ARM720T based
    -   EP93xx - ARM920T based
-   Samsung Electronics (System LSI)
    -   [S3C24xx](http://eLinux.org/S3C24xx "S3C24xx") - ARM 9 Series
        -   [S3C2410](http://eLinux.org/S3C2410 "S3C2410")
            [[1]](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=836&partnum=S3C2410&xFmly_id=229)
            - ARM920T
        -   [S3C2440](http://eLinux.org/S3C2440 "S3C2440")
            [[2]](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=836&partnum=S3C2440&xFmly_id=229)
            - ARM920T
        -   S3C2443
            [[3]](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=836&partnum=S3C2443&xFmly_id=229)
            - ARM920T
        -   [S3C2412](http://eLinux.org/S3C2412 "S3C2412")
            [[4]](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=836&partnum=S3C2412&xFmly_id=229)
            - ARM926EJ
        -   S3C2413
            [[5]](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=836&partnum=S3C2413&xFmly_id=229)
            - ARM926EJ
        -   S3C2416
            [[6]](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=836&partnum=S3C2416&xFmly_id=229)
            - ARM926EJ
        -   S3C2450
            [[7]](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=836&partnum=S3C2450&xFmly_id=229)
            - ARM926EJ
    -   ARM 11 Series
        -   S3C6400 - ARM1176
        -   [S3C6410](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=835&partnum=S3C6410&xFmly_id=229)
            - ARM1176, 800Mhz, 667Mhz, 533Mhz
        -   [S5P6440](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=835&partnum=S5P6440&xFmly_id=229)
            - ARM1176, 667Mhz, 533Mhz
        -   S5P6442
        -   S5P6450
    -   Cortex-A8 Series
        -   [S5PC100](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=834&partnum=S5PC100&xFmly_id=229)
            - 833Mhz, 667Mhz
        -   [EXYNOS3110](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=834&partnum=Exynos%203110&xFmly_id=229)
            - 1Ghz
    -   Cortex-A9 Series
        -   [EXYNOS4210](http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=844&partnum=Exynos%204210&xFmly_id=229)
            - 1.2Ghz, 1Ghz
-   [Allwinner
    Technology](http://eLinux.org/index.php?title=Allwinner_Technology&action=edit&redlink=1 "Allwinner Technology (page does not exist)")
    ([AllwinnerTech(Chinese)](http://www.allwinnertech.com/))
    -   [A1x](http://eLinux.org/A1x "A1x") - Cortex-A8, 1\~1.5Ghz
-   Qualcomm Inc. [[8]](http://www.qualcomm.com)
    -   [Snapdragon S3
        (Scorpion)](http://eLinux.org/Snapdragon_S3_(Scorpion) "Snapdragon S3 (Scorpion)")
    -   [Snapdragon S4
        (Krait)](http://eLinux.org/Snapdragon_S4_(Krait) "Snapdragon S4 (Krait)")

## MIPS

Information about MIPS processor architecture can be found
[here](http://www.mips.com). For the Linux port information can be found
[here](http://www.linux-mips.org).

Processors based on MIPS architecture include

1.  [TX System
    RISC](http://www.toshiba.com/taec/Catalog/Family.do?familyid=5) from
    Toshiba.
2.  [MSP series](http://www.pmc-sierra.com/mips-processors) of processor
    from PMC Sierra.

## SuperH

[![Superh
logo.gif](http://eLinux.org/images/5/57/Superh_logo.gif)](http://eLinux.org/File:Superh_logo.gif)

Built by [Renesas Technology](http://www.renesas.com/homepage.jsp) the
webpage of record for the SuperH family of microprocessors can be found
here: [SuperH RISC Engine
Family](http://www.renesas.com/fmwk.jsp?cnt=superh_family_landing.jsp&fp=/products/mpumcu/superh_family/).

Wikipedia Page: [SuperH](http://en.wikipedia.org/wiki/SuperH)

Linux on SuperH: [linux-sh](http://linux-sh.org/shwiki/FrontPage)

### Renesas SuperH Overview

SuperH is an embedded RISC developed for high cost-performance,
miniaturization, and performance per unit of power consumption (MIPS/W).
We are developing CPU cores for a wide range of applications and
functions and have many products available. Our product lines include a
series with the SH-2 as the CPU core and on-chip large-capacity flash
memory and peripheral functions such as timer, serial I/O, and AD
converter, and a series with the SH-3 or SH-4 as the CPU core, which
achieves high-speed data processing and is equipped with cache and MMU.
Additionally, there is lineup of series with the SH2-DSP or SH3-DSP as
the CPU core, which have full DSP functions and an emphasis on
multimedia and communications processing. Currently available products
also have lots of features, such as low power modes, low power
consumption, and small size. Various versatile operating systems and
development tools have been improved, allowing for more efficient
development.

### Devices

-   Sega
    -   [Dreamcast](http://linux-sh.org/shwiki/Dreamcast) - Limited to
        the machine models that can start by MIL-CD and usage of a Broad
        Band Adapter is recommended.
-   Hitachi ULSI Systems
    -   [MS7206SE01](http://linux-sh.org/shwiki/MS7206SE01) - SH72060
        Solution Engine
    -   MS7750SE01 - SH7750(sh4) Solution Engine
    -   MS7709SE01 - SH7709(sh3) Solution Engine
-   SuperH, Inc.
    -   ["MicroDev"]
-   HP Jornada
    -   525 (SH7709 (sh3))
    -   548 (SH7709A (sh3))
    -   620LX (SH7709 (sh3))
    -   660LX (SH7709 (sh3))
    -   680 (SH7709A (sh3))
    -   690 (SH7709A (sh3))
-   Renesas Technology Corp.
    -   RTS7751R2D - CE Linux Forum（CELF）Compliant Evaluation Board
-   [Renesas Europe/MPC Data Limited](http://www.shlinux.com)
    -   EDOSK7705 - SH7705 sh3
-   EDOSK7760 - SH7760 sh4
    -   EDOSK7751R - SH7751R sh4
    -   SH7751R SystemH - SH7751R sh
-   [CQ Publishing
    Co.，Ltd.](http://www.cqpub.co.jp/eda/CqREEK/SH4PCI.HTM)
    -   CQ RISC Evaluation Kit(CqREEK)/SH4-PCI with Linux
    -   [[http://www.kmckk.co.jp/eng/](http://www.kmckk.co.jp/eng/)
        Kyoto Microcomputer Co., Ltd. (KMC or KμC)
    -   Solution Platform KZP-01 KZP-01[Mainboard] + KZ-SH4RPCI-01[SH4
        CPU Board]
-   [Silicon Linux Co,. Ltd.](http://www.si.linux.com/index.html)
    -   CAT760 - SH7760
    -   CAT709 - SH7709S
    -   CAT68701 - SH7708R For A-one CATBUS[Designed for 68000 board]
        compliant
-   [Daisen Electronic Industrial Co.,
    Ltd.](http://dsn-net.net/product/list_shlinux.html)
    -   SH2000 - SH7709A 118MHz
    -   SH2002 - SH7709S 200MHz
    -   SH-500 - SH7709S 118MHz
    -   SH-1000 - SH7709S 133MHz
    -   SH-2004 - SH7750R 240MHz
-   [IO-DATA DEVICE, Inc.(Network Attached Storage
    [NAS](http://www.iodata.jp/prod/storage/hdd/index_lanhdd.htm)
    Series)]
    -   LAN-iCN - NAS Adapter for IODATA HDD with "i-connect" Interface
    -   LAN-iCN2"] - NAS Adapter for IODATA HDD with "i-connect"
        Interface
    -   LANDISK"] - SH4-266MHz[FSB133MHz] RAM64MB UDMA133 USB x2
        10/100Base-T
        -   HDL-xxxU - LANDISK Series NAS Standard Model
        -   HDL-xxxUR - LANDISK with RICOH IPSiO G series print monitor
            for Windows support
        -   HDL-WxxxU - LANDISK with wide body & twin drive support for
            Heavy storage or RAID1
        -   HDL-AV250 - LANDISK with Home Network DLNA guideline support
        -   LANTank - LANDISK kit SuperTank(CHALLENGER) Series
            -   HDL-WxxxU based twin drive bulk NAS kit. LANTank have a
                special feature that supported network media server(cf.
                iTunes etc..).
-   [TOWA MECCS CORPORATION](http://www.e-linux.jp/tmm_index.html)
    -   TMM1000 - SH7709
    -   TMM1100 - (SH7727
    -   TMM1200 - SH7727
-   [Sophia
    Systems](http://www.sophia-systems.co.jp/ice/eval_board/index.html)
    -   Sophia SH7709A Evaluation Board
    -   Sophia SH7750 Evaluation Board
    -   Sophia SH7751 Evaluation Board
-   [MovingEye Inc.](http://www.movingeye.co.jp/mi6/sh4board.html)
    -   A3pci7003 - Using SH7750/ART-Linux [Linux with Realtime
        Extension]
-   [AlphaProject Co.,
    Ltd.](http://www.apnet.co.jp/product/ms104/ms104-sh4.html)
    -   MS104-SH4 - SH7750R/PC104(Embedded ISA Bus) with apLinux
-   [Interface Corporation.](http://www.interface.co.jp/cpu/)
    -   MPC-SH02 - SH7750S: ATX Motherboard Style
    -   PCI-SH02xx"] - SH7750S: PCI-CARD Style
-   [TAC Inc.](http://www.tacinc.jp/)
    -   [T-SH7706LAN](http://web.kyoto-inet.or.jp/people/takagaki/T-SH7706/T-SH7706.htm)
        another name "Mitsuiwa SH3 board" SH-MIN - SH7706A/128MHz
        Flash512KB SDRAM 8MB 10BASE-T
-   [SecureComputing](http://www.securecomputing.com/)/[SnapGear](http://www.snapgear.org/)
    (older products, check ebay etc, all can netboot and have a debug
    header)
    -   [SG530](http://www.snapgear.org/) - SH7751@166MHz RAM16MB
        FLASH4MB 2x10/100 1xSerial
    -   [SG550](http://www.snapgear.org/) - SH7751@166MHz RAM16MB
        FLASH8MB 2x10/100 1xSerial
    -   [SG570](http://www.snapgear.org/) - SH7751R@240MHz RAM16MB
        FLASH8MB 3x10/100 1xSerial
    -   [SG575](http://www.snapgear.org/) - SH7751R@240MHz RAM64MB
        FLASH16MB 3x10/100 1xSerial
    -   [SG630](http://www.snapgear.org/) - SH7751@166MHz PCI NIC card
        RAM16MB FLASH4MB 1x10/100 1xSerial-header
    -   [SG635](http://www.snapgear.org/) - SH7751R@240MHz PCI NIC card
        RAM16MB FLASH16MB 1x10/100 1xSerial-header

## PowerPC

Some processors and tools for [PowerPC](http://eLinux.org/PowerPC "PowerPC") are

### Processors

-   [Freescale MPC5200](http://eLinux.org/Freescale_MPC5200 "Freescale MPC5200") SOC
-   [RAD750](http://eLinux.org/RAD750 "RAD750")

### Tools

The DENX Embedded Linux Development Kit (ELDK) provides a complete and
powerful software development environment for embedded and real-time
systems. It is available for ARM, PowerPC and MIPS processors and
consists of:

       * Cross Development Tools (Compiler, Assembler, Linker etc.) to develop software for the target system.
       * Native Tools (Shell, commands and libraries) which provide a standard Linux development environment that runs on the target system.
       * U-Boot - Firmware that can be easily ported to new boards and processors.
       * Linux - Kernel including the complete source-code with all device drivers, board-support functions etc.
       * Xenomai - Real-Time and RTOS Emulation Framework
       * SELF (Simple Embedded Linux Framework) as fundament to build your embedded systems on.

All components of the ELDK are available for free with complete source
code under GPL and other Free Software Licenses. Also, detailed
instructions to rebuild all the tools and packages from scratch are
included.

The ELDK can be downloaded for free from several mirror sites or ordered
on CD-ROM for a nominal charge (99 Euro). To order the CD please contact
office@denx.de

Detailed information about the ELDK is available
[here](http://www.denx.de/wiki/DULG/ELDK).

### RT Patches

-   See [RTPatch For
    PowerPC](http://eLinux.org/index.php?title=RTPatch_For_PowerPC&action=edit&redlink=1 "RTPatch For PowerPC (page does not exist)")

### Documents

-   [Book E and PPC 440](http://eLinux.org/Book_E_and_PPC_440 "Book E and PPC 440") -
    Descriptions about diffrences Book E and Ppc440.
-   [Ppc Wait Mode](http://eLinux.org/Ppc_Wait_Mode "Ppc Wait Mode") - PPC wait mode and
    sleep mode information

## XScale

CE2110 Media Processor

-   [CE2110 Media Processor](http://www.intel.com/design/celect/2110/)

The highly integrated Intel CE 2110 Media Processor helps to simplify
the design of consumer electronics products with reduced BOM cost. The
integrated Intel XScale® processor core at 1GHz provides processing
performance and headroom to deploy new revenue-generating applications.
Hardware-based decode of widely used video codecs (MPEG-2, H.264)
maximizes system-level performance by enabling the processor core to be
used exclusively for applications.

The Intel CE 2110 Media Processor also includes an Intel® Micro Signal
Architecture (Intel® MSA) DSP core for audio codecs, a PowerVR\* 2D/3D
graphics accelerator, hardware accelerators for encryption and
decryption, comprehensive peripheral interfaces, analog and digital
input/outputs, and a transport interface for ATSC/DVB input.

-   The Intel CE 2110 Media Processor Development Platform is designed
    to reduce time-to-market for new applications.
-   The Intel CE 2110 Media Processor reference platform provides the
    foundation for rapid development of new customer designs and product
    demonstrations.

## x86

-   Geode from
    [AMD](http://www.amd.com/us-en/ConnectivitySolutions/ProductInformation/0,,50_2330,00.html)

-   AMD Geode GX / CS5535
-   AMD Geode LX / CS5536

-   [Graphical representation of Intel x86 processors from i386 -
    present](http://meld.org/library/education/intel-architectures) on
    Meld.org

## AVR32

-   AP7000 from [Atmel](http://www.atmel.com/products/AVR32/ap7.asp)

In 2010 Atmel stopped the further development of the AP7000 processor.

## Blackfin

-   [Blackfin](http://eLinux.org/Blackfin "Blackfin")

## m68k

The Freescale m68k family includes:

-   68xxx
-   Coldfire
-   DragonBall

Resources:

-   [Coldfire Mailing List](http://www.wildrice.com/ColdFire)

## Further reading

-   Several processors have their own wiki, listed on the
    [WikiNode](http://eLinux.org/WikiNode "WikiNode").


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [NeedsEditing](http://eLinux.org/Category:NeedsEditing "Category:NeedsEditing")
-   [Processors](http://eLinux.org/Category:Processors "Category:Processors")

