> From: [eLinux.org](http://eLinux.org/Evas "http://eLinux.org/Evas")


# Evas



Evas is an object-oriented 2D canvas that uses retained renderer mode.
It's part of [Enlightenment Foundation Libraries](http://eLinux.org/EFL "EFL"). It's
written in C but bindings for Python and Ruby exists.

Evas main goals are to be easy to use and optimized. The latter is one
of its strongest points: it's very light on memory, blit functions are
optimized in C and MMX, SSE or Altivec where possible. It can use
rendering threads, splitting independent work among threads, reaching
about `sqrt(N-cores)` improvements. Since it can know what changed from
one frame to another, it can do employ dirty-rectangle optimizations to
avoid repainting unchanged areas and will also merge dirty rectangles to
avoid painting the same area twice (NP problem, solved with a good
heuristic). There are also engines that use hardware acceleration, like
OpenGL, DirectFB and XRender/X11. Evas ships with native 16bpp engines
targeted at embedded systems.

### Documentation

-   [API (Doxygen)](http://docs.enlightenment.org/api/evas/html)
-   Evas is base of [Edje](http://eLinux.org/Edje "Edje"), so its documentations can
    serve as guide as well.

### Features

-   Optimized for raster and bitmaps
-   Basic Primitives:
    -   Rectangles, Lines and Polygons
    -   Gradients: includes different modes like linear, radial and
        more, with different configurations, stop points and even
        semi-transparent colors.
    -   Images: includes different scaling methods, like nearest or
        smooth super and super-sampled. It can do image tiling and
        handles border properties so scale will scale them properly. Can
        load images from PNG, JPEG, TIFF, PPM, SVG and more.
    -   Text: include effects as shadow (hard and soft), outline and
        glow. Can use fontconfig for font discovery, uses freetype
        rendering by default. Supports UTF-8.
    -   Text Block: handles wrapping and tags to change properties.
        Supports edit and password mode.
-   Advanced Primivies:
    -   Smart Objects: objects without visual, they are used to hold
        other objects (like groups) and its methods are user-defined, so
        on resize you can rearrange its children, for example.
    -   Box: smart object that can layout a sequence of children in some
        way. It's extensible, but by default lots of layouts are
        provided like vertical, horizontal, stack, flow.
    -   Table: smart object that layout children in a table, supports
        row and column spanning.
-   Operations include stacking, rectangular clipping, moving and
    resizing.
-   It's not tied to any main loop, you must call its render routines
    and feed events. [Ecore\_Evas](http://eLinux.org/Ecore "Ecore") is a helper to ease
    that process with Ecore main loop and its engines (X11, Xcb,
    DirectFB...)

### Engines

Working engines:

-   32 bits per pixel native engines (can downscale to 1bpp, with
    optional dithering):
    -   Software Buffer
    -   Software X11 and XCB
    -   XRender X11 and XCB
    -   OpenGL X11
    -   Software Linux Framebuffer
    -   DirectFB
    -   Software SDL
    -   Software Win32 GDI
    -   Software WindowsCE
    -   Software DirectDraw (Windows)
    -   Direct3d (Windows)
    -   Quartz (MacOS X)
-   16 bits per pixel:
    -   Software 16-X11
    -   Software 16-DirectDraw
    -   Software 16-WindowsCE
    -   Software 16-SDL

Some engines are deprecated, broken or need some work, they include
Cairo, GLEW, Qtopia and possible more.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Enlightenment](http://eLinux.org/index.php?title=Category:Enlightenment&action=edit&redlink=1 "Category:Enlightenment (page does not exist)")

