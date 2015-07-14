> From: [eLinux.org](http://eLinux.org/Didj_and_Explorer_libSDL "http://eLinux.org/Didj_and_Explorer_libSDL")


# Didj and Explorer libSDL



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Software Needed](#software-needed)
-   [4 Hardware Needed](#hardware-needed)
-   [5 Build libiconv](#build-libiconv)
-   [6 Build SDL](#build-sdl)

## Summary

libSDL is a popular library for games and other applications. It
provides APIs for events (buttons, etc), graphics, sound, and more. This
will guide you through the process of building it for your device.

## Prerequisites

[Framebuffer
driver](http://eLinux.org/Leapster_Explorer_Framebuffer_Driver "Leapster Explorer Framebuffer Driver")
is required if video is used.

[Build
Environment](http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment "LeapFrog Pollux Platform: Build Environment")

## Software Needed

[libiconv-1.13.1.tar.gz](http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.1.tar.gz)

[SDL-1.2.13.tar.gz](http://www.libsdl.org/release/SDL-1.2.13.tar.gz)

## Hardware Needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")



## Build libiconv

**Create an install script for iconv:**

Create a folder in your packages directory called libiconv, then copy
and paste the following into a text file and save it in the libiconv
folder, call it install.sh then make sure the file is executable.

    #!/bin/bash

    BUILD_FROM_SOURCE=1

    PKG_NAME=libiconv
    SRC=libiconv-1.13.1.tar.gz
    set -e

    . $PROJECT_PATH/scripts/functions

    # make sure all of the environment variables are good
    check_vars

    # exit if the user is root
    check_user

    # parse args
    set_standard_opts $*

    pushd $PROJECT_PATH/packages/$PKG_NAME

    BUILD_DIR=`echo "$SRC" | cut -d '.' -f -3`

    if [ "$CLEAN" == "1" -o ! -e $BUILD_DIR ]; then
        rm -rf $BUILD_DIR
        tar -xzf $SRC
    fi

    pushd $BUILD_DIR

    CFLAGS="-I$PROJECT_PATH/packages/$PKG_NAME/libiconv-1.13.1/ -O3 -fPIC -mcpu=arm926ej-s" LDFLAGS=-L$PROJECT_PATH/packages/$PKG_NAME/libiconv-1.13.1/ ./configure --host=arm-linux --target=arm-linux --prefix=$ROOTFS_PATH/usr --enable-shared
    make clean
    make
    make install

    popd

    popd

    exit 0


 **Build libiconv**

Download libiconv to your libiconv package directory.

Now that you've got an install script you can run it with the following
command:

    CLEAN=1 ./install.sh

This will unpack, set the necessary vars, and then compile and install
libiconv. You should only need to do CLEAN=1 for the first time you run
it, that's the var that triggers a clean download and install.

## Build SDL

**Build the SDL library**

To build SDL, first download and unpack it:

     wget http://www.libsdl.org/release/SDL-1.2.13.tar.gz
     tar -xf SDL-1.2.13.tar.gz
     cd SDL-1.2.13

Now try the following, but replace the "/path/to" lines with paths on
your system. You'll want to tell the build system where to install
libSDL and where to look for kernel headers:

    CFLAGS="-I/path/to/kernel/linux-2.6/include/"
    CC=arm-linux-uclibcgnueabi-gcc
    CXX=arm-linux-uclibcgnueabi-g++
    ./configure --prefix=/path/to/rootfs//usr/ --build=`uname -m` --host=arm-linux --disable-video-opengl --disable-video-x11
    --disable-esd --disable-video-directfb --enable-video-fbcon --enable-pulseaudio=no

If that succeeds, try building and installing:

     make
     make install

You should see libSDL.so in usr/lib/ in your ROOTFS\_PATH directory as
well as its header files in usr/include/. When building applications
against libSDL, tell the compiler to look for headers and the linker to
look for libraries there (ie: CFLAGS="-I/path/to/rootfs/usr/include" and
LDFLAGS="-L/path/to/rootfs/usr/lib").

**Set up the device**

Copy the .so files and symlinks to your device. Also edit "/etc/profile"
on your device and add some environment variables for SDL:

For Didj:

     export SDL_NOMOUSE=1
     export SDL_FBDEV="/dev/fb0"
     export SDL_VIDEODRIVER="fbcon"
     export SDL_AUDIODRIVER="dsp"
     export SDL_PATH_DSP="/dev/dsp"
     export SDL_DEBUG="1"
     export SDL_FBACCEL="0"

For Explorer, the touchscreen works sort of like a mouse (TODO: add
tslib support?), so you could try:

     export SDL_MOUSEDEV="/dev/input/event3"
     export SDL_FBDEV="/dev/fb0"
     export SDL_VIDEODRIVER="fbcon"
     export SDL_AUDIODRIVER="dsp"
     export SDL_PATH_DSP="/dev/dsp"
     export SDL_DEBUG="1"
     export SDL_FBACCEL="0"

You'll need to source that on your device:

     . /etc/profile

or just reboot. You should now be able to run SDL programs or demos as
long as your device is set up with a standard Linux framebuffer and
console in place of the LeapFrog-supplied graphics drivers.

**TODO**

    * better audio support?
    * tslib to make touchscreen usable on Explorer?


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

