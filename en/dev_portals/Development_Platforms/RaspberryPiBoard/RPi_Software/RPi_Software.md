> From: [eLinux.org](http://eLinux.org/RPi_Software "http://eLinux.org/RPi_Software")


# RPi Software





<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Overview">1 Overview</a></li>
<li><a href="#GPU_bootloaders">2 GPU bootloaders</a></li>
<li><a href="#Distributions">3 Distributions</a></li>
<li><a href="#Kernel">4 Kernel</a></li>
<li><a href="#Compiler">5 Compiler</a>
<ul>
<li><a href="#ARM">5.1 ARM</a></li>
<li><a href="#GPU">5.2 GPU</a></li>
<li><a href="#DSP">5.3 DSP</a></li>
</ul></li>
<li><a href="#Performance">6 Performance</a></li>
<li><a href="#Programming">7 Programming</a></li>
<li><a href="#Emulation">8 Emulation</a></li>
<li><a href="#References">9 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Software & Distributions:**

***Software** - an overview.*

*[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") - operating
systems and development environments for the Raspberry Pi.*

*[Kernel Compilation](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation")
- advice on compiling a kernel.*

*[Performance](http://eLinux.org/RPi_Performance "RPi Performance") - measures of the
Raspberry Pi's performance.*

*[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - programming
languages that might be used on the Raspberry Pi.*



## Overview

If you just want a working system, all that is required is a correctly
formatted SD card. For details on how to create or get one, please see
the [Hardware Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup#Prepared_Operating_System_SD_Card "RPi Hardware Basic Setup")
page.

In order to understand the software components in the RPi, you should
first understand how it boots up. At power-up, the CPU is offline, and a
small RISC core on the GPU is responsible for booting the SoC, therefore
most of the boot components are actually run on the GPU code, not the
CPU.

The boot order and components are as follows:

-   **First stage bootloader** - This is used to mount the FAT32 boot
    partition on the SD card so that the second stage bootloader can be
    accessed. It is programmed into the SoC itself during manufacture of
    the RPi and cannot be reprogrammed by a user.
-   **Second stage bootloader** (bootcode.bin) - This is used to
    retrieve the GPU firmware from the SD card, program the firmware,
    then start the GPU.
-   **GPU firmware** (start.elf) - Once loaded, this allows the GPU to
    start up the CPU. An additional file, fixup.dat, is used to
    configure the SDRAM partition between the GPU and the CPU. At this
    point, the CPU is release from reset and execution is transferred
    over.
-   **User code** - This can be one of any number of binaries. By
    default, it is the Linux kernel (usually named kernel.img), but it
    can also be another bootloader (e.g. U-Boot), or a bare-bones
    application.

Prior to 19th October 2012, there was previously also a third stage
bootloader (loader.bin) but this is no longer required.
<sup>[[1]](#cite_note-1)</sup>

Raspbian Linux image (others?) available on the foundation's website
([[1]](http://www.raspberrypi.org/downloads)) also contains cut-down
versions of the above files (fixup\_cd.dat, start\_cd.elf). These are
used when GPU memory is set to 16 MB, which in result disables some GPU
features. More info
[here](http://www.raspberrypi.org/phpBB3/viewtopic.php?p=198420#p198420).
In addition, there are also testing versions of the above files
(fixup\_x.dat, start\_x.elf), which enable potentially
unstable/not-fully-tested/hacky functionality - currently, using these
files instead of the usual fixup.dat/start.elf will cause extra video
codecs to become available.

Because of this boot process, use of an SD card to boot the RPi is
mandatory. This does however mean that you cannot 'brick' the device.

## GPU bootloaders

Currently all of the GPU software and firmware is supplied in binary
format. For Raspbian the latest stable release is included in the image
and can be updated with apt-get (see the [adding software
page](http://eLinux.org/Add_software "Add software")). The latest bleeding edge version
can be downloaded from the [RPI firmware section on
GitHub](https://github.com/raspberrypi/firmware/tree/master/boot). At
this time, the source code is not available.

[rpi-update](https://github.com/Hexxeh/rpi-update) is also available as
an easier way of updating the firmware and kernel. Please note, as this
firmware is bleeding edge, it really should only be used by advanced
users and could potentially still have bugs and be incompatible with
existing images.

## Distributions

*Main page: [Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions")*

SD card images of a number of pre-built distributions including Raspbian
(the RPi official distribution based on Debian), Arch Linux ARM, and
RISC OS are available from the [Raspberry Pi foundation
website](http://www.raspberrypi.org/downloads). Pre-loaded SD cards are
also available from [The Pi
Hut](http://thepihut.com/collections/sd-cards).

Several other Distributions made RPI Images as well. See at
[http://www.raspberrypi.org/phpBB3/viewforum.php?f=18](http://www.raspberrypi.org/phpBB3/viewforum.php?f=18)

Raspbian is the recommended distribution.

## Kernel

*Main page: [RPi Kernel
Compilation](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation")*

The kernel is sources can be obtained from the [RPI linux section on
GitHub](https://github.com/raspberrypi/linux)

## Compiler

The Broadcom processor on Raspberry Pi contains an ARM v6 general
purpose processor and a Broadcom VideoCore IV GPU. No data is currently
available on other cores (if any) available in the BCM2835.

### ARM

There is broad compiler support for the ARM processor including GCC -
please see [ARM Compilers](http://eLinux.org/ARMCompilers "ARMCompilers"). There are also
a number of cross-compiler toolchains - please see
[toolchains](http://eLinux.org/Toolchains "Toolchains").

The gcc compiler flags which will produce the most optimal code for the
RPi are:

    -Ofast -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s

`-Ofast` may produce compile errors for some programs. In this case,
`-O3` or `-O2` should be used instead. Note that `-mcpu=arm1176jzf-s`
can be used in place of `-march=armv6zk -mtune=arm1176jzf-s`.

If you want to generate a relatively up-to-date compiler that uses the
optimal flags by default, you can roll your own version of Linaro GCC -
see [RPi Linaro GCC
Compilation](http://eLinux.org/RPi_Linaro_GCC_Compilation "RPi Linaro GCC Compilation").

### GPU

The GPU provides APIs for Open GL ES 2.0, hardware-accelerated OpenVG,
and 1080p30 H.264 high-profile decode.

The GPU is capable of 1Gpixel/s, 1.5Gtexel/s or 24 GFLOPs of general
purpose compute and features a bunch of texture filtering and DMA
infrastructure - the Raspberry Pi team are looking at how they can make
this available to application programmers. For the documentation on some
Broadcom APIs exposed to control the GPU, see [RPi VideoCore
APIs](http://eLinux.org/RPi_VideoCore_APIs "RPi VideoCore APIs").

The GPU blob is an 18MB elf file, including libraries. It does an awful
lot. <sup>[[2]](#cite_note-2)</sup>

### DSP

There is a DSP, but there isn't currently a public API (Liz thinks the
BC team are keen to make one available at some point).

## Performance

A large number of benchmark results are available on the [performance
page](http://eLinux.org/RaspberryPiPerformance "RaspberryPiPerformance").

## Programming

A number of development environments are available depending on which
language you are writing - see the
[programming](http://eLinux.org/RPi_Programming "RPi Programming") page.

## Emulation

The ARM processor on the RPi can be emulated using QEMU. See [emercer's
tutorial](http://cronicasredux.blogspot.co.uk/2011/09/installing-and-running-debian-armel-on.html),
and also [this
discussion](http://www.raspberrypi.org/forum/projects-and-collaboration-general/emulating-a-raspi-on-windows).

## References

1.  [↑](#cite_ref-1)
    [https://github.com/raspberrypi/firmware/commit/c57ea9dd367f12bf4fb41b7b86806a2dc6281176](https://github.com/raspberrypi/firmware/commit/c57ea9dd367f12bf4fb41b7b86806a2dc6281176)
2.  [↑](#cite_ref-2)
    [http://www.raspberrypi.org/?page\_id=43&mingleforumaction=viewtopic&t=247](http://www.raspberrypi.org/?page_id=43&mingleforumaction=viewtopic&t=247)



-   [v](http://eLinux.org/Template:Raspberry_Pi "Template:Raspberry Pi")
-   [t](http://eLinux.org/Template_talk:Raspberry_Pi "Template talk:Raspberry Pi")
-   [e](http://elinux.org/index.php?title=Template:Raspberry_Pi&action=edit)

 

[Raspberry Pi](http://eLinux.org/R-Pi_Hub "R-Pi Hub")

**Startup**

[Buying Guide](http://eLinux.org/RPi_Buying_Guide "RPi Buying Guide") - [SD Card
Setup](http://eLinux.org/RPi_Easy_SD_Card_Setup "RPi Easy SD Card Setup") - [Basic
Setup](http://eLinux.org/RPi_Hardware_Basic_Setup "RPi Hardware Basic Setup") - [Advanced
Setup](http://eLinux.org/RPi_Advanced_Setup "RPi Advanced Setup") - [Beginners
Guide](http://eLinux.org/RPi_Beginners "RPi Beginners") -
[Troubleshooting](http://eLinux.org/R-Pi_Troubleshooting "R-Pi Troubleshooting")

[![RpiFront.jpg](http://eLinux.org/images/thumb/9/96/RpiFront.jpg/167px-RpiFront.jpg)](http://eLinux.org/File:RpiFront.jpg)

**Hardware**

[Hardware](http://eLinux.org/RPi_Hardware "RPi Hardware") - [Hardware
History](http://eLinux.org/RPi_HardwareHistory "RPi HardwareHistory") - [Low-level
peripherals](http://eLinux.org/RPi_Low-level_peripherals "RPi Low-level peripherals") -
[Expansion Boards](http://eLinux.org/RPi_Expansion_Boards "RPi Expansion Boards")

**Peripherals**

[Screens](http://eLinux.org/RPi_Screens "RPi Screens") - [Cases](http://eLinux.org/RPi_Cases "RPi Cases")
- [Other Peripherals (Keyboard, mouse, hub,
wifi...)](http://eLinux.org/RPi_VerifiedPeripherals "RPi VerifiedPeripherals")

**Software**

**Software** - [Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") -
[Kernel](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation") -
[Performance](http://eLinux.org/RPi_Performance "RPi Performance") -
[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - [VideoCore
APIs](http://eLinux.org/RPi_VideoCore_APIs "RPi VideoCore APIs") -
[Utilities](http://eLinux.org/RPi_Utilities "RPi Utilities")

**Projects**

[Tutorials](http://eLinux.org/RPi_Tutorials "RPi Tutorials") -
[Guides](http://eLinux.org/RPi_Guides "RPi Guides") -
[Projects](http://eLinux.org/RPi_Projects "RPi Projects") -
[Tasks](http://eLinux.org/RPi_Tasks "RPi Tasks") -
[DataSheets](http://eLinux.org/RPi_DatasheetCategories "RPi DatasheetCategories") -
[Education](http://eLinux.org/RPi_Education "RPi Education") -
[Communities](http://eLinux.org/RPi_Community "RPi Community")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [RaspberryPi](http://eLinux.org/Category:RaspberryPi "Category:RaspberryPi")

