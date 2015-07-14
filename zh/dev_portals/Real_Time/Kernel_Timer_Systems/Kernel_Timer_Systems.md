> From: [eLinux.org](http://eLinux.org/Kernel_Timer_Systems "http://eLinux.org/Kernel_Timer_Systems")


# Kernel Timer Systems



## Contents

-   [1 Timer Wheel, Jiffies and HZ (or, the way it
    was)](#timer-wheel-jiffies-and-hz-or-the-way-it-was)
    -   [1.1 Ingo Molnar's explanation of timer wheel
        performance](#ingo-molnar-s-explanation-of-timer-wheel-performance)
-   [2 ktimers](#ktimers)
    -   [2.1 Material needs rework](#material-needs-rework)
    -   [2.2 clock events](#clock-events)
    -   [2.3 clocksource](#clocksource)
-   [3 Timer information](#timer-information)
    -   [3.1 /proc/timer\-list](#-proc-timer-list)
    -   [3.2 /proc/timer\-stats](#-proc-timer-stats)
-   [4 Dynamic ticks](#dynamic-ticks)
    -   [4.1 Testing](#testing)
    -   [4.2 Powertop](#powertop)
-   [5 timer API](#timer-api)
-   [6 time API](#time-api)
-   [7 High Resolution Timers](#high-resolution-timers)
-   [8 Old timer wheel/jiffy replacement
    proposals](#old-timer-wheel-jiffy-replacement-proposals)
    -   [8.1 Jun Sun's "tock"
        proposal](#-jun-sun-s-tock-proposal)
    -   [8.2 John Stultz](#john-stultz)
-   [9 Timer Tick Thread - LKML July
    2005](#timer-tick-thread-lkml-july-2005)

## Timer Wheel, Jiffies and HZ (or, the way it was)

The original kernel timer system (called the "timer wheel) was based on
incrementing a kernel-internal value (jiffies) every timer interrupt.
The timer interrupt becomes the default scheduling quamtum, and all
other timers are based on jiffies. The timer interrupt rate (and jiffy
increment rate) is defined by a compile-time constant called HZ.
Different platforms use different values for HZ. Historically, the
kernel used 100 as the value for HZ, yielding a jiffy interval of 10 ms.
With 2.4, the HZ value for i386 was changed to 1000, yeilding a jiffy
interval of 1 ms. Recently (2.6.13) the kernel changed HZ for i386 to
250. (1000 was deemed too high).

### Ingo Molnar's explanation of timer wheel performance

Ingo Molnar did an in-depth explanation about the performance of the
current "timer wheel" implementation of timers. This was part of a
series of messages trying to justify the addition of ktimers (which have
different characteristics).

It is possibly the best explanation of the timer wheel avaiable: See
[http://lkml.org/lkml/2005/10/19/46](http://lkml.org/lkml/2005/10/19/46)
and [http://lwn.net/Articles/156329/](http://lwn.net/Articles/156329/)

## ktimers

Update: ktimers have been replaced by hrtimer framework also by Thomas
Gleixner, only using a set of functions and datastructures in
linux/ktime.h.

### Material needs rework

A bunch of material in this section needs to be created or expanded to
take into account the hrtimer system by Thomas Gleixner.

### clock events

[Basic LWN coverage on clockevents
concepts](http://lwn.net/Articles/223185/)

### clocksource

[Clocksource Documentation patch that didn't get
accepted](http://article.gmane.org/gmane.linux.kernel/1062438). Has some
coverage of clock sources although care to be taken by going through
patch responses.

Clocksource is also related or the same as the GTOD (Generic time of
Day) work by John Stultz that hrtimer framework depends on (as mentioned
on p.18 in the OLS 2006 slides).

Also refer to the kernel documentation on [High resolution timers and
dynamic ticks design
notes](https://www.kernel.org/doc/Documentation/timers/highres.txt) for
some notes on clock source.

## Timer information

There are two /proc files that are very useful for gathering information
about timers on your system.

### /proc/timer\_list

/proc/timer\_list has information about the currently configured clocks
and timers on the system. This is useful for debugging the current
status of the timer system (especially while you are developing
clockevent and clocksource support for your platform.)

You can tell if high resolution is configured for you machine by looking
at a few different things:

For standard resolution (at jiffy resolution), a clock will have a value
for it's '.resolution' field equal to the period of a jiffy. For
embedded machines, where HZ is typically 100, this will be 10
milliseconds, or 10000000 (ten million) nanoseconds.

Also for standard resolution, the Clock Event Device will have an event
handler of "tick\_handle\_periodic".

For high resolution, the resolution of the clock will be listed as 1
nanosecond (which is ridiculous, but serves as an indicator of
essentially arbitrary precision.) Also, the Clock Event Device will have
an event handler of "hrtimer\_interrupt".

* * * * *

[need more info here - and this should probably be written up and put in
Documentation/filesystems/proc.txt]

### /proc/timer\_stats

/proc/timer\_stats is a file in the /proc pseudo file system which
allows you to see information about the routines that are requesting
timers of the Linux kernel. By cat'ing this file, you can see which
routines are using lots of timers, and how frequently they are
requesting them. This can be of interest to see

To use /proc/timer\_stats, configure the kernel with support for the
feature. That is, set CONFIG\_TIMER\_STATS=y in your .config. This is on
the Kernel Hacking menu, with the prompt: "Collect kernel timers
statistics"

Compile and install your kernel, and reboot your machine.

To activate the collection of stats (and reset the counters), do "echo 1
\>/proc/timer\_stats"

To stop collecting stats, do "echo 0 \>/proc/timer\_stats"

You can dump the statistics either while the collection system is
running or stopped. To dump the stats, use 'cat /proc/timer\_stats'.
This shows the average events/sec at the end as well so you get a rough
idea of system activity.

/proc/timer\_stats fields (for version 0.1 of the format) are:

    <count>,  <pid> <command>   <start_func> (<expire_func>)

## Dynamic ticks

Tickless kernel, dynamic ticks or NO\_HZ is a config option that enables
a kernel to run without a regular timer tick. The timer tick is a timer
interrupt that is usually generated HZ times per second, with the value
of HZ being set at compile time and varying between around 100 to 1500.
Running without a timer tick means the kernel does less work when idle
and can potentially save power because it does not have to wake up
regularly just to service the timer. The configuration option is
CONFIG\_NO\_HZ and is set by Tickless System (Dynamic Ticks), on the
Kernel Features configuration menu.

-   See the [Clockevents and dyntick](http://lwn.net/Articles/223185/)
    LNW.net article

### Testing

To tell if dynamic ticks is supported in your kernel you can:

Look in dmesg for a line like this one:

     # dmesg | grep -i nohz
     Switched to NOHz mode on CPU #0

Or look at the timer interrupts and compare to jiffies:

     # cat /proc/interrupts | grep -i time
     # sleep 10
     # cat /proc/interrupts | grep -i time

### Powertop

Powertop is a tool that parses the /proc/timer\_stats output and gives a
picture of what is causing wakeups on your system. Minimizing these
wakeups should allow you to decrease power consumption in your device.
Powertop was originally written for the x86 architecture but also works
for embedded processors. However, in order to get a clean display from
it, you will need an ncurses lib with wide character support.

Here's a poor-man's version of powertop:

     # watch "cat /proc/timer_stats | sort -nr | head -n 20"

## timer API

-   interval timers
-   posix timer API
-   sleep, usleep and nanosleep

## time API

- do_gettimeofday

## High Resolution Timers

See [High Resolution
Timers](http://eLinux.org/High_Resolution_Timers "High Resolution Timers"), which
describe sub-jiffy timers.

## Old timer wheel/jiffy replacement proposals

### Jun Sun's "tock" proposal

See
[http://linux.junsun.net/HRT/index.html](http://linux.junsun.net/HRT/index.html)

This systems replaces jiffies and xtime with tocks (arch-dependent),
mtime (monotonic time) and wtime (wall time), and proposes a strategy
for migrating to that.

### John Stultz

In 2005, John Stultz proposed changes to the timers to use a 64-bit
nanosecond value as the base. He did a presentation and BOF at OLS 2005.
(It should be available online)

## Timer Tick Thread - LKML July 2005

There was a very long thread about timers, jiffies, and related subjects
in July of 2005 on the kernel mailing list.

The title was: "Re: [PATCH] i386: Selectable Frequency of the Timer
Interrupt"

Linus said jiffies is not going away

- still need 32-bit counter, shouldn't be real-time value (too much overhead to calculate)
- high-res timers shouldn't be sub-HZ, but instead, HZ should be high and timer tick should not be 1:1 with HZ
    - in other words, have HZ be high (like 2K), have the timer interrupt fire off at some lower frequency,
      and increment jiffies by more than one on each interrupt.
    - rationale for this is to keep a single sub-system

Arjan had good points about coalescing low-res timers

- 3 use cases:

    - low res timeouts
    - high res timer for periodic absolute wakeup (wake up every 10 ms, whether last one was late or nt
    - high res timer for periodic relative wakeup (wake up 10 ms from now)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

