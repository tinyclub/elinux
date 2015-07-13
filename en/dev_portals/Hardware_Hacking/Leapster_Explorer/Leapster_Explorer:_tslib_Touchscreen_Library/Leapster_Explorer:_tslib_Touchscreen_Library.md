> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_tslib_Touchscreen_Library "http://eLinux.org/Leapster_Explorer:_tslib_Touchscreen_Library")


# Leapster Explorer: tslib Touchscreen Library



## Background

Tslib is an abstraction layer for touchscreen panel events, as well as a
filter stack for the manipulation of those events. Examples of
implemented filters include jitter smoothing and the calibration
transform. Tslib is generally used on embedded devices to provide a
common user space interface to touchscreen functionality.

## Building tslib

Follow the steps below to build tslib for Leapster Explorer. (We
leverage the existing event device)

Download tslib from the github repository:

    git clone http://github.com/kergoth/tslib.git


 In the tslib directory, create a folder called build:

    cd tslib
    mkdir build


 Set up your cross compiler's environment variables accordingly (ex:
source crosscompile)

First time configuration requires that you run tslib autogen.sh script
to generate configure script:

    ./autogen.sh


 Now you can configure the compilation:

    ./configure --build=i386-linux --host=arm-linux --target=arm --prefix=$PWD/build

**fix ts\_calibrate app** before you compile tslib you need to edit one
of the test applications, ts\_calibrate, otherwise it doesn't quite
calibrate properly, edit lines 238-244 so they look like the following:

       get_sample (ts, &cal, 0, 10,        10,        "Top left");
        clearbuf(ts);
        get_sample (ts, &cal, 1, xres - 10, 10,        "Top right");
        clearbuf(ts);
        get_sample (ts, &cal, 2, xres - 10, yres - 10, "Bot right");
        clearbuf(ts);
        get_sample (ts, &cal, 3, 10,        yres - 10, "Bot left");

Now you've changed the screen position of the calibration boxes closer
to the corners it should calibrate a lot nicer than it did.

Compile tslib

    make

Populate the build directory with the result

    make install

edit .build/etc/ts.conf file and change line 2 so it looks like this:

    module_raw input

Copy the etc/ts.conf file to the LX in the /etc directory.

Copy the contents of lib to the LX in the /usr/lib directory.

Copy the contents of bin to the LX into a directory of your choosing.


 Add the following lines to the LX file called /etc/profile:

` `

    export TSLIB_TSEVENTTYPE=INPUT
    export TSLIB_CONSOLEDEVICE=none
    export TSLIB_FBDEVICE=/dev/fb0
    export TSLIB_TSDEVICE=/dev/input/event3
    export TSLIB_CALIBFILE=/etc/pointercal
    export TSLIB_CONFFILE=/etc/ts.conf
    export TSLIB_PLUGINDIR=/usr/lib/ts

Then, 'source' the file:

    . /etc/profile

Once that is done, boot the fbdev kernel, modprobe lf1000\_ts, then run
ts\_calibrate and ts\_test.

To include this library in your applications: Copy the contents of lib
to your compiler's lib directory (in buildcross: sys-root/usr/lib) Copy
the contents of include to your compiler's include directory (in
buildcross: sys-root/usr/include)

## To Do

Using tslib in your applications.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")

