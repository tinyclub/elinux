> From: [eLinux.org](http://eLinux.org/Didj_and_Explorer_SDL_ttf "http://eLinux.org/Didj_and_Explorer_SDL_ttf")


# Didj and Explorer SDL ttf



this is a very short tutorial on how to compile and install TrueType
font support for the SDL library.

I'd like to thank Nirvous, NullMoogleCable, PhillKll, Claude, JKent,
Jburks, GrizzlyAdams and anyone I may have forgotten for their help :)

**Pre-requisites**

    A working toolchain (see the front page)
    the leapfrog 2.6.31 sources
    A working installation of libSDL would be useful
    an internet connection
    freetype font library

It is fairly simple to install SDL\_ttf, it requires freetype to be
installed as well, so we will do both from their own folder in the
packages directory, so browse to your kernel sources, go to the packages
folder and make 2 new folders:

    mkdir SDL_ttf freetype


 copy the following into a a text editor and save it into the freetype
folder as install.sh

    #!/bin/bash
    export CFLAGS='-I${ROOTFS_PATH}/usr/include -I${ROOTFS_PATH}/usr/include/SDL'
    export LD_FLAGS='-L${ROOTFS_PATH}/usr/lib'
    export CC=arm-linux-uclibcgnueabi-gcc
    export CXX=arm-linux-uclibcgnueabi-g++
    if [ "$CLEAN" == "1" ]; then
    rm -rf ./SDL_ttf-2.0.10
    rm ./SDL_ttf-2.0.10.tar.gz
    wget http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-2.0.10.tar.gz
    tar -xf SDL_ttf-2.0.10.tar.gz
    fi
    cd ./SDL_ttf-2.0.10
    ./configure --prefix=${ROOTFS_PATH}/usr --build=`uname -m` --host=arm-linux --enable-shared --libdir=${ROOTFS_PATH}/usr/lib --includedir=${ROOTFS_PATH}/usr/include --without-x --disable-opengl --with-sdl-prefix=${ROOTFS_PATH}/usr/
    make -j3
    make -j3 install


 Now do the same for SDL\_ttf and save it into the SDL\_ttf folder as
install.sh ` `

    #!/bin/bash
    export CFLAGS='-I${ROOTFS_PATH}/usr/include -I${ROOTFS_PATH}/usr/include/SDL'
    export LD_FLAGS='-L${ROOTFS_PATH}/usr/lib'
    export CC=arm-linux-uclibcgnueabi-gcc
    export CXX=arm-linux-uclibcgnueabi-g++
    if [ "$CLEAN" == "1" ]; then
    rm -rf ./SDL_ttf-2.0.10
    rm ./SDL_ttf-2.0.10.tar.gz
    wget http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-2.0.10.tar.gz
    tar -xf SDL_ttf-2.0.10.tar.gz
    fi
    cd ./SDL_ttf-2.0.10
    ./configure --prefix=${ROOTFS_PATH}/usr --build=`uname -m` --host=arm-linux --enable-shared --libdir=${ROOTFS_PATH}/usr/lib --includedir=${ROOTFS_PATH}/usr/include --without-x --disable-opengl --with-sdl-prefix=${ROOTFS_PATH}/usr/
    make -j3
    make -j3 install

As long as you have your environment variables set you should now be
able to start compiling/installing the freetype lib which is needed by
SDL\_ttf.

go into the freetype directory and type:

    CLEAN=1 ./install.sh

Once its done you should have the freetype headers in your
ROOTFS\_PATH/usr/include and the libs in ROOTFS\_PATH/usr/lib, if they
are there you are now ready to compile SDL\_ttf.


 Same procedure here, go into the SDL\_ttf directory and type:

    CLEAN=1 ./install.sh


 that should put your headers and libs into their appropriate places in
ROOTFS\_PATH/usr/include and /lib

if you ever want to build either lib again, you can omit the CLEAN=1
from the ./install.sh command, unless of course you want to build from
scratch.

to use the libs add the following to your .c file:

    #include "SDL/SDL_ttf.h"

and to compile use something like this:

    arm-linux-uclibcgnueabi-gcc -o testttf testttf.c -I${ROOTFS_PATH}/usr/include/ -L${ROOTFS_PATH}/usr/lib -lSDL -lSDL_ttf -lfreetype -lpthread


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

