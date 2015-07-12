> From: [eLinux.org](http://eLinux.org/IDE_Preempt_Specification "http://eLinux.org/IDE_Preempt_Specification")


# IDE Preempt Specification



    #noprint
    VERSION 0.2 - for other versions, click the "info" button.

    '''Table Of Contents:'''
    [[TableOfContents]]
    #noprint

## Contents

-   [1 Introduction](#introduction)
-   [2 Rationale](#rationale)
-   [3 Specifications](#specifications)
-   [4 Notes (informational and
    non-normative)](#notes-informational-and-non-normative)
-   [5 References](#references)
-   [6 Remaining Issues](#remaining-issues)

## Introduction

The IDE driver in the Linux kernel normally uses a series of busywait
delays during its initialization. When the driver executes these
busywaits, the kernel does nothing for the duration of the wait. The
time spent in these waits could be used for other initialization
activities, if they could be run concurrently with these waits.

More specifically, busywait-style delays such as udelay() in module init
functions inhibit kernel preemption because the Big Kernel Lock is held,
while yielding [APIs](../../../.././dev_portals/Boot_Time/Bootup_Time_Working_Group/IDE_Preempt_Specification/APIs/APIs.md "APIs") such as schedule\_timeout() allow
preemption. This is true because the kernel handles the BKL specially
and releases and reacquires it across reschedules allowed by the current
thread.

This IDE-preempt specification requires that the driver eliminate these
busywaits and replace them with a mechanism that allows other work to
proceed while the IDE driver is initializing.

## Rationale

IDE modules are one of the major offenders with regard to executing
non-preemptible (busywait) delays during initialization. The
ide-probe-mod driver spends a great deal of time in repeated calls to
ide\_delay\_50ms() during probe and drive identification. The driver
busy waits in order to let the IDE controller make progress before
polling for status or to allow previous operations to complete.

The total time spent in these busywait calls in some testing was on the
order of 250 milliseconds. (Testing details are available on the page
mentioned below in the References section.) By changing these calls to
something that can be preempted, other initialization work can
potentially proceed in parallel with the IDE driver init, and the total
system boot time can be reduced.

## Specifications

1.  1.  The Linux kernel SHOULD use preemptible waits during IDE driver
        initialization, rather than busywaits. 2. When this feature is
        supported, the IDE driver SHOULD NOT impose a maximum period of
        non-preemptibility in the kernel of greater than 20
        milliseconds.

## Notes (informational and non-normative)

1.  It is expected that using a preemptible wait in the kernel will have
    no benefit in the current (2.4) kernel driver initialization scheme
    unless the IDE driver is loaded as a module. 2. It is expected that
    the overhead of using a preemptible wait in the IDE driver may
    lengthen the total time for the IDE driver to complete it's
    initialization. However, the total CPU time available for system
    initialization should be increased by this feature. That is, more
    time should be available for other initialization tasks, which
    should result in a net decrease of boot time. 3. This feature is not
    required (that is, it is not specified as a "SHALL" requirement)
    because it is not clear that this feature is valuable for a large
    set of embedded configurations. The fact that the feature requires
    that the IDE driver be loaded as a module (in order to achieve
    concurrency gains) is a serious drawback. However, this feature
    offers some advantage for some situations, and points the way toward
    more general techniques for improved concurrency in driver
    initializations. 4. The value of 20 milliseconds in item 2 of the
    specification may seem somewhat arbitrary. Following is some
    rationale for the selection of this number.

<!-- -->

    Because of the structure of the IDE driver initialization for the 2.4 kernel, the
    preempt-off period is an indicator for the amount of time that the CPU is NOT available for
    other concurrent initialization activities.  Thus, by recommending a maximum non-preemptibility
    value for the IDE driver init, the specification is really indicating that some significant
    amount of time, formerly wasted by IDE busywaits, should be made available for other initialization
    activities.

    The non-preemptible period is normally equal to the sum of all IDE driver busywaits combined.  With
    a preemptible wait, the non-preemptible period should be smaller than the duration of
    a single busywait.

    In 2.4.20, the wait is executed in the routine ide_delay_50ms(), which, as its name
    suggests, delays for 50 milliseconds.
    More than half of the busywait interval should become available for other processes to use,
    if the feature is to have any real value.

    Also, in order to be reasonable, the value chosen should be longer than the
    maximum preemption off period that has been measured in testing of this feature.  This is
    about 10 milliseconds.

    Therefore, 20 milliseconds represents a "rule-of-thumb"
    guideline for the maximum amount of time that the IDE driver waits should be non-preemptible.

## References

A patch is available which implements this features. Please see the
[Preempt IDE Preempt
page](http://tree.celinuxforum.org/pubwiki/moin.cgi/IDE).

## Remaining Issues


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Specification](http://eLinux.org/Category:Specification "Category:Specification")

