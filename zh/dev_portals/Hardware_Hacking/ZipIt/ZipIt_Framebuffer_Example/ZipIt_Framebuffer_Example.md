> From: [eLinux.org](http://eLinux.org/ZipIt_Framebuffer_Example "http://eLinux.org/ZipIt_Framebuffer_Example")


# ZipIt Framebuffer Example



###### ====

**UPDATE**: This code is incomplete, and doesn't work 100% correctly. If
you're interested in drawing graphics on a [ZipIt](http://eLinux.org/ZipIt "ZipIt"),
Albert Santoni has provided [Zipit Gfx](http://eLinux.org/Zipit_Gfx "Zipit Gfx"), a small
library that provides some basic graphics drawing capabilities. zipitgfx
can be found [here](http://www.santoni.ca/albert/zipit.html). (More
information is available in the README posted
[here](http://groups.yahoo.com/group/zipitwireless/message/1542).)

###### ====

From [bomberman0's
post](http://groups.yahoo.com/group/zipitwireless/message/600)...

Here's sample code for writing to the [ZipIt](http://eLinux.org/ZipIt "ZipIt")'s screen.
(I've tested it and it works fine on my [ZipIt](http://eLinux.org/ZipIt "ZipIt").) If you
know C or C++ at all, it shouldn't be very hard to figure out how to
draw other stuff with this.



    #include <unistd.h>
    #include <stdio.h>
    #include <fcntl.h>
    #include <linux/fb.h>
    #include <sys/mman.h>

    int main()
    {
    int fbfd = 0;
    struct fb_var_screeninfo vinfo;
    struct fb_fix_screeninfo finfo;
    long int screensize = 0;
    char *fbp = 0;
    int x = 0, y = 0;
    long int location = 0;

    /* Open the file for reading and writing */
    fbfd = open("/dev/fb0", O_RDWR);
    if (!fbfd) {
    printf("Error: cannot open framebuffer device.\n");
    exit(1);
    }
    printf("The framebuffer device was opened successfully.\n");

    /* Get fixed screen information */
    if (ioctl(fbfd, FBIOGET_FSCREENINFO, &finfo)) {
    printf("Error reading fixed information.\n");
    exit(2);
    }

    /* Get variable screen information */
    if (ioctl(fbfd, FBIOGET_VSCREENINFO, &vinfo)) {
    printf("Error reading variable information.\n");
    exit(3);
    }

    /* Figure out the size of the screen in bytes */
    screensize = vinfo.xres * vinfo.yres * vinfo.bits_per_pixel / 8;

    /* Map the device to memory */
    fbp = (char *)mmap(0, screensize, PROT_READ | PROT_WRITE,
    MAP_SHARED, fbfd, 0);
    if ((int)fbp == -1) {
    printf("Error: failed to map framebuffer device to memory.\n");
    exit(4);
    }
    printf("The framebuffer device was mapped to memory successfully.\n");

    for (y = 0; y < 240; y++)
    {
    for (x = 0; x < 320; x++)
    {
    //x = 100; y = 100; /* Where we are going to put the pixel */

    /* Figure out where in memory to put the pixel */
    location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/4) +
    (y+vinfo.yoffset) * finfo.line_length;

    *(fbp + location) = 255; //Paint a black pixel.
    }
    }
    munmap(fbp, screensize);
    close(fbfd);
    return 0;
    }


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

