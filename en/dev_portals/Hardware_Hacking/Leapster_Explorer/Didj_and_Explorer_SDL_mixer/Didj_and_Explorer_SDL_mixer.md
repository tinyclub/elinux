> From: [eLinux.org](http://eLinux.org/Didj_and_Explorer_SDL_mixer "http://eLinux.org/Didj_and_Explorer_SDL_mixer")


# Didj and Explorer SDL mixer



**Installing SDL\_mixer**

I'd like to thank Nirvous, NullMoogleCable, PhillKll, Claude, JKent,
Jburks, GrizzlyAdams and anyone I may have forgotten for their help :)

Another short tutorial for installing SDL\_mixer, this will give better
audio support to SDL which only has wav/pcm support built in. This
tutorial will show you how to install SDL\_mixer with mp3 support using
libmad.


 **Prerequisites**

* * * * *

    A working toolchain
    LX Kernel sources and ThirdParty tarball unpacked to your harddrive
    correct environment variables set
    libmad (installed as part of this tutorial)
    libSDL (should already be installed)
    A working internet connection

**Installing libmad**

* * * * *

As with the other tutorials, we will need to make a directory in
PROJECT\_PATH/packages:

    mkdir $PROJECT_PATH/packages/SDLmixer
    cd $PROJECT_PATH/packages/SDLmixer

This install is slightly different, we need to disable one of the libmad
optimisation options, so we need to download the SDL\_mixer source and
edit it:

    wget ftp://ftp.mars.org/pub/mpeg/libmad-0.15.1b.tar.gz
    tar -xf libmad-0.15.1b.tar.gz
    cd ./libmad-0.15.1b
    gedit configure

Look for line 19102 and comment it out:

    //     optimize="$optimize -fforce-mem"

now save it into your PROJECT\_PATH/SDLimage folder, we will use it in a
moment when we install libmad.


 We now need to make an install script for libmad, copy the following
into a text editor and save the file as installmad.sh:

    #!/bin/bash
    export CC=arm-linux-uclibcgnueabi-gcc
    export CXX=arm-linux-uclibcgnueabi-gcc
    export CPPFLAGS='-I${PROJECT_PATH}/packages/SDLmixer/libmad-0.15.1b -I${PROJECT_PATH}/packages/zlib/zlib-1.2.3'
    export LDFLAGS='-L${PROJECT_PATH}/packages/SDLmixer/libmad-0.15.1b -L${PROJECT_PATH}/packages/zlib/zlib-1.2.3'
    if [ "$CLEAN" == "1" ]; then
    rm -rf ./libmad-0.15.1b
    wget ftp://ftp.mars.org/pub/mpeg/libmad-0.15.1b.tar.gz
    tar -xf libmad-0.15.1b.tar.gz
    cp -f configure ./libmad-0.15.1b
    cd ./libmad-0.15.1b
    make clean
    fi
    if [ ! "$CLEAN" == "1" ]; then
    cd ./libmad-0.15.1b
    fi
    ./configure --prefix=${ROOTFS_PATH}/usr --build=`uname -m` --host=arm-linux --enable-fpm=arm --enable-shared
    make -j3
    make -j3 install


 Make the install script executable, then you can now install it by the
following command:

    chmod a+x installmad.sh
    CLEAN=1 ./installmad.sh


 that should install the appropriate headers and libs into
ROOTFS\_PATH/usr/include and /lib respectively.


 You can now get on with preparing an install.sh file for SDL\_mixer, so
once again, copy and paste the following into your favourite text
editor:

    #!/bin/bash
    export CFLAGS='-I${ROOTFS_PATH}/usr/include -I${ROOTFS_PATH}/usr/include/SDL'
    export LD_FLAGS='-L${ROOTFS_PATH}/usr/lib'
    export CC=arm-linux-uclibcgnueabi-gcc
    export CXX=arm-linux-uclibcgnueabi-g++
    if [ "$CLEAN" == "1" ]; then
    rm -rf ./SDL_mixer-1.2.11
    rm ./SDL_mixer-1.2.11.tar.gz
    wget http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.11.tar.gz
    tar -xf SDL_mixer-1.2.11.tar.gz
    fi
    cd ./SDL_mixer-1.2.11
    ./configure --prefix=${ROOTFS_PATH}/usr --build=`uname -m` --host=arm-linux --enable-shared --enable-music-wave --enable-music-mp3-mad-gpl --disable-music-mp3 --disable-smpegtest --disable-music-mod --libdir=${ROOTFS_PATH}/usr/lib --includedir=${ROOTFS_PATH}/usr/include --with-sdl-prefix=${ROOTFS_PATH}/usr/
    make -j3
    make -j3 install


 name the file install.sh save the file to
PROJECT\_PATH/packages/SDLmixer.

now Make the script executable, compile and install the SDL\_mixer
library, type the following at the command line:

    chmod a+x install.sh
    CLEAN=1 ./install.sh


 Once that has finished you should have the library files and the
headers in the \$ROOTFS\_PATH/usr/lib and /include folders.

to compile an app do something like:

    arm-linux-uclibcgnueabi-gcc -o mysdlApp mysdlApp.c -I/home/didj/Source/kernel/explorer/rootfs/usr/include/ -L/home/didj/Source/kernel/explorer/rootfs/usr/lib -lSDL -lSDL_mixer -lmad -lpthread

and don't forget to include the SDL\_mixer.h file in your app:

    #include "SDL/SDL_mixer.h"


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

