> From: [eLinux.org](http://eLinux.org/Short_IDE_Delays "http://eLinux.org/Short_IDE_Delays")


# Short IDE Delays



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 Rationale](#rationale)
-   [2 Downloads](#downloads)
    -   [2.1 Patch](#patch)
    -   [2.2 Utility programs](#utility-programs)
-   [3 How To Use](#how-to-use)
-   [4 Sample Results](#sample-results)
-   [5 Status](#status)
-   [6 Future Work](#future-work)

## Introduction

This page describes the feature "short IDE delays". This is just a
description of a technique for shortening the probing time used during
certain IDE operations (I think primarily on startup). It was noted on a
test machine that IDE initialization takes a significant percentage of
the total bootup time. Almost all of this time is spent busywaiting in
the routine `ide_delay_50ms()`.

It is trivial to modify the value of the delay used in this routine.

Reducing the duration of the delay in the `ide_delay_50ms()` routine
provides a substantial reduction in the overall bootup time for the
kernel on a typical desktop system. It also has potential for use in
embedded systems where PCI-based IDE drives are used.

In the patch shown here, the delay was modified from 50 milliseconds to
5 milliseconds. However, for particular hardware, it may be desirable to
tune the delay to the lowest possible value.

This change may only be appropriate for embedded hardware. In a desktop
environment, a variety of legacy hardware may be encountered which may
need these relatively long delays.

### Rationale

In testing on one desktop system, IDE delays accounted for about 70% of
the total kernel bootup time. These delays may not be needed for proper
operation of the hardware for a particular consumer electronics product.

## Downloads

### Patch

-   Patch for 2.6.6: short-ide-delays.patch
-   Patch for 2.6.8-rc2: ide-delay-2.6.8-rc2.patch

Following is what the patch looked like for 2.6.6. Recently, the
ide\_delay\_50ms() routine was replaced with multiple independent calls
to msleep(50), which makes more recent patches more difficult.

>     diff -ruN linux-2.6.6.orig/drivers/ide/ide.c linux-2.6.6-kfi/drivers/ide/ide.c
>     --- linux-2.6.6.orig/drivers/ide/ide.c  2004-05-09 19:32:26.000000000 -0700
>     +++ linux-2.6.6-kfi/drivers/ide/ide.c   2004-06-09 21:14:01.000000000 -0700
>     @@ -1401,10 +1401,10 @@
>      void ide_delay_50ms (void)
>      {
>      #ifndef CONFIG_BLK_DEV_IDECS
>     -   mdelay(50);
>     +   mdelay(5);
>      #else
>         __set_current_state(TASK_UNINTERRUPTIBLE);
>     -   schedule_timeout(1+HZ/20);
>     +   schedule_timeout(1+HZ/200);
>      #endif /* CONFIG_BLK_DEV_IDECS */
>      }

### Utility programs

None

## How To Use

Apply the patch, compile the kernel, and measure the kernel boot time.

## Sample Results

As an experiment, this code (located in the file `drivers/ide/ide.c`)
was modified to only delay 5 milliseconds instead of 50 milliseconds.

The machine used was an HP XW4100 Linux workstation system, with the
following characteristics:

-   Pentium 4 HT processor, running at 3GHz
-   512 MB RAM
-   Western Digital 40G hard drive on hda
-   Generic CDROM drive on hdc

When a kernel with this change was run on the test machine, the total
time for the `ide_init()` routine dropped from 3327 milliseconds to 339
milliseconds. The total time spent in all invocations of
`ide_delay_50ms()` was reduced from 5471 milliseconds to 552
milliseconds. The overall bootup time was reduced accordingly, by about
5 seconds.

The ide devices were successfully detected, and the devices operated
without problem on the test machine. However, this configuration was not
tested exhaustively.

## Status

Todd Poynor posted a patch for this to LKML on July 30, 2004.See the
discussion thread at:
[http://lkml.org/lkml/2004/7/30/141](http://lkml.org/lkml/2004/7/30/141)

This patch was rejected by Alan Cox, Jeff Garzik and Mark Lord. See the
thread mentioned above for details. The reasons amounted to:

-   the IDE driver is delicate and temperamental, changing it would
    break things
    -   This ignored the fact that the submitted patch only changed
        things when a config option was enabled
    -   the counterargument to this is that in this situation, the patch
        would not get much testing by mainline users
-   if users tried this out, they might have problems and they would
    then bug the IDE maintainers
    -   Alan suggested having the option "taint" the kernel, to avoid
        bug reports
-   newer hardware (SATA) won't have these problems and the probes
    should work faster (in other words, if you ignore this problem it
    will go away)
-   the timeouts shouldn't be correlated to each other anyway. That is,
    these timeouts are used by different parts of the IDE code for
    different operations. The fact that they currently have the same
    timeout value is just happenstance, and shouldn't be locked-in with
    a single value definition.

Alan Cox summarized things by saying:
`If you want to speed this up then the two bits that the initial proposal and Jeff have sensibly come up with are `

1.  Are we doing too many probes
2.  Should we switch to proper reset polling

For certain cases (PPC spin up) we actually have switched to doing drive
spin up this way, I certainly have no objection to doing the rest of the
boot optimisation by following the standards carefully.

## Future Work

Here is a list of things that could be worked on for this feature:

-   make a config option for the value of the delay
-   try to verify that the change is safe to use
    -   check to see if these probes are used during runtime (not just
        bootup time)
    -   test as much hardware as possible
    -   ask about the safety of this on LKML


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

