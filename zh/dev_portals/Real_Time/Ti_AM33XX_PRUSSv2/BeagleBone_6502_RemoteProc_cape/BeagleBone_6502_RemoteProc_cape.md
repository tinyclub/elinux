> From: [eLinux.org](http://eLinux.org/BeagleBone_6502_RemoteProc_cape "http://eLinux.org/BeagleBone_6502_RemoteProc_cape")


# BeagleBone 6502 RemoteProc cape



## Contents

-   [1 BeagleBone 6502 RemoteProc
    cape](#beaglebone-6502-remoteproc-cape)
    -   [1.1 Hardware Design](#hardware-design)
    -   [1.2 Software](#software)
        -   [1.2.1 Overview](#overview)
        -   [1.2.2 PRU 6502 Bus Decoder](#pru-6502-bus-decoder)
        -   [1.2.3 Examples](#examples)
        -   [1.2.4 Build and Run](#build-and-run)
    -   [1.3 Presentation](#presentation)

## BeagleBone 6502 RemoteProc cape

The BeagleBone 6502 RemoteProc cape is a prototype project that
interfaces a [WDC65C02S](http://en.wikipedia.org/wiki/WDC_65C02%7C)
microprocessor to the BeagleBone host. The AM335x SoC on the BeagleBone
emulates 65xx bus cycles utilizing the
[Ti\_AM33XX\_PRUSSv2](http://eLinux.org/Ti_AM33XX_PRUSSv2 "Ti AM33XX PRUSSv2"). The
BeagleBone provides both clock and emulated RAM for the 6502 such that a
complete 6502 computer is realized with only some bus transceivers
needed for glue logic.

### Hardware Design

The following diagram shows a high-level schematic of the b6502 cape.
The number of PRU pins available are limited so bus cycles are sampled
by the PRU asserting a series of octal bus transceiver enables. In a
read cycle, address high, address low, and data out are enabled in
sequence. For a write cycle, address high, address low, and data in are
enabled in sequence. This allows the PRU to wait for a clock edge,
sample the R/W signal, and then fetch the address and data for the read
or write operation. To complete the cycle, the PRU reads or writes to
its local SRAM, providing the data to the 6502 on a read cycle or
storing the data on a write cycle.

[![BeagleBone 6502
Schematic](http://eLinux.org/images/d/d3/B6502-rproc.png)](http://eLinux.org/File:B6502-rproc.png "BeagleBone 6502 Schematic")

A Fritzing diagram illustrates the wiring of the prototype on a
breadboard.

[![BeagleBone 6502
Fritzing](http://eLinux.org/images/4/48/B6502-fritzing.png)](http://eLinux.org/File:B6502-fritzing.png "BeagleBone 6502 Fritzing")

The Fritzing project is
[here](https://github.com/ohporter/fritzing-diagrams/blob/master/bone-6502.fzz%7C)

### Software

-   [b6502 3.6 Kernel
    branch](https://github.com/ohporter/linux/tree/WIP/bone-6502-remoteproc)
    is the kernel support for the Beaglebone, PRUSS, RemoteProc driver
    for the attached 6502, and a simple shared memory serial driver for
    communication with the 6502.
-   [b6502 cape userspace tools](https://github.com/ohporter/b6502)
    contains PRU code to decode 6502 bus cycles and tools to create 6502
    applications natively on the BeagleBone filesystem.

#### Overview

The PRU code requires that the user install the am335x PRU SW package
from [AM335x PRU
Package](https://github.com/beagleboard/am335x_pru_package%7C). The 6502
examples require that the user install the \*cc65\* toolchain as
documented at [[1]](http://www.cc65.org). Only ca65/ld65 are required as
there are currently no C examples.

#### PRU 6502 Bus Decoder

b6502\_pruss is a C and PRU assembly tool that launches PRU firmware
that will decode 65xx bus cycles providing access to AM335x-resident
SRAM as local memory for the 6502 processor.

#### Examples

-   pokechar - simplest b6502rproc example. stores an ascii 'C' to sram
-   bvuart - echo characters back to the virtual uart kernel driver
-   bewoz - extended Woz Monitor with virtual uart support

#### Build and Run

This assumes GNU make/gcc and the compiled AM335x PRU SW package are
installed on the BeagleBone rootfs.

    root@bone2:~# cp am335x_pru_package/pru_sw/utils/pasm /usr/local/bin/
    root@bone2:~# cp am335x_pru_package/pru_sw/app_loader/include/*.h /usr/local/include/
    root@bone2:~# cp am335x_pru_package/pru_sw/app_loader/lib/* /usr/local/lib/
    root@bone2:~# cd b6502/pruss/
    root@bone2:~/b6502/pruss# make
    gcc -I/usr/local/include -o b6502_pruss b6502_pruss.c -L/usr/local/lib -lprussdrv -lpthread
    pasm -b b6502_pruss.p
    PRU Assembler Version 0.80
    Copyright (C) 2005-2012 by Texas Instruments Inc.
    Pass 2 : 0 Error(s), 0 Warning(s)
    Writing Code Image of 107 word(s)

This assumes GNU make and ca65/ld65 are installed on the BeagleBone
rootfs and in the path. In addition, the b6502 pruss loader and kernel
with b6502remoteproc and uio\_pruss support plus the necessary DTS data
must be present.

    root@bone2:~/b6502/examples/pokechar# make
    ca65 -l pokechar.lst pokechar.s
    ld65 -o pokechar.bin -C b6502.cfg pokechar.o
    root@bone2:~/b6502/examples/pokechar# cp pokechar.bin /lib/firmware/bone-6502-fw.bin

Now run it.

    root@bone2:~/b6502/examples/pokechar# b6502_pruss
    root@bone2:~/b6502/examples/pokechar# echo 1 > /sys/class/rproc/remoteproc0/on_off

Verify it executed as expected.

    root@bone2:~/b6502/examples/pokechar# devmem2 0x4a31fff0 w
    /dev/mem opened.
    Memory mapped at address 0xb6f92000.
    Read at address  0x4A311FF0 (0xb6f92ff0): 0x00000043

### Presentation

-   [ELCE 2012 Session
    Slides](http://elinux.org/images/a/ac/What%27s_Old_Is_New-_A_6502-based_Remote_Processor.pdf)
-   [ELCE 2012 Session
    Video](http://free-electrons.com/pub/video/2012/elce/elce-2012-porter-6502-based-remote-processor.webm)


