> From: [eLinux.org](http://eLinux.org/Android_Architecture "http://eLinux.org/Android_Architecture")


# Android Architecture



See Google's [What is Android?
page](http://developer.android.com/guide/basics/what-is-android.html)
for an overview of Android components, and a diagram of the
architecture.

The diagram on that page appears in every presentation I have ever seen
about Android technical topics (with the exception of my own).

## Contents

-   [1 Architecture Diagram](#architecture-diagram)
-   [2 Overview presentations](#overview-presentations)
-   [3 Breakdown of running Android
    system](#breakdown-of-running-android-system)
-   [4 Relation to the Linux kernel](#relation-to-the-linux-kernel)
-   [5 Java](#java)
    -   [5.1 Java/Object Oriented
        Philosophy](#java-object-oriented-philosophy)

## Architecture Diagram

Here is the Android Architecture Diagram, obtained from
[here](http://developer.android.com/images/system-architecture.jpg).

[![Android-system-architecture.jpg](http://eLinux.org/images/c/c2/Android-system-architecture.jpg)](http://eLinux.org/File:Android-system-architecture.jpg)

See also [Android internals
diagram](http://www.makelinux.net/android/internals/)

Basically Android has the following layers:

-   applications (written in java, executing in Dalvik)
-   framework services and libraries (written mostly in java)
    -   applications and most framework code executes in a virtual
        machine
-   native libraries, daemons and services (written in C or C++)
-   the Linux kernel, which includes
    -   drivers for hardware, networking, file system access and
        inter-process-communication

## Overview presentations

-   [Android is not just Java on
    Linux](http://kobablog.wordpress.com/2011/05/22/android-is-not-just-java-on-linux/)
    -   Great presentation by Tetsuyuki Kobayashi overview of Android
-   See this Android Internals presentation by Karim Yaghmour
    -   [http://www.opersys.com/blog/android-internals-101103](http://www.opersys.com/blog/android-internals-101103)
    -   You'll find both the video and the slides there
-   [Mythbusters\_Android.pdf](http://eLinux.org/images/2/2d/Mythbusters_Android.pdf "Mythbusters Android.pdf")
    Presentation by Matt Porter at ELC Europe
    -   Has bits and pieces showing problematic Android code and
        policies

## Breakdown of running Android system

A quick look at Android contents and programs running when Android
starts is at:

-   [http://benno.id.au/blog/2007/11/13/android-under-the-hood](http://benno.id.au/blog/2007/11/13/android-under-the-hood)

## Relation to the Linux kernel

Here is [Greg Kroah-Hartmans presentation on
Android](http://github.com/gregkh/android-presentation/downloads) from
the CELF conference 2010, discussing how Google/Android work (or don't
work) with the Linux community.

## Java

Java is used as a language for application programming, but it is
converted into a non-java byte code for runtime interpretation by a
custom interpreter (Dalvik).

### Java/Object Oriented Philosophy

Practicality is more important than purity in implementing the Android
system.

Dianne Hackborn, one of the principal engineers working on Android,
wrote:

It's not like I am a C programmer who doesn't like object oriented
design. In fact prior to Android my primary language was C++... and
honestly, Java really annoys me in the way it introduces so much more
overhead to do things that I could express in very nice OO concepts in
C++ with a much lighter-weight result.

Though Java has a lot of other nice attributes that make it good for
Android, it also has its share of design flaws and misfeatures that mean
we can't be totally beautifully OO as you would like.

Finally, going forward, our API conventions were defined in a way that
allowed us to ship a well performing system on the hardware we had the
time. As the situation changes (and it slowly is, but not enough yet)
that could change... however, I will probably lean towards keeping those
API conventions in place just for the sake of consistency with
everything that currently exists. Of course if Android is successful and
in 10 years from now we are designing a whole new next generation
Android framework... well, then the world is a different place.




[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

