> From: [eLinux.org](http://eLinux.org/User_Interfaces "http://eLinux.org/User_Interfaces")


# User Interfaces



The GUI framework is the software library which allows applications to
put pixels onto the LCD. It handles contention between applications,
deals with windows and usually provides an abstraction away from
pixel-by-pixel drawing through widget libraries.

On a desktop system, this is separated into several components: An
X-server which allows client applications to connect and draw things in
the client's window. Then there are the widget toolkits, where you
generally have a choice between Motif, GTK+, QT or Enlightenment (there
are many others, but these are the more common ones). On an embedded
system, this separation is not always as clear cut.

## Contents

-   [1 Global overviews](#global-overviews)
-   [2 Back Ends](#back-ends)
    -   [2.1 Frame buffer (FBDev)](#frame-buffer-fbdev)
    -   [2.2 DirectFB](#directfb)
    -   [2.3 Nano-X (Formally
        Microwindows)](#nano-x-formally-microwindows)
    -   [2.4 KDrive (formally Micro-x)](#kdrive-formally-micro-x)
    -   [2.5 OpenKODE](#openkode)
-   [3 Widget Toolkits](#widget-toolkits)
    -   [3.1 GTK+](#gtk)
    -   [3.2 QT/Qtopia](#qt-qtopia)
    -   [3.3 Enlightenment](#enlightenment)
    -   [3.4 Quantum Step](#quantum-step)
    -   [3.5 WxEmbedded](#wxembedded)
-   [4 Application Frameworks](#application-frameworks)
    -   [4.1 GTK+ Based Frameworks](#gtk-based-frameworks)
        -   [4.1.1 OpenMoko](#openmoko)
        -   [4.1.2 GPE Palmtop Environment](#gpe-palmtop-environment)
        -   [4.1.3 Hiker (Access Linux
            Platform)](#hiker-access-linux-platform)
        -   [4.1.4 Sato](#sato)
        -   [4.1.5 Hildon (Maemo)](#hildon-maemo)
        -   [4.1.6 Sugar (OLPC)](#sugar-olpc)
    -   [4.2 QT/Qtopia Based Frameworks](#qt-qtopia-based-frameworks)
        -   [4.2.1 Qtopia](#qtopia)
        -   [4.2.2 Open Palmtop Integrated Environment
            (OPIE)](#open-palmtop-integrated-environment-opie)
    -   [4.3 Enlightenment Based
        Frameworks](#enlightenment-based-frameworks)
        -   [4.3.1 Fancypants](#fancypants)
        -   [4.3.2 OpenInkpot](#openinkpot)
        -   [4.3.3 Illume](#illume)
        -   [4.3.4 Guarana](#guarana)
    -   [4.4 Others](#others)
        -   [4.4.1 Disko](#disko)
        -   [4.4.2 Crank Software's Storyboard UI
            Suite](#crank-software-s-storyboard-ui-suite)

## Global overviews

-   LinuxDevices has a more detailed guide to embedded graphics
    [here](http://linuxdevices.com/articles/AT9202043619.html), although
    this is quite old now.
-   Thomas Petazzoni gave a conference giving general information about
    the various graphical libraries available for embedded Linux
    devices, at Embedded Linux Conference Europe 2008.
    [Slides](http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2008Presentations?action=AttachFile&do=get&target=choosing-embedded-graphical-libraries.pdf)
    and
    [video](http://free-electrons.com/pub/video/2008/elce/elce2008-petazzoni-graphical-libraries.ogv)
    are available.

## Back Ends

### Frame buffer (FBDev)

Most Linux systems on embedded devices only provide a frame buffer
device. This allows an application to memory-map the pixels on the
screen and write to them as if it was a regular array. This frame buffer
interface is universal across all architectures and all devices,
allowing applications utilizing the frame buffer to be ported easily.
The disadvantage is that quite often the Application Processor has more
advanced graphics hardware for rendering which is not utilized by the
frame buffer interface. Another disadvantage is when contention for the
frame buffer exists. What happens when two applications want to write to
the framebuffer at once? How do they know not to overwrite each other's
contents?

### DirectFB

[DirectFB](http://www.directfb.org) addresses the issue of not utilising
hardware acceleration by providing applications with a more advanced
programming interface. Common graphics operations such as line drawing,
blit'ing and basic windowing are provided. When the underlying hardware
is able to accelerate these operations, this acceleration is used. When
hardware acceleration is not available, the operation is performed in
software, providing maximum compatibility for applications. While this
is an excellent project, the number of hardware-accelerated devices
supported are small and does not include any CPUs you'd find on a phone.
This may, of course, change in the future. DirectFB also addresses the
contention issue by providing windowing. Applications request a window
from DirectFB, which ensures no applications overwrite each other's
contents (Similar to X).

See [DirectFB](http://eLinux.org/DirectFB "DirectFB") article.

### Nano-X (Formally Microwindows)

An alternative to using a frame buffer device is to use an x server as
you would on a desktop PC. There are many (MANY) applications out there
which use X. The problem with x servers are their footprint. Both memory
and storage requirements of a normal x server are too large for small
embedded systems. To address this, an x-like server has been produced
called [Nano-X](http://www.microwindows.org/). While not conforming to
the X windows API, the API is similar, allowing X windows applications
to be ported. The last item of news on the nano-x site is dated 2005, so
this project may be dead.

### KDrive (formally Micro-x)

Unlike nano-x,
[KDrive](http://www.pps.jussieu.fr/~jch/software/kdrive.html) is a
complete X server and even supports the RENDER X windows extensions.
Although KDrive is a full X Server, it goes to great lengths to not
become bloated and is designed with embedded systems in mind. As KDrive
supports the RENDER extensions, accelerating drawing operations in
hardware is possible, but requires modification for the target
Application Processor's graphics core. As with DirectFB, the list of
supported hardware accelerated devices does not include graphics cores
found in phones. There is an x server for the HP IPaq, however this
simply uses the standard frame buffer and adds support for the VGA-Out
device. Maemo uses Xomap, an accelerated KDrive for OMAP platforms,
namely TI OMAP 1710 and 2420.

See [X11](http://eLinux.org/X11 "X11") article for more information.

### OpenKODE

[OpenKODE](http://www.khronos.org/openkode/) is a new specification for
mobile devices and includes [OpenGL
ES](http://www.khronos.org/opengles/),
[OpenVG](http://www.khronos.org/openvg),
[OpenMAX](http://www.khronos.org/openmax) and similar into a single,
integrated API. The emphases here is hardware acceleration. OpenKODE is
cross platform and is gathering a lot of industry support. One reason
why this might be of interest is rather nicely demonstrated by nVidia in
this user interface demo which uses an OpenKODE 1.0 implementation:
[Next-Gen Phone
Interface](http://www.youtube.com/watch?v=8kLFPfaxQ6U&eurl=). There are
currently no open source implementations of the OpenKODE specification,
however there are OpenGL ES & OpenVG (binary) Linux drivers available
for PowerVR
[MBX](http://www.imgtec.com/PowerVR/products/Graphics/MBX/index.asp) &
[SGX](http://www.imgtec.com/PowerVR/products/Graphics/SGX/index.asp)
cores, found in higher-end [Application Processors]. These drivers are
not available from Imagination Technologies (who designed the PowerVR
series) directly but are instead supplied with the BSP for your chosen
CPU.



## Widget Toolkits

A widget toolkit provides useful widgets such as buttons, menus, text
boxes etc. The application programmer doesn't care what a button looks
like, just what happens when it's pressed. On embedded systems, you
generally have two choices: GTK+ or QT. Recently however, people working
on the E17 (Enlightenment) window manager project have started looking
at running enlightenment on embedded devices. Also emerging are more
advanced, Flash based user interfaces. Sadly though, there are currently
no open source equivalents at present.

### GTK+

GTK+ has excellent support on embedded systems. Ports of GTK+ have been
made for rendering directly to the frame buffer, to a DirectFB device
and of course KDrive. For more information about GTK+, visit
[[1]](http://www.gtk.org).

### QT/Qtopia

QT is a commercial product written by a company called
[Trolltech](http://www.trolltech.com) that has been bought by
[Nokia](http://www.nokia.com) in January 2008. Written in C++ and
providing a C++ API, Qt is not only a graphical library, but a full
development framework : database access, XML, threads, data structures,
networking, etc.

Until version Qt 4.5, Qt was distributed using a dual-licensing scheme :

-   A version of the library distributed under the GPL. As applications
    using a library are considered derived works of the library,
    applications using the GPL version of Qt must be released under the
    GPL. While this is fine for the free software and open source
    community and some companies, it may not suit others companies
    needs.
-   A version of the library under a commercial license, allowing the
    creation of proprietary products.

Since Qt 4.5, Qt is also distributed under the LGPL license, which also
proprietary applications without buying a commercial license.

QT as it stands is unsuitable for embedded devices due to it's large
size and large dependency tree. However, a few years ago, Trolltech
launched an embedded version of QT, cleverly named Qt/Embedded. While
this is still used for the OPIE application framework, Troltech have
updated Qt/Embedded and produced their own framework called Qtopia. Out
of the box, both Qt/Embedded and Qtopia render directly to the frame
buffer. In Qtopia, it is possible to accelerate this rendering by
re-implementing several of the classes the library uses to perform all
drawing operations. The Both QT/Embedded & the Qtopia framework also
handles windowing internally when multiple applications are running.
More recently, Trolltech has incorporated OpenGL ES into Qtopia, which
is used for hardware accelerated drawing operations and for compositing
multiple windows. The Trolltech
[documentation](http://doc.trolltech.com/4.3/qtopiacore-ahigl.html) also
hints at visual effects similar to those on Beryl/Compiz, although there
are no screen-shots avaliable.

### Enlightenment

Enlightenment started life as a window manager for X11. Over the years,
it has transformed into a very rich, full desktop environment similar to
KDE and Gnome. Enlightenment has always had a very slick user interface
with lots of eye-candy. The latest development version of Enlightenment,
E17 is highly modularised. E17 has its own widget toolkit called the
Enlightenment Widget Library (Ewl). The Ewl draws its widgets using the
Enlightenment Foundation Library (ELF) which renders onto a canvas
component called EVAS. EVAS supports compositing with true
alpha-blending allowing some very attractive user interfaces. EVAS also
supports multiple back-ends including X11, OpenGL, and the Linux
framebuffer.

See [Enlightenment Foundation Libraries](http://eLinux.org/EFL "EFL") article.

### Quantum Step

[QuantumStep](http://www.quantum-step.com/) is essentially OpenStep for
mobile devices. It's layered on top of X11 so is (in theory) fairly
portable. Developers may be familiar with another product derived from
NeXTStep... MacOS X. QS uses the MacOS X development chain, including
Xcode and Objective-C. So... if you're a Mac-o-phile, then there is an
open alternative to the iPhone.

### WxEmbedded

[WxEmbedded](http://www.wxwidgets.org/docs/embedded.htm) is the embedded
variant of [WxWidgets](http://www.wxwidgets.org). It is a widget library
on top of X11, GTK+, DirectFB, Nano-X, MicroWindows, MGL and WinCE.
Applications are portable between those platforms and get the native
look and feel on them.

WxWidgets has a nice cross platform GUI programming assistants called
[[[2]](http://www.anthemion.co.uk/dialogblocks/%7CDialogBlocks)]. It is
unclear how usable this tool is in combination with WxEmbedded, but if
you are interested in WxEmbedded, DialogBlocks is definitely worthwhile
investigating.

## Application Frameworks

The widget toolkits provide facilities for applications to draw buttons
on the screen, but what if they want to find a telephone number? On a
typical phone, lots of different applications are going to need a
contact list. Having a different contact list for each application is
going to get silly. Instead, there are several application framesworks
available. These can be split into 3 groups, those based on QT, those
based on GTK+ and those based on Enlightenment. This is similar to the
KDE vs Gnome vs Enlightenment dilemma, just on embedded devices. In
general, GTK+ frameworks use Kdrive as an X server and the matchbox
window manager. Frameworks based on QT (there are only 2 of them) use
the windowing system built into QT/Embedded (now Qtopia Core). As such,
an application using a GTK+ framework can't run simultaneously with an
application using a QT based framework.

The last 12-months has seen interest in Embedded Linux explode. As a
result, the market has become fragmented, with lots of different
competing application frameworks. All of these newer frameworks
(OpenMoko, GPE, GPE Phone Edition, Hiker, Sato, Sugar & Hildon) are
based on the GTK+/KDrive/Matchbox combination. All of these projects
have forked GTK+ and develop on separate branches, which is a lot of
duplicated and wasted effort. To address the problem of fragmentation,
the Gnome Mobile Initiative was founded to bring these different
frameworks together and introduce some consistency & compatibility. The
Gnome Mobile website is at
[http://www.gnome.org/mobile](http://www.gnome.org/mobile/).



### GTK+ Based Frameworks

#### OpenMoko

[OpenMoko](http://www.openmoko.org) is an open source project sponsored
by FIC. It aims to create a complete open source software stack for
mobile phones. As the work is being sponsored by FIC, the first phone
OpenMoko is designed to run on is the FIC Neo1973. OpenMoko uses KDrive
to provide the back end for graphics. All the widgets used on the phone
are designed specifically for OpenMoko and written using the GTK+
toolkit.

#### GPE Palmtop Environment

From GPE's homepage: "*The GPE Palmtop Environment aims to provide a
Free Software GUI environment for palmtop/handheld computers running the
GNU/Linux™ operating system. GPE uses the X Window System, and the
GTK+-2.6 widget toolkit.*

GPE is not a single piece of software, but an entire environment of
components which make it possible to use your GNU/Linux handheld for
standard tasks such as Personal Information Management (PIM). GPE makes
it easy for developers to create powerful programs, by giving them the
infrastructure they need.

Besides providing core software such as shared libraries, and perhaps
more importantly, the GPE environment fixes standards for program
interaction, such as SQL, XML, and other data schemas.*"*

A recent development has been the launch of [GPE Phone
edition](http://gpephone.linuxtogo.org). This aims to implement a
complete [LIPS](http://www.lipsforum.org/) compliant software stack. For
more information on GPE in general, visit
[[3]](http://gpe.handhelds.org)

#### Hiker (Access Linux Platform)

The Access Linux Platform contains an application framework called
Hiker. Hiker is built on top of GTK+ and provides facilities to allow
applications to exchange data etc. More information at the Access Linux
Platform's website:
[www.access-company.com/products/linux/alp.html](http://www.access-company.com/products/linux/alp.html)

#### Sato

Sato is another framework based on GTK+ and is produced by OpenedHand
for their "Poky" Linux distribution. Sato includes lots of applications
such as games, a web browser, contact list etc. See
[pokylinux.org](http://pokylinux.org/) for details.

#### Hildon (Maemo)

Hildon is user interface part of the Maemo distribution used on Nokia
web tablets. It has started to be ported to other platforms such as
Ultra-Mobile computers (E.g. Samsung Q1) as part of the Ubuntu Mobile &
Embedded project. It, again, is based on GTK+ and contains widgets for
menus, status bars etc. The best place to look into Hildon is through
the [http://maemo.org](http://maemo.org/) website.

#### Sugar (OLPC)

Sugar is the user interface used in the One Laptop Per Child project. It
takes a different approach to the "desktop" metaphor and uses its own
unique user interface. The Sugar wiki can be found at
[http://wiki.laptop.org/go/Sugar](http://wiki.laptop.org/go/Sugar).



### QT/Qtopia Based Frameworks

#### Qtopia

from Qtopia's homepage: "*Qtopia is unrivaled as the application
platform and user interface for Linux, allowing efficient creation of
mobile and embedded devices.*"

Qtopia is split up into different versions, including a Qtopia Phone
Edition. Qtopia core is name given to the actual application framework.
Apart from several demos and examples, Qtopia cores does not come with
any applications. Applications are included in the "Open Source Edition"
and "Phone Edition". For more information, visit
[[4]](http://www.trolltech.com/products/qtopia).

#### Open Palmtop Integrated Environment (OPIE)

Originally started as an alternative GUI for the Sharp Zaurus, OPIE has
now spread across several devices and has a large collection of
applications. Opie uses an older version of QT/Embedded which lacks many
of the feature of the more modern Qtopia. However, due to it's stability
& large application base it remains a very interesting prospect. More
information at [[5]](http://opie.sourceforge.net)



### Enlightenment Based Frameworks

Currently, there are many distinct projects using Enlightenment on
embedded devices. the developers have been working with embedded devices
in mind and there are numerous blog posts about things which have been
prototyped.

#### Fancypants

Fancypants is an "advanced graphics and high-performance multi-media
platform for developing embedded applications in consumer, commercial
and industrial devices." It is developed commercially by Fluffy Spider
Technologies. It uses EVAS and Ecore from the Enlightenment project and
includes a very attractive user interface. See
[http://www.fancypants-graphics.com/](http://www.fancypants-graphics.com/)
for details, including videos showing off some of the features.

#### OpenInkpot

OpenInkpot is a "project for creating a free and open-source Linux
distribution for eink-based devices". It is a non-commercial project
developing firmware for different e-ink readers, using Evas and Ewl for
the software. Currently in early stages. See the [project
page](http://openinkpot.org/) for further details.

#### Illume

Illume is an Enlightenment DR17 module to make the window manager
friendly for phones and PDAs. It's in use in
[OpenMoko](http://www.openmoko.org) and [FreeSmartPhone -
FSO](http://www.freesmartphone.org). This module is integrated in SVN as
part of E17 modules.

#### Guarana

[Guarana](http://profusion.mobi/node/10) is a framework on top of
[Enlightenment Foundation Libraries](http://eLinux.org/EFL "EFL") to help with Rich GUI,
it ships with widgets targeted at set-top boxes and media centers (will
merge with Elementary, see [EFL](http://eLinux.org/EFL "EFL")), as well as
Model-View-Controller framework and a plugin system. It's being used in
Digital TV set-top boxes and Enjoy media player.

### Others

#### Disko

Disko is a LGPL-licensed application framework, that can be used to
develop GUI applications for embedded devices. It is closely connected
to the DirectFB hardware abstraction library and specialised in
touchscreen and remote control navigation. It provides a plugin based
management component, which enables easy writing and extending embedded
applications. Media playback (DVD, DVB, IPTV and audio streams) is
provided by the well known xine media library. Disko has been ported to
the TI DaVinci chipset together with Direct FB and runs on x86 as well.
[Disko homepage](http://www.diskohq.org)

#### Crank Software's Storyboard UI Suite

The [Crank™ Storyboard™ UI
Suite](http://cranksoftware.com/products/crank_storyboard_suite.php) is
a graphical development tool and runtime engine designed for the
requirements of the embedded consumer market. [Crank Storyboard
Designer](http://cranksoftware.com/products/crank_storyboard_designer.php)
enables user interface (UI) designers to easily prototype the look and
feel of a product, and then move the prototype directly to the embedded
target for deployment. The [Crank Storyboard Embedded
Engine](http://cranksoftware.com/products/crank_storyboard_embedded_engine.php)
is the runtime component that drives the content developed in Crank
Storyboard Designer on embedded devices. It is architected exclusively
to address the unique challenges of bringing a rich user interface (UI)
user experience (UX) to resource-constrained embedded devices.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Categories](http://eLinux.org/Category:Categories "Category:Categories")

