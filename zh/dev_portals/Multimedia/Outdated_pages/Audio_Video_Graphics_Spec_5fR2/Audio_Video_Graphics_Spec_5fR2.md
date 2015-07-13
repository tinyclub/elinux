> From: [eLinux.org](http://eLinux.org/Audio_Video_Graphics_Spec_5fR2 "http://eLinux.org/Audio_Video_Graphics_Spec_5fR2")


# Audio Video Graphics Spec 5fR2



Draft 0.3

## Contents

-   [1 Introduction](#introduction)
-   [2 Rationale](#rationale)
-   [3 Terminology](#terminology)
    -   [3.1 Acronyms and terms](#acronyms-and-terms)
    -   [3.2 Compliance classifiers](#compliance-classifiers)
-   [4 Platforms](#platforms)
-   [5 Audio Specification](#audio-specification)
-   [6 Video-in/Capture
    Specification](#video-in-capture-specification)
-   [7 Video-out/Graphics
    Specification](#video-out-graphics-specification)
    -   [7.1 Graphics formats](#graphics-formats)
    -   [7.2 Multi-plane support](#multi-plane-support)
-   [8 Work in progress](#work-in-progress)
    -   [8.1 Framebuffer specification](#framebuffer-specification)
        -   [8.1.1 YCbCr Format](#ycbcr-format)
            -   [8.1.1.1 Resolution Support](#resolution-support)
            -   [8.1.1.2 Memory representation](#memory-representation)
        -   [8.1.2 Font rendering](#font-rendering)
        -   [8.1.3 Basic 2D acceleration](#basic-2d-acceleration)
        -   [8.1.4 Video format control](#video-format-control)
        -   [8.1.5 Multi-plane support](#multi-plane-support-2)
        -   [8.1.6 DirectFB specification](#directfb-specification)
        -   [8.1.7 Important Terminology](#important-terminology)
        -   [8.1.8 YCbCr Format](#ycbcr-format-2)
            -   [8.1.8.1 Resolution Support](#resolution-support-2)
            -   [8.1.8.2 Memory
                representation](#memory-representation-2)
            -   [8.1.8.3 Font rendering](#font-rendering-2)
        -   [8.1.9 Basic 2D acceleration](#basic-2d-acceleration-2)
        -   [8.1.10 Video format control](#video-format-control-2)
        -   [8.1.11 Multi-plane support](#multi-plane-support-3)
        -   [8.1.12 GFX Card Driver](#gfx-card-driver)
        -   [8.1.13 DirectFb benchmarks](#directfb-benchmarks)
-   [9 References](#references)
-   [10 Remaining Issues](#remaining-issues)

## Introduction

Audio, video, and graphics processing is at the core of many CE
products. The AVG requirements for CE devices are different than those
for PCs/Servers, notably with respect to footprint, input devices,
interlacing, streaming, etc.. Multiple graphics planes and video planes
may be combined using, e.g., alpha blending and animation.

## Rationale

No single default/standard interfaces exist for AVG. Having a well
defined, well supported interface for AVG devices will reduce
fragmentation of solutions and encourage the CE community to develop
solutions that apply to conforming interfaces, so that they can be
deployed across a wider range of systems.

## Terminology

### Acronyms and terms

Acronyms and Terms

**Term**

**Definition**

ALSA

Advanced Linux Sound Architecture -- functional level audio API, now
standard in 2.6 Linux kernels, replacing OSS.

API

Application Programmers Interface

ARIB

Association of Radio Industries and Businesses. Most relevant to AVG is
the proposed graphics architecture proposed for High Definition TV
Broadcast (the 5-plane model).

ATSC

Advanced Television Systems Committee. American standard body for
digital television broadcasting.

Back-end Scaler

A Scaler which manipulates the graphics planes and data, but does not
allow the host processor access to the (blended) end result, mainly for
efficiency reasons.

CCIR 601

In 1982 CCIR 601 established a digital video standard, which uses the Y,
Cr, Cb color space (often incorrectly referred to as YUV). Unlike YUV,
Cr,Cb range [-0.5, -0.5]. A full conversion matrix is included below
(\*)

CE

Consumer Electronics: a class of devices used in the home or on the
move. Includes DVD, DVR, PVR, PDA, TV, set-top box, cellular phones,
etc.

DVB

Digital Video Broadcast: European standards body for digital television
broadcasting.

DVD

Digital Versatile Disc: high capacity multimedia data storage medium.

DVR

Digital Video Recorder: a consumer electronic device.

FB,Framebuffer

Abstraction of video-out hardware with a low level (ioctl) API. Standard
in \>2.4 Linux kernel (see the /usr/src/linux/Documentation/fb kernel
tree directory for more information).

Front-end Scaler

A Scaler which manipulates the graphics planes and data and allows the
host processor access the (in-between and) end results.

HDTV

High Definition Television: provides a higher quality television
broadcast, with progressive and interlaced ( 720p to 1080i ) video and
support for 16:9 aspect (movie) ratio.

JPEG

Joint Photographic Experts Group: (lossy) still image compression
standard.

MHP

Multimedia Home Platform: an API used together with MPEG-2
transmissions.

MIME

Multipurpose Internet Mail Extension: a standard for identifying the
type of data contained in a file. MIME is an Internet protocol that
allows sending binary files across the Internet as attachments to e-mail
messages. This includes graphics, photos, sound, video files, and
formatted text documents.

MP3

MPEG-1 Audio Layer 3: a popular audio compression standard.

MPEG-1/2/4

Moving Picture Experts Group: a compression standard for digital audio &
video with varying levels of complexity and achievable compression
ratios.

NTSC

National Television Systems Committee: American standard for analog
television broadcasting.

PAL

Phase Alternating Line: American standard for analog television
broadcasting.

PNG

Portable Network Graphics: (lossless) still image compression standard.

PVR

Personal Video Recorder: a consumer electronic device.

RGB[A]

Colorspace representation commonly used in computer graphics. It uses
three orthogonal components -- Red, Green and Blue -- to represent
colors in to human visible spectrum, e.g. by combining red and green as
additive colors it can fool the eye into seeing "yellow" light. An
optional A at the end denotes the presence of per-pixel alpha. See also
CCIR 601.

Scaler

Graphics hardware accelerator which may scale and reformat (e.g. convert
from YCC to RGB) graphics data and merge multiple independent graphics
planes for final display.

V4L

Video for Linux: low level (ioctl) video input and overlay API, standard
in 2.4. Originally designed for control of analog video capture and
tuner cards, as well as parallel port and USB video cameras.
Incorporated in many other higher level APIs such as DirectFB.

!V4L2

Video for Linux, second version, made to be more flexible and
extensible. Added specifications for digital tuner control and capture.

YC'bCr[A]

Colorspace representation commonly used in analog and digital video
broadcasts, and video compression technologies such as MPEG. It uses
three orthogonal components, one for luminance (Y) and two for the
color-difference signals (Cr,Cb). Since the eye is less sensitive to
color than luminance, the color difference signals often get a smaller
bandwidth allocated (or lower pixel resolution in the digital domain).
An optional A at the end denotes the presence of per-pixel alpha. See
also CCIR 601.

YIQ

Colorspace representation commonly used in North American TV broadcast
and is similar to YUV (see definition of YUV). The relation with YUV is:
I == 0.74 V - 0.27 U and Q == 0.48 V + 0.41 U

YUV

Colorspace representation commonly used in European TV broadcast. It is
similar to YC'***bCr and often meant to be the same (incorrectly) with U
referring to Cb and V referring to Cr. With Y (luminance) defined as
Y==0.299 R + 0.587 G + 0.114 B, by definition, U==B-Y, thus U represents
colors from blue (U\>0) to yellow (U\<0). Likewise V==R-Y, thus V
represents colors from magenta (V\>0) to Cyan (blue green) (V\<0).***



<table>
<caption> RGB to YCbCr conversion matrix </caption>
<tbody>
<tr class="odd">
<td align="left">Y</td>
<td align="left"></td>
<td align="left">0.299 0.587 0.114</td>
<td align="left">R</td>
</tr>
<tr class="even">
<td align="left">Cr</td>
<td align="left">==</td>
<td align="left">0.500 -0.419 -0.081</td>
<td align="left">G</td>
</tr>
<tr class="odd">
<td align="left">Cb</td>
<td align="left"></td>
<td align="left">-0.169 -0.331 0.500</td>
<td align="left">B</td>
</tr>
</tbody>
</table>

### Compliance classifiers

Terminology conventions are adopted here as they are defined in IETF
[RFC 2119](http://eLinux.org//tools.ietf.org/html/rfc2119), "Key words for use in RFCs to
Indicate Requirement Levels" (by S. Bradner, March 1997). A compliance
classifier from the following set may be used:

[M]ust, Required, Shall
This is the minimum set of requirements. The CELF based products are
expected to comply with these requirements when expressed in
unconditional form. A conditional requirement expressed in the form, "If
X, then Y must be implemented", means that the requirement "Y" must be
met when the conditional aspect "X" applies to a given implementation.

[S]hould, Recommended
Recommended items are optional items that are strongly recommended for
inclusion in CELF based products. The difference between "recommended"
items and "optional" items, below, is one of priority. When considering
features for inclusion in a product, recommended items should be
included first.

[O]ptional, May
Optional items are suggestions for features that will enhance the user
experience or are offered as a less preferred choice relative to another
recommended feature. If optional features are included, they should
comply with the requirement to ensure interoperability with other
implementations.

E[X]pressly Forbidden
This term means that an item must not be incorporated in a CELF based
product.

## Platforms

[O] Three target platforms are used or under consideration:

-   Renesas SH4 host with SM501 graphics (See SzwgPlatform3)
-   TI OMAP (See SzwgPlatform1)
-   X86 generic with Matrox G450/550

For the first two, the [System Size
Spec](http://eLinux.org/System_Size_Spec "System Size Spec") page has a full description
under "Definition - Platform".

## Audio Specification

[O] No additional Audio specifications have been defined. ALSA, defined
in kernel 2.6, may be used. Further evaluation is required before it can
be considered for recommendation (see work in progress). Future
extensions relate to AV streaming and synchronization.

## Video-in/Capture Specification

[O] No additional Video input (capture) specifications have been
defined. !V4L2, as defined in kernel 2.6, may be used.

[O] Proprietary solutions may also be used for video capture and digital
tuners if !V4L2 does not suffice.

[O] DirectFB may be used as a higher level API.

Note: Video output can be seen as an (interlaced) sub-set of graphics.
See graphics specification below for more details.

## Video-out/Graphics Specification

[S] The standard Framebuffer is recommended for use in embedded CE
devices.

[O] DirectFB may also be used in combination with the framebuffer.

Extensions to both are under consideration (see work in progress).

### Graphics formats

[O] The framebuffer supports CLUT, RGB and RGBA packet data formats, but
not YC'***bCr[A].*** Hardware capable of accelerating the display
YC'***bCr[A] packed data may develop*** their own extensions to the
framebuffer for now.

[O] Also, the DirectFB framework which supports these formats may be
used.

### Multi-plane support

[O] Graphics hardware capable of multiple planes may be implemented with
a single or multiple device drivers with one device per plane e.g.
/dev/fb0, /dev/fb1,.../dev/fb5 for a 5 plane capable device. Front-end
based scalers are recommended to use the DirectFB framework.

[O] Back-end scalers may add ioctl's to their framebuffer drivers.

## Work in progress

Both DirectFB and the Framebuffer **can** be extended with YCbCr formats
and multi-plane blending features commonly found in embedded CE devices.
However, it is likely that only one of them will be supported in the
future.

### Framebuffer specification

#### YCbCr Format

##### Resolution Support

The recommended formats are:

-   4:4:4 Equal number of samples of Y, Cb and Cr.
-   4:2:2 Cb/Cr are subsampled by a factor of two horizontally.
-   4:2:0 Cb/Cr are subsampled by a factor of two in both directions.
-   4:1:1 Cb/Cr are subsampled by a factor of four horizontally (used in
    DV).

If any of these formats are used, the CCIR 601 standard must be used. It
defines how the data is interleaved and the relative positions of the
Cb/Cr samples in relation to the Y samples.

##### Memory representation

YCbCr may be stored in e.g a framebuffer in various ways:

-   packed YC'***bCrA 4:4:4 : 32-bit unit containing one pixel with
    alpha***
-   packed YC'***bCr 4:2:2 : 16-bit unit, two successive units contain
    two horizontally adjacent pixels, no alpha***
-   planar YC'***bCr[A] 4:2:2 : three [four] arrays, one for each
    component***
-   semi-planar YC'***bCr 4:2:2 : two arrays, one with all Ys, one with
    Cb and Cr.***
-   planar YC'***bCr[A] 4:2:0 : three [four] arrays, one for each
    component***
-   semi-planar YC'***bCr 4:2:0 : two arrays, one with all Ys, one with
    U and Vs***

Following CCIR601, only the packed formats are recommended, with the
possible exception of a separate alpha plane in some cases (see ARIB
[O6] proposal).

#### Font rendering

-   freetype [O5]

#### Basic 2D acceleration

-   lines (horz./vert. vs. anti-aliased lines)
-   rectangles (fill and copy)
-   pixmaps (bitblt, scaling)

#### Video format control

-   resolution
-   interlaced/progressive

#### Multi-plane support

-   Each plane is represented by... [/dev/fb0, /dev/fb1,...]
-   Additional API (ioctl) calls... [display order, placement,
    scaling,...]

#### DirectFB specification

[DirectFB
overview](http://www.directfb.org/documentation/DirectFB_overview_V0.2.pdf)
[G2] provides a list of currently supported features, summarized below.

#### Important Terminology

Surface
Memory region physically reserved for rendering pixels. Surfaces are
used for regular rendering of pixels, sprites and so on.

Sub-surface
Sub-region of surface. No physical memory allocated.

Primary Surface
Visible screen in full screen mode.

Layer
Each layer is different video memory. They are alpha-blended and
displayed.

Window/Windowstack
Each layer may have multiple window. Windowstack is a stack of windows.
Each window has surface. Their locations and orders may be changed.

#### YCbCr Format

##### Resolution Support

Supported formats are:

-   4:2:2 Cb/Cr are subsampled by a factor of two horizontally.
-   4:2:0 Cb/Cr are subsampled by a factor of two in both directions.

##### Memory representation

-   packed YCbCr 4:2:2 : 16-bit unit, two successive units contain two
    horizontally adjacent pixels, no alpha
-   planar YCbCr 4:2:0 : three arrays, one for each component

##### Font rendering

-   DirectFB bitmap font
-   !TrueType (using !FreeType2)
-   No bold or italics support other than by specifying a different
    typeface from the same font family. For example, 'Times New Roman
    Regular' and 'Times New Roman Italic' correspond to two different
    faces.

#### Basic 2D acceleration

-   lines (anti-aliased)
-   rectangles (fill and copy)
-   triangle (fill and copy)
-   pixmaps (bitblt, scaling)
-   Per-pixel alpha blending (a.k.a. texture alpha)
-   Per-plane alpha blending (a.k.a. alpha modulation)
-   Colorizing (a.k.a. color modulation)
-   Source and destination color keying

#### Video format control

-   resolution
-   interlaced/progressive support

#### Multi-plane support

-   DirectFB layers (not surfaces) support the concept of planes.
-   Layer API is provided through IDirectFBD'***isplayLayer
    Interface.***
-   Opacity is available through
    IDirectFBD'***isplayLayer::!SetOpacity.***
-   IDirectFBD'***isplayLayer::!SetScreenLocation() controls scaling of
    the plane. Back-End Scaler(BES) is used, for instance for Matrox. It
    requires hardware support.***
-   Explicit Front-End Scaler(FES) is not available. Thus, stretched
    blit to the primary surface should be used.
-   To execute a specific graphics operation (e.g. blitting of a
    surface), the DirectFB driver will access the memory mapped io ports
    of the graphics hardware to submit the command to the acceleration
    engine (actual hardware acceleration is done entirely from user
    space).

#### GFX Card Driver

-   DirectFB abstracts the video driver through GFX driver.
-   Graphic operation is executed through IDirectFBSurface interface.
    The interface calls appropriate callback routine in gfxcard
    driver(src/core/gfxcard.c). The callback routine decides whether the
    video device has hardware acceleration capability or not, and
    invokes appropriate functions.
-   The following is the model used in the core gfxcard driver.
    Blit, !DrawLine,

DrawRect and similar operations are implemented in this way:

    void dfb_gfxcard_OPERATION()
    {
        bool hw == false;
        lock();
        /* check if acceleration is available, and then acquire  */
        if (hardware_accel_available(OPERATION) && hardware_accel_acquire(OPERATION)) {
            hw == card->funcs.OPERATION();
        }
        /* if hardware acceleration is not available */
        if (!hw) {
            gAcquire();
            gOPERATION();
            gRelease();
        }
        unlock();
    }

#### DirectFb benchmarks

You can refer 'DirectFB' benchmark on various environment from Benchmark
section of [Evaluate Direct Fb Task
Page](http://eLinux.org/index.php?title=Evaluate_Direct_Fb_Task_Page&action=edit&redlink=1 "Evaluate Direct Fb Task Page (page does not exist)")

## References

G - Graphics/Video out: 1 Framebuffer -
[http://www.kernel.org/](http://www.kernel.org/) (1) KD26/fb -
[http://linuxconsole.sourceforge.net/fbdev/HOWTO/](http://linuxconsole.sourceforge.net/fbdev/HOWTO/)
-
[http://www.tldp.org/HOWTO/Framebuffer-HOWTO.html](http://www.tldp.org/HOWTO/Framebuffer-HOWTO.html)
2 DirectFB (uses 1) -
[http://www.directfb.org/](http://www.directfb.org/) -
[http://www.directfb.org/documentation/DirectFB\_overview\_V0.2.pdf](http://www.directfb.org/documentation/DirectFB_overview_V0.2.pdf)
3 NanoX - [http://www.microwindows.org/](http://www.microwindows.org/) 4
SDL - [http://www.libsdl.org/](http://www.libsdl.org/) 5 Gstreamer -
[http://www.gstreamer.net/](http://www.gstreamer.net/) 6 OpenGL (OpenML)
- [http://www.opengl.org/](http://www.opengl.org/) -
[http://www.khronos.org/opengles/](http://www.khronos.org/opengles/)

V – Video in: 1 V4L[2] -
[http://www.kernel.org/](http://www.kernel.org/) (1) KD26/video4linux -
[http://bytesex.org/v4l/](http://bytesex.org/v4l/) 2 OpenML -
[http://www.khronos.org/openml/](http://www.khronos.org/openml/) 3
LinuxTV (DVB API) - [http://www.linuxtv.org](http://www.linuxtv.org)

A – Audio in/out: 1 OSS -
[http://www.kernel.org/](http://www.kernel.org/) (1) KD26/sound/oss -
[http://www.4front-tech.com/opensound.html](http://www.4front-tech.com/opensound.html)
2 ALSA - [http://www.kernel.org/](http://www.kernel.org/) (1)
KD26/sound/alsa -
[http://www.alsa-project.org](http://www.alsa-project.org) 3 OpenAL -
[http://www.openal.org/](http://www.openal.org/)

U – Users of AVG: 1 V'***ideoLan*** -
[http://www.videolan.org](http://www.videolan.org) 2 Freevo -
[http://freevo.sourceforge.net](http://freevo.sourceforge.net) 3 LinuxTV
- [http://www.linuxtv.org/](http://www.linuxtv.org/) 4 MythTV -
[http://www.mythtv.org/](http://www.mythtv.org/) 5 DVR -
[http://dvr.sourceforge.net/html/main.html](http://dvr.sourceforge.net/html/main.html)
6 OpenPVR -
[http://www.funktronics.ca/openpvr/](http://www.funktronics.ca/openpvr/)
-
[http://sourceforge.net/projects/openpvr/](http://sourceforge.net/projects/openpvr/)

O – Other: 1 TV Linux Alliance -
[http://www.tvlinuxalliance.com/](http://www.tvlinuxalliance.com/) 2 TV
Anytime - [http://www.tv-anytime.org/](http://www.tv-anytime.org/) 3
Digital Home Working Group -
[http://www.dhwg.org/](http://www.dhwg.org/) 4 B'***ootSplash*** -
[http://www.BootSplash.org/](http://www.BootSplash.org/) 5
F'***reeType*** -
[http://freetype.sourceforge.net/freetype2/](http://freetype.sourceforge.net/freetype2/)
6 ARIB architecture -
[http://www.arib.or.jp/english/html/overview/ov/std\_b24.html](http://www.arib.or.jp/english/html/overview/ov/std_b24.html)

Note (1) - KD26 refers to the [Linux 2.6.X
kernel](http://www.kernel.org/pub/linux/kernel/v2.6/) tree, which has a
"Documentation" sub-directory.

## Remaining Issues

See Work in progress.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Multimedia](http://eLinux.org/Category:Multimedia "Category:Multimedia")

