> From: [eLinux.org](http://eLinux.org/JTAG "http://eLinux.org/JTAG")


# JTAG



Joint Test Action Group, referring to IEEE Standard 1149.1: Four-pin
(plus power/ground) interface designed to test connections between
chips. Interface is serial (clocked via the TCK pin). Configuration is
performed by manipulating a state machine one bit at a time (via TMS
pin), then transferring one bit of data in and out per TCK clock (via
TDI and TDO pins, respectively). Different instruction modes can be
loaded to read the chip ID, sample input pins, drive (or float) output
pins, manipulate chip functions, or bypass (pipe TDI to TDO to logically
shorten chains of multiple chips). Operating frequency varies per chip,
but is typically 10-100MHz TCK (10-100ns per bit time). The description
of how JTAG is implemented for a specific device is described in a file
specific to that device called a [BSDL](http://eLinux.org/BSDL "BSDL") file.

## Contents

-   [1 Information](#information)
-   [2 Tutorial](#tutorial)
-   [3 Hardware (emulators)](#hardware-emulators)
-   [4 Tools](#tools)

### Information

-   [http://en.wikipedia.org/wiki/JTAG](http://en.wikipedia.org/wiki/JTAG)
-   [http://www.asset-intertech.com/products/free\_resources.htm](http://www.asset-intertech.com/products/free_resources.htm)
    - various resources
-   [openjtag wiki](http://www.openjtag.net)
-   [Common JTAG
    Pinouts](http://eLinux.org/images/e/ea/JTAGpinouts.pdf "JTAGpinouts.pdf")
-   [Macraigor JSCAN](http://www.macraigor.com/jscan.htm)
-   [Overview of On Chip Debug
    Methods](http://www.eetimes.com/design/embedded-internet-design/4019860/JTAG-101--Part-1-Overview-and-On-Chip-Debug-Methods)
-   [gojtag](http://www.gojtag.com/) - needs to be ported to Linux

### Tutorial

[Tutorial from Asset
Intertech](http://eLinux.org/images/0/0e/Boundryscan_tutorial.pdf "Boundryscan tutorial.pdf")

[Embedded Linux JTAG debugging (CELF
presentation)](http://tree.celinuxforum.org/CelfPubWiki/ELC2009Presentations?action=AttachFile&do=get&target=DebuggingWithJtagCelf2009.pdf)

### Hardware (emulators)

-   [Holly Gates](http://eLinux.org/Holly_Gates "Holly Gates") wiggler - Parallel Port
-   [Cheap Tag](http://eLinux.org/Cheap_Tag "Cheap Tag") 5v only parallel port
-   [Flyswatter](../../.././dev_portals/Hardware_Hacking/Flyswatter/Flyswatter.md "Flyswatter")- USB
-   [ARM DS-5](http://www.arm.com/ds5) - DS-5 and DSTREAM provide
    embedded Linux developers with a full professional development suite
-   [gnICE](http://docs.blackfin.uclinux.org/doku.php?id=hw:jtag:gnice)
    - USB w/full schematics
-   [ICEbear JTAG](http://www.section5.ch/icebear) - USB
-   [JTAG
    Blue](http://www.renaelectronics.com/2007Fall/product_x_cable.htm) -
    Parallel Port
-   [http://wiki.openwrt.org/JTAG\_Cables](http://wiki.openwrt.org/JTAG_Cables)
-   [http://hri.sourceforge.net/tools/](http://hri.sourceforge.net/tools/)
    - Macraigor compatible wiggler
-   [http://www.sparkfun.com/shop/index.php?shop=1&cart=201362&cat=74&](http://www.sparkfun.com/shop/index.php?shop=1&cart=201362&cat=74&)
-   [http://www.ocdemon.net/hwproducts.htm](http://www.ocdemon.net/hwproducts.htm)
    - \$150-\$1800 par,usb,serial,ethernet
-   [http://www.dlpdesign.com/usb/2232m.shtml](http://www.dlpdesign.com/usb/2232m.shtml)
    - USB module
-   [http://www.corelis.com/products/index.htm](http://www.corelis.com/products/index.htm)
    - Emulators, Testing and Programming
-   [http://www.amontec.com/jtagkey.shtml](http://www.amontec.com/jtagkey.shtml)
    - USB
-   [http://www.sparkfun.com/commerce/product\_info.php?products\_id=7834](http://www.sparkfun.com/commerce/product_info.php?products_id=7834)
    - USB
-   [http://www.ronetix.at/peedi.html](http://www.ronetix.at/peedi.html)
    - JTAG/BDM Emulator and Flash Programmer
-   [http://www.mentor.com/products/embedded\_software/majic-jtag-probe/](http://www.mentor.com/products/embedded_software/majic-jtag-probe/)
    - JTAG Emulator, Flash Programmer, Hardware Bring-up
-   [Embest UNetICE](http://www.armkits.com/Product/unetice.asp) - USB
    and Ethernet based JTAG Emualtor for ARM7 and ARM9 processors
-   [XDS100v2](http://www.armkits.com/Product/xds100.asp) - USB JTAG
    emulator for TI processor available from
    [Embest](http://www.armkits.com)
-   [Dangerous Prototypes Bus
    Blaster](http://dangerousprototypes.com/docs/Bus_Blaster) (\~35\$
    open hardware)

### Tools

-   [JTAG\_Finder](http://eLinux.org/JTAG_Finder "JTAG Finder")
-   [UsingJtagTools](http://eLinux.org/UsingJtagTools "UsingJtagTools")
-   [http://openwince.sourceforge.net/jtag/](http://openwince.sourceforge.net/jtag/)
-   [http://fjtag.sourceforge.net/](http://fjtag.sourceforge.net/)
-   [http://jtagtools.sourceforge.net/](http://jtagtools.sourceforge.net/)
-   [http://www.lart.tudelft.nl/projects/jtag/jflash-linux.tar.gz](http://www.lart.tudelft.nl/projects/jtag/jflash-linux.tar.gz)
-   [http://lapwww.epfl.ch/dev/arm/jelie/index.php](http://lapwww.epfl.ch/dev/arm/jelie/index.php)
-   [http://cvs.arm.linux.org.uk/cgi/viewcvs.cgi/jtag/](http://cvs.arm.linux.org.uk/cgi/viewcvs.cgi/jtag/)
-   [http://jtager.sourceforge.net/](http://jtager.sourceforge.net/)
-   [http://openocd.berlios.de/web/](http://openocd.berlios.de/web/)
-   [http://urjtag.org/](http://urjtag.org/)
-   [http://opencollector.org](http://opencollector.org) database
    contains a list of opensource JTAG SW tools


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

