> From: [eLinux.org](http://eLinux.org/ARM_Integrator_Info "http://eLinux.org/ARM_Integrator_Info")


# ARM Integrator Info



## Integrator Compact Platform

The Real View® Integrator(TM) AP and CP (Compact Platform) operates in
conjunction with a Core Module to provide a fully integrated development
platform. The Core Module FPGA implements a set of ARM PrimeCell®
Peripherals and memory controllers. The PrimeCell Peripherals make use
of the drivers and connectors on the Compact Platform baseboard; these
include LCD and touch screen connectors, VGA connector, Multi-Media Card
(MMC) interface and an audio codec interface. Ethernet connectivity is
provided by a dedicated interface chip. Expansion to Logic Modules and
Logic Tiles is through an AMBA AHB-Lite system bus.

-   The Integrator/AP is a basic board with two UART ports, timer, RTC
    and NOR Flash
-   The Integrator/CP can be extended to support user created IP, using
    standard Integrator Logic Tiles, in conjunction with an IM-LT1
    Interface, or using Logic Modules.

Integrator/CP is compatible with the following Integrator Core Modules:
ARM920T, ARM922T-XA10, ARM926EJ-S, ARM946E-S and ARM966E-S, ARM1026EJ-S
and ARM1136J(F)-S. See the following link [Integrator Core
Modules](http://www.arm.com/products/DevTools/IntegratorCP.html) for a
more complete description of the board and processors.

The Integrator platforms are no longer officially supported by ARM Ltd.

## Boot Loader

[U-boot](http://sourceforge.net/projects/u-boot/) contains support for
this board. To compile U-Boot from CVS sources you can use the following
commands:

    *make integratorcp_config
    *make

The resulting executable can then be loaded on the board using a
debugger to be run from the bootMonitor. The following page [Prebuilt
downloads](http://www.arm.com/linux/prebuilt_download.html) contains
some information on compiling and running Linux for this board.

## Links

-   [Booting a recent U-Boot and kernel on ARM
    Integrator/AP](http://www.df.lth.se/~triad/krad/integrator/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Categories](http://eLinux.org/Category:Categories "Category:Categories")

