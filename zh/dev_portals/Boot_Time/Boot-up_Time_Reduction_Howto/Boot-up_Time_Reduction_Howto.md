> From: [eLinux.org](http://eLinux.org/Boot-up_Time_Reduction_Howto "http://eLinux.org/Boot-up_Time_Reduction_Howto")


# Boot-up Time Reduction Howto



The items on this page constitute a list of existing techniques for
reducing bootup times for embedded systems. Some of these items may also
be applicable to desktop or enterprise systems, but that is not the
focus.

For each individual item below, a separate page should exist. If it
doesn't already exist, a new page should be created using
the !HowtoTemplate. Links listed in red below are pages that are not
created yet. To sign up for a task related to this HOWTO, please see the
[Bootup Time Howto Task
List](../../.././dev_portals/Boot_Time/Bootup_Time_Howto_Task_List/Bootup_Time_Howto_Task_List.md "Bootup Time Howto Task List").

## Contents

-   [1 Introduction](#introduction)
    -   [1.1 Bootup Phases](#bootup-phases)
    -   [1.2 Main Technique Types](#main-technique-types)
-   [2 Bootup Time Reduction Technique
    Outline](#bootup-time-reduction-technique-outline)
-   [3 Firmware Phase](#firmware-phase)
-   [4 Kernel Phase](#kernel-phase)
-   [5 User Space Phase](#user-space-phase)
-   [6 General Reduction Techniques](#general-reduction-techniques)
-   [7 Table of Reduction Techniques](#table-of-reduction-techniques)
-   [8 Potential Techniques](#potential-techniques)

## Introduction

### Bootup Phases

This document divides the bootup process into 3 main phases:

-   Firmware initialization phase
-   Kernel initialization phase
-   User Space initialization phase

User Space usually consists of a few distinct phases also:

-   Initialization scripts (RC scripts, for desktop systems)
    -   This is where most daemons and services are loaded.
-   Graphics system initialization
-   Graphical environment start
-   Application initialization

### Main Technique Types

Techniques presented here can be organized according to the way they try
to achieve their effect. The technique can consist of:

1.  speeding up the activity
2.  doing the activity in parallel with other initialization tasks
3.  doingthe activity later (possibly after booting is completed)
4.  avoiding doing the activity at all.

In summary, each technique describes how to take an existing bootup
activity and do one of:

-   Do it faster
-   Do it in parallel
-   Do it later
-   Don't do it at all

Some techniques will consist of multiple methods (such as both speeding
up and doing it in parallel).

## Bootup Time Reduction Technique Outline

Following is an outline of different bootup time reduction techniques,
organized by the boot phase where they are applied.

## Firmware Phase

Here ase some techniques for speeding up the Firmware phase of the boot
sequence:

-   [Kernel XIP](../../.././dev_portals/Boot_Time/Kernel_XIP/Kernel_XIP.md "Kernel XIP") - Kernel Execute-In-Place
-   SkipFirmware - Disable [firmware](../../../dev_portals/Firmware/Firmware.md "Firmware") features to
    eliminate diagnostics, memory counts, etc.
-   [Parallel HDSpin Up](http://eLinux.org/Parallel_HDSpin_Up "Parallel HDSpin Up") -
    Parallelize Hard Disk spinup with Kernel load
-   [DMA Copy Of Kernel On
    Startup](../../.././dev_portals/Boot_Time/DMA_Copy_Of_Kernel_On_Startup/DMA_Copy_Of_Kernel_On_Startup.md "DMA Copy Of Kernel On Startup")
    - Use DMA to copy kernel from flash to RAM

## Kernel Phase

The following are techniques used to speed up the initialization of the
kernel:

-   DisableConsole - Turn off serial console output during boot
-   [Preset LPJ](../../.././dev_portals/Boot_Time/Preset_LPJ/Preset_LPJ.md "Preset LPJ") - Use pre-set
    loops\_per\_jiffy (avoid calibrate\_delay())
-   Preconfigure PCI - Preconfigure some PCI bus slots
-   [IDE No Probe](../../.././dev_portals/Boot_Time/IDE_No_Probe/IDE_No_Probe.md "IDE No Probe") - Don't probe some IDE
    devices -
-   No Probe Missing Devices - Disable probes for non-existent devices
    (including keyboards, etc.)
-   Small Kernel Config - Use smallest kernel configuration possible
-   Reduce Driver Busy Waits - Shorten device probes by reducing the
    amount of time the driver busywaits
    -   A special case of this is [Short IDE
        Delays](../../.././dev_portals/Boot_Time/Short_IDE_Delays/Short_IDE_Delays.md "Short IDE Delays"), with IDE driver
        delays
-   Threaded Init - Perform threaded initialization - replace driver
    busywaits with yields
    -   A special case of this is [IDE
        Preempt](http://eLinux.org/IDE_Preempt "IDE Preempt"), with IDE driver busywaits
-   Load Drivers Later - Use modules where possible to move driver
    initialization later in the boot sequence

## User Space Phase

The following are techniques for reducing the bootup time for user-space
programs:

-   [Application XIP](../../.././dev_portals/Boot_Time/Application_XIP/Application_XIP.md "Application XIP") -
    Execute-In-Place for applications and librarys
-   Reduce RC Scripts - Eliminate unneeded RC scripts
-   Custom Init Program - Use a custom initialization program
    -   (This is a special case of eliminating unneeded RC scripts)
-   [Optimize RC Scripts](../../.././dev_portals/Boot_Time/Optimize_RC_Scripts/Optimize_RC_Scripts.md "Optimize RC Scripts") -
    Optimize RC script execution
-   [Parallel RC Scripts](../../.././dev_portals/Boot_Time/Parallel_RC_Scripts/Parallel_RC_Scripts.md "Parallel RC Scripts") -
    Execute RC scripts in parallel, instead of in sequence
-   [Pre Linking](../../.././dev_portals/Boot_Time/Pre_Linking/Pre_Linking.md "Pre Linking") - Avoid overhead of
    runtime link fixups during first program/library load
-   Reduce Flash Writes - Reduce writes to flash. (In particular,
    perhaps you want to "disable the date of last access" with noatime
    [[1]](http://forums.techarena.in/tips-tweaks/1053888.htm)[[2]](http://stackoverflow.com/questions/81158/files-on-xp-is-turning-off-last-access-time-safe)[[3]](http://beta.ivancover.com/wiki/index.php/Eee_PC_Linux#Less_Disk_Writes)[[4]](http://home.x-pec.com/~ivc/sites/ivc/ibook/linux/)[[5]](http://danweinreb.org/blog/using-solid-state-disks-on-linux)[[6]](http://24.97.150.195/nstwiki/index.php/HowTo_Disable_The_%22relatime%22_Method_For_%22atime%22_Updates_For_A_File))
-   Disable Logging - Turn off logging to stable storage
-   Faster File System - Use faster file system
-   Ramdisk During Boot - Use RAMDISK during boot
-   Segmented File System - Use a segmented file system to avoid
    interference between reads and writes

## General Reduction Techniques

Some reduction techniques don't apply to a specific boot phase, but are
general methods to reduce bootup time. These are listed here.

-   Smaller Programs - Use smaller kernel and programs for faster load
    times
-   Faster Memory - Use faster system memory to increase load and
    initialization performance

## Table of Reduction Techniques

The following table summarizes the various techniques listed in this
document.

<table>
<caption> Acronyms and Terms </caption>
<thead>
<tr class="header">
<th align="left"><strong>Technique</strong></th>
<th align="left"><strong>Boot Phase</strong></th>
<th align="left"><strong>Description</strong></th>
<th align="left"><strong>Observed reduction</strong></th>
<th align="left"><strong>Notes</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><a href="../../.././dev_portals/Boot_Time/Kernel_XIP/Kernel_XIP.md" title="Kernel XIP">Kernel XIP</a></td>
<td align="left">Firmware</td>
<td align="left">Kernel Execute-In-Place - avoids kernel copy and decompression time</td>
<td align="left">250 ms</td>
<td align="left">causes runtime performance loss</td>
</tr>
<tr class="even">
<td align="left">Skip Firmware</td>
<td align="left">Firmware</td>
<td align="left">Skip firmware probing features, like memory check, bus probing, and device detection, etc.</td>
<td align="left">??</td>
<td align="left">Linux re-probes busses and devices anyway, so this is usually waste of time</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://elinux.org/Parallel_HDSpin_Up" title="Parallel HDSpin Up">Parallel HDSpin Up</a></td>
<td align="left">Firwmare</td>
<td align="left">Start hard drive spin up before loading kernel</td>
<td align="left">??</td>
<td align="left">Not possible if the kernel is loaded from hard drive.</td>
</tr>
<tr class="even">
<td align="left"><a href="../../.././dev_portals/Boot_Time/DMA_Copy_Of_Kernel_On_Startup/DMA_Copy_Of_Kernel_On_Startup.md" title="DMA Copy Of Kernel On Startup">DMA Copy Of Kernel On Startup</a></td>
<td align="left">Firmware</td>
<td align="left">Use DMA to copy kernel from flash to RAM</td>
<td align="left">180 ms</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left"><a href="../../.././dev_portals/Boot_Time/Preset_LPJ/Preset_LPJ.md" title="Preset LPJ">Preset LPJ</a></td>
<td align="left">Kernel</td>
<td align="left">Use a hardcoded loops_per_jiffy value to avoid cost of calibration.</td>
<td align="left">250 ms</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">No Probe Missing Devices</td>
<td align="left">Kernel</td>
<td align="left">Avoid probing for non-existent keyboards and other devices</td>
<td align="left">??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">Small Kernel Config</td>
<td align="left">Kernel</td>
<td align="left">Reduce kernel size and length of code paths, thereby reducing execution overhead</td>
<td align="left">??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left"><a href="http://elinux.org/Disable_Console" title="Disable Console">Disable Console</a></td>
<td align="left">Kernel</td>
<td align="left">Turn off output to serial console during boot</td>
<td align="left">250 ms</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">Preconfigure PCI</td>
<td align="left">Kernel</td>
<td align="left">Preconfigure PCI bus slots on kernel command line</td>
<td align="left">??</td>
<td align="left">Is this even possible?</td>
</tr>
<tr class="even">
<td align="left">Load Drivers Later</td>
<td align="left">Drivers</td>
<td align="left">Move drivers to modules and load them later in boot sequence.)</td>
<td align="left">??</td>
<td align="left">Only works for drivers that can be loaded as modules late in the boot cycle.</td>
</tr>
<tr class="odd">
<td align="left"><a href="../../.././dev_portals/Boot_Time/IDE_No_Probe/IDE_No_Probe.md" title="IDE No Probe">IDE No Probe</a></td>
<td align="left">Drivers</td>
<td align="left">Use &quot;noprobe&quot; on kernel command line for IDE driver</td>
<td align="left">3 sec.</td>
<td align="left">Depends on hardware present</td>
</tr>
<tr class="even">
<td align="left">Reduce Driver Busy Waits</td>
<td align="left">Drivers</td>
<td align="left">Reduce the length of driver busy waits</td>
<td align="left">??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left"><a href="../../.././dev_portals/Boot_Time/Short_IDE_Delays/Short_IDE_Delays.md" title="Short IDE Delays">Short IDE Delays</a></td>
<td align="left">Drivers</td>
<td align="left">Reduce length of IDE initialization delays</td>
<td align="left">5 sec.</td>
<td align="left">May be dangerous, depends on hardware</td>
</tr>
<tr class="even">
<td align="left">Threaded Init</td>
<td align="left">Drivers</td>
<td align="left">Replace busywaits in drivers with yields</td>
<td align="left">??</td>
<td align="left">Only adds value if driver can be parallelized with some other init activity.</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://elinux.org/IDE_Preempt" title="IDE Preempt">IDE Preempt</a></td>
<td align="left">Drivers</td>
<td align="left">Replace busywaits in IDE drivers with yields</td>
<td align="left">250 ms (decreased non-preemptibility)</td>
<td align="left">Already fixed in 2.6</td>
</tr>
<tr class="even">
<td align="left">Reduce RC Scripts</td>
<td align="left">RC scripts</td>
<td align="left">Eliminate unneeded init scripts</td>
<td align="left">3 sec.</td>
<td align="left">Depends on required scripts</td>
</tr>
<tr class="odd">
<td align="left"><a href="../../.././dev_portals/Boot_Time/Parallel_RC_Scripts/Parallel_RC_Scripts.md" title="Parallel RC Scripts">Parallel RC Scripts</a></td>
<td align="left">RC scripts</td>
<td align="left">Start init scripts in parallel</td>
<td align="left">??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">Defer RC Scripts</td>
<td align="left">RC scripts</td>
<td align="left">Defer some init scripts to later in boot cycle</td>
<td align="left">??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left"><a href="../../.././dev_portals/Boot_Time/Optimize_RC_Scripts/Optimize_RC_Scripts.md" title="Optimize RC Scripts">Optimize RC Scripts</a></td>
<td align="left">RC scripts</td>
<td align="left">Use busybox, smaller shell, builtins, adjusted scripts</td>
<td align="left">3 sec.</td>
<td align="left">Depends on required scripts</td>
</tr>
<tr class="even">
<td align="left">Custom Init Program</td>
<td align="left">RC scripts</td>
<td align="left">Use custom initialization program (eliminating RC scripts altogether)</td>
<td align="left">10 sec.</td>
<td align="left">requires long-term maintenance of the program</td>
</tr>
<tr class="odd">
<td align="left"><a href="../../.././dev_portals/Boot_Time/Application_XIP/Application_XIP.md" title="Application XIP">Application XIP</a></td>
<td align="left">User Space</td>
<td align="left">Use Execute-In-Place for applications and libraries.</td>
<td align="left">??</td>
<td align="left">Requires uncompressed file system. Application performance may be reduced.</td>
</tr>
<tr class="even">
<td align="left">Segmented File System</td>
<td align="left">User Space</td>
<td align="left">Keep read-only data separate from writable data in flash storage</td>
<td align="left">??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">Reduce Flash Writes</td>
<td align="left">User Space</td>
<td align="left">Avoid writes to flash memory</td>
<td align="left">??</td>
<td align="left">.</td>
</tr>
<tr class="even">
<td align="left">Ramdisk During Boot</td>
<td align="left">User Space</td>
<td align="left">Keep writable files in RAM, and write them to flash after boot</td>
<td align="left">??</td>
<td align="left">.</td>
</tr>
<tr class="odd">
<td align="left">Smaller Programs</td>
<td align="left">User Space</td>
<td align="left">Use smallest programs and configurations possible</td>
<td align="left">??</td>
<td align="left">Reduces program load time. It may increase cache hits.</td>
</tr>
<tr class="even">
<td align="left">Faster Memory</td>
<td align="left">General</td>
<td align="left">Use faster memory</td>
<td align="left">??</td>
<td align="left">.</td>
</tr>
</tbody>
</table>

## Potential Techniques

Here is a list of potential techniques that have not been tried yet, to
our knowledge:

-   Use different, faster, firmware
-   Cache results of find and grep during RC scripts
-   Partial XIP (this is a current project of the WG)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")

