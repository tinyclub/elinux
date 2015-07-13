> From: [eLinux.org](http://eLinux.org/RTC_No_Sync "http://eLinux.org/RTC_No_Sync")


# RTC No Sync



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 LKML discussion](#lkml-discussion)
    -   [1.2 Rationale](#rationale)
-   [2 Downloads](#downloads)
    -   [2.1 Patch](#patch)
    -   [2.2 Utility programs](#utility-programs)
-   [3 How To Use](#how-to-use)
-   [4 Sample Results](#sample-results)
    -   [4.1 case 1](#case-1)
    -   [4.2 case 2](#case-2)
    -   [4.3 case 3](#case-3)
-   [5 Status](#status)
    -   [5.1 Previous mainline attempts](#previous-mainline-attempts)
-   [6 Future Work](#future-work)

## Introduction

One routine that potentially takes a long time during kernel startup is
`get_cmos_time()`. This routine is used to read the value of the
external real-time clock (RTC) when the kernel boots. Currently, this
routine delays until the edge of the next second rollover, in order to
ensure that the time value in the kernel is accurate with respect to the
RTC.

However, this operation can take up to one full second to complete, and
thus introduces up to 1 second of variability in the total bootup time.

The synchronization in this routine is easy to remove. It can be
eliminated by removing the first two loops in the function
`get_cmos_time()`, which is located in
`include/asm-i386/mach-default/mach_time.h` for the i386 architecture.
Similar routines are present in the kernel source tree for other
architectures.

One tradeoff in making this modification is that the time stored by the
Linux kernel is no longer completely synchronized (to the boundary of a
second) with the time in the machine's realtime clock hardware. Some
systems save the system time back out to the hardware clock on system
shutdown. After numerous bootups and shutdowns, this lack of
synchronization will cause the realtime clock value to drift from the
correct time value.

Since the amount of un-synchronization is up to a second per boot cycle,
this drift can be significant. However, for some embedded applications,
this drift is unimportant. Also, in some situations the system time may
be synchronized with an external source anyway, so the drift, if any, is
corrected under normal circumstances soon after booting.

### LKML discussion

The RTC synchronization was discussed on LKML in May (with even Linus
himself commenting) That thread is available
[here](http://groups.google.com/groups?hl==en&lr==&ie==UTF-8&threadm==1To2R-2S7-11%40gated-at.bofh.it&rnum==1&prev==/groups%3Fhl%3Den%26lr%3D%26ie%3DUTF-8%26selm%3D1To2R-2S7-11%40gated-at.bofh.it).

### Rationale

The RTC edge synchronization can take up to 1 second, and takes .5
seconds on average.

## Downloads

### Patch

-   [Patch for CELF version XXXXXX is \*here\*]
-   [Patch for 2.4.xx is \*here\*]
-   Patch for 2.6.7 (only for i386 architecture): rtc-nosynch-3.patch
-   Patch for 2.6.10 for PPC architecture:
    attachment:rtcnosync-ppc-2.6.10.patch

You might also want to check the [Patch
Archive](http://eLinux.org/Patch_Archive "Patch Archive")

### Utility programs

None

## How To Use

Apply the patch to your Linux kernel. Then reconfigure your kernel so
that "CONFIG\_RTC\_NO\_SYNC\_ON\_READ" is enabled.

The option will be found under "General Setup", "Fast boot options"
labeled as "No SYNC on read of Real Time Clock".

## Sample Results

### case 1

Tim Bird measured the effect of eliminating this synchronization on an
HP xw4100 workstation. The machine had a Pentium 4 processor running at
3 GHz. With the synchronization, the time to perform get\_cmos\_time()
varied from 150 milliseconds to 900 milliseconds. Without the
synchronization, the time to perform get\_cmos\_time() was under 1
millisecond.

### case 2

Richard Griffiths measured the effect of eliminating the synchronization
on a 1GHZ Pentium III based desktop. With synchronization executing
get\_cmos\_time() took from 200 milliseconds to a full second. Without
the synchronization, the time to perform get\_cmos\_time() was under 1
millisecond.

### case 3

Tim Bird measured the RTC read synchronization cost for a PowerPC board.
The platform was a PPC440GP (ebony) board, using a Dallas Semiconductor
DS1743 RTC.

The RTC read routine is in
arch/ppc/syslib/todc\_time.c:todc\_get\_rtc\_time(). The loop to
synchronize with the seconds edge is in
arch/ppc/kernel/time.h:time\_init().

I measured the time for synchronizing the clock edge several times:

-   105 ms, 139 ms, 313 ms, 572 ms, 213 ms, 626 ms, 753 ms, 426 ms, 535
    ms, 163 ms

Note that for PPC, the synchronization code is *outside* the RTC read
routine, instead of inside the routine (as for i386).

## Status

Fixed in mainline.

Matt Mackall submitted a large patch set to fix this problem, in March
2006. See
[http://lkml.org/lkml/2006/3/17/340](http://lkml.org/lkml/2006/3/17/340)
. These patches were mainlined in the Linux kernel in version 2.6.16.
See
[http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=63732c2f37093d63102d53e70866cf87bf0c0479](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=63732c2f37093d63102d53e70866cf87bf0c0479)

### Previous mainline attempts

A patch was eventually submitted to LKML for consideration (in Nov,
2004). The thread is
[here](http://groups.google.com/groups?q==rtc+griffiths&hl==en&lr==&selm==2UNgm-6Mu-21%40gated-at.bofh.it&rnum==1)

There was no response.

## Future Work

Here is a list of things that could be worked on for this feature:

-   In an earlier thread on LKML, it was suggested that some background
    method of synchronizing the system clock and hardware clock could be
    used to avoid the clock drift problem.
-   one idea is: "you could check the cmos time in the timer interrupt
    during boot, and correct it there rather than busy-waiting"
-   Another person notes:

> "There is hwclock that will read or write the CMOS clock, and it
> synchronizes. So if one wants to synchronize with the CMOS clock
> (rather than, say, with an external clock), and wants the
> better-than-1-sec accuracy, then that can be done in a boot script."

-   We need to check if hwclock uses get\_cmos\_time() to read the
    clock. If so, this method of synchronizing the clock edge after
    booting won't work (once the get\_cmos\_time synch is disabled.)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

