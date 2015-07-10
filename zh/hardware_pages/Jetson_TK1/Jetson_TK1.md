> From: [eLinux.org](http://eLinux.org/Jetson_TK1 "http://eLinux.org/Jetson_TK1")


# Jetson TK1

## Contents

-   [1 About this site](#about-this-site)
    -   [1.1 About Tegra K1](#about-tegra-k1)
    -   [1.2 About Jetson TK1](#about-jetson-tk1)
    -   [1.3 Hardware Features](#hardware-features)
-   [2 Buying Guide](#buying-guide)
-   [3 Setting up a new board](#setting-up-a-new-board)
-   [4 Basic setup steps to access the board and access
    internet](#basic-setup-steps-to-access-the-board-and-access-internet)
    -   [4.1 Direct access to a Jetson board using its own keyboard &
        mouse &
        monitor](#direct-access-to-a-jetson-board-using-its-own-keyboard-mouse-monitor)
    -   [4.2 Remote access to a Jetson board through the Ethernet
        port](#remote-access-to-a-jetson-board-through-the-ethernet-port)
-   [5 An important step before connecting the Jetson to
    Internet](#an-important-step-before-connecting-the-jetson-to-internet)
-   [6 Recommended first steps now that your board has internet
    access](#recommended-first-steps-now-that-your-board-has-internet-access)
    -   [6.1 If you will use the shell command-line a
        lot](#if-you-will-use-the-shell-command-line-a-lot)
    -   [6.2 If you will use the graphical environment (Unity) a
        lot](#if-you-will-use-the-graphical-environment-unity-a-lot)
    -   [6.3 If you need more disk space on the
        eMMC](#if-you-need-more-disk-space-on-the-emmc)
    -   [6.4 More recommended Linux tips for a Jetson
        TK1](#more-recommended-linux-tips-for-a-jetson-tk1)
-   [7 Shutting down Jetson TK1
    safely](#shutting-down-jetson-tk1-safely)
-   [8 Emulators for developing with Jetson
    TK1](#emulators-for-developing-with-jetson-tk1)
-   [9 Books](#books)
-   [10 Tutorials for developing with Jetson
    TK1](#tutorials-for-developing-with-jetson-tk1)
-   [11 Jetson TK1 Reference Information (more detailed than the
    tutorials
    above)](#jetson-tk1-reference-information-more-detailed-than-the-tutorials-above)
    -   [11.1 General Topics](#general-topics)
    -   [11.2 Networking Topics](#networking-topics)
    -   [11.3 Software Topics](#software-topics)
    -   [11.4 Performance and Power
        Topics](#performance-and-power-topics)
    -   [11.5 Hardware Expansion Topics](#hardware-expansion-topics)
-   [12 Projects using Jetson TK1](#projects-using-jetson-tk1)
-   [13 Linux distributions running on
    Tegra](#linux-distributions-running-on-tegra)
-   [14 Upstream/mainline OS & kernel system software on
    Tegra](#upstreammainline-os-kernel-system-software-on-tegra)
-   [15 Jetson TK1 and Tegra K1 Hardware
    Documents](#jetson-tk1-and-tegra-k1-hardware-documents)
-   [16 Other embedded Tegra boards created by
    NVIDIA](#other-embedded-tegra-boards-created-by-nvidia)
-   [17 Other SOCs created by NVIDIA](#other-socs-created-by-nvidia)
-   [18 Other links](#other-links)
-   [19 References](#references)

## About this site

This is the official Wiki for embedded Tegra & the Jetson TK1 board,
maintained by both the community and NVIDIA.

The other embedded Tegra community sites with official NVIDIA support
are:

-   The [forum](https://devtalk.nvidia.com/default/board/139/) for
    discussing embedded Tegra & Jetson TK1 issues with the community &
    NVIDIA.
-   The [blog](https://plus.google.com/114318922342198493952) to stay
    updated with the latest news & plans for embedded Tegra & Jetson TK1
    from NVIDIA.

### About Tegra K1

Tegra K1 is NVIDIA's first mobile processor to have the same advanced
features & architecture as a modern desktop GPU while still using the
low power draw of a mobile chip. The Jetson TK1 board therefore allows
embedded devices to use the exact same CUDA code that would also run on
a desktop GPU (used by over 100,000 developers), with similar levels of
GPU-accelerated performance as a desktop.

### About Jetson TK1

[![Jetson TK1 dev
board](http://eLinux.org/images/thumb/2/27/Nvidia-tegra124-jetson-tk1-labelled.jpg/800px-Nvidia-tegra124-jetson-tk1-labelled.jpg)](http://eLinux.org/File:Nvidia-tegra124-jetson-tk1-labelled.jpg "Jetson TK1 dev board")

Jetson TK1 is NVIDIA's embedded Linux development platform featuring a
Tegra K1 SOC (CPU+GPU+ISP in a single chip), selling for \$192 USD.
Jetson TK1 comes pre-installed with
[Linux4Tegra](http://eLinux.org/Tegra/Downstream_SW/Linux4Tegra "Tegra/Downstream SW/Linux4Tegra")
OS (basically Ubuntu 14.04 with pre-configured drivers). There is also
some official support for running other distributions using the mainline
kernel, discussed further in the [Distributions](#Distributions) and
[Mainline](#Mainline) kernel sections below.

Besides the quad-core 2.3GHz ARM Cortex-A15 CPU and the revolutionary
Tegra K1 GPU, the Jetson TK1 board includes similar features as a
Raspberry Pi but also some PC-oriented features such as SATA, mini-PCIe
and a fan to allow continuous operation under heavy workloads:

### Hardware Features

-   **Dimensions:** 5" x 5" (127mm x 127mm) board
-   [Tegra K1 SOC](http://eLinux.org/Tegra/SoCs#Tegra124 "Tegra/SoCs") (CPU+GPU+ISP in a
    single chip, with [typical power consumption between 1 to 5
    Watts](http://eLinux.org/Jetson/Jetson_TK1_Power#Typical_power_draw_of_Jetson_TK1 "Jetson/Jetson TK1 Power")):
    -   **GPU:** NVIDIA
        [Kepler](http://en.wikipedia.org/wiki/Kepler_%28microarchitecture%29)
        "GK20a" GPU with 192 SM3.2 CUDA cores (upto 326 GFLOPS)
    -   **CPU:** NVIDIA "4-Plus-1" 2.32GHz ARM quad-core
        [Cortex-A15](http://infocenter.arm.com/help/topic/com.arm.doc.ddi0438h/index.html)
        CPU with Cortex-A15 battery-saving shadow-core
-   **DRAM:** 2GB DDR3L 933MHz EMC x16 using 64-bit data width
-   **Storage:** 16GB fast eMMC 4.51 (routed to SDMMC4)
-   **[mini-PCIe](http://eLinux.org/Jetson/mini-PCIe "Jetson/mini-PCIe"):** a half-height
    single-lane PEX slot (such as for Wifi, SSD RAID, FireWire or
    Ethernet addon cards)
-   **SD/MMC card:** a full-size slot (routed to SDMMC3)
-   **[USB
    3.0](http://eLinux.org/Jetson/Cameras#Enabling_support_for_USB_3.0 "Jetson/Cameras"):**
    a full-size Type-A female socket
-   **USB 2.0:** a micro-AB female socket (for connecting to a PC, but
    can also be used as a spare USB 2.0 port using a [micro-B male to
    female Type-A
    adapter](http://www.amazon.com/USB-Micro-Female-Male-Adaptor/dp/B0023FTRUO)
    that is sometimes included)
-   **HDMI:** a full-size port
-   **RS232:** a full-size DB9 serial port (routed to UART4)
-   **[Audio](http://eLinux.org/Jetson/Audio "Jetson/Audio"):** an ALC5639 Realtek HD
    Audio codec with Mic in and Line out jacks (routed to DAP2)
-   **Ethernet:** a RTL8111GS Realtek 10/100/1000Base-T Gigabit LAN port
    using PEX
-   **SATA:** a full-size port that supports 2.5" and 3.5" disks, but is
    not hot-pluggable. (Turn off the power before plugging in SATA disk
    drives)
-   **[JTAG](http://eLinux.org/Jetson/JTAG "Jetson/JTAG"):** a 2x10-pin 0.1" port for
    professional debugging
-   **[Power](http://eLinux.org/Jetson/Jetson_TK1_Power "Jetson/Jetson TK1 Power"):** a
    12V DC barrel power jack and a 4-pin PC IDE power connector, using
    AS3722 PMIC
-   **Fan:** a fan-heatsink running on 12V (to allow safely running
    intense workloads continuously, but can usually be [replaced by a
    heat-spreader or
    heatsink](http://eLinux.org/Jetson/Thermal#Replacing_the_fan_with_a_heatsink "Jetson/Thermal"))

The following signals are available through the 125-pin 2mm-pitch
expansion port:

-   **[Camera ports](http://eLinux.org/Jetson/Cameras#CSI_MIPI "Jetson/Cameras"):** 2
    fast CSI-2 MIPI camera ports (one 4-lane and one 1-lane)
-   **LCD port:** LVDS and eDP Display Panel
-   **Touchscreen ports:** Touch SPI 1 x 4-lane + 1 x 1-lane CSI-2
-   **UART**
-   **HSIC**
-   **[I2C](http://eLinux.org/Jetson/I2C "Jetson/I2C"):** 3 ports
-   **[GPIO](http://eLinux.org/Jetson/GPIO "Jetson/GPIO"):** 7 x GPIO pins (1.8V). Camera
    CSI pins can also be used for extra GPIO if you don't use both
    cameras.

Front panel connector:

-   Green - Power LED
-   Orange - HDD LED
-   Red - Power Button
-   Purple / Blue - Reset Button

Hardware-accelerated APIs supported:

-   **CUDA** 6.0 (SM3.2, roughly the same as desktop SM3.5)
-   **[OpenGL](http://eLinux.org/Jetson/Tutorials/OpenGL "Jetson/Tutorials/OpenGL")** 4.4
-   **OpenGL ES** 3.1
-   **[OpenMAX IL multimedia
    codec](http://eLinux.org/Jetson/H264_Codec "Jetson/H264 Codec")** including H.264,
    VC-1 and VP8 through Gstreamer
-   **NPP** (CUDA optimized NVIDIA Performance Primitives)
-   **[OpenCV4Tegra](http://eLinux.org/Jetson/Computer_Vision_Performance#Hardware_Acceleration_of_OpenCV "Jetson/Computer Vision Performance")**
    (NEON + GLSL + quad-core CPU optimizations)
-   **VisionWorks**



## Buying Guide

Where can I get one and for how much?

-   Visit the [NVIDIA store](https://developer.nvidia.com/jetson-tk1)
    then choose a distributor in USA, or click on "International Orders"
    to see other countries it is available from including UK, Germany,
    France, Italy, Japan, Russia, China, Singapore, and Australia.
-   Jetson TK1 costs \$192 in USA.
-   The package includes a power supply (with a detachable US mains
    cord), a USB micro-B cable for connecting it to a PC, and usually a
    [USB micro-B to female USB-A
    adapter](http://www.amazon.com/USB-Micro-Female-Male-Adaptor/dp/B0023FTRUO)
    allowing you to have 2 regular USB ports.
-   There are a large number of optional accessories you can add to
    Jetson such as [Cameras](http://eLinux.org/Jetson/Cameras "Jetson/Cameras"), SATA
    hard-disks and [mini-PCIe](http://eLinux.org/Jetson/mini-PCIe "Jetson/mini-PCIe")
    devices.



## Setting up a new board

To configure a new board, or factory reset an existing Jetson, visit the
official [Get Started On
Jetson](https://developer.nvidia.com/get-started-jetson) page,
particularly to read the Quick Start guides to "flash" your device (wipe
it clean and install Linux onto it). And if you will want to do software
development for your Jetson, such as to build CUDA code, you should
install the JetPack (Jetson Development Package) as mentioned in the
Quick Start Guides to install a graphical IDE with cross-compilation,
debugging & visual profiling tools.



## Basic setup steps to access the board and access internet

Whether you want to sew your embedded Tegra into a backpack or put it in
a robot or simply use it as an ultra powerful media center, the first
thing you should do with a new Jetson TK1 board is attach it to a HDMI
monitor & keyboard & mouse to make sure it works and get familiar with
it for a few minutes.

**Note: the micro-USB port on Jetson TK1 can be used as a second USB
port if you use the supplied
[adapter](http://www.amazon.com/eForCity-Adapter-compatible-Samsung-Galaxy/dp/B00871Q5PI/).**

The device can be accessed in 2 possible ways, depending on whether you
want to plug a keyboard & mouse & monitor directly into the Jetson TK1
board or you want to plug an Ethernet cable between your device and a PC
or laptop or router and access it through a network:

### Direct access to a Jetson board using its own keyboard & mouse & monitor

The [Jetson TK1 Quick Start
Guide](http://developer.download.nvidia.com/embedded/jetson/TK1/docs/Jetson_TK1_QSG_134sq_Jun14_rev7.pdf)
(included as a booklet with your Jetson TK1) shows how to use the Jetson
TK1 board as a mini standalone computer. Basically, you plug in a HDMI
monitor or TV, plug a keyboard into the USB3.0 port, plug a mouse into
the included micro-B to female USB adapter and plug that into the
micro-B USB2.0 port on the board. Then plug the 12V power supply in,
press the small POWER button, then watch it boot up into
[Linux4Tegra](http://eLinux.org/Tegra/Downstream_SW/Linux4Tegra "Tegra/Downstream SW/Linux4Tegra")
(Ubuntu 14.04 with some drivers pre-configured). When it asks for the
password for user "ubuntu", just type "ubuntu" to log in. If you have an
Ethernet router then simply plug an Ethernet cable from the board into
your router (or plug in a USB Wifi dongle) to have internet access, and
you are ready.

### [Remote access to a Jetson board through the Ethernet port](http://eLinux.org/Jetson/Remote_Access "Jetson/Remote Access")

To access the board remotely through a local network from a PC or
laptop, follow the [Remote
Access](http://eLinux.org/Jetson/Remote_Access "Jetson/Remote Access") instructions so
you can control the device from the keyboard & mouse & monitor on your
PC or laptop and share your desktop's Wifi or Ethernet internet access
to the attached device.

## An important step before connecting the Jetson to Internet

It is really important to tell "apt" not to overwrite the file
"libglx.so" if you upgrade the system. "libglx.so" is a specific file in
NVIDIA's graphics driver that might get replaced by an incorrect version
from Ubuntu that stops you from being able to boot into the graphical
environment! So please execute this command on your Jetson before you
connect it to Internet or perform an update:

    sudo apt-mark hold xserver-xorg-core

Now you can allow Ubuntu to update itself automatically or you can run
"sudo apt-get upgrade" without problems. You can get more information
about this issue on the [official development
forum](https://devtalk.nvidia.com/default/topic/775070/embedded-systems/notice-on-apt-get-upgrade-libglx-so-corruption/).
Note: Is this only a problem for L4T Rel-19 only? It seems fixed in
Rel-21.

## Recommended first steps now that your board has internet access

Open a command-line terminal to perform some initial operations. If you
are using the Jetson TK1's graphical environment then click on the
top-left icon in Ubuntu Unity and type "terminal" to open a command
shell, or if you have remote access to the device through a network then
open an SSH command shell into your device from your desktop such as by
running "ssh ubuntu@tegra-ubuntu". Now you are ready for initial
configuration.

Add the Universe package repositories, since you will often need
packages from Universe for code development:

    sudo apt-add-repository universe
    sudo apt-get update

##### If you will use the shell command-line a lot

Install "bash-completion" (it allows you to hit the "Tab" key to
auto-complete your shell commands) and "command-not-found" (it shows
which package you probably need to install if you run an unavailable
command). These 2 tools are extremely useful when using the commandline,
but were not installed by default in Ubuntu 14.04. Simply run this:

    sudo apt-get install bash-completion command-not-found
    exit

Note: now you need to log back in for it to start using bash-completion
and command-not-found.

You probably should also change the shell prompt (by adjusting "PS1" in
the ".bashrc" file in your home directory) to be more useful, such as
getting the shell prompt to have a different color than regular
commands, and make it obvious if a command returned with an error. There
are thousands of custom .bashrc configurations on the web, including
[Shervin's](https://github.com/shervinemami/Stuff) that provides a
different colored shell prompt depending on whether a command was
succesful or returned an error.

##### If you will use the graphical environment (Unity) a lot

You might want to try some suggestions at
"[http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/](http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/)"
or similar, such as to turn off the desktop shopping suggestions that
are enabled by default in Ubuntu 14.04 (despite the spyware concerns
discussed by huge numbers of people) by running this:

    gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', \
        'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', \
        'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

##### If you need more disk space on the eMMC

The eMMC on the Jetson has a capacity of 16GB, however some instructions
or boards default to only using 8GB of the drive ([or 12GB, see
discussion](http://elinux.org/Talk:Jetson_TK1#eMMC_8Gb.3F_860)). If you
require more disk space in your rootfs such as for installing toolkits
or compiling large projects, you can flash the Jetson (from a Linux
desktop) to have a larger filesystem (note that this will erase all data
on the Jetson TK1, and it takes roughly 1 hour to flash the whole
eMMC!):

    [user@host Linux_for_Tegra]$ sudo ./flash.sh -S 14580MiB jetson-tk1 mmcblk0p1
    ...
    sending file: system.img
    / 15032385536/15032385536 bytes sent
    system.img sent successfully
    ...
    Create, format and download  took 2791 Secs
    Time taken for flashing 2792 Secs

The maximum value of the `flash.sh -S` flag that works successfully is
14580MiB. Greater values (like 16GiB) are beyond the capacity of the
eMMC when the other system-required partitions are included.

##### More recommended Linux tips for a Jetson TK1

Some more tips (such as how to speed up SSH logins, login automatically,
share your keyboard & mouse, etc, are in a [forum
discussion](https://devtalk.nvidia.com/default/topic/785551/embedded-systems/my-jetson-focused-linux-tips-and-tricks/).



## Shutting down Jetson TK1 safely

Just like any Linux computer, the recommended way to shut-down or turn
off Jetson TK1 is to click Shutdown in the GUI or run this in a
terminal, to ensure the filesystem will not be corrupt:

    sudo shutdown -h now



## Emulators for developing with Jetson TK1

-   [**Emulators:**](http://eLinux.org/Jetson/Emulators "Jetson/Emulators") which
    Windows, OSX, Linux or SteamOS products with a powerful Nvidia GPU
    are economic and suitable for developing Jetson software?



## Books

[Explore your Jetson
TK1](http://bitkistl.blogspot.co.at/2014/09/explore-your-jetson-tk1-e-book.html)
(e-book)

[The JetPack Cookbook](http://eLinux.org/The_JetPack_Cookbook "The JetPack Cookbook")
(proposed)



## Tutorials for developing with Jetson TK1

The following are tutorial projects for hardware and/or software
development. They show the easiest way to do a certain task, while the
[Reference Information section](#Info) below has more detailed pages. If
you have something useful to contribute about Jetson TK1 or embedded
Tegra then please do so.

Tutorial

Description

Programming Difficulty

Electronics Difficulty

[Hello World](http://eLinux.org/Jetson/Hello_World "Jetson/Hello World")

Create a simple program that prints "Hello World!", by compiling code
directly on your device

\#

[CUDA](http://eLinux.org/Jetson/Tutorials/CUDA "Jetson/Tutorials/CUDA")

Install CUDA then build & run some CUDA sample projects

\#

[Nsight](http://eLinux.org/Jetson/Tutorials/Nsight "Jetson/Tutorials/Nsight")

Documentation and tutorials on GPU debugging and profiling with Nsight,
which is installed with CUDA

\#

[OpenCV](http://eLinux.org/Jetson/Tutorials/OpenCV "Jetson/Tutorials/OpenCV")

Install OpenCV then grab camera frames or build & run some OpenCV
samples

\#

[OpenGL](http://eLinux.org/Jetson/Tutorials/OpenGL "Jetson/Tutorials/OpenGL")

Links to many OpenGL and OpenGL ES sample projects

\#

[Full Body
Detection](http://eLinux.org/Jetson/Tutorials/Full_Body_Detection "Jetson/Tutorials/Full Body Detection")

Shows how to perform full body detection (something that even desktop
CPUs are too slow for!) from a webcam and display the face, using OpenCV

\#

[GPIO Input & Output](http://eLinux.org/Jetson/Tutorials/GPIO "Jetson/Tutorials/GPIO")

Turn on an LED or send a signal to an Arduino microcontroller using GPIO

\#

\#

[Vision-controlled
GPIO](http://eLinux.org/Jetson/Tutorials/Vision-controlled_GPIO "Jetson/Tutorials/Vision-controlled GPIO")

Turn on an LED whenever a face is detected in your camera

\#

\#

[Battery
Power](http://eLinux.org/Jetson/Tutorials/Battery_Power "Jetson/Tutorials/Battery Power")

Power your Jetson TK1 from a battery pack

\#

[Automatic Pan
Tilt](http://eLinux.org/index.php?title=Jetson/Tutorials/Automatic_Pan_Tilt&action=edit&redlink=1 "Jetson/Tutorials/Automatic Pan Tilt (page does not exist)")

Build an autonomous pan-tilt face tracking camera, that tracks faces as
they move around

\#

\#

[Optical Flow
Motion](http://eLinux.org/index.php?title=Jetson/Tutorials/Optical_Flow&action=edit&redlink=1 "Jetson/Tutorials/Optical Flow (page does not exist)")

Generate the optical flow motion vectors to see how things are moving

\#\#

[Video
Stabilization](http://eLinux.org/Jetson/Tutorials/Video_Stabilization "Jetson/Tutorials/Video Stabilization")

Real-time video stabilization such as for a robot's onboard camera

\#\#

[Program An
Arduino](http://eLinux.org/Jetson/Tutorials/Program_An_Arduino "Jetson/Tutorials/Program An Arduino")

Program an Arduino microcontroller from your Jetson TK1 (instead of from
a PC)

\#\#

[Communicate To An
Arduino](http://eLinux.org/Jetson/Tutorials/Communicate_To_Arduino "Jetson/Tutorials/Communicate To Arduino")

Connect an Arduino board to a Jetson TK1 board, with communication
between then

\#\#

\#\#

[Follower
Robot](http://eLinux.org/index.php?title=Jetson/Tutorials/Follower_Robot&action=edit&redlink=1 "Jetson/Tutorials/Follower Robot (page does not exist)")

Get a wheeled robot to drive towards the nearest person

\#\#

\#\#

[Walking Follower
Robot](http://eLinux.org/Jetson/Tutorials/Walking_Follower_Robot "Jetson/Tutorials/Walking Follower Robot")

Get a 2-legged robot to walk towards the nearest person

\#\#\#

\#\#



## Jetson TK1 Reference Information (more detailed than the tutorials above)

#### General Topics

-   [**Official Jetson TK1
    website**](https://developer.nvidia.com/embedded-computing).
-   [**Official Jetson TK1 software development
    page**](https://developer.nvidia.com/platform-software-development),
    including L4T and all the Linux kernel source changes.
-   [**System
    Info:**](http://eLinux.org/Jetson/Jetson_TK1_System_Info "Jetson/Jetson TK1 System Info")
    Find out the hardware info & what is available on the Jetson TK1
    such as disk space, RAM, and devices.
-   [**Cloning & Backup**](http://eLinux.org/Jetson/Cloning "Jetson/Cloning") Save the
    Jetson's eMMC (system.img) via the flash port and restore it to
    other Jetson boards.
-   [**Trace32 / JTAG Debugging**](http://eLinux.org/Jetson/JTAG "Jetson/JTAG") Attaching
    a professional debugger module for very low-level access to the
    Tegra.

#### Networking Topics

-   [**Wifi & Ethernet
    Adapters:**](http://eLinux.org/Jetson/Network_Adapters "Jetson/Network Adapters")
    Discusses which Wifi or Ethernet cards have been tested on Jetson
    TK1.
-   [**Remote Access:**](http://eLinux.org/Jetson/Remote_Access "Jetson/Remote Access")
    Control the device from your PC or laptop, and share your desktop's
    Wifi or Ethernet internet access to the attached device.

#### Software Topics

-   [**CUDA
    Installation:**](http://eLinux.org/Jetson/Installing_CUDA "Jetson/Installing CUDA")
    How to install the CUDA toolkit.
-   [**VisionWorks
    Installation:**](http://eLinux.org/Jetson/Installing_VisionWorks "Jetson/Installing VisionWorks")
    How to install the VisionWorks toolkit.
-   [**OpenCV
    Installation:**](http://eLinux.org/Jetson/Installing_OpenCV "Jetson/Installing OpenCV")
    How to install OpenCV, including building from source.
-   [**ArrayFire
    Installation:**](http://eLinux.org/Jetson/Installing_ArrayFire "Jetson/Installing ArrayFire")
    How to install ArrayFire for Tegra and getting started.
-   [**Kodi (XBMC)
    Installation:**](http://eLinux.org/Jetson/Kodi_(XBMC) "Jetson/Kodi (XBMC)") How to
    install XBMC Media Center such as for a green HTPC.
-   [**Plex Media Server Installation:**](http://eLinux.org/Jetson/Plex "Jetson/Plex")
    How to install Plex Media Server such as for a green HTPC.
-   [**Libraries:**](http://eLinux.org/Jetson/Libraries "Jetson/Libraries") Libraries
    that have been tested on Jetson TK1.
-   [**Web
    Browsers:**](http://eLinux.org/Tegra/Downstream_SW/Linux4Tegra/WebBrowsers "Tegra/Downstream SW/Linux4Tegra/WebBrowsers")
    How to get web browsers working, including Flash for watching
    youtube videos in Chromium.
-   [**H.264 Codec:**](http://eLinux.org/Jetson/H264_Codec "Jetson/H264 Codec")
    Hardware-accelerated video encoder/decoder for H.264 and other
    multimedia formats.
-   [**cuDNN:**](http://eLinux.org/Jetson/cuDNN "Jetson/cuDNN") GPU-accelerated Machine
    Learning & Deep Neural Network library.
-   [**JavaFX installation:**](http://eLinux.org/Jetson/JavaFX "Jetson/JavaFX") How to
    install JavaFX for the Jetson TK1

#### Performance and Power Topics

-   [**Performance:**](http://eLinux.org/Jetson/Performance "Jetson/Performance") How to
    maximize or minimize CPU & GPU clocks for different performance &
    power draw.
-   [**Power
    Management:**](http://eLinux.org/Jetson/Jetson_TK1_Power "Jetson/Jetson TK1 Power")
    Electrical power related issues, such as powering the board from a
    battery or seeing how much power is drawn.
-   [**Thermal:**](http://eLinux.org/Jetson/Thermal "Jetson/Thermal") How to replace the
    fan with a heat-spreader or heatsink, and measure the board's
    temperatures.
-   [**Graphics
    Performance:**](http://eLinux.org/Jetson/Graphics_Performance "Jetson/Graphics Performance")
    Discusses graphics performance of the Tegra TK1 on the board,
    including comparison with competing solutions.
-   [**Computer Vision Performance & Power
    Draw:**](http://eLinux.org/Jetson/Computer_Vision_Performance "Jetson/Computer Vision Performance")
    Describes the different Tegra hardware optimizations in OpenCV, and
    shows power & perf measurements for many computer vision
    applications in OpenCV, CUDA and VisionWorks.

#### Hardware Expansion Topics

-   [**Cameras & Webcams:**](http://eLinux.org/Jetson/Cameras "Jetson/Cameras") Discusses
    USB cameras and CSI cameras, stereo cameras and Time-Of-Flight 3D
    depth cameras.
-   [**mini-PCIe Add-on Cards:**](http://eLinux.org/Jetson/mini-PCIe "Jetson/mini-PCIe")
    Shows some possible add-on cards that can be used in the mini-PCIe
    port.
-   [**GPIO:**](http://eLinux.org/Jetson/GPIO "Jetson/GPIO") How to control digital
    output pins and read input data pins on Jetson TK1.
-   [**PWM:**](http://eLinux.org/Jetson/PWM "Jetson/PWM") How to control the spped of
    motors & servos or LED brightness using Jetson TK1.
-   [**I2C:**](http://eLinux.org/Jetson/I2C "Jetson/I2C") How to communicate between
    microcontrollers & devices using I2C on Jetson TK1.
-   [**Bluetooth:**](http://eLinux.org/Jetson/Bluetooth "Jetson/Bluetooth") Use wireless
    Bluetooth devices such as keyboards, mice & speakers, or communicate
    to a smartphone or tablet.
-   [**Enclosures & Cases:**](http://eLinux.org/Jetson/Enclosures "Jetson/Enclosures")
    Various cases that are available to protect a Jetson TK1.
-   [**Audio:**](http://eLinux.org/Jetson/Audio "Jetson/Audio") Issues related to audio
    input or output, such as microphones or speakers.
-   [**RTC:**](http://eLinux.org/Jetson/RTC "Jetson/RTC") Add battery backup RTC and
    support it using the Grinch Custom Kernel.



## Projects using Jetson TK1

The following are descriptions, photos and/or videos of projects
featuring Jetson TK1. Feel free to add your own!

[![Linux 3.15 + Wayland + Weston + Nouveau running on Jetson
TK1](http://eLinux.org/images/thumb/c/cb/WaylandWeston_JetsonTK1.jpg/320px-WaylandWeston_JetsonTK1.jpg)](http://eLinux.org/File:WaylandWeston_JetsonTK1.jpg "Linux 3.15 + Wayland + Weston + Nouveau running on Jetson TK1")

[Upstream Linux 3.15 + Wayland + Weston + Nouveau running a 100%
open-source OS on Jetson TK1, by CodeThink in
UK](http://www.codethink.co.uk/2014/06/12/no-secret-sauce-just-open-source).
If you want to try a similar setup on your Jetson TK1, read
[this](http://listmaster.pepperfish.net/pipermail/baserock-dev-baserock.org/2014-June/006529.html)
and
[this](http://listmaster.pepperfish.net/pipermail/baserock-dev-baserock.org/2014-June/006566.html).

[![NVIDIA SCOL
robot](http://eLinux.org/images/thumb/b/bb/NVIDIA_WalkingRobot.jpg/180px-NVIDIA_WalkingRobot.jpg)](http://eLinux.org/File:NVIDIA_WalkingRobot.jpg "NVIDIA SCOL robot")

[NVIDIA's SCOL "Super-Computer-On-Legs" robot, by Shervin Emami in
Australia](https://plus.google.com/116884386788836719107/posts/Be9thtKZwW7).
Performs Optical Flow video stabilization and HOG person detection to
walk towards nearby people. [Operator
Manual](http://eLinux.org/Jetson/Tutorials/Using_the_SCOL_Robot "Jetson/Tutorials/Using the SCOL Robot").

[![GE Lidar + Optical Flow
demo](http://eLinux.org/images/thumb/3/3e/GE_JetsonTK1.jpg/360px-GE_JetsonTK1.jpg)](http://eLinux.org/File:GE_JetsonTK1.jpg "GE Lidar + Optical Flow demo")

[Jetson TK1 Lidar range finder + camera Optical Flow robotics demo by
General Electric Intelligent Platforms in
USA](http://devblogs.nvidia.com/parallelforall/low-power-sensing-autonomy-nvidia-jetson-tk1/).
GE IP are developing a ruggedized Tegra K1 based module.

[![Explorer
Robot](http://eLinux.org/images/thumb/3/32/ExplorerRobot.jpg/250px-ExplorerRobot.jpg)](http://eLinux.org/File:ExplorerRobot.jpg "Explorer Robot")

[Explorer Robot by the Officine Robotiche in
Italy](https://plus.google.com/b/114318922342198493952/+RaffaelloBonghi/posts/2hdF5VtTG4m)

[![MyzharBot
Robot](http://eLinux.org/images/thumb/a/ae/MyzharBot2.jpg/250px-MyzharBot2.jpg)](http://eLinux.org/File:MyzharBot2.jpg "MyzharBot Robot")[![MyzharBot
Robot](http://eLinux.org/images/thumb/e/e5/FB_STICKERS_20150317_085147_Richtone%28HDR%29_1426607684475.jpg/250px-FB_STICKERS_20150317_085147_Richtone%28HDR%29_1426607684475.jpg)](http://eLinux.org/File:FB_STICKERS_20150317_085147_Richtone(HDR)_1426607684475.jpg "MyzharBot Robot")

[MyzharBot by Walter Lucetti in Italy](http://myzharbot.robot-home.it)
is a crawler robot made to study Navigation algorithms based on Computer
Vision, Machine Learning and 3D Sensors. The project is open source and
open hardware and has its own blog where you can find every information
to replicate it. MyzharBot has partecipated to
[GTC2015](http://www.gputechconf.com/) conference running for 3 days
between the legs of the attendants of the Nvidia's booth in the exhibit
area.

[![Project TURBO by
GE](http://eLinux.org/images/thumb/2/2e/Project_turbo.jpg/250px-Project_turbo.jpg)](http://eLinux.org/File:Project_turbo.jpg "Project TURBO by GE")

Project TURBO (TK1 Unmanned Reconnaissance Bot) is a low-cost mobile
research platform developed by GE Intelligent Platforms, exploring
CUDA-accelerated autonomy, sensing & perception powered by Tegra K1.

[![Cluster
Computer](http://eLinux.org/images/thumb/f/f8/Jetson_Cluster.jpg/270px-Jetson_Cluster.jpg)](http://eLinux.org/File:Jetson_Cluster.jpg "Cluster Computer")

Several users are building cluster computers using a handful of Jetson
TK1's:

-   User [rralf is using 10-15 Jetson
    TK1's](https://devtalk.nvidia.com/default/topic/766554/embedded-systems/-jetson-tk1-power-supply-dc-or-ac-/).
-   User [Purex is using 8 Jetson
    TK1's](https://devtalk.nvidia.com/default/topic/761234/#4274666).

[![JetsonBalloonFinderOutputScreenshot.png](http://eLinux.org/images/thumb/f/f0/JetsonBalloonFinderOutputScreenshot.png/300px-JetsonBalloonFinderOutputScreenshot.png)](http://eLinux.org/File:JetsonBalloonFinderOutputScreenshot.png)

A user is using CUDA accelerated computer vision to find balloons (or
other red round things). [This article explains the algorithm and has a
link to the
source.](http://pleasingsoftware.blogspot.com/2014/06/identifying-balloons-using-computer.html)

[![Jedroid
v1.0.jpg](http://eLinux.org/images/thumb/3/36/Jedroid_v1.0.jpg/300px-Jedroid_v1.0.jpg)](http://eLinux.org/File:Jedroid_v1.0.jpg)

**Project Jedroid** Android on Jetson TK1. Pure AOSP, Pure open source
code. [Jedroid source code now avaiable, let's work on jedroid
together](http://jetson.co/wiki/main_page/development)

[![Nbajetson1.jpg](http://eLinux.org/images/thumb/6/61/Nbajetson1.jpg/300px-Nbajetson1.jpg)](http://eLinux.org/File:Nbajetson1.jpg)

NBA 2K14 Android game using Jedroid on JetsonTK1 [Demo
video](https://www.youtube.com/watch?v=SjgPy0R1fms)

[![Transformative
Reality](http://eLinux.org/images/thumb/2/29/TR4Tegra.jpg/231px-TR4Tegra.jpg)](http://eLinux.org/File:TR4Tegra.jpg "Transformative Reality")

TR4Tegra. Smart-glasses with a depth camera, connected to Jetson TK1 in
a backpack, detects object location and notifies a blind user with a
\~25x25 neural implant
[info](https://plus.google.com/u/0/+WaiHoLi/posts/UxtarcqvUJb)

[![VORviz.png](http://eLinux.org/images/thumb/0/0c/VORviz.png/300px-VORviz.png)](http://eLinux.org/File:VORviz.png)

Monocular Visual Odometry for UAV using ROS on JETSON TK1 [Project
Info](http://www.robnsngh.com/2014/11/monocular-visual-odometry-using-nvidia-jetson-tk1-for-uavs/)

[![Jetson
bot.JPG](http://eLinux.org/images/thumb/5/5f/Jetson_bot.JPG/300px-Jetson_bot.JPG)](http://eLinux.org/File:Jetson_bot.JPG)

A low cost vision based development platform based on the Nvidia Jetson
TK1. [Project
info](http://secondrobotics.com/projects/robots/nvidia-jetson-robot-concept/)

[![Android Lollipop on Jetson
TK1.jpg](http://eLinux.org/images/thumb/d/d4/Android_Lollipop_on_Jetson_TK1.jpg/350px-Android_Lollipop_on_Jetson_TK1.jpg)](http://eLinux.org/File:Android_Lollipop_on_Jetson_TK1.jpg)

Jetson TK1 running on Android Lollipop BSP from e-con Systems with MIPI
camera and Ethernet connectivity. [Demo
video](https://www.youtube.com/watch?v=tYH2gHYB42s) [Project
info](http://www.e-consystems.com/jetson-tk1-android.asp?aljfrm/)



## Linux distributions running on Tegra

Jetson TK1 comes preloaded with NVIDIA's Linux4Tegra (L4T) distribution.
However it is possible to install other distributions on a Tegra device:

-   [Linux4Tegra](http://eLinux.org/Tegra/Downstream_SW/Linux4Tegra "Tegra/Downstream SW/Linux4Tegra")
    (L4T) distribution: basically Ubuntu 14.04 with pre-configured
    drivers for bootloader, kernel, OpenGL, X.Org, Multimedia, etc.
-   [Gentoo Linux from
    SD](http://eLinux.org/Tegra/Mainline_SW/Gentoo_From_SD_Card "Tegra/Mainline SW/Gentoo From SD Card"):
    run Gentoo directly on an SD-card without modifying the contents of
    the eMMC storage. (Will soon support many other Linux distros such
    as Debian, Ubuntu, Redhat, etc!)
-   [Gentoo
    Linux](http://eLinux.org/Tegra/Downstream_SW/Gentoo_From_eMMC "Tegra/Downstream SW/Gentoo From eMMC"):
    run Gentoo Linux (from eMMC) instead of Ubuntu Linux.
-   [Busybox](http://eLinux.org/Jetson/Busybox_RootFS "Jetson/Busybox RootFS"): create a
    very minimal root filesystem with Busybox.
-   [Android](https://devtalk.nvidia.com/default/topic/767885/embedded-systems/android-on-jetson-tk1/):
    The user "lucasdai" is working on a community-supported version of
    Android on Jetson TK1.
-   [Android lollipop on Jetson
    TK1](http://www.e-consystems.com/jetson-tk1-android.asp?aljfrm):
    Android Lollipop port for Jetson TK1, inlcuindg support from e-Con
    Systems.
-   others?



## Upstream/mainline OS & kernel system software on Tegra

NVIDIA's Tegra SoCs are well supported by mainline OSS such as Linux and
U-Boot. This section contains an index of topics related to running
mainline software on Tegra.

-   [U-Boot](http://eLinux.org/Tegra/Mainline_SW/U-Boot "Tegra/Mainline SW/U-Boot").
-   [Linux
    kernel](http://eLinux.org/Tegra/Mainline_SW/Linux_kernel "Tegra/Mainline SW/Linux kernel").
-   [Nouveau
    driver](http://eLinux.org/Tegra/Mainline_SW/Nouveau "Tegra/Mainline SW/Nouveau").
-   [Issues specific to running mainline Linux on the Jetson TK1
    board](http://eLinux.org/Tegra/Boards/NVIDIA_Jetson_TK1 "Tegra/Boards/NVIDIA Jetson TK1").



## Jetson TK1 and Tegra K1 Hardware Documents

The official Jetson TK1 [**Hardware Design and Development
page**](https://developer.nvidia.com/hardware-design-and-development)
contains the open-source hardware documents, allowing you to inspect
your Jetson board or even design your own custom board based on Tegra K1
or Jetson TK1, including:

-   Jetson TK1 DevKit Specification
-   Jetson TK1 Schematics
-   Jetson TK1 PCB Board Files (Gerbers)
-   Jetson TK1 2D CAD file with layers (.DXF)
-   Jetson TK1 Bill of Materials (BOM)
-   Tegra K1 SOC Technical Reference Manual (TRM)
-   Tegra K1 Embedded Platform Design Guide
-   Tegra K1 Memory Approved Vendor List
-   Jetson TK1 Pin Mux
-   Jetson TK1 Allegro Design File
-   Jetson TK1 PCB Stack Up Details
-   Jetson TK1 ValorODB++ Database
-   Jetson TK1 Datasheet Orcad Schematics
-   Jetson TK1 Board Orcad Schematics
-   Jetson TK1 PCB Assembly Drawing
-   Jetson TK1 RS274x Gerber Data
-   Jetson TK1 Autocad DXF Format Design File
-   Jetson TK1 PCB Mentor PADS ASCII Format Layout



## Other embedded Tegra boards created by NVIDIA

Jetson TK1 was the first embedded board that NVIDIA created for the
general public, but there have also been some other [Tegra
boards](http://eLinux.org/Tegra/Boards "Tegra/Boards"), including the automotive-grade
Tegra-K1 based [Visual Compute
Module](http://www.nvidia.com/object/visual-computing-module.html) and
the [Jetson
Pro](http://www.nvidia.com/object/jetson-automotive-development-platform.html)
development platform, both for the automotive industry (requires an NDA
and large sales figures, etc).



## Other SOCs created by NVIDIA

[SOCs](http://eLinux.org/Tegra/SoCs "Tegra/SoCs"): NVIDIA made several previous
generations of Tegra SOCs for the mobile, automotive and MP3 player
industries.



## Other links

[Resources](http://eLinux.org/Tegra/Resources "Tegra/Resources") is a list of links to
Tegra-related documentation and code outside of this wiki, such as TRMs
and mainline kernel links.

[Google+](https://plus.google.com/114318922342198493952)



## References


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [NVIDIA](http://eLinux.org/index.php?title=Category:NVIDIA&action=edit&redlink=1 "Category:NVIDIA (page does not exist)")
-   [Tegra](http://eLinux.org/index.php?title=Category:Tegra&action=edit&redlink=1 "Category:Tegra (page does not exist)")
-   [Jetson](http://eLinux.org/index.php?title=Category:Jetson&action=edit&redlink=1 "Category:Jetson (page does not exist)")

