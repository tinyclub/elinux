> From: [eLinux.org](http://eLinux.org/EFL "http://eLinux.org/EFL")


# EFL



Enlightenment Foundation Libraries, or EFL, are the set of libraries
used to create the Enlightenment Window Manager DR17 (E17). This set of
libraries is not restricted to X11 as Enlightenment WM itself.

-   [http://www.enlightenment.org/](http://www.enlightenment.org/)
-   [http://wiki.enlightenment.org/](http://wiki.enlightenment.org/)
-   [http://trac.enlightenment.org/e](http://trac.enlightenment.org/e)
-   `svn co http://svn.enlightenment.org/svn/e/trunk/$PROJECT e`

[![E17-Illume
The-gang-03.jpg](http://eLinux.org/images/c/ca/E17-Illume_The-gang-03.jpg)](http://eLinux.org/File:E17-Illume_The-gang-03.jpg)

## Contents

-   [1 Libraries](#libraries)
-   [2 Old Style Toolkits](#old-style-toolkits)
-   [3 New Style Toolkits](#new-style-toolkits)
-   [4 Demos and Videos](#demos-and-videos)

### Libraries

Most used libraries follows, you can see them all at
[SVN](http://svn.enlightenment.org/svn/e/trunk/):

-   [Evas](http://eLinux.org/Evas "Evas") object-oriented and stateful 2D canvas, uses
    retained render mode and is very optimized, both with hardware
    acceleration with OpenGL and XRender and software. Ships with 32bpp
    and 16bpp native engines, but can downscale from 32bpp down to 1bpp
    with dithering on render time.
-   [Ecore](http://eLinux.org/Ecore "Ecore") set of libraries that covers main loop with
    events, including UNIX signals, timers, file descriptors, animators,
    pollers (shared timers). It also contains integration code with X11,
    DirectFB, Win32/DirectDraw, MacOS/Quartz. Extra functionality are
    simple IPC and HTTP communication.
-   [Edje](http://eLinux.org/Edje "Edje") is a super-theme engine, it builds on top of
    Evas, Ecore, Embryo, EET and others to provide powerful themes. With
    it your application themes are not restricted to just replace some
    images or changing some colors, you can radically change the look
    and feel. It can be thought as a mix of HTML, CSS and JavaScript.
    It's based on object states and transition between theirs states, so
    animations can be easily specified. State descriptions can use
    relative and absolute positioning, so your interfaces can be
    scalable yet pixel perfect.
-   Emotion is a media playback system integrated with Ecore and Evas.
    It ships with Xine, GStreamer and VLC engines.
-   Epsilon is an image and video thumbnailer, builds on top of Evas,
    Ecore and Emotion.
-   Eina basic data types, very optimized. Includes stringshare, lists,
    hashes and red-black trees.
-   EET data storage library and command line tool, provides
    ar/zip-similar storage and is optimized for reading. It can handle
    entry compression, signing and crypto. It bundles an easy to use
    C-struct serialization, so one can loads complex data from files
    directly to dynamically allocated C structs or persist them into
    files. Ideal to save user preferences in an optimized way, but still
    editable with regular tools/editors if you use `eet -e` and
    `eet -e`. It's used [Edje](http://eLinux.org/Edje "Edje") to store theme resources,
    as fonts, images, descriptions and even embryo scripts.
-   Embryo is a tiny, simple and fast virtual machine that runs a C
    subset, derived from
    [PAWN/SMALL](http://www.compuphase.com/pawn/pawn.htm).

### Old Style Toolkits

Some more traditional toolkits were build on top of EFL but don't expose
underneath technologies like Evas or Edje. They're targeted at form-like
applications, just like GTK and Qt.

-   ETK, similar to GTK in API. *not being actively developed anymore*
-   EWL, more Model-View-Controller approach.

### New Style Toolkits

Some new toolkits were born recently and makes more use of EFL concepts,
not just exposing components like Evas and Edje, but truly mixing with
them. So far we have two alternatives, but they will merge soon. See
[Rich GUI without pain ELC-E 2008
talk](http://palestras.gustavobarbieri.com.br/efl/elce2008/Rich_GUI_without_pain.pdf).

-   Elementary, targeted at phones, pdas and other touch screen devices.
    It was originally born as a port of E17 widgets.
-   [Guarana](http://profusion.mobi/node/10), targeted at digital tv,
    media centers and other set-top boxes. Guarana is more than just
    widgets, it also covers module loader, MVC framework and more.

### Demos and Videos

-   [E17/Illume running on Palm Treo
    650](http://www.rasterman.com/files/illume-treo-650.avi)
-   [E17/Illume running on Freescale
    iMX31](http://www.youtube.com/watch?v=HZ8TDywzL34)
-   [Guarana demo: Enjoy Media
    Player](http://www.youtube.com/watch?v=Xtf1nvNcNf8)
-   [Video](http://free-electrons.com/pub/video/2008/elce/elce2008-barbieri-rich-gui-without-pain.ogv)
    of Gustavo Barbieri talk on EFL at Embedded Linux Conference Europe
    2008.
    [Slides](http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2008Presentations?action=AttachFile&do=get&target=Rich_GUI_without_pain.pdf)
    are also available.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Libraries](http://eLinux.org/Category:Libraries "Category:Libraries")

