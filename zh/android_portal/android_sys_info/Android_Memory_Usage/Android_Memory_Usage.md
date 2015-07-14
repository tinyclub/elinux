> From: [eLinux.org](http://eLinux.org/Android_Memory_Usage "http://eLinux.org/Android_Memory_Usage")


# Android Memory Usage



The memory of an Android system is managed by several different
allocators, in several different pools.

## Contents

-   [1 System Memory](#system-memory)
-   [2 Process Memory](#process-memory)
    -   [2.1 procrank](#procrank)
    -   [2.2 smem tool](#smem-tool)
-   [3 Dalvik Heap](#dalvik-heap)
-   [4 Debugging Android application memory
    usage](#debugging-android-application-memory-usage)
    -   [4.1 How to debug native process memory
        allocations](#how-to-debug-native-process-memory-allocations)
    -   [4.2 libc.debug.malloc](#libc-debug-malloc)
-   [5 References](#references)

## System Memory

You can examine the system's view of the memory on the machine, by
examining /proc/meminfo.

If you use 'ddms', you can see a summary of the memory used on the
machine, by the system and by the different executing processes. Click
on the SysInfo tab, and select "Memory Usage" in the box on the upper
left of the pane.

Here's a screenshot:

[![Android memory usage on an OMAP EVM platform, running eclair, as
shown by
ddms](http://eLinux.org/images/4/49/Ddms-memory-usage1.png)](http://eLinux.org/File:Ddms-memory-usage1.png "Android memory usage on an OMAP EVM platform, running eclair, as shown by ddms")

Note that you can get the numbers for each process by hovering your
mouse over a particular pie slice. Numbers are shown in K and
percentages.

## Process Memory

You can see an individual process' memory usage by examining
/proc/\<pid\>/status

Details about memory usage are in

-   /proc/\<pid\>/statm
-   /proc/\<pid\>/maps
-   /proc/\<pid\>/smaps

The 'top' command will show VSS and RSS.

Also, see ddms info above.

### procrank

procrank will show you a quick summary of process memory utilization. By
default, it shows Vss, Rss, Pss and Uss, and sorts by Vss. However, you
can control the sorting order.

procrank source is included in system/extras/procrank, and the binary is
located in /system/xbin on an android device.

-   Vss = virtual set size
-   Rss = resident set size
-   Pss = proportional set size
-   Uss = unique set size

In general, the two numbers you want to watch are the Pss and Uss (Vss
and Rss are generally worthless, because they don't accurately reflect a
process's usage of pages shared with other processes.)

-   Uss is the set of pages that are unique to a process. This is the
    amount of memory that would be freed if the application was
    terminated right now.
-   Pss is the amount of memory shared with other processes, accounted
    in a way that the amount is divided evenly between the processes
    that share it. This is memory that would not be released if the
    process was terminated, but is indicative of the amount that this
    process is "contributing"

to the overall memory load.

You can also use procrank to view the working set size of each process,
and to reset the working set size counters.

Here is procrank's usage:

    # procrank -h
    Usage: procrank [ -W ] [ -v | -r | -p | -u | -h ]
        -v  Sort by VSS.
        -r  Sort by RSS.
        -p  Sort by PSS.
        -u  Sort by USS.
            (Default sort order is PSS.)
        -R  Reverse sort order (default is descending).
        -w  Display statistics for working set only.
        -W  Reset working set of all processes.
        -h  Display this help screen.

And here is some sample output:

    # procrank
      PID      Vss      Rss      Pss      Uss  cmdline
     1217   36848K   35648K   17983K   13956K  system_server
     1276   32200K   32200K   14048K   10116K  android.process.acore
     1189   26920K   26920K    9293K    5500K  zygote
     1321   20328K   20328K    4743K    2344K  android.process.media
     1356   20360K   20360K    4621K    2148K  com.android.email
     1303   20184K   20184K    4381K    1724K  com.android.settings
     1271   19888K   19888K    4297K    1764K  com.android.inputmethod.latin
     1332   19560K   19560K    3993K    1620K  com.android.alarmclock
     1187    5068K    5068K    2119K    1476K  /system/bin/mediaserver
     1384     436K     436K     248K     236K  procrank
        1     212K     212K     200K     200K  /init
      753     572K     572K     171K     136K  /system/bin/rild
      748     340K     340K     163K     152K  /system/bin/sh
      751     388K     388K     156K     140K  /system/bin/vold
     1215     148K     148K     136K     136K  /sbin/adbd
      757     352K     352K     117K      92K  /system/bin/dbus-daemon
      760     404K     404K     104K      80K  /system/bin/keystore
      759     312K     312K     102K      88K  /system/bin/installd
      749     288K     288K      96K      84K  /system/bin/servicemanager
      752     244K     244K      71K      60K  /system/bin/debuggerd

In this example, it shows that the native daemons and programs are an
order of magnitude smaller than the Dalvik-based services and programs.
Also, even the smallest Dalvik program requires about 1.5 meg (Uss) to
run.

### smem tool

You can see very detailed per-process or systemwide memory information
with smem.

See [Using smem on
Android](http://eLinux.org/Using_smem_on_Android "Using smem on Android")

## Dalvik Heap

The Dalvik heap is preloaded with classes and data by zygote (loading
over 1900 classes as of Android version 2.2). When zygote forks to start
an android application, the new application gets a copy-on-write mapping
of this heap. As Dan Borstein says below, this helps with memory
reduction as well as application startup time.

Dalvik, like virtual machines for many other languages, does garbage
collection on the heap. There appears to be a separate thread (called
the HeapWorker) in each VM process that performs the garbage collection
actions. (See toolbox ps -t) [need more notes on the garbage collection]

Dan Borstein said this about heap sharing<sup>[[1]](#cite_note-1)</sup>:

It's used in Android to amortize the RAM footprint of the large amount
of effectively-read-only data (technically writable but rarely actually
written) associated with common library classes across all active VM
processes. 1000+ classes get preloaded by the system at boot time, and
each class consumes at least a little heap for itself, including often
pointing off to a constellation of other objects. The heap created by
the preloading process gets shared copy-on-write with each spawned VM
process (but again doesn't in practice get written much). This saves
hundreds of kB of dirty unpageable RAM per process and also helps speed
up process startup.

[INFO NEEDED: how to show dalvik heap info?]

## Debugging Android application memory usage

See an excellent article by Dianne Hackborn at:
[http://stackoverflow.com/questions/2298208/how-to-discover-memory-usage-of-my-application-in-android/2299813\#2299813](http://stackoverflow.com/questions/2298208/how-to-discover-memory-usage-of-my-application-in-android/2299813#2299813)

### How to debug native process memory allocations

    setprop dalvik.vm.checkjni true
    setprop libc.debug.malloc 10
    setprop setprop dalvik.vm.jniopts forcecopy
    start
    stop

### libc.debug.malloc

The C library (bionic) in the system supports the ability to utilize a
different, debug, version of the malloc code at runtime in the system.

If the system property libc.debug.malloc has a value other than 0, then
when a process is instantiated, the C library uses functions for
allocating and freeing memory, for that process.

(Note that there are other ways that the debug shared library malloc
code ends up being used as well. That is, if you are running in the
emulator, and the value of the system property ro.kernel.memcheck is not
'0', then you get a debug level of 20. Note that debug level 20 can only
be used in the emulator.)

By default, the standard malloc/free/calloc/realloc/memalign routines
are used. By setting libc.debug.malloc, different routines are used,
which check for certain kinds of memory errors (such as leaks and
overruns). This is done by loading a separate shared library (.so) with
these different routines.

The shared libraries are named: /system/lib/libc\_malloc\_debug\_leak.so
and /system/lib/libc\_malloc\_debug\_qemu.so

(Information was obtained by looking at
\<android-source-root\>/bionic/libc/bionic/malloc\_debug\_common.c)

Supported values for libc.debug.malloc (debug level values) are:

-   1 - perform leak detection
-   5 - fill allocated memory to detect overruns
-   10 - fill memory and add sentinels to detect overruns
-   20 - use special instrumented malloc/free routines for the emulator

I'm not sure whether these shared libraries are shipped in production
devices.

## References

1.  [↑](#cite_ref-1) comment by Dan Borstein, Jan 2009 to blog article
    [Dalvik vs.
    Mono](http://www.koushikdutta.com/2009/01/dalvik-vs-mono.html)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

