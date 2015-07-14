> From: [eLinux.org](http://eLinux.org/Realtime_Preemption "http://eLinux.org/Realtime_Preemption")


# Realtime Preemption

## Contents

-   [1 Description](#description)
    -   [1.1 Overview](#overview)
        -   [1.1.1 Voluntary Preempt](#voluntary-preempt)
        -   [1.1.2 Conversion of Spinlocks to
            Mutexes](#conversion-of-spinlocks-to-mutexes)
    -   [1.2 people working on/interested in this
        stuff](#people-working-on-interested-in-this-stuff)
    -   [1.3 people working on related
        stuff](#people-working-on-related-stuff)
    -   [1.4 miscellaneous comments](#miscellaneous-comments)
        -   [1.4.1 Comments regarding the scheduling of RT
            tasks](#comments-regarding-the-scheduling-of-rt-tasks)
        -   [1.4.2 comments regarding the hard parts of this
            work](#comments-regarding-the-hard-parts-of-this-work)
        -   [1.4.3 comments about the number of raw spinlocks
            needed](#comments-about-the-number-of-raw-spinlocks-needed)
    -   [1.5 Rationale](#rationale)
-   [2 Resources](#resources)
    -   [2.1 Projects](#projects)
    -   [2.2 Specifications](#specifications)
    -   [2.3 Online resources](#online-resources)
-   [3 Downloads](#downloads)
    -   [3.1 Patch](#patch)
    -   [3.2 Utility programs](#utility-programs)
-   [4 How To Use](#how-to-use)
    -   [4.1 Configuration variables](#configuration-variables)
-   [5 How to validate](#how-to-validate)
-   [6 Related projects](#related-projects)
-   [7 Sample Results](#sample-results)
    -   [7.1 Case Study 1](#case-study-1)
    -   [7.2 Case Study 2](#case-study-2)
    -   [7.3 Case Study 3](#case-study-3)
-   [8 Status](#status)
-   [9 Future Work/Action Items](#future-work-action-items)
    -   [9.1 people who expressed
        interest](#people-who-expressed-interest)

## Description

### Overview

Realtime Preemption is (as of this writing 12/21/2004) a patch which
tries to improve realtime performance of the Linux kernel.

Recent patches from Ingo include a (large) number of technologies for
improving preemption and debugging preemption issues with the Linux
kernel.

An overview of the technologies is as follows:

-   voluntary preempt = a set of voluntary preemption points for the
    kernel, to improve normal scheduling latency (These changes
    basically
-   BKL change to semaphore
-   latency tracer

<!-- -->
    
#### Voluntary Preempt

Overview:

-   if it's on at compile time, it can be turned off at runtime with
    the command line: "voluntary-preemption=0" or
    "voluntary-preemption=off"
-   Creates a new function might\_resched(), which is used by might\_sleep().
    -   might\_resched calls cond\_resched() if voluntary preemption is on.

    -   Adds might\_sleep in several places.

#### Conversion of Spinlocks to Mutexes

According to Ingo Molnar, it's primary author, "the big change in this
release is the addition of PREEMPT\_REALTIME, which is a new
implementation of a fully preemptible kernel model"

For a brief description of the overall technology, see:
[http://kerneltrap.org/node/3995?PHPSESSID=4bc02ae16e5a27308031f3cd664fd574](http://kerneltrap.org/node/3995?PHPSESSID=4bc02ae16e5a27308031f3cd664fd574)

Briefly, the technology makes spinlocks and rwlocks preemptible by
default.

-   the patch auto-detects at compile-time the type of lock to use
    for a spinlock (mutex or original raw\_spinlock)
-   it uses a feature of gcc to manage this (reducing patch size)
-   it uses native Linux semaphores for preemption
-   it convert rwlocks to rw-semaphores
-   apparently, about 90 locks are targetted for NON-conversion to
    preemptibility (that is, they are preserved as RAW\_SPINLOCKS)

Ingo mentioned at one time that this was about 20% of the locks in his
kernel configuration, implying that there were about 450 spinlocks
present in the kernel in his configuration.

Ingo said this about how well this works on Un-processor (UP) systems
versus SMP systems.



    ...and no matter how well UP works, to fix SMP one has to 'cover' all the
    necessary locks first before fixing it, which (drastic) increase in raw
    locks invalidates most of the UP efforts of getting rid of raw locks.
    That's why i decided to go for SMP primarily - didnt see much point in
    going for UP.

Normally, in UP the spinlocks are compiled away. When PREEMPT is turned
on (without the new patch) these spinlocks are turned into markers for
non-preemptible regions. When RT-PREEMPT is used,

### people working on/interested in this stuff

-   Ingo Molnar, [Red Hat](http://eLinux.org/Red_Hat "Red Hat"), voluntary
    preemption, Ingo real-time preemption
-   Sven Dietrich, [Monta Vista](http://eLinux.org/Monta_Vista "Monta Vista"), MV
    real-time preemption
-   Daniel Walker, [Monta Vista](http://eLinux.org/Monta_Vista "Monta Vista"),
    priority inheritance??
-   John Cooper, [Time Sys](http://eLinux.org/Time_Sys "Time Sys"), ???
-   Tim Bird, Sony, port to 2.6.10-native, port to PPC
-   Scott Woods, [Time Sys](http://eLinux.org/Time_Sys "Time Sys"), IRQ threading??

### people working on related stuff

-   Bill Huey, [Lynux     Works](http://eLinux.org/index.php?title=Lynux_Works&action=edit&redlink=1 "Lynux Works (page does not exist)")??, mmlinux

### miscellaneous comments

#### Comments regarding the scheduling of RT tasks

Ingo said (in this
[message](http://groups-beta.google.com/group/linux.kernel/browse_frm/thread/e8b81552643bfc50/d0e021c7065fa600?q=OSDL+bug+3770&_done=%2Fgroup%2Flinux.kernel%2Fsearch%3Fgroup%3Dlinux.kernel%26q%3DOSDL+bug+3770%26qt_g%3D1%26searchnow%3DSearch+this+group%26&_doneTitle=Back+to+Search&&d#d0e021c7065fa600)):

* * * * *

note that my -RT patchset includes scheduler changes that implement
"global RT scheduling" on SMP systems. Give it a go, it's at:

      http://redhat.com/~mingo/realtime-preempt/

you have to enable CONFIG\_PREEMPT\_RT to active this feature. I've
designed this code to not hurt non-RT scheduling, and i've optimized
performance for the 'lightly loaded case' (which is the most common to
occur on mainline-using systems).

A very short description of the design: there's a global 'RT overload
counter' - which is zero and causes no overhead if there is at most 1 RT
task in every runqueue. (i.e. at most 2 RT tasks on a 2-way system, at
most 4 RT tasks on a 4-way system, etc.) If the system gets into 'RT
overload' mode (e.g. the third RT task gets activated on a 2-way box),
then the scheduler starts to balance the RT tasks agressively. Also,
whenever an RT task is preempted on a CPU, or is woken up but cannot
preempt a higher-prio RT task on a given CPU, then it's 'pushed' to
other CPUs if possible. This design avoids global locking (it avoids a
global runqueue), which simplifies things immensely. (I first tried a
global runqueue for RT tasks but the complexity impact was much bigger.)

(note that these scheduler changes are resonably self-contained and do
not depend on other parts of PREEMPT\_RT, so in theory they could be
added to mainline too, after some time - given lots of testing and broad
agreement.)

* * * * *

#### comments regarding the hard parts of this work

Ingo says (at:
[http://groups-beta.google.com/group/linux.kernel/msg/cf036477d30ab736](http://groups-beta.google.com/group/linux.kernel/msg/cf036477d30ab736))

some of the harder stuff:

- the handling of per-CPU data structures (get_cpu_var())

- RCU and softirq data structures

- the handling of the IRQ flag



#### comments about the number of raw spinlocks needed

Ingo says (at:
[http://groups-beta.google.com/group/linux.kernel/msg/e63b2860d2e993dd](http://groups-beta.google.com/group/linux.kernel/msg/e63b2860d2e993dd))



Sven Dietrich <sdietr...@mvista.com> wrote:

> IMO the number of raw_spinlocks should be lower, I said teens before.

> Theoretically, it should only need to be around hardware registers and
some memory maps and cache code, plus interrupt controller and other
SMP-contended hardware.

> yeah, fully agreed. Right now the 90 locks i have means roughly 20% of
all locking still happens as raw spinlocks.

> But, there is a 'correctness' _minimum_ set of spinlocks that _must_ be
raw spinlocks - this i tried to map in the -T4 patch. The patch does run
on SMP systems for example. (it was developed as an SMP kernel - in fact
i never compiled it as UP :-|.) If code has per-CPU or preemption
assumptions then there is no choice but to make it a raw spinlock, until
those assumptions are fixed.



### Rationale

This feature is intended to provide much better realtime scheduling
response for a Linux system.

## Resources

### Projects

Various parties are working on ports: [Time Sys](http://eLinux.org/Time_Sys "Time Sys")
and Monta Vista, in particular, seem to have made ports to PPC and ARM
platforms.

### Specifications

None that I'm aware of.

### Online resources

The original announcement for voluntary-preemption:

-   [http://people.redhat.com/mingo/realtime-preempt/older/ANNOUNCE-voluntary](http://people.redhat.com/mingo/realtime-preempt/older/ANNOUNCE-voluntary)

Here's some stuff by Jonathon Corbet:

-   [http://lwn.net/Articles/106010/](http://lwn.net/Articles/106010/)
-   [http://lwn.net/Articles/107269/](http://lwn.net/Articles/107269/)
-   [http://lwn.net/Articles/108216/](http://lwn.net/Articles/108216/)
-   [http://lwn.net/Articles/129511/](http://lwn.net/Articles/129511/)

There's a page of links about RT for audio at:

-   [http://www.affenbande.org/\~tapas/wiki/index.php?Low%20latency%20for%20audio%20work%20on%20linux%202.6.x](http://www.affenbande.org/~tapas/wiki/index.php?Low%20latency%20for%20audio%20work%20on%20linux%202.6.x)

A brief introduction of RT patch (Sorry, in Japanese only):

-   [http://www.atmarkit.co.jp/fembedded/rtos03/rtos03a.html](http://www.atmarkit.co.jp/fembedded/rtos03/rtos03a.html)

-   Paper: "[Embedded GNU/Linux and Real-Time an executive
    summary](http://www.reliableembeddedsystems.com/pdfs/2010_03_04_rt_linux.pdf)",
    2010 by Robert Berger
    -   This papers, prepared for the Embedded World Conference 2010,
        compares different real-time approaches (including RT-preempt
        and dual-kernel approaches).
    -   The paper has an extensive list of references, which are very
        good.

## Downloads

### Patch

     See http://redhat.com/~mingo/realtime-preempt/

### Utility programs

[other programs, user-space, test, etc. related to this technology]

## How To Use

-   apply patch
-   choose desired preemption level
-   compile kernel

### Configuration variables

The patch introduces (or modifies) the following configuration
variables:

<table>
<tbody>
<tr class="odd">
<td align="left">Variable</td>
<td align="left">Purpose</td>
</tr>
<tr class="even">
<td align="left">ASM_SEMAPHORES</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">BLOCKER</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CRITICAL_IRQSOFF_TIMING</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">CRITICAL_PREEMPT_TIMING</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">CRITICAL_TIMING</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">FRAME_POINTER</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">LATENCY_TIMING</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">LATENCY_TRACE</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">MCOUNT</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">PREEMPT</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">PREEMPT_BKL</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">PREEMPT_DESKTOP</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">PREEMPT_HARDIRQS</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">PREEMPT_NONE</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">PREEMPT_RT</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">PREEMPT_SOFTIRQS</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">PREEMPT_TRACE</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">PREEMPT_VOLUNTARY</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">RTC_HISTOGRAM</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">RT_DEADLOCK_DETECT</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">RWSEM_GENERIC_SPINLOCK</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">RWSEM_XCHGADD_ALGORITHM</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">SPINLOCK_BKL</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">USE_FRAME_POINTER</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">WAKEUP_TIMING</td>
<td align="left"></td>
</tr>
</tbody>
</table>

-   retrieved from patch with command:

<!-- -->

    grep "[+-]config " realtime-preempt-2.6.10-mm1-V0.7.34-01 | sed "s/[+-]config //" | sort | uniq



## How to validate

[put references to test plans, scripts, methods, etc. here]

-   use included trace feature, or
-   use included latency overrun reporting mechanism
-   [Preemption\_Instrumentation](http://eLinux.org/Preemption_Instrumentation "Preemption Instrumentation")

## Related projects

[Monta Vista](http://eLinux.org/Monta_Vista "Monta Vista") released a similar technology,
which had the following features:

See
[http://groups-beta.google.com/group/linux.kernel/msg/7eeef031d9ec1446](http://groups-beta.google.com/group/linux.kernel/msg/7eeef031d9ec1446)

These RT enhancements are an integration of features developed by
others and some new MontaVista components:

- Voluntary Preemption by Ingo Molnar
- IRQ thread patches by Scott Wood and Ingo Molnar
- BKL mutex patch by Ingo Molnar (with MV extensions)
- PMutex from Germany's Universitaet der Bundeswehr, Munich
- MontaVista mutex abstraction layer replacing spinlocks with mutexes

## Sample Results

[Examples of use with measurement of the effects.]

### Case Study 1

-   Linux RT Benchmarking Framework
    -   [http://www.opersys.com/lrtbf/](http://www.opersys.com/lrtbf/)
-   Summary of dicussion in LKLM (sorry in Japanese)
    -   [http://japan.linux.com/kernel/05/07/25/2334226.shtml?topic=1](http://japan.linux.com/kernel/05/07/25/2334226.shtml?topic=1)
    -   [http://japan.linux.com/kernel/05/08/29/0817208.shtml?topic=1](http://japan.linux.com/kernel/05/08/29/0817208.shtml?topic=1)

### Case Study 2

Trevor Woerner published some results in November 2005 regarding some
latency measurements he have been recording on the 2.6.14 kernel with
Ingo's patches.

See
[http://geek.vtnet.ca/embedded/LatencyTests/html/index.html](http://geek.vtnet.ca/embedded/LatencyTests/html/index.html)

### Case Study 3

## Status

-   [Rt\_Preempt\_Subpatch\_Table](http://eLinux.org/Rt_Preempt_Subpatch_Table "Rt Preempt Subpatch Table")
-   Status: [not started??]

     (one of: not started, researched, implemented, measured, documented, accepted)

-   Architecture Support:

      (for each arch, one of: unknown, patches apply, compiles, runs, works, accepted)

    -   i386: unknown
    -   ARM: unknown
    -   PPC: unknown
    -   MIPS: unknown
    -   SH: unknown

## Future Work/Action Items

Here is a list of things that could be worked on for this feature:

- help with mainlining???
- perform testing on multiple platforms
- provide use cases for justification
- what else?
- break patch into manageable pieces - doesn't Ingo use any kind of patch management system???



### people who expressed interest

Manas Saksena, Jon Masters, Takeharu Kato, Ralph Siemsen, Jyunji Kondo


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")
-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")

