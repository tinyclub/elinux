> From: [eLinux.org](http://eLinux.org/Devkit8000_QT "http://eLinux.org/Devkit8000_QT")


# Devkit8000 QT



This page introduced how to port QT on [Embest](http://www.armkits.com)
[Devkit8000](http://eLinux.org/Devkit8000 "Devkit8000") board.

## Contents

-   [1 Environment](#environment)
    -   [1.1 Hardware](#hardware)
    -   [1.2 Software development
        environment=](#software-development-environment-3d)
-   [2 Compile](#compile)
    -   [2.1 Preparations](#preparations)
    -   [2.2 Configuration](#configuration)
    -   [2.3 Compile & Installation](#compile-26-installation)
-   [3 Test](#test)
    -   [3.1 Preparations](#preparations-2)
    -   [3.2 Run](#run)
    -   [3.3 Compile example programs](#compile-example-programs)

# Environment

## Hardware

Item Name: [Devkit8000](http://eLinux.org/Devkit8000 "Devkit8000")
 CPU: TI OMAP3530
 DDR SDRAM: 256MB
 Nand Flash: 256MB
 Vendor: [Embest](http://www.armkits.com)
 DevKit8000 technical Wiki:
[http://elinux.org/Devkit8000](http://elinux.org/Devkit8000)
 DevKit8000 webpage:
[http://www.armkits.com/Product/devkit8000.asp](http://www.armkits.com/Product/devkit8000.asp)

## Software development environment=

1. ubuntu 8.04
 2.
qtopia-core-opensource-src-4.3.5([http://www.qtcn.org/bbs/read.php?tid=3144&page=1&fpage=1](http://www.qtcn.org/bbs/read.php?tid=3144&page=1&fpage=1))
 3. arm-none-linux-gnueabi-2007q3

# Compile

## Preparations

1.  tar xvf qtopia-core-opensource-src-4.3.5.tar.gz
2.  cd qtopia-core-opensource-src-4.3.5

Modify mkspecs/qws/linux-arm-g++/qmake.conf file, replace all arm-linux
by arm-none-linux-gnueabi

## Configuration

1.  ./configure -embedded arm -xplatform qws/linux-arm-g++ -depths
    4,8,16,32 -no-qt3support -prefix \${HOME}/work/qt/target -fast
    -qt-sql-sqlite -no-libtiff -no-libmng -qt-libjpeg -qt-zlib
    -qt-libpng -qt-freetype -optimized-qmake -no-nis
    -no-separate-debug-info -no-qvfb -qt-gfx-linuxfb -no-gfx-qvfb
    -qt-kbd-usb -no-kbd-qvfb -no-mouse-qvfb -no-mouse-linuxtp
    -qt-mouse-pc -qt-mouse-tslib

## Compile & Installation

1.  make
2.  make install

# Test

## Preparations

1. Copy \${HOME}/work/qt/target/lib folder to Devkit8000 /opt/qtopia
folder;
 2. Remove unnecessary words in folder /opt/qtopia/lib/fonts (only
remain cour.pfa and cursor.pfa)
 3. Set environment variables
 export QTOPIA=/opt/qtopia
 export LD\_LIBRARY\_PATH=\$QTOPIA/lib:\$LD\_LIBRARY\_PATH
 export PATH=\$QTOPIA/bin:\$PATH
 export QWS\_MOUSE\_PROTO=tslib:/dev/input/event1
 export QWS\_DISPLAY="LinuxFb:mmWidth100:mmHeight130:0"
 export TSLIB\_TSDEVICE=/dev/input/event1
 export TSLIB\_PLUGINDIR=/lib/ts

## Run

Copy \${HOME}/work/qt/target/examples/tutorial/t1/t1 to Devkit8000
folder /opt/qtopia/bin

1.  /opt/qtopia/bin/t1 -qws(show helloworld interface)

* * * * *



## Compile example programs

1. Copy target/bin/qmake to folder /bin and rename to qmake-arm;
 2. Create new folder "test" under target/examples/tutorial, and then
copy cpp programs to this folder;
 3. Get into this folder
 cd target/examples/tutorial/test
 4. Run command (pay attention to setting cross compile tool provided by
[Embest](http://www.armkits.com)）
 \$ qmake-arm -project
 \$ qmake-arm
 \$ make


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")
-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")
-   [Devkit8000](http://eLinux.org/Category:Devkit8000 "Category:Devkit8000")

