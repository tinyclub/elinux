> From: [eLinux.org](http://eLinux.org/Didj_and_Explorer:_boot_pixel_format "http://eLinux.org/Didj_and_Explorer:_boot_pixel_format")


# Didj and Explorer: boot pixel format



Tutorial to help the user set a framebuffer pixel format that will
display the boot logo correctly.

The excellent work by nirvous has given us a frame buffer driver, this
is a work in progress, it currently has some hard-coded settings to make
it work primarily with the gpsp gba emulator, so things like the linux
boot logo don't show up in the correct colours (my tux in 565 mode has a
bit of a tint, and the background for the layer is red).

I'd like to thank Nirvous, NullMoogleCable, PhillKll, Claude, JKent,
Jburks, GrizzlyAdams and anyone I may have forgotten for their help :)


 **Prerequisites**

    Working toolchain
    Explorer kernel Sources with lf1000fb drivers already patched in
    correctly set environment variables
    lf1000 frame buffer drivers from nirvous github
    gpsp sources from nirvous github (optional)



The reason for the boot logo being skewed is the default pixel format
and some other non default settings, the available pixel formats are:

RGB565-8bit (not sure what this mode is exactly) RGB565-16bit (Default)
RGB888-24bit (this and 32bit are pretty much used universally for images
like jpg,bmp,png etc.) ABGR888-32bit (like BGR888 24bit but with a
transparency byte?)


 These are currently dealt with in a switch case in lf1000fb.c in the
function set\_mode:

    static void set_mode(struct lf1000fb_info *fbi)

with a test to see what bits\_per\_pixel is set to, bits\_per\_pixel is
hardcoded to take BITSPP which is derived from BYTESPP\*8 elsewhere in
the code.

` `

         switch(fbi->fb.var.bits_per_pixel) {
            case 8:
            /*565 - 8 bits*/

                fbi->fb.var.red.offset      = 0;
                fbi->fb.var.red.length      = 8;
                fbi->fb.var.green.offset    = 0;
                fbi->fb.var.green.length    = 8;
                fbi->fb.var.blue.offset     = 0;
                fbi->fb.var.blue.length     = 8;
                fbi->fb.var.transp.offset   = 0;
                fbi->fb.var.transp.length   = 0;
                fbi->pix_fmt                = 0x443A;
                break;
            case 16:
            /*565 - 16 bits*/

                fbi->fb.var.red.offset      = 5;//was 11
                fbi->fb.var.red.length      = 5;
                fbi->fb.var.green.offset    = 5;
                fbi->fb.var.green.length    = 6;
                fbi->fb.var.blue.offset     = 0;
                fbi->fb.var.blue.length     = 5;
                fbi->fb.var.transp.offset   = 0;
                fbi->fb.var.transp.length   = 0;
                fbi->pix_fmt                = 0x4432;
                break;
            case 24:
            /*888 24bits*/

                fbi->fb.var.red.offset      = 0;//0 for bgr. 16 for rgb
                fbi->fb.var.red.length      = 8;
                fbi->fb.var.green.offset    = 8;
                fbi->fb.var.green.length    = 8;
                fbi->fb.var.blue.offset     = 16;//16 for bgr. 0 for rgb
                fbi->fb.var.blue.length     = 8;
                fbi->fb.var.transp.offset   = 0;
                fbi->fb.var.transp.length   = 0;
                fbi->pix_fmt                = 0x4653;
                break;
            case 32:
            /* 8888 32bits*/

                fbi->fb.var.red.offset      = 16;
                fbi->fb.var.red.length      = 8;
                fbi->fb.var.green.offset    = 8;
                fbi->fb.var.green.length    = 8;
                fbi->fb.var.blue.offset     = 0;
                fbi->fb.var.blue.length     = 8;
                fbi->fb.var.transp.offset   = 0;
                fbi->fb.var.transp.length   = 0;
                fbi->pix_fmt                = 0x8653;
                break;
            default:
            return -EINVAL;
        }


 The important parts here are the offset, length and the pix\_fmt
