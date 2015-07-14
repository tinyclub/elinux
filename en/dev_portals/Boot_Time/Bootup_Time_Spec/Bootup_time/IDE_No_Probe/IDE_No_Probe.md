> From: [eLinux.org](http://eLinux.org/IDE_No_Probe "http://eLinux.org/IDE_No_Probe")


# IDE No Probe



***Preliminary Draft*** under construction

## Contents

-   [1 Introduction](#introduction)
    -   [1.1 Rationale](#rationale)
-   [2 Downloads](#downloads)
    -   [2.1 Patch](#patch)
    -   [2.2 Utility programs](#utility-programs)
-   [3 How To Use](#how-to-use)
-   [4 Sample Results](#sample-results)
    -   [4.1 Experimental Results \#1](#experimental-results-1)
    -   [4.2 Experimental Results \#2](#experimental-results-2)
    -   [4.3 Experimental Results \#3](#experimental-results-3)
-   [5 Details](#details)
-   [6 Future Work](#future-work)

## Introduction

This page describes the feature "forced IDE noprobe". Normally, the
Linux kernel supports the ability to avoid probing for specific IDE
drives and IDE interfaces, using a command line argument specified at
boot time. The command line argument is "hdx==noprobe" or
"idex==noprobe".

Under certain conditions this command line argument is not observed by
the Linux kernel (at least for version 2.4.20). This "feature" forces
the kernel to observe the "noprobe" command for IDE interfaces.

The fix here records the fact that "noprobe" was specified on the
command line (via "the forcenoprobe" field), and skips probing the
device if it is set, even if the driver has changed the setting of the
noprobe field. This is all a quick hack, and a more systemic rewrite of
noprobe handling would be more appropriate for community work, if this
is still needed.

### Rationale

Probing IDE devices can take a few seconds during system startup. It is
especially painful to probe interfaces which are known not to be used in
an embedded device.

## Downloads

### Patch

-   Patch for CELF tree is isolated here: ide-noprobe.patch
-   [![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif)THIS PATCH
    (IN ITS ISOLATED FORM) HAS NOT BEEN VERIFIED
-   Patch for 2.4.xx is *needed*
-   Don't know if patch for 2.6.xx is needed

### Utility programs

None.

## How To Use

-   Apply this patch to your CELF tree (or verify that it is already
    present)
-   use "ide1==noprobe" on the kernel command line
    -   see the documentation on ide driver command line parameters in
        the file:

            drivers/ide/ide.c

    -   The documentation is in a comment right before the routine

            ide-setup()

        , at about line 3200 in the file.

-   verify that no probing is done for ide1
-   measure the time savings from using the patch and the "noprobe"
    option

## Sample Results

### Experimental Results \#1

Todd Poynor of MontaVista measured the effect of specifying "hdf==none
ide3==noprobe" (avoid probing ide2 slave and both ide3 devices) on a
200MHz IBM 405GP "Walnut" evaluation board with a 33MHz PCI bus. A
Seagate Barracuda ATA IV 60GB disk drive was cabled to one of the two
IDE interfaces on a Promise Ultra66 PCI-IDE bridge card (PDC20262
chipset). All of the drivers for PCI, IDE, PCI-IDE disk, and EXT2 file
system were built into the kernel.

The time to init IDE was 1.3 seconds when the missing devices were
probed, and about 230 milliseconds when "hdf==none ide3==noprobe" was
specified. Thus, the resulting bootup time savings were about 1.1
seconds.

### Experimental Results \#2

### Experimental Results \#3

## Details

More details on the original problem in case you're interested...

drivers/ide/ide.c: ide\_setup() is called early in start\_kernel
sequence (via parse\_options -\> checksetup -\> \_\_setup() macro
mechanism). It calls init\_hwif\_data to init each interface to
"noprobe==1". Then parses cmd line params such as "ide1==noprobe",
setting noprobe back to 1.

Later, drivers such as the PCI-IDE bridge driver, at

    drivers/ide/ide-pci.c: ide_setup_pci_device

, resets the value of noprobe according to whether there's a valid
interface there:

           hwif->noprobe == !hwif->io_ports[IDE_DATA_OFFSET];

This undoes the effect of any "noprobe" cmd line option.

## Future Work

Here is a list of things that could be worked on for this feature:

-   get an exhaustive list of places where noprobe is reset by the
    kernel
-   find out why community overrides this flag in places?
-   maybe refactor to be a "forcenoprobe" option?
-   find out if the same problem exists in 2.6.xx kernels


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

