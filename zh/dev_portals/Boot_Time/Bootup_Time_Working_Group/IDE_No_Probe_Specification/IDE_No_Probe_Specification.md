> From: [eLinux.org](http://eLinux.org/IDE_No_Probe_Specification "http://eLinux.org/IDE_No_Probe_Specification")


# IDE No Probe Specification



    #noprint
    VERSION 0.3 - for other versions, click the "info" button.

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

This is the specification for a change in behavior of Linux support for
the IDE "noprobe" option.

Historically, the IDE driver supports command line options to avoid
probing certain devices and interfaces.

     /\ Note - The command line options for the IDE driver are documented in the
     file drivers/ide/ide.c, in a comment right before the routine ide_setup()
     (at about line 3200 in the file).

The "ide\<x\>=noprobe" option was found not to work as expected in the
in the 2.4.20 code.

The basic problem is that the data structures that describe possible IDE
interfaces are initialized to indicate "noprobe" when the option is set
at the kernel command line. However, later some drivers reset the value
of "noprobe" in the data structures when certain interfaces are
detected.

The end result is that (at least in Linux version 2.4.20) the kernel
command line processing for "ide\<x\>=noprobe" has no practical effect.

The desired behavior is that the "noprobe" option will be observed, even
if subsequent driver initialization finds out that an interface is
actually present.

## Rationale

Todd Poynor of [Monta Vista](../../../.././dev_portals/Boot_Time/Bootup_Time_Working_Group/IDE_No_Probe_Specification/Monta_Vista/Monta_Vista.md "Monta Vista") measured the
effect of specifying "hdf=none ide3=noprobe" (avoid probing ide2 slave
and both ide3 devices) on a 200MHz IBM 405GP "Walnut" evaluation board
with a 33MHz PCI bus. A Seagate Barracuda ATA IV 60GB disk drive was
cabled to one of the two IDE interfaces on a Promise Ultra66 PCI-IDE
bridge card (PDC20262 chipset). All of the drivers for PCI, IDE, PCI-IDE
disk, and EXT2 file system were built into the kernel.

The time to initialize IDE was 1.3 seconds when the missing devices were
probed, and about 230 milliseconds when "hdf=none ide3=noprobe" was
specified. Thus the resulting bootup time savings, with "noprobe"
properly observed by the Linux kernel, were about 1.1 seconds, in this
test.

This specification is needed because the kernel sometimes fails to
observe the "noprobe" command line option.

## Specifications

1.  When the "ide\<x\>=noprobe" option is specified on the kernel
    command line, the IDE driver in the Linux kernel SHALL avoid probing
    the specified IDE interface. 2. When the "hd\<x\>=noprobe" option is
    specified on the kernel command line, the IDE driver in the Linux
    kernel SHALL avoid probing the specified IDE device.

## Notes (informational and non-normative)

1.  Processing for the option "hd\<x\>=none" (which is related to the
    "hd\<x\>=noprobe" option) is specific to a single processor
    architecture (i386). No aspect of the behavior of this option is
    specified here.

## References

See the page
[IDENoProbe](http://tree.celinuxforum.org/pubwiki/moin.cgi/IDENoProbe)
for more information about this problem, and for a sample
implementation.

## Remaining Issues

    - see if "noprobe" behavior has changed in 2.6


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Specification](http://eLinux.org/Category:Specification "Category:Specification")