variables. There is a list of the possible pix\_fmt values in
lf1000fb.h, I have commented the ones we use above, you can also see
where BYTESPP and how BITSPP are set:

    #define BYTESPP                2

    #define BITSPP              BYTESPP*8
    #define VISUALTYPE          FB_VISUAL_TRUECOLOR //FB_VISUAL_PSEUDOCOLOR, FB_VISUAL_TRUECOLOR

    /* Formats:
    *   RGB565      = 0x4432, // 16 bits per pixel mode 2 BYTESPP
        BGR565      = 0xC432,
        XRGB1555    = 0x4342,
        XBGR1555    = 0xC342,
        XRGB4444    = 0x4211,
        XBGR4444    = 0xC211,
        XRGB8332    = 0x4120,
        XBGR8332    = 0xC120,
        ARGB1555    = 0x3342,
        ABGR1555    = 0xB342,
        ARGB4444    = 0x2211,
        ABGR4444    = 0xA211,
        ARGB8332    = 0x1120,
        ABGR8332    = 0x9120,
        RGB888  = 0x4653, // 24 bits per pixel mode 3 BYTESPP
        BGR888  = 0xC653,
        XRGB8888    = 0x4653,
        XBGR8888    = 0xC653,
        ARGB8888    = 0x0653,
        ABGR8888    = 0x8653, // 32 bits per pixel mode 4 BYTESPP
        PTRGB565    = 0x443A  //  8 bits per pixel mode 1 BYTESPP
     * */

We now know what modes we are using, changing the default mode should be
easy, change BYTESPP to be an integer between 1 and 4, as I'm using SDL
and I want to display some png and bmp images I tested with 3.

Oh Dear, one Tux with blue feet and a blue background, testing my app
and the colours in my image are well off :/ what's going wrong? Look at
the code for BYTESPP = 3, 24bit:

                fbi->fb.var.red.offset      = 0;//0 for bgr. 16 for rgb
                fbi->fb.var.red.length      = 8;
                fbi->fb.var.green.offset    = 8;
                fbi->fb.var.green.length    = 8;
                fbi->fb.var.blue.offset     = 16;//16 for bgr. 0 for rgb
                fbi->fb.var.blue.length     = 8;
                fbi->fb.var.transp.offset   = 0;
                fbi->fb.var.transp.length   = 0;
                fbi->pix_fmt                = 0x4653;

Its been nicely commented so we can easily see what is happening, it
looks like the pix\_fmt is correctly set for RGB888, the BYTESPP are set
correctly, so from the comments its definitely the offsets, swap them
back so they are RGB

                fbi->fb.var.red.offset      = 16;//0 for bgr. 16 for rgb
    ...
                fbi->fb.var.blue.offset     = 0;//16 for bgr. 0 for rgb

Time to recompile your kernel, Success, tux displays correctly, getting
a blue background this time around, testing the SDL app and I get my
image displayed in glorious technicolour. Great, what about other apps?

I'm also testing with gpsp, in 565 mode, gpsp works fine, with or
without the fb driver. In 24bit or 32bit mode using the fb driver gpsp
is displayed wrong, so it appears that gpsp isn't setting the mode
settings correctly when its using the framebuffer driver. What do we do
about it?

