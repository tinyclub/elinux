> From: [eLinux.org](http://eLinux.org/IDE_Preempt "http://eLinux.org/IDE_Preempt")


# IDE Preempt



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 Rationale](#rationale)
-   [2 Downloads](#downloads)
    -   [2.1 Patch](#patch)
    -   [2.2 Utility programs](#utility-programs)
-   [3 How To Use](#how-to-use)
-   [4 Sample Results](#sample-results)
-   [5 Future Work](#future-work)

## Introduction

"IDE Preempt" is the shorthand name for a feature which allows the IDE
driver to be preempted during its initialization. There are long delays
associated with the initialization of the IDE driver. Use of the
IDE-preempt feature allows other kernel initialization work to proceed
while the IDE driver is initializing, under certain circumstances.

Currently, the set of conditions under which this feature is useful is
pretty limited. The IDE driver must be configured and compiled as a
kernel loadable module. This rules out most desktop uses of the
IDE-preempt feature.

This code basically turns the main busywait routine, `ide_delay_50ms()`,
in the IDE driver into scheduled timeout and yield.

### Rationale

Allowing other initialization operations to occur during IDE driver init
prevents wasting CPU cycles in IDE driver busywait calls.

## Downloads

### Patch

    - Patch for CELF version 040304, AND for 2.4.20 is here: Media:ide-preempt-2.patch
      - /\ THIS PATCH (IN ISOLATED FORM) HAS NOT BEEN TESTED /\
    - [Patch for 2.6.xx is *here*]

### Utility programs

None

## How To Use

    - Apply the patch to your 2.4.20-based (CELF or kernel.org) source tree
    - Configure the kernel:
      - with "Preemptible IDE delays" turned on
      - with the IDE driver configured as a module
    - Compile the kernel and modules
    - Set up your system to load the IDE driver module during system startup, after kernel boot
    - Set up your system to perform other initialization operations during the IDE driver initialization
    - Measure the decrease in total system boot time from running the IDE driver init concurrently
    with other system initialization tasks

Note that to benefit from this feature you load the IDE driver as a
module. When the IDE driver is linked statically with the kernel, then
when the driver initializes there are no other kernel threads running
which can take advantage of the time freed up from the busywait
conversion. Also, in order to benefit from this there must be additional
user-space or kernel tasks to run when loading the IDE driver.

## Sample Results

Busywait-style delays such as udelay() in module init functions inhibit
kernel preemption because the Big Kernel Lock is held, while yielding
[APIs](../../../.././dev_portals/Boot_Time/Boot-up_Time_Reduction_Howto/IDE_Preempt/APIs/APIs.md "APIs") such as schedule\_timeout() allow preemption
(because the kernel handles the BKL specially and releases and
reacquires it across reschedules alloowed by the current thread).

IDE modules were one of the major offenders in this regard identified
while looking at a couple of embedded platforms. The ide-probe-mod
driver spends a great deal of time in repeated calls to
ide\_delay\_50ms() during probe and drive identification, which busy
waits (in order to let the IDE controller make progress before polling
for status or to allow previous operations to complete). The ide-preempt
fix changes these to schedule\_timeout().

Todd Poynor of [Monta Vista](../../../.././dev_portals/Boot_Time/Boot-up_Time_Reduction_Howto/IDE_Preempt/Monta_Vista/Monta_Vista.md "Monta Vista") measured the
effect on a 200MHz IBM 405GP "Walnut" evaluation board with a 33MHz PCI
bus. A Seagate Barracuda ATA IV 60GB disk drive with an ext2 filesystem
was cabled to one of the two IDE interfaces on a Promise Ultra66 PCI-IDE
bridge card (PDC20262 chipset). The ide-mod, ide-probe-mod, and ide-disk
drivers were loaded as modules. The drivers for PCI, PCI-IDE disk, and
ext2 filesystem were built statically into the kernel.

Use of this feature had these effects on module loading time:



    Original: 255.221 ms
    New: 296.977 ms


 Note the elapsed time increased somewhat for two reasons. First,
waiting times are slightly longer due to back porting a bug fix from the
2.5 kernel (which waits for an extra millisecond each time). Second,
extra overhead was introduced by use of the schedule() function.

The fix had these effects on maximum preemption-off windows, measured
via /proc/latencytimes:



    Original: 251.065 ms
    New: 9.865 ms


 The ide-probe-mod driver spent almost all its time in about five calls
to ide\_delay\_50ms(); use of preemptible delays freed up almost 250
milliseconds of time for other threads to run.

## Future Work

Here is a list of things that could be worked on for this feature:

    - version 2 of patch uses CONFIG_INSTANT_ON instead of CONFIG_FASTBOOT - this is a bug
    - test the patch
    - port the patch to 2.6
    - determine if and how this could be converted into a generalized driver init concurrency mechanism


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")
-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")

