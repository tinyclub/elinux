> From: [eLinux.org](http://eLinux.org/Bootup_Time_Working_Group "http://eLinux.org/Bootup_Time_Working_Group")


# Bootup Time Working Group



This page has references for various resources for use by the Bootup
Times Working Group.

Table of Contents:



## Contents

-   [1 Working Group Information](#working-group-information)
    -   [1.1 Charter](#charter)
    -   [1.2 Scope](#scope)
    -   [1.3 Current Tasks](#current-tasks)
-   [2 Documents and information](#documents-and-information)
-   [3 Current Projects](#current-projects)
-   [4 Specifications](#specifications)
-   [5 Implementations and/or
    patches](#implementations-and-or-patches)
    -   [5.1 Measurement Systems](#measurement-systems)
    -   [5.2 Patches for Reducing Bootup
        Time](#patches-for-reducing-bootup-time)
-   [6 External projects](#external-projects)
    -   [6.1 De-serialized user-space service startups (RC
        scripts)](#de-serialized-user-space-service-startups-rc-scripts)
    -   [6.2 Kexec](#kexec)
-   [7 Pre-Linking and Lazy Linking](#pre-linking-and-lazy-linking)
    -   [7.1 Others](#others)

## Working Group Information

### Charter

The Bootup Time Working Group shall work to minimize the activation and
deactivation times of Linux systems. This includes making improvements
in cold start bootup times and shutdown times, as well as improvements
in the speed of suspend and resume operations. The Working Group shall
establish requirements for Linux systems and sub-systems in order to
accomplish this goal of timely activation and deactivation. Also, the
Working Group will evaluate and recommend technical solutions and
implementations which accomplish this goal.

### Scope

The scope of this Working Group includes firmware, operating system
kernel, and user space issues. It may include work to accelerate device
initialization by means of coordination between the firmware and the OS,
work inside the OS to reduce the time to initialize kernel sub-systems
and device drivers, and work to increase application startup speed.
Also, the Working Group may specify, evaluate or recommend
instrumentation and tools for analysing bootup and shutdown times.

The Working Group will not consider compiler technologies related to
this issue.

### Current Tasks

See the [Bootup Time Howto Task
List](../../.././dev_portals/Boot_Time/Bootup_Time_Howto_Task_List/Bootup_Time_Howto_Task_List.md "Bootup Time Howto Task List")

## Documents and information

-   [Boot-up Time Definition Of
    Terms](../../.././dev_portals/Boot_Time/Boot-up_Time_Definition_Of_Terms/Boot-up_Time_Definition_Of_Terms.md "Boot-up Time Definition Of Terms")
    - defintions of terms used by the working group
-   /\\ - *no content yet* - [Boot-up Time Delay
    Taxonomy](../../.././dev_portals/Boot_Time/Boot-up_Time_Delay_Taxonomy/Boot-up_Time_Delay_Taxonomy.md "Boot-up Time Delay Taxonomy")
    - list of delays categorized by boot phase, type and magnitude
-   Presentation: - [Reducing Startup Time in Embedded Linux
    Systems](http://eLinux.org/images/7/78/ReducingStartupTime_v0.8.pdf "ReducingStartupTime v0.8.pdf")
    This document is a presentation that was prepared based on existing
    bootup time reduction techniques.
-   [Kernel
    Instrumentation](../../.././dev_portals/Boot_Time/Kernel_Instrumentation/Kernel_Instrumentation.md "Kernel Instrumentation") -
    lists some known kernel instrumentation tools. These are of interest
    for measuring kernel startup time.
-   [Filesystem
    Information](../../.././dev_portals/Boot_Time/Filesystem_Information/Filesystem_Information.md "Filesystem Information") -
    information about bootup times with various file systems

## Current Projects

[Boot-up Time Reduction
Howto](../../.././dev_portals/Boot_Time/Boot-up_Time_Reduction_Howto/Boot-up_Time_Reduction_Howto.md "Boot-up Time Reduction Howto") -
this is a project to catalog existing bootup time reduction techniques.
Work on this project is under way. The wiki will serve as the primary
repository of information gathered for this project.

## Specifications

-   [Timing\_APISpecification](http://eLinux.org/Timing_APISpecification "Timing APISpecification")
    - requirements (and specification?) for a simple API to support
    bootup timing measurements
-   see also
    [Instrumentation\_API](http://eLinux.org/Instrumentation_API "Instrumentation API")
    for some background research on this API
-   Calibrate Delay Avoidance Specification - avoiding the cost of
    calibrate\_delay()
    -   Done - see [Preset LPJ](../../.././dev_portals/Boot_Time/Preset_LPJ/Preset_LPJ.md "Preset LPJ")
-   [IDE\_No\_Probe\_Specification](../../.././dev_portals/Boot_Time/IDE_No_Probe/IDE_No_Probe.md_Specification "IDE No Probe Specification")
    - force kernel to observe the IDE "noprobe" command line option
-   [IDE\_Preempt\_Specification](http://eLinux.org/IDE_Preempt_Specification "IDE Preempt Specification")
    - change IDE busywaits into preemptible timeouts
-   [Kernel\_XIP](../../.././dev_portals/Boot_Time/Kernel_XIP/Kernel_XIP.md "Kernel XIP") - support Execute-In-Place
    for the kernel.

## Implementations and/or patches

### Measurement Systems

-   [Printk Times](../../.././dev_portals/Boot_Time/Printk_Times/Printk_Times.md "Printk Times") - simple system for
    showing timing information for each printk
-   [Kernel Function
    Instrumentation](http://eLinux.org/Kernel_Function_Instrumentation "Kernel Function Instrumentation")
    - more complete system for reporting function timings in the kernel
    (The patch for this has not been isolated, but it's currently in the
    CELF tree)

### Patches for Reducing Bootup Time

-   [Preset LPJ](../../.././dev_portals/Boot_Time/Preset_LPJ/Preset_LPJ.md "Preset LPJ") - Allow the use of a preset
    loops\_per\_jiffy value
-   [IDE No Probe](../../.././dev_portals/Boot_Time/IDE_No_Probe/IDE_No_Probe.md "IDE No Probe") - Force kernel to
    observe the ide\<x\>=noprobe option
-   [IDE Preempt](http://eLinux.org/IDE_Preempt "IDE Preempt") - Make IDE driver init
    busywaits preemptible
-   [Kernel XIP](../../.././dev_portals/Boot_Time/Kernel_XIP/Kernel_XIP.md "Kernel XIP") - Allow kernel to be executed
    in-place in ROM or FLASH (code is not isolated yet, but is in the
    CELF source tree)

## External projects

### De-serialized user-space service startups (RC scripts)

-   IBM article on on using Makefile techniques to express dependencies
    between services and support parallel service start. See
    [http://www-106.ibm.com/developerworks/linux/library/l-boot.html?ca=dgr-lnxw04BootFaster](http://www-106.ibm.com/developerworks/linux/library/l-boot.html?ca=dgr-lnxw04BootFaster)
-   Richard Gooch project to rewrite boot script system from scratch.
    Eliminates lots of BSD and SYS V-isms, and introduces dependencies.
    See
    [http://www.atnf.csiro.au/people/rgooch/linux/boot-scripts/](http://www.atnf.csiro.au/people/rgooch/linux/boot-scripts/)
-   Serel project - for parallelizing service startup. Commands are
    inserted into RC scripts to cause needed services to start (based on
    XML database of dependencies). See
    [http://www.fastboot.org/](http://www.fastboot.org/)
-   LSB specification for comments in RC Scripts which allow
    parallization. See
    [http://www.linuxbase.org/spec/refspecs/LSB\_1.1.0/gLSB/initscrcomconv.html](http://www.linuxbase.org/spec/refspecs/LSB_1.1.0/gLSB/initscrcomconv.html)

### Kexec

-   Kexec is a system which allows a system to be **rebooted** without
    going through BIOS. That is, a Linux kernel can directly boot into
    another Linux kernel, without going through firmware. See the white
    paper at:
    [http://devloper.osdl.org/rddunlap/kexec/whitepaper/kexec.pdf](http://devloper.osdl.org/rddunlap/kexec/whitepaper/kexec.pdf)
-   here's another Kexec white paper:
    [http://www-106.ibm.com/developerworks/linux/library/l-kexec.html?ca=dgr-lnxw04RebootFast](http://www-106.ibm.com/developerworks/linux/library/l-kexec.html?ca=dgr-lnxw04RebootFast)

## Pre-Linking and Lazy Linking

-   see this excellent paper for an overview of dynamic linking issues:
    [http://www.cis.upenn.edu/\~mwh/papers\_DB/ieee\_computer97.pdf](http://www.cis.upenn.edu/~mwh/papers_DB/ieee_computer97.pdf)

### Others

-   [http://www.bootsplash.org/](http://www.bootsplash.org/)
-   [http://www.linuxdevices.com/news/NS5907201615.html](http://www.linuxdevices.com/news/NS5907201615.html)
    - any [FSM
    Labs](http://eLinux.org/index.php?title=FSM_Labs&action=edit&redlink=1 "FSM Labs (page does not exist)")
    folk have pieces of this?


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [CE Linux Working
    Groups](http://eLinux.org/Category:CE_Linux_Working_Groups "Category:CE Linux Working Groups")

