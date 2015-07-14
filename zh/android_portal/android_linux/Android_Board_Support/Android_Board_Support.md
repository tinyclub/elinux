> From: [eLinux.org](http://eLinux.org/Android_Board_Support "http://eLinux.org/Android_Board_Support")


# Android Board Support



Porting Android to a new platform can be a challenge. Here are some
resources to start with that:

## Contents

-   [1 Processor Support](#processor-support)
    -   [1.1 ARM](#arm)
        -   [1.1.1 OMAP](#omap)
    -   [1.2 Mips](#mips)
    -   [1.3 x86](#x86)
-   [2 Individual Platform Support](#individual-platform-support)
    -   [2.1 For Nexus One](#for-nexus-one)
        -   [2.1.1 Unlocking the phone](#unlocking-the-phone)
        -   [2.1.2 Serial port access](#serial-port-access)
-   [3 System Requirements](#system-requirements)
    -   [3.1 RAM (\>256M if possible)](#ram-3e256m-if-possible)

## Processor Support

### ARM

Most ports of Android are to ARM-based platforms.

#### OMAP

-   Mentor Graphics and Texas Instruments support Android on OMAP
    processors via the
    [project](http://code.google.com/p/rowboat/%7CRowboat)
-   See also [Android on OMAP](http://eLinux.org/Android_on_OMAP "Android on OMAP"),
    which has a very thorough listing of issues faced in initially
    porting Android to OMAP

### Mips

Mentor Graphics did a port of Android to MIPS.

See [http://www.mipsandroid.org](http://www.mipsandroid.org)

(Unfortunately, this site requires registration.)

-   MIPS now has support for SMP on Android - see [MIPS Supports
    Symmetric Multiprocessing on Android
    Platform](http://edageek.com/2010/06/01/smartphones-smp/) - Posted
    by Ken Cheung in IP Cores on Tuesday, June 1, 2010

### x86

There is a whole well-developed project for Android on x86.

See [http://www.android-x86.org/](http://www.android-x86.org/)

At least one major product (Sony Internet TV) is reported to be
x86-based. Intel has a team of developers working on Android issues. See
Mark Gross' presentation from ELC 2010 for some tips from them about
using Android

-   [Experiences in Android Porting, Lessons Learned,Tips and
    Tricks](http://eLinux.org/images/e/ee/ELC2010-android-xp-tips-tricks.pdf "ELC2010-android-xp-tips-tricks.pdf")
    by Mark Gross, April 2010, Embedded Linux Conference 2010

-   Intel is working on "native" Android support. See [Intel prepping
    x86 port for Android
    2.2](http://www.linuxfordevices.com/c/a/News/Intel-x86-port-and-Sprint-upgrade-plans/?kc=LNXDEVNL063010)
    By Eric Brown, lwn.net, 2010-06-28

## Individual Platform Support

### For Nexus One

#### Unlocking the phone

Bryan Swetland says:
([here](http://torvalds-family.blogspot.com/2010/02/happy-camper.html?showCom))

All Nexus One devices have an unlockable bootloader (% fastboot oem
unlock), which, once unlocked will allow you to reflash the boot
partition (kernel + ramdisk), system partition, etc.

Full kernel sources are available here:
[http://android.git.kernel.org/?p=kernel/msm.git;a=shortlog;h=refs/heads/android-msm-2.6.29-nexusone](http://android.git.kernel.org/?p=kernel/msm.git;a=shortlog;h=refs/heads/android-msm-2.6.29-nexusone)
(make mahimahi\_defconfig to configure just like the production kernel).
We're in the process of rebasing up to .32, on our way to .33 and
beyond.

#### Serial port access

There are some serial port pins available on the micro-USB connector,
which you can access if you have the right hardware.

See this [discussion on
xda-developers](http://forum.xda-developers.com/showthread.php?t=625434)
for detailed information and links.

Brian Swetland says: TTL level (\~3.3v?) serial is present on the D+/D-
pins of the micro USB connector whenever VBUS (usb +5v power) is not
present. This is physical UART1 (ttyMSM0). In standard builds the FIQ
kernel debugger runs there. You'll have to disable the FIQ debugger and
enable the serial device in your kernel config if you want to use it as
a regular serial port.

## System Requirements

### RAM (\>256M if possible)

Dianne Hackborn had this to say (in August, 2009) about RAM requirements
for Android:

I would recommend at least 128MB available to the \*kernel\*. In many
architectures, a big chunk of RAM will be dedicated to the radio, so you
need to take that into account, and the 128MB recommendation does not
cover that. Also if your architecture allocates graphics surfaces in
user space, bump it up by 16MB or so (The Qualcomm devices I have
experience do their allocations in RAM outside of that accessible to the
kernel.) And of course this also depends on the size and density of your
screen, camera megapixels, etc. If the screen has more pixels than
320x480 or the camera is more than 3 megapixels, bump the size up
accordingly.

For reference, the myTouch has 192MB of RAM which on 1.6 only left 100MB
left for the kernel and user space, and was \*very\* tight on RAM. Don't
go that low. An update to the Qualcomm radio apparently frees up a bunch
of space, adding over 10MB or so to user space... that should run even
2.2 okay. At this level, though, the amount of RAM is probably the most
important aspect to how well the device will run. Don't skip on RAM, and
you'll have a much better running device, with a lot fewer headaches as
you try to get everything working well. That is from painful
experience. :)

Another reference point -- the Droid has 256MB RAM, which runs the
system well, but it also does its graphics allocations in user space and
has a high density screen so you can still end up not keeping as many
processes running as you'd like if loading large pages with the browser,
running lots of background services, etc.

The Nexus One has 512MB of RAM and honestly that is really more than we
know what to do with. It is great. :) I ended up putting some code into
the activity manager to put a hard limit on the number of processes we
would keep around, because there was so much memory we had often could
keep way more processes than was useful. That was never an issue on
Droid. ;)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

