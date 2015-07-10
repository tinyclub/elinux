> From: [eLinux.org](http://eLinux.org/Android_Kernel_Features "http://eLinux.org/Android_Kernel_Features")


# Android Kernel Features



## Contents

-   [1 Kernel features unique to
    Android](#kernel-features-unique-to-android)
    -   [1.1 Resources](#resources)
    -   [1.2 Temporary including in mainline
        'staging'](#temporary-including-in-mainline-staging)
    -   [1.3 Android mainlining project](#android-mainlining-project)
-   [2 List of kernel features unique to
    Android](#list-of-kernel-features-unique-to-android)
    -   [2.1 Binder](#binder)
    -   [2.2 ashmem](#ashmem)
    -   [2.3 pmem](#pmem)
    -   [2.4 logger](#logger)
    -   [2.5 wakelocks](#wakelocks)
    -   [2.6 oom handling](#oom-handling)
    -   [2.7 Alarm timers](#alarm-timers)
        -   [2.7.1 POSIX Alarm Timers](#posix-alarm-timers)
    -   [2.8 paranoid network security](#paranoid-network-security)
    -   [2.9 timed output / timed gpio](#timed-output-timed-gpio)
    -   [2.10 RAM\-CONSOLE](#ram-console)
    -   [2.11 other kernel changes](#other-kernel-changes)
-   [3 Kernel configuration options](#kernel-configuration-options)

## Kernel features unique to Android

In the course of development, Google developers made some changes to the
Linux kernel. The amount of changes is not extremely large, and is on
the order of changes that are customarily made to the Linux kernel by
embedded developers (approximately 250 patches, with about 3 meg. of
differences in 25,000 lines). The changes include a variety of large and
small additions, ranging from the wholesale addition of a flash
filesystem (YAFFS2), to very small patches to augment Linux security
(paranoid networking patches).

Various efforts have been made over the past few years to submit these
to changes to mainline (mostly by Google engineers, but also by others),
with not much success so far.

### Resources

A very good overview of the changes is available in a talk by John
Stultz at ELC 2011. (The talk has a somewhat misleading name.)

-   [Android OS for
    Servers](http://eLinux.org/images/8/89/Elc2011_stultz.pdf "Elc2011 stultz.pdf")- John
    Stultz, ELC 2011
    -   This talks breaks down the differences between an Android Linux
        kernel and a stock Linux kernel, and provides information about
        the features of each.
-   [http://www.lindusembedded.com/blog/2010/12/07/android-linux-kernel-additions/](http://www.lindusembedded.com/blog/2010/12/07/android-linux-kernel-additions/)
    -   Lindus Embedded (Alex Gonzalez) has a listing of kernel changes
        based on an Android kernel for the Freescale MX51 SOC, with some
        good information about each change.
-   [http://yidonghan.wordpress.com/2010/01/28/porting-android-to-a-new-device/](http://yidonghan.wordpress.com/2010/01/28/porting-android-to-a-new-device/)
    -   Peter McDermott's excellent description of his work to port
        Android to the Nokia N810.
    -   Also, see his annotated list of modified and added kernel files,
        at:
        [http://www.linuxfordevices.com/files/misc/porting-android-to-a-new-device-p3.html](http://www.linuxfordevices.com/files/misc/porting-android-to-a-new-device-p3.html)
    -   See the project site [at
        sourceforge](http://android-n810.sourceforge.net/).
-   [http://www.slideshare.net/jollen/android-os-porting-introduction](http://www.slideshare.net/jollen/android-os-porting-introduction)
    -   Jollen Chen's excellent presentation on system-level Android
        features, including an overview of kernel features unique to
        Android: *Note: Parts of the presentation are in Chinese*

### Temporary including in mainline 'staging'

Some changes were temporarily added at the "staging" driver area in the
stock kernel, but were removed due to lack of support. See [Greg KH blog
post on -staging for
2.6.33](http://www.kroah.com/log/linux/staging-status-12-2009.html),
where he announces the **removal** of various Android drivers from
-staging.

### Android mainlining project

Several groups and individuals are working to get kernel changes from
Android mainlined into the Linux kernel.

Please see [Android Mainlining
Project](http://eLinux.org/Android_Mainlining_Project "Android Mainlining Project") for
more information.

## List of kernel features unique to Android

Here is a list of changes/addons that the Android Project made to the
linux kernel. As of September, 2011, these kernel changes are not part
of the standard kernel and are only available in the Android kernel
trees in the Android Open Source project.

This list does not include board- or platform-specific support or
drivers (commonly called "board support").

### Binder

Binder is an Android-specific interprocess communication mechanism, and
remote method invocation system.

See [Android Binder](http://eLinux.org/Android_Binder "Android Binder")

### ashmem

-   ashmem - Android shared memory
    -   implementation is in `mm/ashmem.c`

According to the Kconfig help "The ashmem subsystem is a new shared
memory allocator, similar to POSIX SHM but with different behavior and
sporting a simpler file-based API."

Apparently it better-supports low memory devices, because it can discard
shared memory units under memory pressure.

To use this, programs open /dev/ashmem, use mmap() on it, and can
perform one or more of the following ioctls:

-   ASHMEM\_SET\_NAME
-   ASHMEM\_GET\_NAME
-   ASHMEM\_SET\_SIZE
-   ASHMEM\_GET\_SIZE
-   ASHMEM\_SET\_PROT\_MASK
-   ASHMEM\_GET\_PROT\_MASK
-   ASHMEM\_PIN
-   ASHMEM\_UNPIN
-   ASHMEM\_GET\_PIN\_STATUS
-   ASHMEM\_PURGE\_ALL\_CACHES

From a thread on android-platform
[source](http://groups.google.com/group/android-platform/browse_thread/thread/2fa6ba5ef9f81d22/0b91a39d108d02fc)

You can create a shared memory segment using:

        fd = ashmem_create_region("my_shm_region", size);
        if(fd < 0)
            return -1;
        data = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
        if(data == MAP_FAILED)
            goto out;

In the second process, instead of opening the region using the same
name, for security reasons the file descriptor is passed to the other
process via binder IPC.

The libcutils interface for ashmem consists of the following calls:
(found in system/core/include/cutils/ashmem.h)

-   int ashmem\_create\_region(const char \*name, size\_t size);
-   int ashmem\_set\_prot\_region(int fd, int prot);
-   int ashmem\_pin\_region(int fd, size\_t offset, size\_t len);
-   int ashmem\_unpin\_region(int fd, size\_t offset, size\_t len);
-   int ashmem\_get\_size\_region(int fd);

### pmem

-   PMEM - Process memory allocator
    -   implementation at: `drivers/misc/pmem.c` with include file at:
        `include/linux/android_pmem.h`
    -   Brian Swetland says:

<!-- -->

    The pmem driver is used to manage large (1-16+MB) physically contiguous
    regions of memory shared between userspace and kernel drivers (dsp, gpu,
    etc).  It was written specifically to deal with hardware limitations of
    the MSM7201A, but could be used for other chipsets as well.  For now,
    you're safe to turn it off on x86.

David Sparks wrote the following:
[source](http://groups.google.com/group/android-framework/msg/06bb9d8c294ce6d7)

    2. ashmem and pmem are very similar. Both are used for sharing memory
    between processes. ashmem uses virtual memory, whereas pmem uses
    physically contiguous memory. One big difference is that with ashmem,
    you have a ref-counted object that can be shared equally between
    processes. For example, if two processes are sharing an ashmem memory
    buffer, the buffer reference goes away when both process have removed
    all their references by closing all their file descriptors. pmem
    doesn't work that way because it needs to maintain a physical to
    virtual mapping. This requires the process that allocates a pmem heap
    to hold the file descriptor until all the other references are closed.

    3. You have the right idea for using shared memory. The choice between
    ashmem and pmem depends on whether you need physically contiguous
    buffers. In the case of the G1, we use the hardware 2D engine to do
    scaling, rotation, and color conversion, so we use pmem heaps. The
    emulator doesn't have a pmem driver and doesn't really need one, so we
    use ashmem in the emulator. If you use ashmem on the G1, you lose the
    hardware 2D engine capability, so SurfaceFlinger falls back to its
    software renderer which does not do color conversion, which is why you
    see the monochrome image.

### logger

-   logger - system logging facility
    -   This is the kernel support for the 'logcat' command
    -   The kernel driver for the serial devices for logging are in the
        source code `drivers/misc/logger.c`
    -   See [Android logger](http://eLinux.org/Android_logger "Android logger") for more
        information about the kernel code
    -   See [Android Logging
        System](http://eLinux.org/Android_Logging_System "Android Logging System") for an
        overview of the system it supports

### wakelocks

-   wakelock - used for power management files `kernel/power/wakelock.c`
    -   Holds machine awake on a per-event basis until wakelock is
        released
    -   See [Android Power
        Management](http://eLinux.org/Android_Power_Management "Android Power Management")
        for detailed information

### oom handling

-   oom handling modifications
    -   lowmem notifications
    -   implementation at: `drivers/misc/lowmemorykiller.c`
    -   also at: `security/lowmem.c`

Informally known as the Viking Killer, the OOM handler simply kills
processes as available memory becomes low. The kernel module follows
rules for this that are supplied from user space in two ways:

1. init writes information about memory levels and associated classes:

-   The write value must be consistent with the above properties.
-   Note that the driver only supports 6 slots, so we have combined some
    of the classes into the same memory level; the associated processes
    of higher classes will still be killed first.
    -   From /init.rc:

<!-- -->

       write /sys/module/lowmemorykiller/parameters/adj 0,1,2,4,7,15
       write /sys/module/lowmemorykiller/parameters/minfree 2048,3072,4096,6144,7168,8192

2. User space sets the oom\_adj of processes to put them in the correct
class for their current operation. This redefines the meaning of
oom\_adj from that used by the standard OOM killer to something that is
more aggressive and controlled.

These oom\_adj levels end up being based on the process lifecycle
defined here:
[http://developer.android.com/guide/topics/fundamentals.html\#proclife](http://developer.android.com/guide/topics/fundamentals.html#proclife)

### Alarm timers

This is the kernel implementation to support Android's AlarmManager. It
lets user space tell the kernel when it would like to wake up, allowing
the kernel to schedule that appropriately and come back (holding a wake
lock) when the time has expired regardless of the sleep state of the
CPU.

#### POSIX Alarm Timers

Note that POSIX Alarm timers, which implement this functionality (but
not identically), was accepted into mainline Linux in kernel version
3.0.

See [Waking Systems from Suspend](https://lwn.net/Articles/429925/) and
[http://lwn.net/Articles/439364/](http://lwn.net/Articles/439364/)

### paranoid network security

-   paranoid network security
    -   See
        [Android\_Security\#Paranoid\_network-ing](http://eLinux.org/Android_Security#Paranoid_network-ing "Android Security")

### timed output / timed gpio

Generic gpio is a mechanism to allow programs to access and manipulate
gpio registers from user space.

Timed output/gpio is a system to allow chaning a gpio pin and restore it
automatically after a specified timeout. See
`drives/misc/timed_output.c` and `drives/misc/timed_gpio.c` This expose
a user space interface used by the vibrator code.

On ADP1, there is a driver at:

    # cd /sys/bus/platform/drivers/timed-gpio
    # ls -l
    --w-------    1 0        0            4096 Nov 13 02:11 bind
    lrwxrwxrwx    1 0        0               0 Nov 13 02:11 timed-gpio -> ../../../../devices/platform/timed-gpio
    --w-------    1 0        0            4096 Nov 13 02:11 uevent
    --w-------    1 0        0            4096 Nov 13 02:11 unbind

Also, there is a device at:

    # cd /sys/devices/platform/timed-gpio
    # ls -lR
    .:
    lrwxrwxrwx    1 0        0               0 Nov 13 01:34 driver -> ../../../bus/platform/drivers/timed-gpio
    -r--r--r--    1 0        0            4096 Nov 13 01:34 modalias
    drwxr-xr-x    2 0        0               0 Nov 13 01:34 power
    lrwxrwxrwx    1 0        0               0 Nov 13 01:34 subsystem -> ../../../bus/platform
    -rw-r--r--    1 0        0            4096 Nov 13 01:34 uevent

    ./power:
    -rw-r--r--    1 0        0            4096 Nov 13 01:34 wakeup

### RAM\_CONSOLE

This allows saving the kernel printk messages to a buffer in RAM, so
that after a kernel panic they can be viewed in the next kernel
invocation, by accessing /proc/last\_kmsg.

[Would be good to get more details on how to set this up and use it
here!] [I guess this is something like pramfs?]

### other kernel changes

Here is a miscellaneous list of other kernel changes in the mistral
Android kernel:

-   switch events - drivers/switch/\* userspace support for monitoring
    GPIO via sysfs/uevent used by vold to detect USB
-   USB gadget driver for ADB - drivers/usb/gadget/android.c
-   yaffs2 flash filesystem
-   support in FAT filesystem for FVAT\_IOCTL\_GET\_VOLUME\_ID
-   and more...

## Kernel configuration options

The file
[Documentation/android.txt](http://android.git.kernel.org/?p=kernel/common.git;a=blob_plain;f=Documentation/android.txt;hb=HEAD)
has a list of required configuration options for a kernel to support an
Android system.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

