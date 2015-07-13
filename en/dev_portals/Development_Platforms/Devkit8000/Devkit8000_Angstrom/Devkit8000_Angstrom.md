> From: [eLinux.org](http://eLinux.org/Devkit8000_Angstrom "http://eLinux.org/Devkit8000_Angstrom")


# Devkit8000 Angstrom



This page gives some guide and suggestions on Angstrom development on
[Embest](http://www.armkits.com)
[Devkit8000](http://www.armkits.com/Product/devkit8000.asp) board.

## Contents

-   [1 Angstrom Demonstration](#angstrom-demonstration)
    -   [1.1 Introduction](#introduction)
    -   [1.2 Preparations](#preparations)
    -   [1.3 Demonstration](#demonstration)
    -   [1.4 Remark](#remark)

# Angstrom Demonstration

## Introduction

Angstrom was started by a small group of people who worked on the
OpenEmbedded, OpenZaurus and OpenSimpad projects to unify their effort
to make a stable and userfriendly distribution for embedded devices like
handhelds, set top boxes and network-attached storage devices and more.

## Preparations

1. One [DevKit8000](http://www.armkits.com/Product/devkit8000.asp)
Board
 2. One SD card for demonstrate Angstrom
 3. One DVI monitor (with one HDMI to DVI-D cable)
 4. One USB mouse, one USB keyboard and one USB Hub (with external
power)
 5. One USB mini-A to USB A (female connector) cable
 6. One 5V power adapter

## Demonstration

1. Connect power well to
[Devkit8000](http://www.armkits.com/Product/devkit8000.asp) board;
 2. Connect DVI monitor well to Devkit8000 board using HDMI to DVI-D
cable;
 3. Connect USB Hub well using USB Mini-A to USB A (female connector)
cable, the USB Mini-A terminal is connected to
[Devkit8000](http://www.armkits.com/Product/devkit8000.asp) board while
the USB A (female connector) terminal is connected to USB Hub, and
connect USB mouse or USB keyboard to USB Hub;
 4. Insert SD card and then power on
[Devkit8000](http://www.armkits.com/Product/devkit8000.asp) board;
 5. Wait a moment, the DVI monitor will display logo;
 6. After the system booted, the DVI monitor will remind the Angstrom
startup progress;
 7. After booting Angstrom successfully, it will get into graphic login
inteface, please input user name and password to get into the system.

## Remark

User name: embest
 Password: embest
 IP configuration command:
 IP address: ifconfig eth0 192.192.192.77
 getway address: route add default gw 192.192.192.101
 Example

[http://www.angstrom-distribution.org/demo/beagleboard/](http://www.angstrom-distribution.org/demo/beagleboard/)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [Devkit8000](http://eLinux.org/Category:Devkit8000 "Category:Devkit8000")

