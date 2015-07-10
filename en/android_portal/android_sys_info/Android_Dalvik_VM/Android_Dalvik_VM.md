> From: [eLinux.org](http://eLinux.org/Android_Dalvik_VM "http://eLinux.org/Android_Dalvik_VM")


# Android Dalvik VM



Dalvik is the name of the Virtual Machine in which Android applications
are run. This VM executes Dalvik bytecode, which is compiled from
programs written in the Java language. Note that the Dalvik VM is not a
Java VM (JVM).

Every Android application runs in its own process, with its own instance
of the Dalvik virtual machine.

At boot time, a single virtual machine, called 'zygote' is created,
which preloads a long list of classes. (As of Android version 2.1
(eclair), the list of classes preloaded by zygote had 1,942 entries).
All other "java" programs or services are forked from this process, and
run as their own process (and threads) in their own address space. Both
applications and system services in the Android framework are
implemented in "java".

Dalvik was written so that a device can run multiple VMs efficiently.
The Dalvik VM executes code in the Dalvik Executable (.dex) format which
is optimized for minimal memory footprint. The VM is register-based, and
runs classes compiled by a Java language compiler that have been
transformed into the .dex format by the included "dx" tool.

Most Android applications are delivered and stored on the system as
packages (.apks), which include both dex bytes code (classes and
methods) and resources. During first boot-up the system creates a cache
of dex classes in /data/dalvik-cache.

## Contents

-   [1 Documentation](#documentation)
-   [2 Q&A](#q-26a)
-   [3 JIT](#jit)
-   [4 Relationship to Java](#relationship-to-java)
-   [5 Dalvik on other platforms](#dalvik-on-other-platforms)
-   [6 Debugging the VM](#debugging-the-vm)
    -   [6.1 Getting stack traces](#getting-stack-traces)
    -   [6.2 Using checkJNI](#using-checkjni)
-   [7 Resources](#resources)

## Documentation

There is some documentation on Dalvik in the source code in the
dalvik/docs directory. See the [Android dalvik docs git
repository](http://android.git.kernel.org/?p=platform/dalvik.git;a=tree;f=docs;).

The source code has some rather large comments, including near the top
of Thread.c and Exception.c. The "mterp" directory has some notes
describing the structure of the interpreters.

## Q&A

From fadden on the android-platform list:

-   Who is responsible to read the dex file and call Dalvik ?
    -   The VM is started by the framework, through the JNI invocation
        interface. See AndroidRuntime.cpp in frameworks/base/...

-   Do you have a tutorial launch an app in the terminal adb: bytecode
    file \> dex file \> app launch in Dalvik =\> and see the result in
    adb ?
    -   See "hello-world.html" in the dalvik/docs directory (linked
        above).

-   Is there a profiler inside Dalvik, which enable us to follow each
    step in the dalvik execution ?
    -   You could turn on LOG\_INSTR to see each instruction as it is
        executed. This results in a rather dramatic amount of logging.
        If you try to do this on a device you will overrun the 64KB
        kernel log buffer pretty quickly and drop lots of stuff, so it's
        really only suitable for a "desktop" build (e.g. sim-eng).
    -   Also, Dalvik does include instrumentation to allow for tracing
        and profiling. See
        [http://elinux.org/Android\_Tools\#traceview](http://elinux.org/Android_Tools#traceview)



## JIT

As of version 2.2 (*Froyo*), Dalvik includes a Just-In-Time compiler (or
JIT).

-   See [A JIT Compiler for Android's Dalvik
    VM](http://code.google.com/events/io/2010/sessions/jit-compiler-androids-dalvik-vm.html)
    - video of presentation by Ben Cheng and Bill Buzbee at Google IO,
    2010
    -   [Slides, in
        PDF](http://dl.google.com/googleio/2010/android-jit-compiler-androids-dalvik-vm.pdf)

The Dalvik JIT, as of version 2.2, is a "trace-granularity JIT", which
means that it compiles individual code fragments that it discovers at
runtime to be "hot spots". (That is, it does not compile whole methods.)
The Dalvik bytecode interpreter is constantly profiling the code it is
executing, and when a piece of code is determined to be running a lot,
it is passed to a compiler to turn into native code. Several
optimizations may be performed in this process. This code is then
executed instead of the bytecode, for future runs through this section
of the software.

The memory overhead of the JIT is reported to be between 100K to 200K
per application. The ratio of code size between native instructions and
DEX byte codes in one example give (see slide 22 of the presentation)
was 7.7 to 1. That is, native instructions take approximately 8 times as
much space as DEX byte codes do to perform the same operations.

## Relationship to Java

Because Dalvik is not referred to as a Java Virtual Machine it does not
utilize the branding of "Java". Also, it does not execute Java
bytecodes. Hence, Google can ignore licensing issues with Sun or Oracle,
with regards to Java.

However, a Java compiler and set of class libraries are required in
order to create a Dalvik program.

As of March 2010, only the Sun JDK, version 1.5 is supported for
building the Android system and add-on Android applications.

## Dalvik on other platforms

-   Myriad Alien Dalvik - an implementation of the Dalvik VM for other
    platforms (demonstrated first on Meego)
    -   [http://www.linuxfordevices.com/c/a/News/Myriad-Group-Myriad-Alien-Dalvik/?kc=LNXDEVNL020911](http://www.linuxfordevices.com/c/a/News/Myriad-Group-Myriad-Alien-Dalvik/?kc=LNXDEVNL020911)

## Debugging the VM

There are a number of properties you can set, to control operation of
the VM and allow for debugging various aspects of the system:

See
[http://netmite.com/android/mydroid/dalvik/docs/embedded-vm-control.html](http://netmite.com/android/mydroid/dalvik/docs/embedded-vm-control.html)

(Note that this is in \<aosp-root\>/dalvik/docs, along with a whole
bunch of other files with information about Dalvik.)

this mentions a number of features you can control with properties,
including:

-   checkjni - various checks when JNI is used
-   enableassertions - enable assertions in the VM code
-   verify-bytecode - whether to perform bytecode verification
-   execution-mode - whether to use optimized assembly or portable C
    code for the interpreter
-   stack-trace-file - where to put stack trace data when a SIGQUIT is
    received

### Getting stack traces

You can force the VM to dump a stack trace of all threads by sending a
SIGQUIT signal. This can be done using 'kill -3 \<pid\>', where pid in
the main dalvik process. By default, the stack trace goes to the android
log, but you can have the data sent to a file (using the
dalvik.vm.stack-trace-file property) instead.

### Using checkJNI

CheckJNI refers to a special runtime mode of the Dalvik VM, which forces
the VM to run certain check and report problems when it sees certain
errors occuring from code called via JNI.

See
[http://android-developers.blogspot.com/2011/07/debugging-android-jni-with-checkjni.html](http://android-developers.blogspot.com/2011/07/debugging-android-jni-with-checkjni.html)

## Resources

-   [Dalvik wikipedia
    entry](http://en.wikipedia.org/wiki/Dalvik_(software))

-   [Dalvik VM
    Internals](http://sites.google.com/site/io/dalvik-vm-internals) -
    video of presentation by Dan Bornstein at Google IO, 2008

-   [DEX file format](http://www.retrodev.com/android/dexformat.html),
    reverse engineered by Michael Pavone

-   [Dalvik
    bytecodes](http://developer.android.com/reference/dalvik/bytecode/Opcodes.html)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

