> From: [eLinux.org](http://eLinux.org/Panda_How_to_build_SDR "http://eLinux.org/Panda_How_to_build_SDR")


# Panda How to build SDR



## Contents

-   [1 Introduction](#introduction)
-   [2 Software](#software)
    -   [2.1 Kernel](#kernel)
        -   [2.1.1 kernel 3.3-rc2 .config](#kernel-3-3-rc2-config)
        -   [2.1.2 kernel 3.5-rc4 .config](#kernel-3-5-rc4-config)
    -   [2.2 u-boot/MLO/SPL](#u-boot-mlo-spl)
    -   [2.3 Buildroot Internal toolchain with uClibc
        mfloat-abi=softfp](#buildroot-internal-toolchain-with-uclibc-mfloat-abi-3dsoftfp)
        -   [2.3.1 buildroot .config](#buildroot-config)
        -   [2.3.2 busybox .config](#busybox-config)
        -   [2.3.3 uClibc .config](#uclibc-config)
    -   [2.4 Buildroot Internal toolchain with uClibc
        mfloat-abi=hard](#buildroot-internal-toolchain-with-uclibc-mfloat-abi-3dhard)
        -   [2.4.1 buildroot .config](#buildroot-config-2)
        -   [2.4.2 busybox .config](#busybox-config-2)
        -   [2.4.3 uClibc .config](#uclibc-config-2)
    -   [2.5 Buildroot Crosstool-ng toolchain with
        glibc](#buildroot-crosstool-ng-toolchain-with-glibc)
        -   [2.5.1 buildroot .config](#buildroot-config-3)
        -   [2.5.2 busybox .config](#busybox-config-3)
        -   [2.5.3 crosstool-ng config](#crosstool-ng-config)
    -   [2.6 uClibc vs glibc size and speed in a real world
        example](#uclibc-vs-glibc-size-and-speed-in-a-real-world-example)
    -   [2.7 rootfs](#rootfs)
        -   [2.7.1 Packages](#packages)
    -   [2.8 ghpsdr3-alex](#ghpsdr3-alex)
        -   [2.8.1 dttsp](#dttsp)
            -   [2.8.1.1 Makefile](#makefile)
        -   [2.8.2 fftw3](#fftw3)
        -   [2.8.3 widget-server](#widget-server)
            -   [2.8.3.1 patch to orig](#patch-to-orig)
            -   [2.8.3.2 Makefile](#makefile-2)
        -   [2.8.4 dspserver](#dspserver)
            -   [2.8.4.1 Makefile](#makefile-3)
        -   [2.8.5 QtRadio](#qtradio)
-   [3 Hardware](#hardware)
    -   [3.1 PandaBoard](#pandaboard)
    -   [3.2 SDR Widget Lite Alpha](#sdr-widget-lite-alpha)
    -   [3.3 SDR Widget Beta](#sdr-widget-beta)
    -   [3.4 SoftRock Lite+USB Xtall
        v9.0](#softrock-lite-usb-xtall-v9-0)
    -   [3.5 RTL-SDR](#rtl-sdr)
        -   [3.5.1 mod to directly control the Si570 from the
            Widget](#mod-to-directly-control-the-si570-from-the-widget)

# Introduction

What I have done is still very much a work in progress. The PandaBoard,
OMAP4, platform is a very powerful and flexible system, but it has its
limitations. I have been doing work with the PandaBoard since about
November 2010, so I've seen the kernel and distributions move from
barely runable to very capable during that time.

For my SDR work, I run a home built "distro" which I build with
buildroot. It has the advantages of Gentoo as everything is built from
source, but it is not quite "plug & play". There is a lot of fiddling
that I had to do to get all the dependences and libraries that dspserver
and widget-server need. I am currently not running QtRadio on the
PandaBoard, and don't intend to, for a while at least. The DSP software
needs all the CPU power it can get.

The major problem that most folks have run into trying to get SDR
software running on a non-x86 platform is dealing with the lack of FPU.
Anything without an FPU is just a waste of time, software floating point
emulation is just tooooooooo slow. Custom code to do SDR with fixed
point arithmetic is possible and has been done. But, most recent efforts
to run something like ghpsdr or ghpsdr3-alex have met with dismal
failure due to the fact that folks will try to boot up Ubuntu on their
platform of choice, install the build-essentials, and try to build the
SDR software like they would on their desktop. While this may result in
a runnable piece of code, there is currently no support for an FPU. So
if the software runs at all, the DSP functions will not be able to keep
up with the incoming data.

This is where I diverged from the mainstream. The key event was the
availability of FFTW3 3.3.1-beta1 which includes support for the neon
FPU that is present on the OMAP4 4430/4460/4470. Unfortunately ARM made
this co-processor an option on Cortex-A9 implementations, and Nvidia
chose not to have it on Tegra2, so what I wound up with is somewhat Ti
specific. Neon is allegedly in the Tegra3, so newer tablets (Google??)
may benefit.

I was able to cross compile fftw3 and run several benchmarks on my
PandaBoard ES and was quite impressed with the result vs. what Vesprerix
had reported on with their implementation (fork) of fftw3. Once I was
convinced that the fft routines on which DTTSP depend were "good enough"
I proceeded to put together a buildroot build that was tuned to using
"-mcpu=cortex-a9 -mfpu=neon -mfloat-abi=softfp". There are lots of
fiddly cross-compiler options and libraries that have to be checked to
be sure they actually are using neon (this work has not been completed
yet). After the cross environment was working I went about getting
dspserver, widget-server and all their dependencies cross-compiled,
there were a lot. The most troublesome was Codec2, which I still have to
hand tweak to get to cross-compile properly. My first effort has Codec2
support patched out, but the current code does include it. The dspserver
and DttSP code is identical to what is in the git repository, except for
the Makefile which is customized to compile with my toolchain. I have
modified the widget-server code to remove some dead code and add
calibration for the Si570.

Recently (6/26/2012) I've cross-compiled everything for armhf which is
all the rage these days as folks have found that floating point
emulation sucks rocks. I earlier used softfp for compatibility sake, but
am now fiddling with armhf which takes a bit of fiddling with buildroots
gcc makefile to get to work. Might get a 10% performance boost.

Another issue that I haven't dug into yet is Jack, it is necessary for
non-hpsdr protocol servers. Jack2 uses waf (a really old version 1.5.0
at that) instead of make. I am able to cross compile Jack1 (0.121.3)
since it uses make, but Jack2 needs some help. Jack2 has had some
allignment issues at it is very x86 centric. Pulse audio and Port audio
were no problem.

There will be an sd card image that one can "dd" onto a blank card.
(someday)


 For SDR work, at least gcc 4.6.2 is a must, now using 4.7.1

# Software

I build the kernel and u-boot/SPL outside of buildroot, but use the
buildroot toolchain. This may change in the near future, as buildroot
will soon support the PandaBoard as a target. The latest buildroot can
build SPL/MLO/u-boot/kernel and has a PandaBoard defconfig.

## Kernel

### kernel 3.3-rc2 .config

### kernel 3.5-rc4 .config

## u-boot/MLO/SPL

## Buildroot Internal toolchain with uClibc mfloat-abi=softfp

Start by downloading buildroot and getting all the prerequisites
installed on your build machine.

    git clone git://git.buildroot.net/buildroot buildroot-softfp

Then apply the following patch from the main buildroot directory

    patch -p1 < 0001_add_new_packages.patch

Then replace the config files for buildroot, busybox, and uClibc like
this

    patch -p1 < 0002_replace_configs.patch

Build everything

    make

After the build completes you will have a toolchain, packages and
libraries except for codec2. This takes a bit of fiddling with to cross
compile.

Download
[http://freetel.svn.sourceforge.net/viewvc/freetel/codec2/?view=tar](http://freetel.svn.sourceforge.net/viewvc/freetel/codec2/?view=tar)

Untar in a convenient place, cd to that place, run ./configure, then
make. This will build codec2/src/generate\_codebook for your desktop
platform, which will be needed later.

Now run make menuconfig in the buildroot main dir, go to Package
Selection for Target --\> Libraries --\> Other and select codec2

Run make again from the main buildroot dir and wait till the build
fails, which it should.

Now copy the generate\_codebook file from codec2/src/ to
buildroot/output/build/codec2-289/src/

The Makefile.am in /src will need to be modified as well as follows:

comment out line 46 i.e.

    #noinst_PROGRAMS = generate_codebook

cd to the root of codec2-289

    make clean
    rm .stamp_configured

Now back to the main buildroot dir and run make again. This will finish
building and the codec2 library.

### buildroot .config

### busybox .config

### uClibc .config

## Buildroot Internal toolchain with uClibc mfloat-abi=hard

Start by downloading buildroot and getting all the prerequisites
installed on your build machine.

    git clone git://git.buildroot.net/buildroot buildroot-hf

Building the whole shebang for hardfloat starts off simply enough but,
buildroot support for hardfloat is somewhat broken,

Apply the following patch and use with the supplied buildroot .config

    patch -p1 <0001_fix_buildroot_uclibc_hardfloat.patch

Don't try to change the floating point abi as this patch may be fragile
enough to break everything.

Then apply the following patch from the main buildroot directory

    patch -p1 < 0001_add_new_packages.patch

Then replace the config files for buildroot, busybox, and uClibc like
this

    patch -p1 < 0002_replace_configs.patch

This is just a place holder till I figure out how to do this properly

Build everything

    make

After the build completes you will have a toolchain, packages and
libraries except for codec2. This takes a bit of fiddling with to cross
compile.

Download
[http://freetel.svn.sourceforge.net/viewvc/freetel/codec2/?view=tar](http://freetel.svn.sourceforge.net/viewvc/freetel/codec2/?view=tar)

Untar in a convenient place, cd to that place, run ./configure, then
make. This will build codec2/src/generate\_codebook for your desktop
platform, which will be needed later.

Now run make menuconfig in the buildroot main dir, go to Package
Selection for Target --\> Libraries --\> Other and select codec2

Run make again from the main buildroot dir and wait till the build
fails, which it should.

Now copy the generate\_codebook file from codec2/src/ to
buildroot/output/build/codec2-289/src/

The Makefile.am in /src will need to be modified as well as follows:

comment out line 46 i.e.

    #noinst_PROGRAMS = generate_codebook

cd to the root of codec2-289

    make clean
    rm .stamp_configured

Now back to the main buildroot dir and run make again. This will finish
building and the codec2 library.

### buildroot .config

### busybox .config

### uClibc .config

## Buildroot Crosstool-ng toolchain with glibc

### buildroot .config

### busybox .config

### crosstool-ng config

## uClibc vs glibc size and speed in a real world example

After building the first PandaSDR system, I was curious as to how things
might change if I used glibc. The first thing I did was do a bench mark
on the floating point performance of both. uClibc was woefully
inadequate in sin/cos

[http://gruntthepeon.free.fr/ssemath/neon\_mathfun.html](http://gruntthepeon.free.fr/ssemath/neon_mathfun.html)

with this benchmark compiled with glibc the performance numbers matched
closely with the website, however with uClibc the sinf/cosf numbers were
off.

Instead of "2.0 millions of vector evaluations/second -\> 121
cycles/value" I got ".1 millions of vector evaluations/second -\> 1333
cycles/value"

Based on that benchmark, I had buildroot build a new system with a
crosstool-ng based toolchain using glibc 2.13. This was somewhat
complicated since the gcc 4.6.2 implementation was EXPERIMENTAL.
Numerous other problems were encountered, but after a while I was able
to get the toolchain built and the packages compiled with neon support
for cortex-a9. The SDR software dspserver and widget-server built
without problems except for the lack of libgomp in the target rootfs. It
ws built ok, and populated into the toolchain's staging area, it just
didn't make into the final rootfs. After all was said & done I compared
the size of the libraries and executables, glibc's libs were certainly
bigger, but there were fewer of them. The packages executables and libs
were about the same size. Overall the two rootfs's were very close to
the same size at 32MBytes (uClibc), and 40MBytes (glibc), the largest
difference being in /usr/share/locale (292KBytes vs 7.7MBytes). In
operation the SDR code consumed about the same amount of cpu power too.
More to come as I investigate further.

Buildroot with uClibc was certainly easier to get running, but
crossstool-ng with glibc more closely compares to what would be
available in a "Distro" like ubuntu/angstrom/arch Linux. Performance
without neon was not evaluated. Earlier linpack and fftw3 benchmarks
showed that without neon floating performance was abysmal. Both builds
had fiddly bits, but my lack of programming skill probably weighed in as
well.

Building buildroot with either uClibc or glibc (via crosstools-ng)
builds all the host tools necessarry, whereas building crosstools-ng
alone requires versions of host tools that you may not have on your
machine. For example, my desktop 64bit Core i7 is running ubuntu karmic,
it can't build crosstools-ng without updating lots of tools, but it can
build buildroot with crosstools-ng. However it is currently not possible
to change the crosstools-ng configuration in buildroot as it is with
busybox or uClibc. It's an inconvenience, but not a show stopper.

## rootfs

### Packages

alsa-lib-1.0.24.1

alsa-utils-1.0.24.2

busybox-1.19.3

codec2-289

dbus-1.4.16

dbus-glib-0.98

dropbear-2011.54

expat-2.0.1

fftw-3.3.1-beta1

gdb-7.3.1-target

gdbserver-7.3.1

gettext-0.16.1

i2c-tools-3.0.3

input-event-daemon-v0.1.3

json-c-0.9

libconfig-1.4.8

libevent-2.0.14

libglib2-2.28.8

libogg-1.2.2

libsamplerate-0.1.8

libsndfile-1.0.25

libtool-2.2.10

libusb-1.0.8

libusb-compat-0.1.3

libxml2-2.7.8

ncurses-5.7

ortp-0.18.0

portaudio-V19

pulseaudio-1.0

speex-1.2rc1

wireless\_tools-29

zlib-1.2.5



## ghpsdr3-alex

A good introductory guide to ghpsdr & ghpsdr-alex is available:

[http://openhpsdr.org/wiki/images/6/63/NewbieGuide.pdf](http://openhpsdr.org/wiki/images/6/63/NewbieGuide.pdf)

Familiarity with ghpsdr-alex is useful before starting on
cross-compiling bits & pieces of it to run on the PandaBoard.

The normal ghpsdr3-alex package needs QtSDK installed as well a lot of
graphic specific librarys. At present, this is beyond the scope of this
How-To, and it will be left for another day to produce the GUI part of
this, ie. QtRadio. The PandaBoard will only be running the minimal code
necessary to have a functional SDR server radio. pulseaudio and
portaudio are required for non hpsdr protocol servers, and have been
built successfully, however at present they are not used for the
widget-server and could be eliminated from the build. Only the
widget-server has been tested so far.

This code is built outside of buildroot, but using the buildroot created
toolchain. This is done by adding a Makefile to dspserver, DttSP, and
widget server. The Makefile has a hardcoded path to the toolchain, so it
may (will) be necessary to alter it to fit individual circumstances.

The various parts of this package have been evolving for quite some
time, the ghpsdr3-alex project is the most recent "fork" of the original
ghpsdr3 software

[http://openhpsdr.org/wiki/index.php?title=Ghpsdr3](http://openhpsdr.org/wiki/index.php?title=Ghpsdr3)

[https://github.com/alexlee188/ghpsdr3-alex](https://github.com/alexlee188/ghpsdr3-alex)

Although this project is trying not to be a fork, in essence it is, as
the code is going in a different direction than the original authors
intended. Three cheers for open source....

### dttsp

This code is very mature and does much of the heavy lifting, non fft
processing for the SDR stack

#### Makefile

### fftw3

The latest beta of fftw3 added support for ARM neon floating point.

[http://www.fftw.org/](http://www.fftw.org/)

This is where the heavy lifting part of the DttSP happens. Somewhat
independently evolved by the fftw3 authors and Vesperix

[http://www.vesperix.com/arm/fftw-arm/](http://www.vesperix.com/arm/fftw-arm/)

fftw3 3.3.1-beta1 is a critical part of the SDR stack. Without neon
support, SDR on ARM v7-a is not possible.

### widget-server

The SDR-Widget project

[http://code.google.com/p/sdr-widget/](http://code.google.com/p/sdr-widget/)

[http://www.yoyodyneconsulting.ca/pages/SDR-Widget.html](http://www.yoyodyneconsulting.ca/pages/SDR-Widget.html)

Sought to develop an Atmel AVR AT32UC3A3256 based USB UAC2 sound "card".
Able to digitize at 24bits and 192000 samples/second, this project
provided a "standard of comparison" noise floor of better than -130dbm.
Subsequent firmware development allowed a single firmware image to
support UAC1, UAC2 and hpsdr protocols, allowing Linux, MacOSX, and
Windows users to benefit.

The widget-server driver supports the hpsdr protocol allowing all users
24bit 192000 samples/second operation. The following patch removes some
dead code and allows claibration of the Si570 VFO chip. This is the
direct interface to the SDR harware, and provides a standard ABI to the
upper layer, dspserver

#### patch to orig

#### Makefile

### dspserver

The dspserver program is the "middle-ware" between the hardware
interface code, many different hardware radios are supported, through
different "driver" programs:

hiqsdr [http://www.hiqsdr.org/](http://www.hiqsdr.org/)

perseus
[http://microtelecom.it/perseus/](http://microtelecom.it/perseus/)

sdriq
[http://www.rfspace.com/RFSPACE/SDR-IQ.html](http://www.rfspace.com/RFSPACE/SDR-IQ.html)

softrock [http://www.softrockradio.org/](http://www.softrockradio.org/)

widget-server
[http://www.yoyodyneconsulting.ca/pages/SDR-Widget.html](http://www.yoyodyneconsulting.ca/pages/SDR-Widget.html)

hpsdrsvr
[http://openhpsdr.org/index.php](http://openhpsdr.org/index.php)

sdr1000
[http://www.flex-radio.com/Products.aspx?topic=sdr1k](http://www.flex-radio.com/Products.aspx?topic=sdr1k)

usrp [http://www.ettus.com/](http://www.ettus.com/)

dspserver includes DttSP and both must be compiled with neon enabled.
The toolchains built by buildroot and the associated libraries all need
this enabled.

#### Makefile

### QtRadio

QtRadio is the GUI interface for the SDR package. In the PandaBoard
implementation, no such layer exists. In the future, once ubuntu is
stabilised with full GPU acceleration, a GUI might be possible. OpenCL
and/or OpenGL are essential.

# Hardware

[http://www.youtube.com/watch?v=qn479WawT3U&feature=youtu.be](http://www.youtube.com/watch?v=qn479WawT3U&feature=youtu.be)



## PandaBoard

Tested with PandaBoard EA3 and PandaBoard ES EB3.

## SDR Widget Lite Alpha

The Widget Lite Alpha boards were capture only, the Widget Beta includes
audio out and supports the same common firmware and protocol as the
Alpha board.

## SDR Widget Beta

[http://www.yoyodyneconsulting.ca/images/SDR\_Widget\_Lite\_Alpha2\_w\_LCD.JPG](http://www.yoyodyneconsulting.ca/images/SDR_Widget_Lite_Alpha2_w_LCD.JPG)

## SoftRock Lite+USB Xtall v9.0

[http://wb5rvz.com/sdr/RX\_V9\_0/](http://wb5rvz.com/sdr/RX_V9_0/)

[http://pages.cs.wisc.edu/\~timc/e/sdr.html](http://pages.cs.wisc.edu/~timc/e/sdr.html)

## RTL-SDR

### mod to directly control the Si570 from the Widget


