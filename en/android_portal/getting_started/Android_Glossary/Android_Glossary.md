> From: [eLinux.org](http://eLinux.org/Android_Glossary "http://eLinux.org/Android_Glossary")


# Android Glossary



Here are some Android terms (some even with definitions!!)

See also the developer glossary at:
[http://developer.android.com/guide/appendix/glossary.html](http://developer.android.com/guide/appendix/glossary.html)

Back to [Android Portal](http://eLinux.org/Android_Portal "Android Portal")

## Contents

-   [1 A](#a)
-   [2 B](#b)
-   [3 C](#c)
-   [4 D](#d)
-   [5 E](#e)
-   [6 F](#f)
-   [7 G](#g)
-   [8 H](#h)
-   [9 I](#i)
-   [10 J](#j)
-   [11 K](#k)
-   [12 L](#l)
-   [13 M](#m)
-   [14 N](#n)
-   [15 O](#o)
-   [16 R](#r)
-   [17 S](#s)
-   [18 T](#t)
-   [19 V](#v)
-   [20 W](#w)
-   [21 Z](#z)

## A

 [aapt](http://eLinux.org/Android_aapt "Android aapt") 
Android Asset Packaging Tool - a tool for creating, inspecting and
modifying Android application packages.

 Activity 
A single focused thing the user can do on an Android device. Also, a
java class in the Android framework, which is used as the superclass for
an Activity implementation. See
[http://developer.android.com/reference/android/app/Activity.html](http://developer.android.com/reference/android/app/Activity.html).
"An Activity presents a visual user interface for one focused endeavor
the user can undertake." See Activity on the page:
[http://developer.android.com/guide/topics/fundamentals.html](http://developer.android.com/guide/topics/fundamentals.html)

 adb 
Android Debug Bridge - a tool for communicating between the host and a
target Android system (including an emulator running on the host). See
[http://developer.android.com/guide/developing/tools/adb.html](http://developer.android.com/guide/developing/tools/adb.html)

 ADP1 
Android Developer Phone 1

 ANR 
Application Not Responding - this is a type of bug where Android
believes a process has hung. The system may kill the process, and leave
information about it in /data/anr for post-mortem analysis.

 Android 
A robot resembling a human being - the name of the operating system
produced by Google for mobile phones. Apparently, Andy Rubin, one of the
original founders of Android, Inc. loves robots.

 AndroidManifest.xml 
A file describing the contents, permissions and other attributes of an
Android application package. See
[http://developer.android.com/guide/topics/manifest/manifest-intro.html](http://developer.android.com/guide/topics/manifest/manifest-intro.html)

 Android, Inc. 
A company founded by Andy Rubin and others to create a mobile phone
operating system. Android, Inc. was acquired by Google in 2005.

 ASE 
Android Scripting Environment - the old name of Scripting Layer for
Android. See [Android Scripting](http://eLinux.org/Android_Scripting "Android Scripting")

## B

 Binder 
An Interprocess Communication (IPC) mechanism. See
[http://cs736-android.pbworks.com/IPC-Binder](http://cs736-android.pbworks.com/IPC-Binder)
and
[http://groups.google.com/group/android-developers/msg/dc0e0e872de9b0d2](http://groups.google.com/group/android-developers/msg/dc0e0e872de9b0d2)

 Bionic 
small C library used in Android devices

 Bootchart 
A mechanism to create visual charts of a Linux boot sequence, including
the timing of process start and execution. See [Using Bootchart on
Android](http://eLinux.org/Using_Bootchart_on_Android "Using Bootchart on Android")

## C

 Cliq 
The US name for the Motorola Android phone.

 Content Provider 
An piece of software on an Android system that provides information
(content) to other software elements. See
[http://developer.android.com/guide/topics/providers/content-providers.html](http://developer.android.com/guide/topics/providers/content-providers.html).
Also, a class which is the superclass for code which acts as a content
provider. See the [ContentProvider class
documentation](http://developer.android.com/reference/android/content/ContentProvider.html)

 Cupcake 
The code name for Android version 1.5.

## D

 Dalvik 
Virtual Machine in which Android applications are run. This VM executes
Dalvik bytecode, which is compiled from programs written in the Java
language. Note that the Dalvik VM is not a Java VM (JVM).

Every Android application runs in its own process, with its own instance
of the Dalvik virtual machine. Dalvik has been written so that a device
can run multiple VMs efficiently. The Dalvik VM executes files in the
Dalvik Executable (.dex) format which is optimized for minimal memory
footprint. The VM is register-based, and runs classes compiled by a Java
language compiler that have been transformed into the .dex format by the
included "dx" tool.

See [Android Dalvik VM](http://eLinux.org/Android_Dalvik_VM "Android Dalvik VM") for more
information

 Donut 
The code name for Android version 1.6

 Dream 
Code name for the mobile phone hardware publicly called the t-Mobile G1,
in the United States.

 Droid 
The name for an upcoming Android phone by Motorola (I believe this is
the high-end phone, and Cliq is the low-end phone?)

## E

 Eclair 
The code name for Android version 2.1

## F

 fastboot 
a program which communicates with the developer firmware, and which is
capable of loading new software on the ADP1 phone (including re-writing
the flash partitions on the device). See [Android
Fastboot](http://eLinux.org/Android_Fastboot "Android Fastboot")

 FreeType 
An open-source set of fonts and font system

 Froyo 
*Frozen Yogurt* - The code name for Android version 2.2

## G

 G1 
The name of the first Android-based mobile phone, from t-Mobile.

 Galaxy 
The name of the first Samsung Android phone

 Gingerbread 
The code name for Android version 2.3

 Goldfish 
The name of a virtual ARM platform provided by the emulator.

Goldfish executes ARM926T instructions and has hooks for input and
output -- such as reading key presses from or displaying video output in
the emulator. There is a "goldfish" configuration file for compiling the
Linux kernel to run with this emulated platform.

 Google 
A large web search company, and primary developer of Android

## H

 Honeycomb 
The code name for Android version 3.0 - especially targeted at table
computers

## I

 Ice Cream Sandwhich 
Android version 2.4 or 3.1 - the successor to Gingerbread and/or
Honeycomb (possibly indicating a development fork) See
[http://techcrunch.com/2011/01/11/android-ice-cream-sandwich/](http://techcrunch.com/2011/01/11/android-ice-cream-sandwich/)

 init 
the first user-space program run in the Android system. It is not a
standard Linux-style 'init' program (which processes an /etc/inittab
file). Rather, it processes a script called init.rc in the root
directory of the file system. See [Android
Booting\#'init'](http://eLinux.org/Android_Booting#.27init.27 "Android Booting")

 Intent 
A facility to send messages between different Android components. A
message is conveyed using an Intent object, which is a data structure
holding a description of an operation to be performed, or of something
that has happened and is being announced.

## J

 Java 
Java is a programming language originally developed by Sun, and used to
develop Android applications.

It is important to note that while the Java language is used for Android
applications, the Java bytecode and Java virtual machine are not. for
more information, see the entry for Dalvik.

 JDK 
Java Development Kit

 Jellybean 
The code name for Android versions 4.1, 4.2 and 4.3

 JNI 
Java Native Interface ([wikipedia
entry](http://wikipedia.org/wiki/Java_Native_Interface)) is a
programming framework that allows Java code to call or be called by
"native" code (that is, code compiled in another language such as C, C++
or assembly).

## K

 KitKat
The release name for Android version 4.4

## L

 Linux 
An open source operating system kernel, developed originally by Linus
Torvalds, but over time by many thousands of developers worldwide.

 Live-android 
A project to create an [Android
live-CD](http://code.google.com/p/live-android/), for running Android on
generic x86 platforms.

 logcat
A command to view messages in one of the system logs. See [Android
logger](http://eLinux.org/Android_logger "Android logger")

## M

 manifest file
See AndroidManifest.xml

 mahimahi
The machine name used in the kernel for the development board used for
the Nexus One product.

 MSM 
Mobile Station Modem. Chipset manufactured by Qualcomm. Can for instance
be found in cell phones containing the Snapdragon chipsets (HTC
Desire/Nexus One).

## N

 NDK 
[Native Development
Kit](http://developer.android.com/sdk/ndk/index.html). A set of tools,
build files and instructions to generate native code (usually libraries)
to be used with Android systems. Native libraries are most often used as
part of JNI (to allow Java code to call C code, or vice versa).

## O

 OpenGL ES 
3D graphics system and API for Android applications

## R

 repo 
Android repository manager. This is a wrapper program (written in
Python) over the git tool, for managing the multiple git repositories
that make up the entire Android code base. See
[http://source.android.com/download/using-repo](http://source.android.com/download/using-repo)

 rild 
Radio-Interface-Link daemon. This is the daemon which handles
communication between the rest of the Android system and the "radio
interface" (otherwise known as the phone portion of an Android-based
mobile phone system). In the simulator, since the phone hardware is not
present, there is a program which runs to simulate the radio interface.

## S

Saphire

 SL4A 
Scripting Layer for Android - an execution environment that let's users
use scripting languages (such as Python or Ruby), instead of Java, to
write programs for Android. See [Android
Scripting](http://eLinux.org/Android_Scripting "Android Scripting")

 SGL 
2D graphics layer for Android applications

 SQLite 
A powerful and lightweight relational database engine used by the
Android system components, and available to all Android applications.

## T

 TARGET\_PRODUCT 
An environment variable used by the build system to indicate the product
that the software should be built for. This and other TARGET\_\*
variables are set using the choosecombo() function in build/envsetup.sh.
If not set, the TARGET\_\* variables will use defaults when you run the
'm' alias, after source-ing build/envsetup.sh into your shell
environment. Otherwise, use the choosecombo() function to set them.

ex: \$ cd mydroid ; source build/envsetup.sh ; choosecombo

The options for TARGET\_PRODUCT depend on entries in the
AndroidProducts.mk files under build/target/products and
vendor/\*/\*/AndroidProducts.mk in your repository.

 toolbox 
The name of a multi-function program in the Android system. This program
contains code for the single program toolbox to act like several
different programs and utilities. Normally 'toolbox' is stored in
/system/bin, and is symlinked to other names. It uses argv[0] to
determine which program to behave like, when run. It is very similar in
this regard to 'busybox', which another multi-function program used in
many other embedded Linux systems.

 Trout 
ARM linux kernel machine ID for the HTC Dream hardware (used in the
t-Mobile G1 and the ADP1)

See
[http://www.arm.linux.org.uk/developer/machines/list.php?id=1440](http://www.arm.linux.org.uk/developer/machines/list.php?id=1440)

## V

 vold 
volume daemon - a process on an android system responsible for managing
mounting and unmounting file system (volumes)

## W

 wakelocks 
A kernel mechanism for Android power management. When a thread holds a
wakelock, the kernel will refrain from entering a low-power state.

Back to [Android Portal](http://eLinux.org/Android_Portal "Android Portal")

## Z

 zygote 
The first Dalvik virtual machine instance. All other java applications
that are started in the system are spawned from zygote.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

