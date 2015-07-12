> From: [eLinux.org](http://eLinux.org/Pram_Fs "http://eLinux.org/Pram_Fs")


# Pram Fs



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 Rationale](#rationale)
-   [2 References](#references)
-   [3 Downloads](#downloads)
    -   [3.1 Patch](#patch)
    -   [3.2 Utility programs](#utility-programs)
-   [4 How To Use](#how-to-use)
-   [5 Status](#status)
-   [6 Sample Results](#sample-results)
-   [7 Future Work](#future-work)

## Introduction

This page describes the Protected RAM File System (PRAM FS) feature.

PRAM FS is a file system that enhances the security of system data in
the presence of kernel bugs or rogue programs.

The protected RAM file system will ordinarily remain consistent even if
kernel data pointers are corrupted, or if the kernel starts executing
unexpectedly in the wrong location. This is accomplished by making the
RAM pages used by PRAM FS non-writable except during the actual file
operations themselves.

### Rationale

A single bug in the Linux kernel may cause catastrophic damage to a
system. If a product holds irreproducible security keys, financial data,
or account information, then loss of such data could render the product
unusable, or worse. The customer could suffer financial or legal harm
(from account theft or identity theft).

It is not possible to guarantee with certainty that there are no bugs in
the Linux kernel. However, it is possible to decrease the probability
that a bug in the kernel will cause damage to a particular area of
memory or storage. This protected area can then be used, with greater
confidence, to hold sensitive user or product data.

## References

The home page for the PRAMFS project is at:
[http://pramfs.sourceforge.net/](http://pramfs.sourceforge.net/)

That site contains a LOT of detailed technical information and more
explanation of the rationale for this feature.

## Downloads

### Patch

-   See [celinux-dev archive message
    197](http://tree.celinuxforum.org/pipermail/celinux-dev/2004-September/000197.html)
    for a submission to CELF in 2004)
-   Patches for 2.6.30 were posted to lkml in June 2009 - see
    [http://lkml.org/lkml/2009/6/13/86](http://lkml.org/lkml/2009/6/13/86)

### Utility programs

Pram fs can be created and populated using normal Linux filesystem
utilities.

## How To Use

See the file `Documentation/filesystems/pramfs.txt` for instructions on
its use (once the patch is applied).

## Status

Pramfs was submitted for consideration for inclusion in the 2.6.4
kernel, in March 2004. There was a thread of discussion
[here](http://groups.google.com/groups?hl=en&lr=&threadm=1vJLx-4GI-57%40gated-at.bofh.it&rnum=1&prev=/groups%3Fhl%3Den%26lr%3D%26selm%3D1vJLx-4GI-57%2540gated-at.bofh.it)

There were a few, easily answered, concerns raised. But the patch was
not accepted into mainstream.

I talked to Andrew Morton about this in April, 2004, and he said the
threshold is high for getting a new filesystem into the mainline kernel,
because each filesystem adds incremental, ongoing, source maintenance
overhead.

## Sample Results

Here there are some benchmark results made with bonnie++. The board used
was an Atmel ngw100 (avr32 architecture) with ap7000 processor and 32MB
of SDRAM.

-   (2.1 KB) [Without
    XIP](http://eLinux.org/images/e/ea/Benchmark_bonnie--_pramfs_noxip.txt "Benchmark bonnie-- pramfs noxip.txt")
-   (2.1 KB) [With
    XIP](http://eLinux.org/images/6/66/Benchmark_bonnie--_pramfs_xip.txt "Benchmark bonnie-- pramfs xip.txt")

## Future Work

Here is a list of things that could be worked on for this feature:

    -


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [File Systems](http://eLinux.org/Category:File_Systems "Category:File Systems")

