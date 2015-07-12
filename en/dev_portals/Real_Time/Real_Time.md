> From: [eLinux.org](http://eLinux.org/Real_Time "http://eLinux.org/Real_Time")


# Real Time







## Contents

-   [2 Introduction](#introduction)
-   [3 Real Time Wiki](#real-time-wiki)
-   [4 Software Projects](#software-projects)
-   [5 Hardware Implementations](#hardware-implementations)
-   [6 Documents](#documents)
-   [7 Further Open Source Projects](#further-open-source-projects)


## Introduction

This page has information about Real-time usage of Linux. Also this page
has information about timing systems for Linux. This is of interest to
CE Linux Forum members, because many consumer electronics products have
realtime requirements (e.g. in the areas of multi-media presentation, or
communications)

## Real Time Wiki

-   Please note that the primary source of information for Real Time
    Linux information is the new [RTWiki](http://rt.wiki.kernel.org/).

## Software Projects

-   [Realtime Preemption](../.././dev_portals/Real_Time/Realtime_Preemption/Realtime_Preemption.md "Realtime Preemption") -
    Ingo Molnar's patchset to add realtime preemption to the 2.6 Linux
    kernel
-   [Kernel Timer Systems](../.././dev_portals/Real_Time/Kernel_Timer_Systems/Kernel_Timer_Systems.md "Kernel Timer Systems")
    - Various new proposals for changing the kernel timing system
-   [Soft IRQ Threads](../.././dev_portals/Real_Time/Soft_IRQ_Threads/Soft_IRQ_Threads.md "Soft IRQ Threads") -
    Technology to put SoftIRQs in threads so they can be preempted.
    -   ***NOTE:** Soft IRQ threads are now (Oct 2007) incorporated into
        the [Realtime
        Preemption](../.././dev_portals/Real_Time/Realtime_Preemption/Realtime_Preemption.md "Realtime Preemption") patch*
-   [High Resolution
    Timers](../.././dev_portals/Real_Time/High_Resolution_Timers/High_Resolution_Timers.md "High Resolution Timers") - A system
    to support timers with sub-jiffy resolution
-   [Variable Scheduling
    Timeouts](../.././dev_portals/Real_Time/Variable_Scheduling_Timeouts/Variable_Scheduling_Timeouts.md "Variable Scheduling Timeouts")
    - A system to support variable timeouts for periodic system
    activities (also known as Tickless)

## Hardware Implementations

Ti AM18XX PRUSSv1

[Ti\_AM33XX\_PRUSSv2](../.././dev_portals/Real_Time/Ti_AM33XX_PRUSSv2/Ti_AM33XX_PRUSSv2.md "Ti AM33XX PRUSSv2")

Tools for PRUSS



## Documents

-   [Building Embedded Linux Systems, 2nd
    edition](http://www.amazon.com/Building-Embedded-Linux-Systems-Yaghmour/dp/0596529686)
    discusses the realtime preemption patch.
-   [CELF Realtime
    Specification](http://tree.celinuxforum.org/CelfPubWiki/RTSpecDraft_5fR2)
    (from 2004, so it's pretty old)
-   Realtime Preemption presentation by Manas at the 2005 CELF Technical
    Conference -
    [Media:Real-Time-Preemption-Patchset.pdf](http://eLinux.org/images/4/4e/Real-Time-Preemption-Patchset.pdf "Real-Time-Preemption-Patchset.pdf")
-   [Realtime Testing Best
    Practices](../.././dev_portals/Real_Time/Realtime_Testing_Best_Practices/Realtime_Testing_Best_Practices.md "Realtime Testing Best Practices")
    - a document to show recent testing results, and give hints for how
    different tests are conducted and what pitfalls to avoid.
-   [Real time in embedded Linux
    systems](http://free-electrons.com/articles/realtime/)
-   [Using Real-Time
    Linux](http://www.celinux.org/elc08_presentations/Using_Real-Time_Linux.KlaasVanGend.ELC2008.pdf)
    - Presentation by Klaas van Gends at the ELC 2008. The
    [video](http://free-electrons.com/pub/video/2008/elc/elc2008-klaas-van-gend-using-real-time-linux.ogg)
    is available
-   Frank Rowand's series of talks
    -   *Adventures in real-time performance tuning*
        -   Part 1,
            [slides](http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2008Presentations?action=AttachFile&do=get&target=adventures_in_real_time_performance_tuning_part_1-no_hidden.pdf)
            and
            [video](http://free-electrons.com/pub/video/2008/elce/elce2008-rowand-adventures-real-time-part1.ogv)
            ELCE 2008 version
        -   Part 2,
            [slides](http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2008Presentations?action=AttachFile&do=get&target=adventures_in_real_time_performance_tuning_part_2-no_hidden.pdf)
            and
            [video](http://free-electrons.com/pub/video/2008/elce/elce2008-rowand-adventures-real-time-part2.ogv)
            ELCE 2008 version
    -   Musings On Analysis of Measurements of a Real-Time Workload
        [slides](http://tree.celinuxforum.org/CelfPubWiki/ELC2009Presentations?action=AttachFile&do=get&target=musings_on_analysis_of_measurements_of_a_real-time_workload.pdf)
        ELC 2009 version and
        [video](http://free-electrons.com/pub/video/2009/elce/elce2009-rowand-measurement-diagnostic-tools.ogv)
    -   Real-Time Linux Failure
        [slides](http://eLinux.org/images/b/be/Real_time_linux_failure.pdf "Real time linux failure.pdf")
        ELC 2010 version and [full HD
        video](http://free-electrons.com/pub/video/2011/elc/elc-2011-rowand-real-time-issues-i-cache-locks.webm)
        and [450x800
        video](http://free-electrons.com/pub/video/2011/elc/elc-2011-rowand-real-time-issues-i-cache-locks-x450p.webm)
    -   How Linux PREEMPT\_RT Works
        [slides](http://eLinux.org/images/5/51/Elce11_rowand.pdf "Elce11 rowand.pdf")
        ELCE 2011 version
-   *Real-time vs real-fast, how to choose*, conference given by Paul E.
    McKenney at the Ottawa Linux Symposium 2008.
    [Paper](http://ols.fedoraproject.org/OLS/Reprints-2008/mckenney-reprint.pdf)
    and
    [video](http://free-electrons.com/pub/video/2008/ols/ols2008-paul-mckenney-real-time-vs-real-fast.ogg)

-   Paper: "[Embedded GNU/Linux and Real-Time an executive
    summary](http://www.reliableembeddedsystems.com/pdfs/2010_03_04_rt_linux.pdf)",
    2010 by Robert Berger
    -   This papers, prepared for the Embedded World Conference 2010,
        compares different real-time approaches (including PREEMPT\_RT
        and dual-kernel approaches).
    -   The paper has an extensive list of references.
-   Tutorial [RT-Preempt
    Tutorial](../.././dev_portals/Real_Time/RT-Preempt_Tutorial/RT-Preempt_Tutorial.md "RT-Preempt Tutorial")
-   [OSADL Realtime
    Page](https://www.osadl.org/Realtime-Linux.projects-realtime-linux.0.html)
    with realtime latency
    [testing](https://www.osadl.org/Continuous-latency-monitoring.qa-farm-monitoring.0.html)
    farm.

## Further Open Source Projects

-   [Xenomai](http://www.xenomai.org) - Real-time development framework,
    closely cooperating with the Linux kernel. Among other features, it
    provides a migration path from various RTOSes like VxWorks, PSOS+,
    etc. to Linux based on so-called skins.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Real Time](http://eLinux.org/Category:Real_Time "Category:Real Time")

