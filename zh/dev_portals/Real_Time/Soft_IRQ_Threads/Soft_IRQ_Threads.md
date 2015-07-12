> From: [eLinux.org](http://eLinux.org/Soft_IRQ_Threads "http://eLinux.org/Soft_IRQ_Threads")


# Soft IRQ Threads



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 LKML discussions](#lkml-discussions)
        -   [1.1.1 Time Sys patch](#time-sys-patch)
        -   [1.1.2 Korty patch](#korty-patch)
    -   [1.2 Rationale](#rationale)
-   [2 Downloads](#downloads)
    -   [2.1 Patch](#patch)
    -   [2.2 Utility programs](#utility-programs)
-   [3 How To Use](#how-to-use)
-   [4 Sample Results](#sample-results)
-   [5 Future Work](#future-work)

## Introduction

This page describes [Soft
IRQ](http://eLinux.org/index.php?title=Soft_IRQ&action=edit&redlink=1 "Soft IRQ (page does not exist)")
threads, which is a mechanism to run certain interrupt bottom halves
using a kernel thread with scheduling that can be prioritized in the
same scheduling class as other threads and processes.

### LKML discussions

Recently (July 2004), two patches have been submitted to provide Soft
IRQ threads for the Linux kernel.

#### [Time Sys](http://eLinux.org/Time_Sys "Time Sys") patch

See
[http://lkml.org/lkml/2004/7/13/125](http://lkml.org/lkml/2004/7/13/125)

It applies against 2.6.8-mm1, with one PPC-specific reject

#### Korty patch

See
[http://lkml.org/lkml/2004/7/13/152](http://lkml.org/lkml/2004/7/13/152)

### Rationale

This feature is important because it allows [Soft
IRQ](http://eLinux.org/index.php?title=Soft_IRQ&action=edit&redlink=1 "Soft IRQ (page does not exist)")
processing to be scheduled at a lower priority than realtime threads.
This allows for better realtime handling by the Linux kernel.

## Downloads

### Patch

    - [Patch for CELF version XXXXXX is *here*]
    - [Patch for 2.4.xx is *here*]
    - [Patch for 2.6.xx is *here*]

### Utility programs

None

## How To Use

[Should fill this in]

## Sample Results

## Future Work

Here is a list of things that could be worked on for this feature:

    (None so far)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

