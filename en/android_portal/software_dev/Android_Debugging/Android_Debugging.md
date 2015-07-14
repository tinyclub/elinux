> From: [eLinux.org](http://eLinux.org/Android_Debugging "http://eLinux.org/Android_Debugging")


# Android Debugging



Debugging methods for Android

## Contents

-   [1 Debuggers](#debuggers)
    -   [1.1 Kernel and User co-debug with GDB on
        Android](#kernel-and-user-co-debug-with-gdb-on-android)
-   [2 loggers](#loggers)
    -   [2.1 kernel message log](#kernel-message-log)
        -   [2.1.1 init logging](#init-logging)
    -   [2.2 Android logging system](#android-logging-system)
-   [3 tracers](#tracers)
    -   [3.1 strace](#strace)
    -   [3.2 Dalvik Method Tracer](#dalvik-method-tracer)
-   [4 Additional Resources](#additional-resources)

## Debuggers

### Kernel and User co-debug with GDB on Android

This presentation covers lots of Android debug resources provided by
Linaro, presented by Zach Pfeffer in Spring 2012. Included is
information about how to debug kernel and user simultaneously with gdb.

See [Media:Zach Pfeffer Next Gen Android
2012.pdf](http://eLinux.org/images/4/4e/Zach_Pfeffer_Next_Gen_Android_2012.pdf "Zach Pfeffer Next Gen Android 2012.pdf")

## loggers

### kernel message log

The Linux kernel has a message log in an internal ring buffer. You can
access the contents of this log using the
['dmesg'](http://en.wikipedia.org/wiki/Dmesg) command.

You can add timing information to the printk messages, by adding "time"
to the Linux kernel command line.

#### init logging

The Android init program outputs some messages to the kernel log, as it
starts the system. You can increase the verbosity of init, using the
"loglevel" command in the /init.rc file.

The default loglevel is 3, but you can change it to 8 (the highest) by
changing the following line in the /init.rc file. Change:

    loglevel 3

to

    loglevel 8

### Android logging system

The Android application framework has a built-in logging system, which
goes through a special driver in the kernel. It is described
at:[http://developer.android.com/guide/developing/tools/adb.html\#logcat](http://developer.android.com/guide/developing/tools/adb.html#logcat)

Note that although the log dumper (logcat) is described on the Android
developer site on the 'adb' page, there is a native logcat command
included in the Android distribution (that is, available on the target
file system, which can be run locally).

## tracers

### strace

You can use [strace](http://en.wikipedia.org/wiki/Strace) on Android. It
is included in the Android open source project (at least as of Android
2.1), and appears to be automatically installed in engineering builds of
the software.

To use strace during early initialization, you can put it in the
/init.rc file. For example, to trace zygote initialization, change the
following line in /init.rc.

    service zygote /system/bin/app_process -Xzygote /system/bin --zygote --start-system-server

should be changed to:

    service zygote /system/xbin/strace -tt -o/data/boot.strace /system/bin/app_process -Xzygote /system/bin --zygote --start system-server

### Dalvik Method Tracer

See
[http://developer.android.com/guide/developing/tools/traceview.html](http://developer.android.com/guide/developing/tools/traceview.html)



## Additional Resources

-   [Google I/O 2009 - Debugging Arts of the Ninja Masters
    (video)](http://www.youtube.com/watch?v=Dgnx0E7m1GQ&feature=related)
    by Justin Mattson


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

