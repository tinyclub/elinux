> From: [eLinux.org](http://eLinux.org/Porting_DirectFB "http://eLinux.org/Porting_DirectFB")


# Porting DirectFB



## Contents

-   [1 DirectFB porting to RTS7751R2D (SH-4/SM501)
    platform](#directfb-porting-to-rts7751r2d-sh-4-sm501-platform)
    -   [1.1 Development Environment](#development-environment)
        -   [1.1.1 SH-4 target platform
            environment](#sh-4-target-platform-environment)
    -   [1.2 x86 host machine
        environment](#x86-host-machine-environment)
-   [2 Install DirectFB](#install-directfb)
    -   [2.1 Prepare libraries used in
        DirectFB](#prepare-libraries-used-in-directfb)
    -   [2.2 Prepare Demo software](#prepare-demo-software)
    -   [2.3 Install Demo program](#install-demo-program)
    -   [2.4 Benchmark program](#benchmark-program)
    -   [2.5 Cross compiling](#cross-compiling)
-   [3 Writing DirectFB driver](#writing-directfb-driver)
    -   [3.1 Graphics driver detection
        procedure](#graphics-driver-detection-procedure)
    -   [3.2 Enabling hardware graphics acceleration
        capability](#enabling-hardware-graphics-acceleration-capability)
-   [4 SM501 driver development](#sm501-driver-development)
    -   [4.1 reference driver](#reference-driver)
    -   [4.2 Drawing API prepared for
        SM501](#drawing-api-prepared-for-sm501)
-   [5 DirectFB porting notes](#directfb-porting-notes)
    -   [5.1 Reference](#reference)
-   [6 Resources](#resources)
    -   [6.1 logs](#logs)
    -   [6.2 source archives](#source-archives)
    -   [6.3 patches](#patches)
    -   [6.4 kernel, root\-fs](#kernel-root-fs)

## DirectFB porting to RTS7751R2D (SH-4/SM501) platform

### Development Environment

#### SH-4 target platform environment

<table border="1" cellpadding="5" cellspacing="0" align="center">
<tr>
<td style="background:#d0a0a0;"><b>Item</b>
</td>
<th style="background:#d0a0a0;"><b>Element</b>
</th>
<th style="background:#d0a0a0;"><b>Resources</b>
</th></tr>
<tr>
<td rowspan="2">Hardware</td>
<td> Renesas `RTS7751R2D` (Renesas SH-4 processor board)</td>
<td rowspan="2"><a href="http://eLinux.org/RTS7751R2D_Handling_Manual" title="RTS7751R2D Handling Manual">RTS7751R2D Handling Manual</a>
</td></tr>
<tr>
<td> Silicon Motion Inc SM501 (Renesas platform on board graphics)
</td></tr>
<tr>
<td rowspan="7">Software</td>
<td> kernel   = CE-LINUX-2.4.20</td>
<td rowspan="2"><a href="http://eLinux.org/Tool_Chain" title="Tool Chain"> Tool Chains</a>
</td></tr>
<tr>
<td> loader   = SH-LILO
</td></tr>
<tr>
<td> <a href="../../.././dev_portals/Multimedia/DirectFB/DirectFB.md" title="DirectFB">DirectFB</a> = DirectFB-0.9.20 </td>
<td><a rel="nofollow" class="external free" href="http://www.directfb.org/download/DirectFB/DirectFB-0.9.20.tar.gz">http://www.directfb.org/download/DirectFB/DirectFB-0.9.20.tar.gz</a>
</td></tr>
<tr>
<td> freetype = freetype-2.1.3 </td>
<td> <a rel="nofollow" class="external free" href="http://heanet.dl.sourceforge.net/sourceforge/freetype/freetype-2.1.3.tar.gz">http://heanet.dl.sourceforge.net/sourceforge/freetype/freetype-2.1.3.tar.gz</a>
</td></tr>
<tr>
<td> libjpeg  = jpeg-6b </td>
<td><a rel="nofollow" class="external free" href="ftp://ftp.uu.net/graphics/jpeg/jpegsrc.v6b.tar.gz">ftp://ftp.uu.net/graphics/jpeg/jpegsrc.v6b.tar.gz</a>
</td></tr>
<tr>
<td> libpng   = png-1.2.2 </td>
<td> <a rel="nofollow" class="external free" href="http://keihanna.dl.sourceforge.net/sourceforge/libpng/libpng-1.2.2.tar.gz">http://keihanna.dl.sourceforge.net/sourceforge/libpng/libpng-1.2.2.tar.gz</a>
</td></tr>
<tr>
<td> zlib     = zlib-1.1.4 </td>
<td> <a rel="nofollow" class="external free" href="http://www.zlib.net/zlib-1.1.4.tar.gz">http://www.zlib.net/zlib-1.1.4.tar.gz</a>
</td></tr></table>

### x86 host machine environment

<table border="1" cellpadding="5" cellspacing="0" align="center">
<tr>
<td style="background:#d0a0a0;"><b>Item</b>
</td>
<th style="background:#d0a0a0;"><b>Element</b>
</th>
<th style="background:#d0a0a0;"><b>Resources</b>
</th></tr>
<tr>
<td>OS</td>
<td> Linux ( Redhat 7.3 ) </td>
<td><a rel="nofollow" class="external autonumber" href="http://ftp.redhat.com/pub/redhat/linux/7.3/">[1]</a>
</td></tr>
<tr>
<td>host  compiler	</td>
<td> gcc 2.9.6 </td>
<td><a rel="nofollow" class="external autonumber" href="http://www.gnu.org/software/gcc/">[2]</a>
</td></tr>
<tr>
<td>cross compiler	</td>
<td> gcc 3.2.3 ( CELF sh-4 compiler posted by Lineo Solutions )</td>
<td><a href="http://eLinux.org/Tool_Chain" title="Tool Chain">Tool Chains</a>
</td></tr></table>


## Install DirectFB

### Prepare libraries used in DirectFB

-   Extract each source code
-   Set environment variables for cross compile

<!-- -->

    CC  = /usr/local/bin/sh4-linux-gcc
    CPP = /usr/local/bin/sh4-linux-cpp
    CXX = /usr/local/bin/sh4-linux-g++

-   create libjpeg

<!-- -->

    modify configure file for cross compile
    line 548 : change "gcc" to "sh4-linux-gcc"

    # ./configure --enable-shared
    # make
    # cp .libs/libjpeg.so* /usr/local/sh4-linux/lib

-   create zlib

<!-- -->

    # ./configure --shared
    modify Makefile for cross compile
    line 24 : LDSHARED=/usr/local/bin/sh4-linux-gcc -shared -Wl,-soname,libz.so.1
    line 28 : LIBS=libz.so.1.1.4
    # make
    # cp libz* /usr/local/sh4-linux/lib

-   create libpng

<!-- -->

    # cp scripts/makefile.linux Makefile
    modify Makefile for cross compile
    line 11 : change "gcc" to "sh4-linux-gcc"
    # make
    # cp libpng12.so* /usr/local/sh4-linux/lib

-   create freetype

<!-- -->

    # ./configure --host=sh4-linux
    # make
    # cp objs/.libs/libfreetype.so* /usr/local/sh4-linux/lib
    # cp -r include/* /usr/local/sh4-linux/include

-   Cross Compile DirectFB for SH-4

<!-- -->

    adopt patch upon DirectFb source directory
    # gzip -d -c DirectFB-0.9.20-ftpath.patch.gz | patch -p0
    # ./configure --host=sh4-linux \
    #             --disable-sdl \
    #             --with-ftpath=/usr/local/sh4-linux
    #         --with-gfxdrivers=sm501
    # make

    If error occurs modify interfaces/IDirectFBFont/Makefile
    line 86 : remove "-lfreetype"

-   We use CELF SH-4 root\_fs image posted by Lineo Solutions.
-   We expect this root\_fs is already bootable.
-   We expect root\_fs is mounted on /mnt.
-   We add /usr/local/lib?/usr/lib to /etc/ld.so.conf
-   Prepare directory for DirectFB installation

<!-- -->

    # mkdir /usr/lib
    # mkdir /usr/local/share
    # mkdir /usr/local/share/directfb-examples
    # mkdir /usr/local/lib/
    # mkdir /usr/local/lib/directfb-0.9.20
    # mkdir /usr/local/lib/directfb-0.9.20/gfxdrivers
    # mkdir /usr/local/lib/directfb-0.9.20/inputdrivers
    # mkdir /usr/local/lib/directfb-0.9.20/interfaces
    # mkdir /usr/local/lib/directfb-0.9.20/interfaces/IDirectFBFont
    # mkdir /usr/local/lib/directfb-0.9.20/interfaces/IDirectFBImageProvider
    # mkdir /usr/local/lib/directfb-0.9.20/interfaces/IDirectFBVideoProvider
    # mkdir /usr/local/lib/directfb-0.9.20/systems

-   copy libjpeg

<!-- -->

    move to libjpeg's directory
    # cp .libs/libjpeg.so* /mnt/usr/lib

-   copy zlib

<!-- -->

    move to zlib's directory
    # cp libz.so* /mnt/usr/lib

-   copy libpng

<!-- -->

    move to libpng's directory
    # cp libpng12.so /mnt/usr/lib/libpng.so
    # cp libpng12.so.0 /mnt/usr/lib/libpng.so.0
    # cp libpng12.so.0.1.2.2 /mnt/usr/lib/libpng.so.0.1.2.2

-   copy freetype

<!-- -->

    move to freetype's directory
    # cp objs/.libs/libfreetype.so* /mnt/usr/lib

-   copy DirectFB

<!-- -->

    move to DirectFB's directory
    # cp src/.libs/libdirectfb.so /mnt/usr/lib
    # cp src/.libs/libdirectfb-0.9.so* /mnt/usr/lib
    # cp gfxdrivers/sm501/.libs/libdirectfb_sm501.so /mnt/usr/local/lib/directfb-0.9.20/gfxdrivers
    # cp inputdrivers/joystick/.libs/libdirectfb_joystick.so /mnt/usr/local/lib/directfb-0.9.20/inputdrivers
    # cp inputdrivers/keyboard/.libs/libdirectfb_keyboard.so /mnt/usr/local/lib/directfb-0.9.20/inputdrivers
    # cp inputdrivers/ps2mouse/.libs/libdirectfb_ps2mouse.so /mnt/usr/local/lib/directfb-0.9.20/inputdrivers
    # cp inputdrivers/serialmouse/.libs/libdirectfb_serialmouse.so /mnt/usr/local/lib/directfb-0.9.20/inputdrivers
    # cp inputdrivers/sonypi/.libs/libdirectfb_sonypi.so /mnt/usr/local/lib/directfb-0.9.20/inputdrivers
    # cp interfaces/IDirectFBFont/.libs/libidirectfbfont_*.so /mnt/usr/local/lib/directfb-0.9.20/interfaces/IDirectFBFont
    # cp interfaces/IDirectFBImageProvider/.libs/libidirectfbimageprovider_*.so /mnt/usr/local/lib/directfb-0.9.20/interfaces/IDirectFBImageProvider
    # cp interfaces/IDirectFBVideoProvider/.libs/libidirectfbvideoprovider_*.so /mnt/usr/local/lib/directfb-0.9.20/interfaces/IDirectFBVideoProvider

### Prepare Demo software

Through previous steps, you have installed DirectFB to SH-4 Linux
environment. To confirm everything created and installed properly use
DirectFB demo program. You can download these demo program from DirectFB
project website, that name is "DirectFB-examples". We used version
0.9.18. You can download from following Web site.

[DirectFB-examples](http://www.directfb.org/downloads/Old/DirectFB-examples-0.9.18.tar.gz)
used in this tutorial.

As we faced some problem compiling these demo program for SH-4 Linux, we
installed to x86 Linux first, then retarget to SH-4 Linux using
following step.

    Modify Makefile in src directry as
        "CC = gcc" to "CC = sh4-linux-gcc"
        "LIBADDS = -L/usr/local/lib -ldirectfb -lpthread -ldl" to
        "LIBADDS = -L/usr/local/sh4-linux/lib -ldirectfb -lpthread -ldl"
    Adopt same modification to each Makefile in src/df_knuckles?src/df_neo?src/spacedream

Do make in src directory ( If you do make at the upper directory, it
seems not works correctly )

### Install Demo program

Now demo program binary images was generated in src directory, you can
copy manually these binary to target root\_fs's your preferred location.
Then copy all data file located under data directory to
/usr/local/share/directfb-examples It seems you do not maintain/modift
these file (just copy) except Makefile.

### Benchmark program

Demo program named df\_dok is DirectFB benchmark. If you run this
without any options, it automatically runs set of benchmark program
using graphics acceleration capability, and display result as graph. We
use this benchmark score to tune DirectFB library for SM501.

### Cross compiling

Like other Linux application program, DirectFB is designed to compile
only on x86 Linux. We struggled this time to compile DirectFB for SH-4
Linux and finally we success this cross porting. However we think this
is a kind of handwork way. When you try to run demo program on non-x86
Linux, x86 reference looks mandatory. I suggest you start DirectFB
implementation from x86 Linux.

## Writing DirectFB driver

### Graphics driver detection procedure

Graphics chip drivers are located under
/usr/local/lib/directfb-0.9.20/gfxdrivers There is no special
installation procedure to add your own driver. DirectFB checks all
drivers in driver\_probe routine. When DirectFB detect correct driver in
this process, DirectFB enables this driver. If driver does not works
then move to next driver check, if all drivers does not much, DirectFB
runs software mode without dedicated graphics driver. We have
tentatively modified this process force to use SM501 driver.

### Enabling hardware graphics acceleration capability

Drawing routine set command parameters to use 2D acceleration
capability. Graphic driver returns TRUE or FALSE as return-value. If
FALSE returned, DirectFB thinks hardware acceleration does not built-in,
and use whole software drawing. Not all drawing routine has this
acceleration detection mechanism, it is sure to define in \`CheckState\`
routine. You can write your own driver as you like except command
parameters and return value.

## SM501 driver development

### reference driver

We use i810 graphics driver as a reference, because it is small and
looks easy to implement. Finally we need to refer other drivers because
i810 has limited numbers of draw routine. If you want to support full
drawing capabilities, Matrox driver may be better reference.

### Drawing API prepared for SM501

<table>
<thead>
<tr class="header">
<th align="left"><strong>API</strong></th>
<th align="left"><strong>Operations</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">`sm501_set_src`</td>
<td align="left">Set source address for BLIT operation. You need to assign VRAM physical address to source address.</td>
</tr>
<tr class="even">
<td align="left">`sm501_set_dest`</td>
<td align="left">Set destination physical address and color depth for BLIT and drawing operation.</td>
</tr>
<tr class="odd">
<td align="left">`sm501_set_colorkey`</td>
<td align="left">colorkey setting, it defines transparent color for colorkeyed BLIT operation. Color compare regiser is used in SM501 to enable this operation. You can define transparent color to the SM501 color compare register, then SM501 does not transfer this color when doing BLIT operation. So it looks transparent.</td>
</tr>
<tr class="even">
<td align="left">`sm501_set_color`</td>
<td align="left">Define drawing color setting</td>
</tr>
<tr class="odd">
<td align="left">`sm501_set_clip`</td>
<td align="left">Save clipping coordinates value to the structure, and set SM501 clipping register as well</td>
</tr>
<tr class="even">
<td align="left">`sm501CheckState`</td>
<td align="left">This bit returns hardware acceleration capability. You need to refer each graphics spec, and you also care for color format that graphics supports</td>
</tr>
<tr class="odd">
<td align="left">`sm501SetState`</td>
<td align="left">Do pre-process for acceleration</td>
</tr>
<tr class="even">
<td align="left">`sm501FillRectangle`</td>
<td align="left">Do fill rectangle, using SM501 2D drawing engine</td>
</tr>
<tr class="odd">
<td align="left">`sm501DrawRectangle`</td>
<td align="left">Draw rectangles. SM501 does not have rectangle drawing capability, so draw four lines to draw rectangle in this driver</td>
</tr>
<tr class="even">
<td align="left">`sm501Blit`</td>
<td align="left">Do BLIT operation, using SM501 2D drawing engine</td>
</tr>
<tr class="odd">
<td align="left">`sm501StretchBlit`</td>
<td align="left">Do Stretch BLIT To avoid SM501 2D engine stretch function limitation, we use CSC (color space conversion) function instead. Colorkeyed stretch BLIT can not be support in this driver.</td>
</tr>
<tr class="even">
<td align="left">`sm501DrawLine`</td>
<td align="left">Draw line, using SM501 2D drawing engine. Use shortstroke command for simple vertical / holizontal line,and use line command for other kind of line.</td>
</tr>
<tr class="odd">
<td align="left">`sm501fill_tri`</td>
<td align="left">Draw triangle with filling inside. As SM501 does not have hardware triangle drawing capability,we draw triangle by software. However we can use horizontal line draw capability in SM501, so seems to achieved a little better performance than all software drawing.</td>
</tr>
<tr class="even">
<td align="left">`sm501FillTriangle`</td>
<td align="left">Fill triangle, actual operation execute in subroutine sm501fill_tri</td>
</tr>
<tr class="odd">
<td align="left">`driver_get_abi_version`</td>
<td align="left">Returns version information</td>
</tr>
<tr class="even">
<td align="left">`driver_probe`</td>
<td align="left">This should return check result of expected graphics chip is exist or not. At this moment, this driver retunes always TRUE (=SM501 exist)</td>
</tr>
<tr class="odd">
<td align="left">`driver_get_info`</td>
<td align="left">Returns driver's information</td>
</tr>
<tr class="even">
<td align="left">`sm501_release_resource`</td>
<td align="left">Do close operation</td>
</tr>
<tr class="odd">
<td align="left">`driver_init_driver`</td>
<td align="left">Initialize SM501 2D engine and create function table</td>
</tr>
<tr class="even">
<td align="left">`driver_init_device`</td>
<td align="left">Initialize device structure</td>
</tr>
<tr class="odd">
<td align="left">`driver_close_device`</td>
<td align="left">Do nothing at this moment</td>
</tr>
<tr class="even">
<td align="left">`driver_close_driver`</td>
<td align="left">Do nothing at this moment</td>
</tr>
</tbody>
</table>



## DirectFB porting notes

DirectFB requires display resolution capability built in frame buffer
driver. So initially we modify SM501 generic frame buffer driver to
support resolution and color depth setting. We did not care for
pixel\_clock, left/right margin and vertical/horizontal sync, because
DirectFB does not works when frame buffer drivers return FALSE to these
parameter. It looks no problem using without these parameters.

Initially we modify reference gfxdriver (=i810) source code so that SH-4
gcc compiler can compile properly. Actually we maintain filename,
display character and source code comment to fit SM501. And commented
out driver code that operate 2D graphics engine. After you compile SM501
driver, copy it to the proper location so that DirectFB can load this
new driver. If DirectFB boot message does not comes driver location
missing nor driver\_probe process returns error.

Then merge 2D engine sample program that works. In SM501 initialization
call 2D engine initialization and modify simple graphics API like line.
You need to activate bit in \`CheckState\`, that has hardware
acceleration in SM501. Remove unused program in driver\_init\_driver, to
eliminate unexpected initialization.

Once SM501 hardware acceleration works, replace other drawing API. If
SM501 command support DirectFB drawing API, just use SM501 command. If
SM501 does not support it, you need to find out alternative way to
implement this API. If your reference driver does not support required
API, you need to refer other graphics driver and you need to add this
function by yourself.

If you added new hardware drawing API, you need to enable bit in
\`CheckState\` and need to maintain function table list. Due to the
limitations of graphics controller if some hardware acceleration can not
be used, you need to disable corresponded bit in \`CheckState\`. For
example SM501 can not handle ARGB format. If BLIT source format does not
much target format, SM501 can not use hardware BLIT capability. In such
case you need to disable bit in \`CheckState\`.

To achieve better performance, we modify to use /dev/mem access instead
of usual ioctl call, that was originally used in reference driver. After
we maintained to read/write 2D engine register directly use /dev/mem,
drawing performance increased dramatically especially \`FillRect\` type
simple parameter command.

Finally we removed un-used function built in reference driver. For
example i810 driver include UMA setting. PCI initialization does not
need when SM501 connect to SH-4 using SH-BUS. So we remove these
portion.

### Reference

Unfortunately we can not find any useful information to DirectFB port to
SH-4 Linux. So we do it using step-by-step way using printk(). For 2D
acceleration portion, sample program and device document were helpful.
But sometime it is difficult to understand actual drawing limitations.
So x86 DirectFB is mandatory as a reference when you port DirectFB to
the Linux runs on embedded CPU like SH-4.

## Resources

You can download original source, patches and pre-compiled DirectFB
program for \`RTS7751R2D\` platform

### logs

-   DirectFB configure logs
    [conf\_log](http://eLinux.org/images/7/75/Conf_log.txt "Conf log.txt")
-   DirectFB make logs
    [make\_log](http://eLinux.org/images/2/26/Make_log.txt "Make log.txt")

### source archives

NOTE: The versions listed below are very old. Newer versions are
recommended.

-   DirectFB
    [DirectFB-0.9.20.tar.gz](http://eLinux.org/images/5/52/DirectFB-0.9.20.tar.gz "DirectFB-0.9.20.tar.gz")
    (1277kB)
-   Freetype
    [freetype-2.1.3.tar.gz](http://eLinux.org/images/7/72/Freetype-2.1.3.tar.gz "Freetype-2.1.3.tar.gz")
    (1021kB)
-   libjpeg
    [jpegsrc.v6b.tar.gz](http://eLinux.org/images/f/f6/Jpegsrc.v6b.tar.gz "Jpegsrc.v6b.tar.gz")
    (599kB)
-   libpng
    [libpng-1.2.2.tar.gz](http://eLinux.org/images/4/43/Libpng-1.2.2.tar.gz "Libpng-1.2.2.tar.gz")
    (488kB)
-   zlib
    [zlib-1.1.4.tar.gz](http://eLinux.org/images/b/ba/Zlib-1.1.4.tar.gz "Zlib-1.1.4.tar.gz")
    (177kB)

### patches

-   DirectFB SM501 patches
    [DirectFB-0.9.20-sh4-sm501.patch.tar.gz](http://eLinux.org/images/b/bb/DirectFB-0.9.20-sh4-sm501.patch.tar.gz "DirectFB-0.9.20-sh4-sm501.patch.tar.gz")
    (21kB)

### kernel, root\_fs

-   CELF kernel Media:celinux.tgz | celinux.tgz (42MB) - NOTE that this
    file is too large to upload. See the old [CELF
    Wiki](http://tree.celinuxforum.org/CelfPubWiki/FrontPage) and search
    for celinux.tgz or email the admin.
-   root\_fs for \`RTS7751R2D\` platform Media:rootfs.tgz | rootfs.tgz
    (36MB) NOTE that this file is too large to upload. See the old [CELF
    Wiki](http://tree.celinuxforum.org/CelfPubWiki/FrontPage) and search
    for rootfs.tgz


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DirectFB](http://eLinux.org/Category:DirectFB "Category:DirectFB")
-   [Multimedia](http://eLinux.org/Category:Multimedia "Category:Multimedia")
-   [SuperH](http://eLinux.org/Category:SuperH "Category:SuperH")

