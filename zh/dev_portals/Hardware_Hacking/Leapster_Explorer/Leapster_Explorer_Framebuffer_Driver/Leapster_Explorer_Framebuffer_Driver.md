> From: [eLinux.org](http://eLinux.org/Leapster_Explorer_Framebuffer_Driver "http://eLinux.org/Leapster_Explorer_Framebuffer_Driver")


# Leapster Explorer Framebuffer Driver



[![LX-FB-example.jpg](http://eLinux.org/images/thumb/3/31/LX-FB-example.jpg/350px-LX-FB-example.jpg)](http://eLinux.org/File:LX-FB-example.jpg)

[](http://eLinux.org/File:LX-FB-example.jpg "Enlarge")

## Contents

-   [1 Overview](#overview)
-   [2 Prerequisites](#prerequisites)
-   [3 Building the Framebuffer
    Driver](#building-the-framebuffer-driver)
-   [4 Where to go from here](#where-to-go-from-here)
-   [5 Acknowledgments](#acknowledgments)

## Overview

These the steps to enable the Linux framebuffer for **both Didj and
Explorer** on the updated Explorer kernel (2.6.31).

They involve modifications to the kernel's configuration file to enable
the framebuffer (and disable the existing DPC and MLC drivers), minor
patches to a few of the existing kernel files, and the replacement of
the new kernel's lf1000fb framebuffer driver with a working modified
version.

**Note: The stock 'Brio' application environment will no longer be
available on your device once you perform this modification.**

## Prerequisites

Cross compiler environment. For example:

-   [Buildcross](http://eLinux.org/Didj_Build_Environment "Didj Build Environment")
-   [Scratchbox](http://eLinux.org/Didj_Kernel_Build_Environment "Didj Kernel Build Environment")
-   [crosstool-NG](http://eLinux.org/Didj_crosstool-NG_Build_Environment "Didj crosstool-NG Build Environment")

[LF 2.6.31 Source code -
94MB](http://files.poxlib.org/LF-Linux-6905-20100610-0915.tar.gz)

If you havent yet built a kernel config file, you can use the default
config as a basis to build this driver.

` make lf1000_ts_defconfig`

If you are building this driver for Didj, you must first follow these
instructions:
[Didj\_Explorer\_Kernel](http://eLinux.org/Didj_Explorer_Kernel "Didj Explorer Kernel")

## Building the Framebuffer Driver

1.Modify the Kernel configuration.

The following items must be listed in 'lf1000 devices':

` `

    # CONFIG_LF1000_DPC is not set
    # CONFIG_LF1000_MLC is not set

The following items must be listed in 'character devices':

` `

    CONFIG_VT=y
    CONFIG_CONSOLE_TRANSLATIONS=y
    CONFIG_VT_CONSOLE=y
    CONFIG_HW_CONSOLE=y

The following items must be listed in 'graphics support':

` `

    CONFIG_FB=y
    CONFIG_FB_CFB_FILLRECT=y
    CONFIG_FB_CFB_COPYAREA=y
    CONFIG_FB_CFB_IMAGEBLIT=y
    CONFIG_FB_LF1000=y

The following items must be listed in 'display device support':

` `

    #CONFIG_VGA_CONSOLE is not set
    CONFIG_DUMMY_CONSOLE=y
    CONFIG_FRAMEBUFFER_CONSOLE=y
    CONFIG_FONTS=y
    CONFIG_FONT_8x8=y
    CONFIG_FONT_MINI_4x6=y
    CONFIG_LOGO=y
    CONFIG_LOGO_LINUX_MONO=y
    CONFIG_LOGO_LINUX_VGA16=y
    CONFIG_LOGO_LINUX_CLUT224=y


 2.Modify arch/arm/mach-lf1000/core.c and
drivers/input/keyboard/lf1000-keypad.c

To enable the fb driver to register, and to remove error-causing
references to LCD backlighting, apply the following patches.

[File:Core.c.diff](http://eLinux.org/File:Core.c.diff "File:Core.c.diff") (this one not
needed when building LF-Linux-8291-20101026-1425 kernel)

[File:Lf1000-keypad.c.diff](http://eLinux.org/File:Lf1000-keypad.c.diff "File:Lf1000-keypad.c.diff")

` `

    # patch arch/arm/mach-lf1000/core.c < Core.c.diff
    # patch drivers/input/keyboard/lf1000-keypad.c < Lf1000-keypad.c.diff

3.Grab the lf1000fb driver from the [github
repository](http://github.com/nirvous/lf1000fb).

(Rather than incorporate the driver changes into a patch, the code is
checked into github to facilitate improvements. If you have improvements
or fixes, please contribute them!)


 4.Replace the current drivers/video/lf1000fb.c file with the file from
the repository.


 5.Compile the kernel. ` `

    LF-Linux-6905-20100610-0915/linux2.6# make

6.Transfer the kernel to your device.

-   [Boot Didj from UART Connection -
    Linux](http://eLinux.org/Didj_UART_Boot_with_Linux_Host "Didj UART Boot with Linux Host")
    (or if so-equipped use an SD card)

-   [To transfer kernels to Explorer via
    USB](http://eLinux.org/Leapster_Explorer:_USB_Boot "Leapster Explorer: USB Boot")

7.On the device, check to see that the lf1000fb driver loaded by

` `

    dmesg | grep lf1000fb

8.On the device, Look for /dev/fb0. ` `

    ls /dev/fb*

9.If it is not present on the device, create the framebuffer device
entry.

` `

    mdev -s

10.Reboot


 You should see a picture of tux in the upper left corner of the display

## Where to go from here

The Linux framebuffer driver enables you to use a wide variety of
packages designed to work with it.

-   [Build and install
    libSDL](http://eLinux.org/Didj_and_Explorer_libSDL "Didj and Explorer libSDL")
-   [Build and install a simple Tetris game using
    libSDL](http://eLinux.org/Leapster_Explorer/stc "Leapster Explorer/stc")

## Acknowledgments

Many thanks to zucchini for his valuable help and input, as well as to
Claude, GrizzlyAdams, jburks, jkent, losinggeneration, MostAwesomeDude,
NullMoogleCable, PhilKll, prpplague, ReggieUK, and everyone on \#Didj
(irc.freenode.org).


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")

