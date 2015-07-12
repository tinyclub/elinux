> From: [eLinux.org](http://eLinux.org/Preemption_Instrumentation "http://eLinux.org/Preemption_Instrumentation")


# Preemption Instrumentation



@) ***Preliminary Draft*** @) under construction



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 CELF 1.0 (2-4-20-based)
        system](#celf-1-0-2.4-20-based-system)
    -   [1.2 preemption latency measurementin
        2.6](#preemption-latency-measurementin-2-6)
        -   [1.2.1 LKML discussion](#lkml-discussion)
    -   [1.3 Comparison of two systems](#comparison-of-two-systems)
    -   [1.4 Ingo's patch](#ingo-s-patch)
    -   [1.5 Realfeel](#realfeel)
    -   [1.6 latencytest-0.5.5](#latencytest-0-5-5)
    -   [1.7 Rationale](#rationale)
-   [2 Downloads](#downloads)
    -   [2.1 Patch](#patch)
    -   [2.2 Utility programs](#utility-programs)
-   [3 How To Use](#how-to-use)
-   [4 Sample Results](#sample-results)
-   [5 Future Work](#future-work)
-   [6 uncategorized information](#uncategorized-information)
    -   [6.1 stress testing](#stress-testing)

## Introduction

Preemption instrumentation is used to detect and measure periods where
the kernel is non-preemptible for a long period of time. The maximum
non-preemptible period corresponds with the maximum scheduling latency
in the kernel, and thus an important characteristic of realtime
accuracy.

By instrumenting the kernel to measure the longest preemption-off
periods, it becomes possible to identify and resolve realtime problems
with the kernel.

### CELF 1.0 (2.4.20-based) system

The CELF 1.0 kernel contains something called "preempt-times", to find
the maximum preemption-off periods in the kernel.

Not much information is available about this system. But here are some
pointers if you want to poke around:

    - the code for this is conditional on CONFIG_PREEMPT_TIMES
    - the main source file for the system appears to be in the file /kernel/preem_latency.c

The 2.4 code generates a report of the 20 longest preempt-off windows
per-CPU, identified by start and end source file and line number,
whenever a /proc file is read.

### preemption latency measurementin 2.6

Con Kolivas introduced a preemption latency measurement mechanism for
2.6.8-rc1

The mechanism sets a reporting threshold and dumps function names and
addresses of the start/stop points, plus a stack trace of the end point,
to the console/syslog if the time exceeds that threshold.

Con said:

* * * * *

Because of the recent discussion about latency in the kernel I asked
William Lee Irwin III to help create some instrumentation to determine
where in the kernel there were still sustained periods of
non-preemptible code. He hacked together this simple patch which times
periods according to the preempt count. Hopefully we can use this patch
in the advice of Linus to avoid the "mental masturbation" at guessing
where latency is and track down real problem areas.

It is enabled via a config option and by setting the threshold at boot
by passing the parameter: `preempt_thresh=2` to set the threshold at 2ms
for example.

The output is a warning in syslog like so:

5ms non-preemptible critical section violated 2 ms preempt threshold
starting at add\_wait\_queue+0x21/0x82 and ending at add\_wait
\_queue+0x4a/0x82

I would not recommend using this patch for daily use but please try it
out on multiple setups/filesystems etc and help us track down the areas.
Unfortunately I am not personally capable of fixing the code paths in
question so I'll need the help of others in this.

* * * * *

#### LKML discussion

The thread of kernel discussion about this feature is
[here](http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&threadm=2h6xN-6yB-13%40gated-at.bofh.it&rnum=2&prev=/groups%3Fq%3D%2BInstrumenting%2Bhigh%2Blatency%26hl%3Den%26lr%3D%26ie%3DUTF-8%26selm%3D2h6xN-6yB-13%2540gated-at.bofh.it%26rnum%3D2).



### Comparison of two systems

Todd Poynor of [Monta Vista](http://eLinux.org/Monta_Vista "Monta Vista") Software wrote:

* * * * *

The code in the CELF tree is an older version of the instrumentation
shipped with [Monta Vista](http://eLinux.org/Monta_Vista "Monta Vista")'s products; it
originated (I believe) from Jun Sun and George Anzinger (a.o.?), and was
formerly publically maintained during 2.4 and perhaps 2.5 as the
preempt-times patch by Robert Love.

I haven't looked at wli's new patch in detail. The instrumentation is
probably similar between the two, except that the 2.4 code doesn't
handle conditional scheduling "lock break" -- there was a
community-contributed version that fixed this, but preempt-times went
into unmaintained status around that time and nobody picked it up. There
are a number of special cases in the 2.4 code, such as explicit
scheduling by a process with a non-zero preempt count, that are probably
better handled by the conditional scheduling logic. There's also some
obscure reporting of softirq masks handled in preempt-off windows for
softirq processing, which might not be appropriate for 2.6 or for
systems that run softirqs in threads.



The William Irwin patch was incorporated into Ingo Molnar's Involuntary
preemption patch

### Ingo's patch

### Realfeel

### latencytest-0.5.5

Takashi Iwai, as leader in the ALSA project, is the author of a program
called "latencytest"

See
[http://www.alsa-project.org/\~iwai/alsa.html\#LatencyTest](http://www.alsa-project.org/~iwai/alsa.html#LatencyTest)

### Rationale

This is useful for finding spots of maximum preemption off.

## Downloads

### Patch

    - Patch for 2.6.7 is here:
      - base patch: Media:preempt-timing-1.patch
      - fixup patch: Media:preempt-timing-fixup.patch
    NOTE: William Lee Irwin III said he would be providing a cleaned-up patch against 2.6.8 or -mm soon

    - Patch for 2.6.8-rc2 is here:
      - Ingo Molnar made some additional fixes, and posted an updated patch
      - see http://redhat.com/~mingo/voluntary-preempt/preempt-timing-on-2.6.8-rc2-O2
      - see continuing discussion of this version at: http://lkml.org/lkml/2004/8/2/66
      - try searching for "voluntary preempt" on lkml for additional discussion

### Utility programs

None

## How To Use

See introduction text.

Ingo Molnar wrote this in another thread:

    the kernel command line option for immediate 2:1 is:

      "voluntary-preempt=2 preempt=1"

## Sample Results

Con wrote:

* * * * *

This works very nicely standalone getting us this for example with the
fixed patch:

    6ms non-preemptible critical section violated 1 ms preempt threshold
    starting at exit_mmap+0x1c/0x188 and ending at exit_mmap+0x118/0x188
      [<c011d769>] dec_preempt_count+0x14f/0x151
      [<c014d0d4>] exit_mmap+0x118/0x188
      [<c014d0d4>] exit_mmap+0x118/0x188
      [<c011df0a>] mmput+0x61/0x7b
      [<c01226fa>] do_exit+0x142/0x510
      [<c014c928>] unmap_vma_list+0xe/0x17
      [<c0122b8a>] do_group_exit+0x41/0xf9
      [<c0105fd5>] sysenter_past_esp+0x52/0x71

which then an objdump of the inlined code has allowed us to track it
down to this:

              profile_exit_mmap(mm);
              lru_add_drain();
    c014cfce:       e8 18 72 ff ff          call   c01441eb <lru_add_drain>
              spin_lock(&mm->page_table_lock);
    c014cfd3:       e8 16 06 fd ff          call   c011d5ee <inc_preempt_count>


 That's pretty specific. I dont think this comes under the umbrella of
statistics as such. Sure it can be modified to do it but I was looking
for a tool to find where specific latency hotspots still exist.

## Future Work

Here is a list of things that could be worked on for this feature:

    -



## uncategorized information

Here is some more stuff I found, that I haven't categorized yet.

-   realfeel.c is a program which programs the RTC to generate data at
    the rate of 2KHz, and measure the deviation from expected time to
    the actual time of wakeup of the program. It is available at:
-   surely LTT could show data on interrupt and scheduling latency (with
    a good post-processor)
-   surely HRT facilities could be used to create short periodic
    interrupt timer tests

-   There's a good article on preemption testing at: [Linux Scheduler
    Latency](http://www.linuxdevices.com/articles/AT8906594941.html)
    (This is the Clark Williams article)

### stress testing

Here's information about stress tests that were conducted by Clark
Williams in his preemption testing in March 2002:

After a bit of experimentation, I set up stress-kernel to run the
following programs:

-   -   NFS-COMPILE
    -   TTCP
    -   FIFOS\_MMAP
    -   P3\_FPU
    -   FS
    -   CRASHME


 The NFS-COMPILE script is the repeated compilation of a Linux kernel,
via an NFS filesystem exported over the loopback device. The TTCP (Test
TCP) program sends and receives large data sets via the loopback device.
FIFOS\_MMAP is a combination test that alternates between sending data
between two processes via a FIFO and mmap'ing and operating on a file.
The P3\_FPU test does operations on floating point matrices. The FS test
performs all sorts of unnatural acts on a set of files, such as creating
large files with holes in the middle, then truncating and extending
those files. Finally the CRASHME test generates buffers of random data,
then jumps to that data and tries to execute it.[[Category:Linux]


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

