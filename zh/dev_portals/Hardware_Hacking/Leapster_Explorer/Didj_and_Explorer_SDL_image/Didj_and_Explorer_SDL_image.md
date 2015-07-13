> From: [eLinux.org](http://eLinux.org/Didj_and_Explorer_SDL_image "http://eLinux.org/Didj_and_Explorer_SDL_image")


# Didj and Explorer SDL image



How to install SDL\_Image library

A short tutorial on how to build, install and get started with the
SDL\_Image handling library, adding .jpg and .png support to your
apps/games.

I'd like to thank Nirvous, NullMoogleCable, PhillKll, Claude, JKent,
Jburks, GrizzlyAdams and anyone I may have forgotten for their help :)

Prerequisites

    A working toolchain
    LX Kernel sources and ThirdParty tarball unpacked to your harddrive
    correct environment variables set
    zlib (installed as part of this tutorial)
    libpng (installed as part of this tutorial)
    libjpg (installed as part of this tutorial)
    libSDL (should already be installed)



SDL\_Image requires a few libraries to be installed, namely the image
formats that you want supported and any libraries they are dependent on.
I have chosen libjpg as its a very popular format and libpng as we
already have .png files on the Didj/LX.

Luckily for us, all 3 of these libraries are provided for us, zlib and
libpng are in the packages directory and libjpeg is part of the Third
Party tarball.

**Installing zlib and libpng**

* * * * *

first we need to install zlib, this is the same procedure used for all
/package apps. go to your /packages directory, make sure your env vars
are set correctly and do:

    ./install.sh

you should end up with the headers and lib files in their appropriate
directories under ROOTFS\_PATH/usr/include and /lib respectively.

Do the same for libpng:

    ./install.sh



**Installing libjpeg**

* * * * *

go to where you unpacked the ThirdParty folder, I unpacked mine into the
same folder that /scripts and /packages are in the LX kernel sources.
Next go into the /libJPEG/Source folder.

Now do the usual to start the installation, slightly different filename
this time though:

    CLEAN=1 ./setup-libjpeg.sh

the libJPEG lib and header files should be in ROOTFS\_PATH/usr/lib and
/include folders respectively.


 Now that we have the libs and headers installed we can go ahead and
make our SDL\_image library, to do this we will need a folder in
PROJECT\_PATH/packages and an install.sh file, so make the directory and
enter it:

    mkdir $PROJECT_PATH/packages/SDLimage
    cd $PROJECT_PATH/packages/SDLimage


 Copy the following and paste it into a text file, save it as install.sh
in your \$PROJECT\_PATH/packages/SDLimage folder:

    #!/bin/bash
    export CFLAGS='-I${ROOTFS_PATH}/usr/include -I${ROOTFS_PATH}/usr/include/SDL'
    export LD_FLAGS='-L${ROOTFS_PATH}/usr/lib'
    export CC=arm-linux-uclibcgnueabi-gcc
    export CXX=arm-linux-uclibcgnueabi-g++
    if [ "$CLEAN" == "1" ]; then
    rm -rf ./SDL_image-1.2.10
    rm ./SDL_image-1.2.10.tar.gz
    wget http://www.libsdl.org/projects/SDL_image/release/SDL_image-1.2.10.tar.gz
    tar -xf SDL_image-1.2.10.tar.gz
    fi
    cd ./SDL_image-1.2.10
    ./configure CPPFLAGS="-I${ROOTFS_PATH}/usr/include" --prefix=$ROOTFS_PATH/usr --build=`uname -m` --host=arm-linux --enable-shared --with-sdl-prefix=${ROOTFS_PATH}/usr --libdir=${ROOTFS_PATH}/usr/lib --includedir= ${ROOTFS_PATH}/usr/include --enable-jpg
    make -j3
    make -j3 install

next you just have to run the install.sh script (make sure your
environment variables are set):

    CLEAN=1 ./install.sh

this should now build and install SDL\_Image to your
ROOTFS\_PATH/usr/lib and include folders, if you want to add other
libraries, then compile and install them (use the install.sh files for
libjpg and libpng for hints on what to do), then re-run the
SDLimage/install.sh file again


 You can now build an app with SDL\_image support by adding the
following to your .c file:

    #include "SDL/SDL_image.h"

and to compile an app with SDL\_image support, try the following:

    arm-linux-uclibcgnueabi-gcc -o mysdlApp mysdlApp.c -I${ROOTFS_PATH}/usr/include -L${ROOTFS_PATH}/usr/lib -lSDL -lSDL_image -ljpeg -lpng -lz -lpthread

Obviously change the arm-linux-uclibcgnueabi-gcc to your chosen cross
compiler. If you added extra image formats don't forget to add a -l for
each extra lib and support lib that is needed.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

