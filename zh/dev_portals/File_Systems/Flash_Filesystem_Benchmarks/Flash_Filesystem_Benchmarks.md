> From: [eLinux.org](http://eLinux.org/Flash_Filesystem_Benchmarks "http://eLinux.org/Flash_Filesystem_Benchmarks")


# Flash Filesystem Benchmarks



[Free Electrons](http://free-electrons.com) has performed flash
filesystem benchmarks, with funding from the [CE Linux
Forum](http://www.celinuxforum.org/). This page is the starting page to
present the methodology and the results of these benchmarks.

## Contents

-   [1 Test methodology](#test-methodology)
-   [2 Results](#results)
    -   [2.1 Comparison of different versions of the
        Kernel](#comparison-of-different-versions-of-the-kernel)
    -   [2.2 Linux 3.1 results](#linux-3-1-results)
    -   [2.3 Linux 3.0 results](#linux-3-0-results)
    -   [2.4 Linux 2.6.39 results](#linux-2-6-39-results)
    -   [2.5 Linux 2.6.38 results](#linux-2-6-38-results)
    -   [2.6 Linux 2.6.36 results](#linux-2-6-36-results)
-   [3 Presentations of the results](#presentations-of-the-results)
-   [4 Details on the hardware platforms
    used](#details-on-the-hardware-platforms-used)

## Test methodology

Free Electrons created Python scripts that automate the execution of
commands through a serial line (including bootloader and kernel
booting), and measure the time taken to execute these commands. The
scripts were designed to be generic, and support for new boards can
easily be added by creating board specific Python definitions. The
complete details of what tests are performed and how measurements are
made are available in the [Flash Filesystem Benchmarks
Protocol](http://eLinux.org/Flash_Filesystem_Benchmarks_Protocol "Flash Filesystem Benchmarks Protocol")
page.

The current version of these scripts can be found in a Git repository on
[gitorious](https://gitorious.org/ffs-benchmarks/ffs-benchmarks), and
are released under the terms of the GPLv2 license. Working board
automation files are provided for the [CALAO
USB-A9263-C02](http://www.calao-systems.com/articles.php?lng=en&pg=5932)
and [IGEPv2
boards](http://www.igep.es/index.php?option=com_content&view=article&id=46&Itemid=55).
You will need to build a root filesystem to run the tests on and create
filesystems of different sizes (8, 32, 252 and 508 MB) to be tested ;
both of which that have been used by Free Electrons will be available
soon.

## Results

### Comparison of different versions of the Kernel

See [Flash Filesystem Benchmarks Kernel
Evolution](http://eLinux.org/Flash_Filesystem_Benchmarks_Kernel_Evolution "Flash Filesystem Benchmarks Kernel Evolution")
to find possible regressions

### Linux 3.1 results

See [Flash Filesystem Benchmarks
3.1](http://eLinux.org/Flash_Filesystem_Benchmarks_3.1 "Flash Filesystem Benchmarks 3.1")
for the results

### Linux 3.0 results

See [Flash Filesystem Benchmarks
3.0](http://eLinux.org/Flash_Filesystem_Benchmarks_3.0 "Flash Filesystem Benchmarks 3.0")
for the results

### Linux 2.6.39 results

See [Flash Filesystem Benchmarks
2.6.39](http://eLinux.org/Flash_Filesystem_Benchmarks_2.6.39 "Flash Filesystem Benchmarks 2.6.39")
for the results

### Linux 2.6.38 results

See [Flash Filesystem Benchmarks
2.6.38](http://eLinux.org/Flash_Filesystem_Benchmarks_2.6.38 "Flash Filesystem Benchmarks 2.6.38")
for the results

### Linux 2.6.36 results

See [Flash Filesystem Benchmarks
2.6.36](http://eLinux.org/Flash_Filesystem_Benchmarks_2.6.36 "Flash Filesystem Benchmarks 2.6.36")
for the results

## Presentations of the results

Previous results of those benchmarks were presented:

-   At [ELC Europe
    2010](http://www.embeddedlinuxconference.com/elc_europe10/index.html),
    the [slides
    (PDF)](http://eLinux.org/images/d/d7/Elce2010-flash-filesystems.pdf "Elce2010-flash-filesystems.pdf")
    are available
-   At [ELC Europe
    2008](http://www.embeddedlinuxconference.com/elc_europe08/index.html),
    the [slides
    (PDF)](http://eLinux.org/images/a/ab/Flash-filesystems.pdf "Flash-filesystems.pdf")
    are available

## Details on the hardware platforms used

-   [CALAO
    USB-A9263-C02](http://www.calao-systems.com/articles.php?lng=en&pg=5932)
    -   AT91SAM9263 processor at 200 Mhz
    -   64 MB of RAM
    -   256 MB of NAND Flash from Samsung K9F2G08U0A
-   [IGEPv2
    boards](http://www.igep.es/index.php?option=com_content&view=article&id=46&Itemid=55)
    -   DM3730 processor at 1 Ghz
    -   512 MB of RAM
    -   512 MB of dual-plane SLC OneNAND Flash from Numonyx NAND04GR4E1A


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Flash Filesystem
    Benchmarks](http://eLinux.org/index.php?title=Category:Flash_Filesystem_Benchmarks&action=edit&redlink=1 "Category:Flash Filesystem Benchmarks (page does not exist)")

