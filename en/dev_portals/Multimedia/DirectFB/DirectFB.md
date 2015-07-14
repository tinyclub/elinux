> From: [eLinux.org](http://eLinux.org/DirectFB "http://eLinux.org/DirectFB")


# DirectFB



This page was obtained from *DirectFB Analysis by IGEL Co.,Ltd.*

## Contents

-   [1 What is DirectFB?](#what-is-directfb-3f)
-   [2 Goals of DirectFB](#goals-of-directfb)
-   [3 Features of DirectFB](#features-of-directfb)
-   [4 Devices supported by DirectFB](#devices-supported-by-directfb)
-   [5 Supported Media Format](#supported-media-format)
-   [6 DirectFB Architecture](#directfb-architecture)
-   [7 DirectFB API](#directfb-api)
-   [8 Upper Layer APIs supporting
    DirectFB](#upper-layer-apis-supporting-directfb)
-   [9 Fusion Sound](#fusion-sound)
-   [10 Consideration](#consideration)
-   [11 Development Resources](#development-resources)
    -   [11.1 Porting Guides](#porting-guides)
    -   [11.2 Performance benchmarking](#performance-benchmarking)
-   [12 Proposed System Architecture for AVWG
    Platform](#proposed-system-architecture-for-avwg-platform)

## What is DirectFB?

DirectFB (Direct Frame Buffer) is a set of graphics APIs implemented on
top of the Linux Frame Buffer (fbdev) abstraction layer.

-   Input Device and Window System are also available
-   Linux version of \`DirectDraw\`, in a manner of speaking
-   [www.directfb.org](http://www.directfb.org/)
-   [DirectFB wikipedia entry](http://en.wikipedia.org/wiki/DirectFB)

DirectFB is primarily developed by the German Company, Convergence GmbH

-   Specialty in Linux based DTV benchmark and middleware development
    Hosts LinuxTV, \`FusionSound\` and DirectFB projects
-   Member of Multimedia Home Platform
    ([http://www.mhp.org/](http://www.mhp.org/))
-   [www.convergence.de](http://www.convergence.de/)

## Goals of DirectFB

-   Small memory Footprint
-   Maximize utilities of hardware acceleration
-   Support of advanced graphics operations such as multiple alpha
    blending modes
-   No kernel modifications
-   No library dependencies, except for libc
-   Meet the requirements of [MHP](http://www.mhp.org) specifications

## Features of DirectFB

Graphics

-   Rectangle Filling/Drawing
-   Triangle Filling/Drawing
-   Line Drawing
-   Blit
-   Alpha Blending (texture alpha, alpha modulation)
-   Porter/Duff
-   Colorizing
-   Source Color Keying
-   Destination Color Keying
-   Integrated Window System
-   A subset of OpenGL API (Mesa)

## Devices supported by DirectFB

As of DirectFB 0.9.21

Graphics Drivers

-   Matrox Mystique/Millennium, G100, G200, G400/450, G550
-   Via CLE266
-   ATI Mach64/Rage Pro series
-   ATI Rage 128
-   ATI Radeon
-   3dfx Voodoo3/4/5/Banshee
-   igs \`CyberPro\` 5xxx
-   S3 Savage 3/4 series
-   \`NeoMagic\` 220/2230/2360/2380
-   nVidia \`TNT/GeForce\` seiries
-   SiS 315
-   Intel i810
-   NSC Geode

Input Drivers

-   Standard Keyboards
-   Serial and PS/2 mice
-   joysticks
-   Linux Input Layer Devices
-   Infrared Remote Controller (lirc)
-   iPAQ Touch Screen
-   ucb 1x00 Touch Screen
-   Microtech Touch Screen
-   Sony PI Jogdial

## Supported Media Format

Still Images

-   JPEG (libjpeg)
-   PNG (libpng2)
-   GIF
-   Image format supported by Imlib2

Motion Picture

-   mpeg1/2 (libmpeg3)
-   AVI (avifile)
-   MOV (\`OpenQuicktime\`)
-   Macromedia Flash (libflash)
-   video4linux

Fonts

-   DirectFB bitmap font
-   \`TrueType\` (\`FreeType2\`)

## DirectFB Architecture

[![Slide0003
image021.gif](http://eLinux.org/images/6/6c/Slide0003_image021.gif)](http://eLinux.org/File:Slide0003_image021.gif)

DirectFB runs on top of the Frame Buffer Device (http://eLinux.org/dev/fb), and utilize
hardware acceleration with their chipset drivers

-   Also runs on VESA frame buffer

DirectFB performs only the following tasks thru /dev/fb?

-   Setting up the video mode (resolution, color depth and timings)
-   Memory mapping of the frame buffer and I/O ports
-   Changing the viewport (e.g. for double-buffer)

DirectFB uses their own chipset driver to utilize hardware acceleration
through the memory mapped I/O ports

-   Turns off the frame buffer drivers acceleration features

## DirectFB API

DirectFB APIs are simple APIs whose design concept seems to be referring
the DirectX APIs Might be enough for STB, but further analysis is
required

-   Does it covers enough features?
-   Performance and quality, such as flickers, when used in conjunction
    with \`Video4Linux\`
    -   Based on their presentation at FOSDEM, the DirectFB has
        capability to synchronously overlay MPEG-2 video on DirectFB
        window, i.e. no flickers

## Upper Layer APIs supporting DirectFB

-   XDirectFB
    -   X Server for DirectFB
-   DirectFBGL
    -   OpenGL extension for DirectFB
    -   Uses Mesa/DRI
-   GTK+
    -   GTK+ for DirectFB
-   DFB++
    -   C++ Interface for DirectFB
-   DFBTerm
    -   Terminal runs on DirectFB
-   DFBSee
    -   Movie player runs on DirectFB
-   DFBPoint
    -   Presentation application runs on DirectFB
-   MythTV
    -   PVR runs on DirectFB
-   Qt on DirectFB
    -   Qt for DirectFB
-   SDL (Simple Directmedia Layer)
    -   Game Development API that also supports DirectFB
-   Enlightenment Foundation Libraries (Evas and Ecore)
    -   Object-oriented and stateful canvas (Evas) and main loop
        integration (Ecore) that have DirectFB engines/backends.
-   Crank Storyboard on DirectFB
    -   [http://www.cranksoftware.com/products/crank\_storyboard\_suite.php](http://www.cranksoftware.com/products/crank_storyboard_suite.php)

## Fusion Sound

Audio subsystem that runs in conjunction with DirectFB Uses Fusion IPC,
kernel function for synchronization, to synchronize with DirectFB

-   By using Fusion IPC, DirectFB and Fusion Sound can achieve fine
    granularity synchronization
-   Not enough documentation is available for Fusion IPC, requires
    source code level analysis

## Consideration

Need further investigation and tests on the following points:

-   How well and smoothly works with video4linux
-   Internal architecture of Fusion Sound and Fusion IPC
-   Coverage of features

Architecture, at a glance, seems to be well designed, however, to
increase supportability of new video and audio devices, we may need to
re-design the architectures, e.g. both DirectFB layer and the Linux
Frame Buffer Device To accomplish inter-media synchronization, i.e.
synchronization of device access and temporal synchronization, concrete
synchronization subsystem needs to be designed Based on the
synchronization subsystem, API similar to \`DirectDraw\`,
\`DirectSound\` and \`DirectShow\` has to be designed (See next slide)

## Development Resources

### Porting Guides

See [Porting DirectFB](http://eLinux.org/Porting_DirectFB "Porting DirectFB") - which
describes the process of porting DirectFB to an SH platform.

### Performance benchmarking

See [Benchmark DirectFB](http://eLinux.org/Benchmark_DirectFB "Benchmark DirectFB")

## Proposed System Architecture for AVWG Platform

[![Slide0012
image040.gif](http://eLinux.org/images/f/f3/Slide0012_image040.gif)](http://eLinux.org/File:Slide0012_image040.gif)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DirectFB](http://eLinux.org/Category:DirectFB "Category:DirectFB")
-   [Multimedia](http://eLinux.org/Category:Multimedia "Category:Multimedia")

