> From: [eLinux.org](http://eLinux.org/RPi_VideoCore_APIs "http://eLinux.org/RPi_VideoCore_APIs")


# Raspberry Pi VideoCore APIs


(Redirected from [RPi VideoCore
APIs](http://eLinux.org/index.php?title=RPi_VideoCore_APIs&redirect=no "RPi VideoCore APIs"))


<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Contents</h2>
<ul>
<li><a href="#Quirks">1 Quirks</a></li>
<li><a href="#Built-in_Sample_Programs">2 Built-in Sample Programs</a>
<ul>
<li><a href="#hello_encode">2.1 hello_encode</a></li>
<li><a href="#hello_video">2.2 hello_video</a></li>
<li><a href="#hello_audio">2.3 hello_audio</a></li>
<li><a href="#hello_triangle">2.4 hello_triangle</a></li>
<li><a href="#ilclient_helper_library">2.5 ilclient helper library</a></li>
</ul></li>
<li><a href="#Libraries">3 Libraries</a>
<ul>
<li><a href="#libbcm_host">3.1 libbcm_host</a></li>
<li><a href="#vc_dispmanx_.2A">3.2 vc_dispmanx_*</a></li>
<li><a href="#vc_tvservice_.2A">3.3 vc_tvservice_*</a>
<ul>
<li><a href="#Samples">3.3.1 Samples</a></li>
</ul></li>
<li><a href="#vc_cec_.2A">3.4 vc_cec_*</a></li>
<li><a href="#vc_gencmd_.2A">3.5 vc_gencmd_*</a></li>
<li><a href="#EGL">3.6 EGL</a>
<ul>
<li><a href="#Samples_2">3.6.1 Samples</a></li>
<li><a href="#Function_Documentation">3.6.2 Function Documentation</a>
<ul>
<li><a href="#int32_t_graphics_get_display_size.28_const_uint16_t_display_number.2C_uint32_t_.2Awidth.2C_uint32_t_.2Aheight.29.3B">3.6.2.1 int32_t graphics_get_display_size( const uint16_t display_number, uint32_t *width, uint32_t *height);</a></li>
</ul></li>
</ul></li>
<li><a href="#OpenGL_ES">3.7 OpenGL ES</a></li>
<li><a href="#OpenVG">3.8 OpenVG</a>
<ul>
<li><a href="#Samples_3">3.8.1 Samples</a></li>
</ul></li>
<li><a href="#OpenMAX">3.9 OpenMAX</a></li>
</ul></li>
<li><a href="#Bindings_for_Other_Programming_Languages">4 Bindings for Other Programming Languages</a></li>
<li><a href="#Open_Source_Software_compatible_with_the_VideoCore_APIs">5 Open Source Software compatible with the VideoCore APIs</a></li>
<li><a href="#References">6 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Back to the [Hub](http://eLinux.org/R-Pi_Hub "R-Pi Hub").


 **Software & Distributions:**

*[Software](http://eLinux.org/RPi_Software "RPi Software") - an overview.*

*[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") - operating
systems and development environments for the Raspberry Pi.*

*[Kernel Compilation](http://eLinux.org/RPi_Kernel_Compilation "RPi Kernel Compilation")
- advice on compiling a kernel.*

*[Performance](http://eLinux.org/RPi_Performance "RPi Performance") - measures of the
Raspberry Pi's performance.*

*[Programming](http://eLinux.org/RPi_Programming "RPi Programming") - programming
languages that might be used on the Raspberry Pi.*

[![](http://eLinux.org/images/thumb/a/a2/VideoCore-Architecture-and-Source.png/500px-VideoCore-Architecture-and-Source.png)](http://eLinux.org/File:VideoCore-Architecture-and-Source.png)

[](http://eLinux.org/File:VideoCore-Architecture-and-Source.png "Enlarge")

Source:
[http://www.raspberrypi.org/wp-content/uploads/2012/10/Architecture-and-Source.png](http://www.raspberrypi.org/wp-content/uploads/2012/10/Architecture-and-Source.png)

The Raspberry Pi contains a Broadcom
[VideoCore](http://en.wikipedia.org/wiki/Videocore) IV GPU providing
OpenGL ES 1.1, OpenGL ES 2.0, hardware-accelerated OpenVG 1.1, Open EGL,
OpenMAX and 1080p30 H.264 high-profile decode. There are 24 GFLOPS of
general purpose compute and a bunch of texture filtering and DMA
infrastructure. Eben worked on the architecture team for this and the
Raspberry Pi team are looking at how they can make some of the
proprietary features available to application programmers.

Currently C header files and libraries for many of the Broadcom APIs are
located in `/opt/vc/include` and `/opt/vc/lib` respectively, or
available from [GitHub](https://github.com/raspberrypi/firmware) within
the same directory structure. Some documentation is contained within
comments in the header files, as well as documentation for the OpenMAX
IL components in the [documentation directory on
GitHub](https://github.com/raspberrypi/firmware/tree/master/documentation/ilcomponents),
however it is severely lacking and difficult to understand in a general
sense for people wanting to experiment with the device due to it being
proprietary. As such, we encourage you to [edit this
page](http://elinux.org/index.php?title=RPi_VideoCore_APIs&action=edit)
to help us build much better open documentation.

## Quirks

-   The Raspberry Pi requires that the `bcm_host_init()` function is
    called first before any GPU calls can be made.
-   Before calling any of the vc\_\* functions, you need to initialise
    vcos and vchi, and make a vchi connection, before then calling the
    corresponding vc\_\*\_init function for the part of the library you
    want to use: `vc_vchi_dispmanx_init`, `vc_vchi_tv_init`,
    `vc_vchi_cec_init` or `vc_vchi_gencmd_init`.
    (See this [sample
    code](https://github.com/adammw/rpi-output-swapper/blob/master/video_swap.c#L152-169)
    which does initialisation for vc\_tvservice\_\* APIs)
-   Linking against the EGL library (-lEGL) also requires you to link
    against the GLESv2 library (-lGLESv2).
-   `graphics_get_display_size()` is a Broadcom-specific function.

## Built-in Sample Programs

The Raspberry Pi comes with seven sample programs and two helper
libraries in the /opt/vc/src/hello\_pi directory showing some of the
system's capabilities and sample code.

### hello\_encode

This sample is a GPU-assisted H.264 encoder using the OpenMAX APIs, and
currently works with raw frames. It outputs a raw H.264 file.

### hello\_video

This sample decodes H.264 video using the OpenMAX APIs and the ilclient
library and is distributed with a short scene of [Big Buck
Bunny](http://www.bigbuckbunny.org/)

### hello\_audio

This sample plays a sine wave for ten seconds using the OpenMAX APIs.

### hello\_triangle

This sample shows how to get a OpenGL ES context on the Raspberry Pi.

### ilclient helper library

This library is described as:
`This API defines helper functions for writing IL clients. `

    *
    * This file defines an IL client side library.  This is useful when
    * writing IL clients, since there tends to be much repeated and
    * common code across both single and multiple clients.  This library
    * seeks to remove that common code and abstract some of the
    * interactions with components.  There is a wrapper around a
    * component and tunnel, and some operations can be done on lists of
    * these.  The callbacks from components are handled, and specific
    * events can be checked or waited for.
    */

## Libraries

<table>
<tbody>
<tr class="odd">
<td align="left"><strong>The userland libraries have been <a href="http://www.raspberrypi.org/archives/2221">open-sourced</a> ! Code can be found at <a href="https://github.com/raspberrypi/userland">github.com/raspberrypi/userland</a></strong></td>
</tr>
</tbody>
</table>

### libbcm\_host

bcm\_host is the Broadcom hardware interface library.

### vc\_dispmanx\_\*

Dispmanx is a windowing system in the process of being deprecated in
favour of [OpenWF](http://www.khronos.org/openwf/) (or similar), however
dispmanx is still used in all API demos and it's replacement may not yet
be available. <sup>[[1]](#cite_note-1)</sup>(confirmation required?)

### vc\_tvservice\_\*

These APIs allow controlling the HDMI and SDTV video outputs of the
Raspberry Pi, as well as allowing the user to query the supported HDMI
resolutions and audio formats and turn on/off copy protection. The
Raspberry Pi can only have one output active at a time - turning on the
HDMI automatically turns off the SDTV and vice-versa. However either can
be turned off using the `vc_tv_power_off()` function.

The header file
[vc\_tvservice.h](https://github.com/raspberrypi/firmware/blob/master/opt/vc/include/interface/vmcs_host/vc_tvservice.h)
documents the functions quite well via comments above each prototype
function, however before any of these functions will succeed you must
initialise the connection to the host API like so:

    void tvservice_init() {
       VCHI_INSTANCE_T vchi_instance;
       VCHI_CONNECTION_T *vchi_connections;

       // initialise bcm_host
       bcm_host_init();

       // initialise vcos/vchi
       vcos_init();
       if (vchi_initialise(&vchi_instance) != VCHIQ_SUCCESS) {
           fprintf(stderr, "failed to open vchiq instance\n");
           exit(-2);
       }

       // create a vchi connection
       if ( vchi_connect( NULL, 0, vchi_instance ) != 0) {
           fprintf(stderr, "failed to connect to VCHI\n");
           exit(-3);
       }

       // connect to tvservice
       if ( vc_vchi_tv_init( vchi_instance, &vchi_connections, 1) != 0) {
           fprintf(stderr, "failed to connect to tvservice\n");
           exit(-4);
       }
    }

*TODO: Deinitialization*

#### Samples

-   [rpi-output-swapper](https://github.com/adammw/rpi-output-swapper)
    Uses tvservice apis to power on HDMI or SDTV display in specific or
    preferred mode.

### vc\_cec\_\*

The vc\_cec APIs allow programs to interface with the [Consumer
Electronics Control
(CEC)](http://en.wikipedia.org/wiki/Consumer_Electronics_Control#CEC)
host middleware on the system to send CEC packets, set strings for the
middleware to auto-respond to certain requests or override the
middleware handling by adding custom callbacks.

*TODO: Samples/Howto*

### vc\_gencmd\_\*

*TODO*

### EGL

[EGL (Native Platform Graphics Interface)](http://www.khronos.org/egl/)
is an interface between Khronos rendering APIs such as OpenGL ES or
OpenVG and the underlying native platform. The Raspberry Pi supports
[EGL Version
1.4](http://www.khronos.org/registry/egl/specs/eglspec.1.4.20110406.pdf)
and the following EGL extensions (links are to EGL registry
documentation):<sup>[[2]](#cite_note-egl-info-2)</sup>

-   [EGL\_KHR\_image](http://www.khronos.org/registry/egl/extensions/KHR/EGL_KHR_image.txt)
-   [EGL\_KHR\_image\_base](http://www.khronos.org/registry/egl/extensions/KHR/EGL_KHR_image_base.txt)
-   [EGL\_KHR\_image\_pixmap](http://www.khronos.org/registry/egl/extensions/KHR/EGL_KHR_image_pixmap.txt)
-   [EGL\_KHR\_vg\_parent\_image](http://www.khronos.org/registry/egl/extensions/KHR/EGL_KHR_vg_parent_image.txt)
-   [EGL\_KHR\_gl\_texture\_2D\_image](http://www.khronos.org/registry/egl/extensions/KHR/EGL_KHR_gl_image.txt)
-   [EGL\_KHR\_gl\_texture\_cubemap\_image](http://www.khronos.org/registry/egl/extensions/KHR/EGL_KHR_gl_image.txt)
-   [EGL\_KHR\_lock\_surface](http://www.khronos.org/registry/egl/extensions/KHR/EGL_KHR_lock_surface.txt)


 Creating an on-screen EGL rendering surface requires you to to use the
eglCreateWindowSurface function, which takes a EGLNativeWindowType
parameter. On the Raspberry Pi, this is implemented as a
EGL\_DISPMANX\_WINDOW\_T struct, which is defined in eglplatform.h as:

     typedef struct {
       DISPMANX_ELEMENT_HANDLE_T element;
       int width;   /* This is necessary because dispmanx elements are not queriable. */
       int height;
     } EGL_DISPMANX_WINDOW_T;

Therefore, to create a EGL surface you must also use the Dispmanx
library to get a dispmanx element handle. The [hello\_triangle source
code](https://github.com/raspberrypi/firmware/blob/master/opt/vc/src/hello_pi/hello_triangle/triangle.c#L147-173)
provides example code to do this.

#### Samples

See [Getting Started with
EGL](http://jonmacey.blogspot.com.au/2012/05/getting-started-with-egl-on-raspberry.html)
post by Jon Macey. Extended documentation available in the [EGL Version
1.4
Specification](http://www.khronos.org/registry/egl/specs/eglspec.1.4.20110406.pdf)
and Simple Reference available in the [EGL 1.4 API Quick Reference
Card](http://www.khronos.org/files/egl-1-4-quick-reference-card.pdf).

#### Function Documentation

##### `int32_t graphics_get_display_size( const uint16_t display_number, uint32_t *width, uint32_t *height);`

This function allows you to get the size of the display, and is often
used in creating an EGL Surface. width and height are pointers that you
pass in to where you want the response values to be written to, display
number 0 is usually used for the Raspberry Pi. return value of \>= 0
indicates success, \<0 indicates failure.

This function is implemented in libbcm\_host, and the implementation has
been made
[public](https://github.com/raspberrypi/firmware/issues/14#issuecomment-5652185)
showing that it internally calls the vc\_dispmanx\_display\_get\_info
function to get the width and height of the current mode.

Bugs present in early versions of the firmware caused this function to
always return 1920x1080, however this can easily be fixed by updating
the firmware with [Hexxeh's
rpi-update](https://github.com/Hexxeh/rpi-update) (see the [Updating
firmware](http://eLinux.org/R-Pi_Troubleshooting#Updating_firmware "R-Pi Troubleshooting")
page for
help).<sup>[[3]](#cite_note-3)</sup><sup>[[4]](#cite_note-4)</sup>

### OpenGL ES

The Raspberry Pi supports OpenGL ES 2.0 with the following extensions:
<sup>[[2]](#cite_note-egl-info-2)</sup>

-   GL\_OES\_compressed\_ETC1\_RGB8\_texture
-   GL\_OES\_compressed\_paletted\_texture
-   GL\_OES\_texture\_npot GL\_OES\_depth24
-   GL\_OES\_vertex\_half\_float
-   GL\_OES\_EGL\_image
-   GL\_OES\_EGL\_image\_external
-   GL\_EXT\_discard\_framebuffer
-   GL\_OES\_rgb8\_rgba8
-   GL\_OES\_depth32
-   GL\_OES\_mapbuffer
-   GL\_EXT\_texture\_format\_BGRA8888
-   GL\_APPLE\_rgb\_422
-   GL\_EXT\_debug\_marker

*TODO: Sample of how to use/initalise OpenGL ES*

### OpenVG

The Raspberry Pi supports OpenVG 1.1 for hardware-accelerated
two-dimensional vector and raster graphics. See the full specification
[here](http://www.khronos.org/registry/vg/specs/openvg-1.1.pdf) or [the
API quick reference
card](http://www.khronos.org/files/openvg-quick-reference-card.pdf).

#### Samples

-   [Code sample: Drawing a triangle by using
    OpenVG](http://docs.blackberry.com/en/developers/deliverables/17967/CS_Drawing_a_triangle_using_OpenVG_1241146_11.jsp)
    *(Java implentation for RIM devices, however should be able to get a
    grasp on how it works and be able to port it to the Raspberry Pi)*

### OpenMAX

See
[/documentation/ilcomponents](https://github.com/raspberrypi/firmware/tree/master/documentation/ilcomponents)
on GitHub firmware repository for official documentation.

*TODO: Sample of how to use OpenMAX to decode audio/video/images, etc.*

## Bindings for Other Programming Languages

**Python**

-   [RPi\_Vid\_Core](https://bitbucket.org/bryancole/rpi_vid_core/) -
    *Python bindings of EGL, OpenGL ES, OpenVG and bcm\_host for
    Raspberry Pi implemented using Cython*

**Java**

-   [JogAmp JOGL](http://www.jogamp.org) - *JogAmp JOGL Java bindings
    for EGL and OpenGL ES for Raspberry Pi implemented using Gluegen.*
    -   Raspberry Pi autodetection is included in JogAmp JOGL RC11 and
        later.
        [http://forum.jogamp.org/Release-v2-0-rc11-td4026703.html](http://forum.jogamp.org/Release-v2-0-rc11-td4026703.html)
-   [LWJGL](http://www.lwjgl.org) -
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?p=211087](http://www.raspberrypi.org/phpBB3/viewtopic.php?p=211087)
    Raspberry Pi community port by **spsn**

## Open Source Software compatible with the VideoCore APIs

-   **[omxplayer](https://github.com/huceke/omxplayer)** - *a command
    line a/v player for the Raspberry Pi utilising the OpenMAX APIs and
    ffmpeg*
-   **[XBMC](http://wiki.xbmc.org/index.php?title=Raspberry_Pi)** - *a
    media center, omxplayer's "big brother"*
-   **[piNGL](http://nccastaff.bournemouth.ac.uk/jmacey/GraphicsLib/piNGL/index.html)**
    - *port of the NGL graphics library to Raspberry Pi*
-   **[Qt on Pi](http://qt-project.org/wiki/Qt-RaspberryPi)** -
    *Raspberry Pi port of the Qt toolkit*

## References

1.  [↑](#cite_ref-1)
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?t=5621&p=77981](http://www.raspberrypi.org/phpBB3/viewtopic.php?t=5621&p=77981)
2.  ↑ <sup>[2.0](#cite_ref-egl-info_2-0)</sup>
    <sup>[2.1](#cite_ref-egl-info_2-1)</sup> eglinfo,
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?p=35942\#p35942](http://www.raspberrypi.org/phpBB3/viewtopic.php?p=35942#p35942)
    ,
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?p=36318\#p36318](http://www.raspberrypi.org/phpBB3/viewtopic.php?p=36318#p36318)
3.  [↑](#cite_ref-3)
    [http://www.raspberrypi.org/phpBB3/viewtopic.php?f=68&t=8252](http://www.raspberrypi.org/phpBB3/viewtopic.php?f=68&t=8252)
4.  [↑](#cite_ref-4)
    [https://github.com/raspberrypi/firmware/issues/14](https://github.com/raspberrypi/firmware/issues/14)

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

[Software](http://eLinux.org/RPi_Software "RPi Software") -
[Distributions](http://eLinux.org/RPi_Distributions "RPi Distributions") -
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

