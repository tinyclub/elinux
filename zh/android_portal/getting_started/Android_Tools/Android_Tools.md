> From: [eLinux.org](http://eLinux.org/Android_Tools "http://eLinux.org/Android_Tools")


# Android Tools



Here are some development tools useful for working with Android

## Contents

-   [1 Android SDK](#android-sdk)
    -   [1.1 host-side tools](#host-side-tools)
        -   [1.1.1 adb](#adb)
            -   [1.1.1.1 Running adbd on non-Android
                systems](#running-adbd-on-non-android-systems)
        -   [1.1.2 aapt](#aapt)
        -   [1.1.3 ddms](#ddms)
        -   [1.1.4 Fastboot](#fastboot)
        -   [1.1.5 Toolchains](#toolchains)
        -   [1.1.6 Emulator](#emulator)
        -   [1.1.7 traceview](#traceview)
    -   [1.2 target-side tools](#target-side-tools)
        -   [1.2.1 am](#am)
        -   [1.2.2 dumpstate](#dumpstate)
        -   [1.2.3 logcat](#logcat)
        -   [1.2.4 monkey](#monkey)
        -   [1.2.5 procrank](#procrank)
        -   [1.2.6 service](#service)
        -   [1.2.7 sqlite3](#sqlite3)
        -   [1.2.8 toolbox](#toolbox)
-   [2 other tools](#other-tools)
    -   [2.1 agcc](#agcc)
    -   [2.2 bootchart](#bootchart)
    -   [2.3 busybox](#busybox)
    -   [2.4 smem](#smem)
    -   [2.5 strace](#strace)
-   [3 Eclipse](#eclipse)
-   [4 Hardware](#hardware)
    -   [4.1 Serial Cable for G1](#serial-cable-for-g1)

## Android SDK

### host-side tools

#### adb

adb is the android debugger - it also doubles as file transfer agent.
The setup consists of an `adbd` on the target in the `/sbin` directory.
On the host two programs are run: the `adb` application (in the SDK's
`tools` directory) and an adb server, started by the adb application.

For emulators, adb will usually run automagically.

For real boards - with debugging over USB, you might need to do work, as
is documented here:
[http://developer.android.com/guide/developing/device.html\#setting-up](http://developer.android.com/guide/developing/device.html#setting-up)
.

For real boards that do not have a USB connection but have Ethernet
instead, you might need to do a few tricks.

-   make sure that adbd runs on the board. If it doesn't run, you might
    want to check the `init.rc` file.
-   make sure that the network connection between host and the board is
    working - test pinging both ways.
-   on the host, type the following (you need to specify the board's IP
    address on the host):

<!-- -->

      ADBHOST=<target-ip> tools/adb kill-server
      ADBHOST=<target-ip> tools/adb shell

-   you should now get a prompt on the board, you can exit the prompt if
    you want.
-   `tools/adb devices` should now list the device.

##### Running adbd on non-Android systems

It is sometimes useful to use adbd on non-Android embedded Linux
systems. Here is a patch that can be applied to adb (source as of
2014-04-05) to change it to avoid "Android-isms" in the build.
Instructions are in a README.NONANDROID.TXT file.

[File:0001-Add-support-for-non-Android-use-of-adbd.patch](http://eLinux.org/File:0001-Add-support-for-non-Android-use-of-adbd.patch "File:0001-Add-support-for-non-Android-use-of-adbd.patch")

This patch can be applied to your adb source by cd'ing to the directory
/system/core/adb, applying the patch with:

    $ git am 0001-Add-support-for-non-Android-use-of-adbd.patch

#### aapt

The Android Asset Packaging Tool is used to create, inspect and manage
Android packages.

You can use this to see details about a package, it's resources, and xml
information.

The [Android developer page on
aapt](http://developer.android.com/guide/developing/tools/aapt.html) is
somewhat meager.

See [Android aapt](http://eLinux.org/Android_aapt "Android aapt") for substantially more
information.

#### ddms

The Dalvik Debug Monitor Server is a host-based tool which interacts
with and Android target system and can show numerous bits of
information, including the log, cpu and memory utilization, and lots of
details about individual processes.

See the [DDMS developer
guide](http://developer.android.com/guide/developing/tools/ddms.html)



#### Fastboot

[Android Fastboot](http://eLinux.org/Android_Fastboot "Android Fastboot") is a tool to
boot and manipulate the partitions on an Android development phone.

#### Toolchains

Android provides pre-built toolchains (C/C++ compilers and linkers), but
requires the installation of a java compiler (JDK) from an external
source.

As of NDK version r5 (December 2010), the toolchains can now be used in
standalone cross-compiler mode. See docs/STANDALONE-TOOLCHAIN.html in
the NDK for information about this. Previously, the toolchains could be
used within the build system, but it was difficult and error prone to
compile native programs outside the Android build system with them.

#### Emulator

-   Emulator - See
    [http://developer.android.com/guide/developing/tools/emulator.html](http://developer.android.com/guide/developing/tools/emulator.html)

The emulator is a version of QEMU, which mimics the instruction set of
an ARM processor, and the hardware that one might find on a mobile
phone. The emulator runs on an x86 system, but executes an ARM linux
kernel and programs. The flow of control is:

-   -   application -\>
    -   dalvik VM -\>
    -   C/C++ libraries -\>
    -   ARM linux kernel -\>
    -   emulated instructions and hardware (QEMU)-\>
    -   C libraries-\>
    -   x86 kernel -\>
    -   real hardware

#### traceview

-   Google's main page describing traceview:
    [http://developer.android.com/guide/developing/tools/traceview.html](http://developer.android.com/guide/developing/tools/traceview.html)
-   [http://www.bottomlesspit.org/file\_download/2/Android\_SDK\_Traceview\_tool.pdf](http://www.bottomlesspit.org/file_download/2/Android_SDK_Traceview_tool.pdf)
    - good overview presentation by Olivier Bilodeau
    -   presentation with speaker notes:
        [http://www.bottomlesspit.org/file\_download/3/Android\_SDK\_Traceview\_tool\_w\_speakernotes.pdf](http://www.bottomlesspit.org/file_download/3/Android_SDK_Traceview_tool_w_speakernotes.pdf)
-   [Performance Tuning Android
    Applications](http://newfoo.net/2009/04/18/performance-tuning-android-applications.html)
    - straightforward article discussing traceview use to find an
    application bottleneck. April 2009.

### target-side tools

#### am

Activity Manager - can be used to start applications at the command
line, or send intents to running applications.

#### dumpstate

dumps the state of the system. It scans the /proc filesystem, and
collects various system properties, and puts them in a single report,
suitable for sending to someone for support or development help.

#### logcat

This is the user tool for accessing the Android system log. This is
implemented at a special option in adb (I'm not sure what the difference
is between "adb logcat" and "adb shell logcat")

You can find lots of information about logcat on the [Android
logger](http://eLinux.org/Android_logger "Android logger") page, and at
[http://developer.android.com/guide/developing/tools/adb.html\#logcat](http://developer.android.com/guide/developing/tools/adb.html#logcat)

#### monkey

#### procrank

procrank shows a listing of processes on the system, sorted by one of
the memory utilization metrics. See [Android Memory
Usage\#procrank](http://eLinux.org/Android_Memory_Usage#procrank "Android Memory Usage")

#### service

Can be used to send an individual service message.

    Usage: service [-h|-?]
           service list
           service check SERVICE
           service call SERVICE CODE [i32 INT | s16 STR] ...
    Options:
       i32: Write the integer INT into the send parcel.
       s16: Write the UTF-16 string STR into the send parcel.

On one forum, I saw that you could switch between portrait and landscape
with:

    $ service call window 18 i32 1 # to set to landscape on the emulator
    $ service call window 18 i32 0 # to set to portrait on the emulator

service list will show a list of different services that can be
communicated with.

#### sqlite3

sqlite3 is a command-line database client program, for manipulating
sqlite databases.

See
[http://www.higherpass.com/Android/Tutorials/Accessing-Data-With-Android-Cursors/](http://www.higherpass.com/Android/Tutorials/Accessing-Data-With-Android-Cursors/)
for a tutorial and some examples of using sqlite.

#### toolbox

toolbox is the equivalent of busybox on an Android system. That is, it
is a multi-function program that provides many difference commands from
a single binary. this includes things like: ps, ls, top, stop, start -
commands to stop and start services on an Android system

See [Android toolbox](http://eLinux.org/Android_toolbox "Android toolbox") for details
about individual commands.

## other tools

### agcc

-   [agcc](http://plausible.org/andy/agcc) - A wrapper tool for
    compiling native Android apps (linked directly to bionic)
    -   See
        [http://android-tricks.blogspot.com/2009/02/hello-world-c-program-on-using-android.html](http://android-tricks.blogspot.com/2009/02/hello-world-c-program-on-using-android.html)

### bootchart

-   See [Using Bootchart on
    Android](http://eLinux.org/Using_Bootchart_on_Android "Using Bootchart on Android")

### busybox

Android ships with a utility suite (called 'toolbox') that is not
busybox.

You can get a binary busybox for Android
[here](http://benno.id.au/blog/2007/11/14/android-busybox) The site
includes instructions for easy installation on your device.

If you're interested in including busybox into a platform build:

-   precompiled binaries
    [here](https://github.com/Gnurou/busybox-android)
-   a
    [presentation](https://video.linux.com/videos/busybox-integration-on-android)
    on how to build (or not) and integrate busybox into platform build
    (slides available
    [here](https://events.linuxfoundation.org/images/stories/pdf/lf_abs12_sun.pdf)).

### smem

-   smem - smem is a tools for analyzing the memory usage on a system
    -   See [Using smem on
        Android](http://eLinux.org/Using_smem_on_Android "Using smem on Android") for
        more information

### strace

-   strace
    -   Statically linked binary available at:
        [http://benno.id.au/blog/2007/11/18/android-runtime-strace](http://benno.id.au/blog/2007/11/18/android-runtime-strace)
    -   Instructions for building Android strace -
        [http://discuz-android.blogspot.com/2008/01/create-google-android-strace-tool.html](http://discuz-android.blogspot.com/2008/01/create-google-android-strace-tool.html)

## Eclipse

The officially supported integrated development environment (IDE) is
[Eclipse](http://www.eclipse.org/) (currently 3.4 or 3.5) using the
Android Development Tools (ADT) Plugin, though developers may use any
text editor to edit Java and XML files then use command line tools (Java
Development Kit and Apache Ant are required) to create, build and debug
Android applications as well as control attached Android devices (e.g.,
triggering a reboot, installing software package(s) remotely).

## Hardware

### Serial Cable for G1

You can build a serial cable to use with the G1, which is helpful to see
kernel boot messages on the serial console.

See
[http://www.instructables.com/id/Android\_G1\_Serial\_Cable](http://www.instructables.com/id/Android_G1_Serial_Cable)

Back to [Android Portal](http://eLinux.org/Android_Portal "Android Portal")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

