> From: [eLinux.org](http://eLinux.org/TCube_Info "http://eLinux.org/TCube_Info")


# TCube Info



This page describes how to load Linux on the T-Cube board.

Table Of Contents:



* * * * *

## Contents

-   [1 Hardware Used](#hardware-used)
-   [2 Software and Configuration Files
    Used](#software-and-configuration-files-used)
-   [3 General Outline for Bootstrapping using
    PMON](#general-outline-for-bootstrapping-using-pmon)
    -   [3.1 Preparing Target Hardware and
        Connections](#preparing-target-hardware-and-connections)
    -   [3.2 Preparing Host Software](#preparing-host-software)
    -   [3.3 Using PMON to Boot the
        Kernel](#using-pmon-to-boot-the-kernel)
        -   [3.3.1 Building the Kernel](#building-the-kernel)
        -   [3.3.2 Preparing the Kernel to
            Download](#preparing-the-kernel-to-download)
        -   [3.3.3 Starting the NFS daemon](#starting-the-nfs-daemon)
        -   [3.3.4 Setting Environment Variable and Write Environment
            Value on
            T-Cube](#setting-environment-variable-and-write-environment-value-on-t-cube)
        -   [3.3.5 Downloading the Kernel to
            T-Cube](#downloading-the-kernel-to-t-cube)
        -   [3.3.6 Booting the Kernel](#booting-the-kernel)

## Hardware Used

-   Board Order Number: SEMC5701(T-Cube)/SHIMAFUJI
    -   CPU
        -   VR5701 (NEC VR5500A SOC chip) (333MHz)
-   Memory
    -   64 Mbyte SDRAM
    -   16 Mbyte Flash
-   Graphics controller
    -   SMI (SM722GX )
-   Other Feature
    -   Timer x 4 ( VR5701 )
    -   UART x2 ( VR5701 /16550 compatible)
    -   PCI ( VR5701 ) -- no PCI connector/header on the baord
    -   Sound AC97 ( VR5701 )
    -   IDE/Compact Flash ( VR5701 )
    -   RTC (RV 5C348B)
    -   Ethernet ( Intel GD82559ERSL3DG )
    -   USB(USB2) ( NEC uPD720101 )
    -   CF

## Software and Configuration Files Used

-   PMON
    -   setup
    -   boot
-   Toolchain
    -   Mips Toolchain from Lineo
-   kernel
    -   celinux-040503.tar.bz2
-   root filesystem
    -   [unprepared]

## General Outline for Bootstrapping using PMON

### Preparing Target Hardware and Connections

-   -   Connections:
        -   Host machine Ethernet to hub (I configured as 192.168.1.1)
        -   T-Cube Ethernet to hub (I configured as 192.168.1.2)
        -   Connect serial cable between T-Cube and host machine
            -   Serial1 connector to interface module serial port
            -   Other end of null-modem cable to first serial port
                (ttyS0) on the Linux host machine

### Preparing Host Software

-   Download and place files in /tftpboot
-   Make sure tftpd is ready to run
-   Confirm minicom is configured to access /dev/ttyS0, at 115K N81

### Using PMON to Boot the Kernel

-   Root filesystem is NFS

#### Building the Kernel

Here are some commands I used to build the kernel:

-   cd celinux-040503/
-   export PATH=/usr/local/bin:\$PATH
-   cp arch/mips/defconfig-tcube .config
-   make ARCH=mips CROSS\_COMPILE=mipsel-linux- menuconfig
    -   disable XIP
-   make ARCH=mips CROSS\_COMPILE=mipsel-linux- dep
-   make ARCH=mips CROSS\_COMPILE=mipsel-linux-

#### Preparing the Kernel to Download

-   cp vmlinux /tftpboot/

#### Starting the NFS daemon

-   /etc/rc.d/init.d/nfs start

#### Setting Environment Variable and Write Environment Value on T-Cube

-   minicom (set to /dev/ttyS0)
-   Set environment variable
    -   Set variable tty0 (I used "set tty0 115200")
    -   Set variable netaddr (I used "set netaddr 192.168.1.2")
    -   Set variable bootaddr (I used "set bootaddr 192.168.1.1")
    -   Set variable bootfile (I used "set bootfile vmlinux")
-   Write environment value
    -   Employed "write\_env" command

#### Downloading the Kernel to T-Cube

-   minicom (set to /dev/ttyS0)
-   Download the kernel
    -   Employ "boot" command
    -   As "boot" command completes, "Entry-address" appears.

#### Booting the Kernel

-   Employ "go" command (I used "g -e Entry-address")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")