We know that gpsp will display correctly if it's using the lf1000
mlc/dpc drivers, so lets take a look in the /lf1000 folder at lf1000.c
from the gpsp sources, the video init functions are what we need to look
at:

    static void fb_video_init()
    {
      struct fb_fix_screeninfo fbfix;
      int i, ret;

      fbdev = open("/dev/fb0", O_RDWR);
      if (fbdev < 0) {
        perror("can't open fbdev");
        printf("attempting mlc\n");

        //nirvous - added support for MLC driver
        fbdev = open("/dev/layer0", O_RDWR);
        if (fbdev < 0) {
            perror("can't open mlc");
            exit(1);
          }

        fb_paddr[0] = ioctl(fbdev, MLC_IOCQADDRESS, 0);
          if (ret == -1)
          {
            perror("ioctl(fbdev) failed");
            exit(1);
          }
     //capture original mlc settings, then change to RGB565
        original_mlcformat = ioctl(fbdev, MLC_IOCQFORMAT, 0);
        original_mlchstride = ioctl(fbdev, MLC_IOCQHSTRIDE, 0);
        original_mlcvstride = ioctl(fbdev, MLC_IOCQVSTRIDE, 0);
        ioctl(fbdev, MLC_IOCTFORMAT, 0x4432);
        ioctl(fbdev, MLC_IOCTHSTRIDE, 2);
        ioctl(fbdev, MLC_IOCTVSTRIDE, 320*2);
        ioctl(fbdev, MLC_IOCTDIRTY, 0);
        printf("mlc framebuffer: @ %08lx\n", fb_paddr[0]);
     }

      else
      {
          ret = ioctl(fbdev, FBIOGET_FSCREENINFO, &fbfix);
          if (ret == -1)
          {
            perror("ioctl(fbdev) failed");
            exit(1);
          }
          printf("framebuffer: \"%s\" @ %08lx\n", fbfix.id, fbfix.smem_start);
          fb_paddr[0] = fbfix.smem_start;
    }

The basic breakdown of the code is:

    try to open the framebuffer /dev/fb0
    if we fail, try the mlc driver
    if we get mlc success then store the original format settings and set 565 mode for gpsp
    if we succeeded in opening the framebuffer device we just assume we're in the right mode....


 That last bit is the issue, we never set the mode if we use the
framebuffer driver.

Simple to rectify in this instance, copy the mlc code for handling the
mode and format settings, the else should now look like this:

      else
    {
          ret = ioctl(fbdev, FBIOGET_FSCREENINFO, &fbfix);
          if (ret == -1)
          {
            perror("ioctl(fbdev) failed");
            exit(1);
          }
    // copied and pasted by reggie
    //capture original mlc settings, then change to RGB565
        ioctl(fbdev, MLC_IOCTENABLE, 1); // added by reggie
        original_mlcformat = ioctl(fbdev, MLC_IOCQFORMAT, 0);
        original_mlchstride = ioctl(fbdev, MLC_IOCQHSTRIDE, 0);
        original_mlcvstride = ioctl(fbdev, MLC_IOCQVSTRIDE, 0);
        ioctl(fbdev, MLC_IOCTFORMAT, 0x4432);
        ioctl(fbdev, MLC_IOCTHSTRIDE, 2);
        ioctl(fbdev, MLC_IOCTVSTRIDE, 320*2);
        ioctl(fbdev, MLC_IOCTDIRTY, 0);

          printf("framebuffer: \"%s\" @ %08lx\n", fbfix.id, fbfix.smem_start);
          fb_paddr[0] = fbfix.smem_start;
    }

Testing it now shows that gpsp will work with 24 and 32bit modes, we get
the added bonus that we've cleaned up another little gpsp quirk,
quitting the app. no longer stops other apps and gpsp from displaying an
image, before this (at least for me) gpsp would load fine the first
time, then anything else I loaded after that wouldn't display anything
on screen.

I've added the MLC\_IOCTENABLE control to the routine as well, this is
used because we are going to disable the layer on exit, this will tidy
up the screen when gpsp has finished but obviously breaks other apps
that don't enable the layer when they open the framebuffer, we should
really be doing this in the framebuffer driver I think.



    static void fb_video_exit()
    {
      int ret;
      /* switch to default fb mem, turn portrait off */
      //nirvous comments out support for layer1
      //gpsp_gp2x_memregl[0x406C>>2] = fb_paddr[0];
      //gpsp_gp2x_memregl[0x4058>>2] |= 0x10;
      //nirvous adds support for layer0
      gpsp_gp2x_memregl[0x4038>>2] = fb_paddr[0];
      gpsp_gp2x_memregl[0x4024>>2] |= 0x10;
      wiz_lcd_set_portrait(0);
      ret = ioctl(fbdev, MLC_IOCQADDRESS, 0);
      if (ret == -1)
      {
        //nirvous - restore original mlc settings
        ioctl(fbdev, MLC_IOCTFORMAT, original_mlcformat);
        ioctl(fbdev, MLC_IOCTHSTRIDE, original_mlchstride);
        ioctl(fbdev, MLC_IOCTVSTRIDE, original_mlcvstride);
        ioctl(fbdev, MLC_IOCTENABLE, 0); // added by reggie
        ioctl(fbdev, MLC_IOCTDIRTY, 0);
        close(fbdev);
      }
      else
      {
        //nirvous - restore original mlc settings
        ioctl(fbdev, MLC_IOCTFORMAT, original_mlcformat);
        ioctl(fbdev, MLC_IOCTHSTRIDE, original_mlchstride);
        ioctl(fbdev, MLC_IOCTVSTRIDE, original_mlcvstride);
        ioctl(fbdev, MLC_IOCTENABLE, 0); // added by reggie
        ioctl(fbdev, MLC_IOCTDIRTY, 0);
        close(fbdev);
     }
    }


 **Notes**

I think we need a better method for doing things, changing the
background colour via ioctl doesn't seem to do much, even though the
background register displays the change when queried , it might be more
useful if we use layer0 as a seperate background layer, and work with
either layer 1 or layer 2 as our main layer, I wonder if it's possible
to allow us to pass fb1 and fb2 to the driver and have it react
accordingly? Or pass the driver an 'active layer' flag?


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

