> From: [eLinux.org](http://eLinux.org/Ecore "http://eLinux.org/Ecore")


# Ecore



Ecore is a set of libraries to help software development. It's part of
[[EFL|Enlightenment Foundation Libraries], is written in C but bindings
for Python and Ruby exists.

The base library provides main loop with interesting calls as timers,
animators, pollers, file descriptor handlers, idlers idle enterer and
exit, some of these do not exit in GLib or Qt counterparts. It will also
provide an asynchronous event dispatching system, this can be used by
applications and is also used to handle UNIX signals like `SIGHUP`.

Other libraries provide integration of some other system with Ecore,
like ecore\_x that integrates [X11](http://eLinux.org/X11 "X11") using Xlib or Xcb;
ecore\_directfb that integrates [DirectFB](http://eLinux.org/DirectFB "DirectFB");
ecore\_con to do communication using TCP, UDP and even integrates with
curl to provide easy access to HTTP resources; ecore\_file for easier
path and file manipulation and so on.

Of special interest for [EFL](http://eLinux.org/EFL "EFL") users is **Ecore\_Evas** that
will integrate [Evas](http://eLinux.org/Evas "Evas") with ecore main loop and some
input/output system as [X11](http://eLinux.org/X11 "X11"),
[DirectFB](http://eLinux.org/DirectFB "DirectFB") or WindowsCE, it will feed Evas with
events, request render of parts and then inform the output system that
parts were updated.

### Documentation

-   [API (Doxygen)](http://docs.enlightenment.org/api/ecore/html)
-   Ecore is the base of [Edje](http://eLinux.org/Edje "Edje"), so its documentations may
    help as well.



### Features

Main Loop:

-   idlers, including exiter and enterer (useful for garbage collect and
    render phases)
-   timers, including shared timers as animators and pollers
-   file descriptor handlers
-   asynchronous events
-   UNIX signal handling in asynchronous way

[X11](http://eLinux.org/X11 "X11"):

-   xlib or xcb backends
-   supports most of api, including xrandr, xscreensaver and more
-   used by e17 window manager

Ecore\_Evas:

-   integrates with fb, directfb, x11, directdraw, quartz and most of
    evas engines
-   handles evas render phase automatically using idle enterer.
-   handles memory buffer flushing on idle, releasing shared X11
    pixmaps, for example

Ecore\_Con:

-   easy to use, main loop based unix sockets, tcp, udp, multicast
    client and server
-   curl integration

Ecore\_Ipc:

-   client server inter-process communication integrated in main loop



### Engines

-   framebuffer, supports libts (touchscreen)
-   macos quartz
-   sdl
-   win32 api
-   WindowsCE
-   X11
-   DirectFB


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Enlightenment](http://eLinux.org/index.php?title=Category:Enlightenment&action=edit&redlink=1 "Category:Enlightenment (page does not exist)")

