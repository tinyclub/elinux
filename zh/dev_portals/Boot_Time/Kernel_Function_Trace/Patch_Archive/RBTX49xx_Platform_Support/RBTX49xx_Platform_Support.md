> From: [eLinux.org](http://eLinux.org/RBTX49xx_Platform_Support "http://eLinux.org/RBTX49xx_Platform_Support")


# RBTX49xx Platform Support



## Contents

-   [1 Introduction](#introduction)
-   [2 Boards](#boards)
-   [3 Build Environment](#build-environment)
-   [4 Available Devices](#available-devices)
-   [5 Available Functions](#available-functions)
-   [6 Downloads](#downloads)
-   [7 How To Build](#how-to-build)
-   [8 Future Work](#future-work)

## Introduction

This page describes the feature of patches for TX49xx boards on CE Linx.
TX49xx is mips architecture MPU from TOSHIBA.

## Boards

We checked the patch on the following boards

-   TOSHIBA RBHMA4200 (RBTX4927)
-   TOSHIBA RBHMA4400 (RBTX4937)
-   TOSHIBA RBHMA4500 (RBTX4938)

## Build Environment

We checked with the toolchain below

-   2.6.8.1
    -   gcc-3.3.2 / glibc-2.5.2 / binutils-1.15
    -   gcc-3.4.2 / glibc-2.3.2 / binutils-1.15
    -   MIPS toolchains from Sony (ToolChains)

-   2.6.9
    -   gcc-3.3.2 / glibc-2.5.2 / binutils-1.15
    -   gcc-3.4.2 / glibc-2.3.2 / binutils-1.15
    -   MIPS toolchains from Sony (ToolChains)

-   2.6.10
    -   gcc-3.4.2 / glibc-2.3.2 / binutils-1.15
    -   MIPS toolchains from Sony (ToolChains)

## Available Devices

-   Ether
-   Serial(UART)
-   PCI

## Available Functions

-   [Kernel XIP](http://eLinux.org/Kernel_XIP "Kernel XIP")
-   [Kernel Function
    Instrumentation](http://eLinux.org/Kernel_Function_Instrumentation "Kernel Function Instrumentation")
-   [Linux Trace
    Toolkit](http://eLinux.org/Linux_Trace_Toolkit "Linux Trace Toolkit")(LTT)

## Downloads

-   Patch for 2.6.8.1 is in [Patch
    Archive](http://eLinux.org/Patch_Archive "Patch Archive")
-   Patch for 2.6.9 is in [Patch
    Archive](http://eLinux.org/Patch_Archive "Patch Archive")
    -   attachment:Makefile-mips.linux-2.6.9-1.patch
-   Patch for 2.6.10 is in [Patch
    Archive](http://eLinux.org/Patch_Archive "Patch Archive") (updated)
    -   LTT - attachment:ltt-2.6.10-tb5-mips.patch ,
        attachment:TraceToolkit-0.9.6-tb-mips.daemon.patch

## How To Build

-   2.6.8.1

<!-- -->

    $ tar jxf linux-2.6.8.1.tar.bz2
    $ cd linux-2.6.8.1
    $ patch -p1 < rbtx49.linux-2.6.8.1-2.patch

    big endian
    $ mkdir ../build_be
    $ make SUBARCH=mips O=../build_be tx-r4k-be_defconfig
    $ make SUBARCH=mips O=../build_be

    little endian
    $ mkdir ../build_le
    $ make SUBARCH=mips O=../build_le tx-r4k_defconfig
    $ make SUBARCH=mips O=../build_le

-   2.6.9

We needed the patch for Makefile to build.

    $ tar jxf linux-2.6.9.tar.bz2
    $ cd linux-2.6.9
    $ patch -p1 < rbtx49.linux-2.6.9-2.patch
    $ patch -p1 < Makefile-mips.linux-2.6.9-1.patch

    big endian
    $ mkdir ../build_be
    $ make SUBARCH=mips O=../build_be tx-r4k-be_defconfig
    $ make SUBARCH=mips O=../build_be

    little endian
    $ mkdir ../build_le
    $ make SUBARCH=mips O=../build_le tx-r4k_defconfig
    $ make SUBARCH=mips O=../build_le

-   2.6.10

<!-- -->

    $ tar jxf linux-2.6.10.tar.bz2
    $ cd linux-2.6.10
    $ patch -p1 < rbtx49.linux-2.6.10-2.patch

    big endian
    $ mkdir ../build_be
    $ make SUBARCH=mips O=../build_be tx-r4k-be_defconfig
    $ make SUBARCH=mips O=../build_be

    little endian
    $ mkdir ../build_le
    $ make SUBARCH=mips O=../build_le tx-r4k_defconfig
    $ make SUBARCH=mips O=../build_le

-   LTT on 2.6.10

<!-- -->

      Kernel:
        # tar jxf linux-2.6.10.tar.bz2
        # cd linux-2.6.10
        # patch -p1 < rbtx49.linux-2.6.10-2.patch
        # patch -p1 < ltt-2.6.10-tb5-mips.patch
        edit .config to enable CONFIG_RELAYFS_FS and CONFIG_LTT.
        # make SUBARCH=mips rbtx49_defconfig
        # make

      LTT:
        # tar zxf TraceToolkit-0.9.6-tb.tar.gz
        # cd TraceToolkit-0.9.6
        # patch -p1 < TraceToolkit-0.9.6-tb-mips.daemon.patch
       - tracedaemon
          # ./configure --prefix=xx --target=mipsel-linux --host=mipsel-linux --build=`./config.guess` --without-glib --without-gtk
          # make -C LibUserTrace UserTrace.o
          # make -C LibUserTrace LDFLAGS="-static"
          # make -C Daemon LDFLAGS="-static"
       - tracevisualizer
          # ./configure --prefix=xx
          # make -C LibLTT LDFLAGS="-static"
          # make -C Visualizer LDFLAGS="-static"

## Future Work

Here is a list of things that could be worked on for this feature:

-   Implement [Printk Times](http://eLinux.org/Printk_Times "Printk Times")
-   Implement [High Resolution
    Timers](http://eLinux.org/High_Resolution_Timers "High Resolution Timers")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware](http://eLinux.org/Category:Hardware "Category:Hardware")

