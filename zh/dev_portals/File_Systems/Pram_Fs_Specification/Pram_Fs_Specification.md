> From: [eLinux.org](http://eLinux.org/Pram_Fs_Specification "http://eLinux.org/Pram_Fs_Specification")


# Pram Fs Specification



    #noprint
    VERSION 0.1 - for other versions, click the "info" button.

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

This page specifies a file system that will enhance security of system
data in the presence of kernel bugs or rogue programs.

## Rationale

A single bug in the Linux kernel may cause catastrophic damage to a
system. If a product holds irreproducible security keys, financial data,
or account information, then loss of such data could render the product
unusable, or worse. The customer could suffer financial or legal harm
(from account theft or identity theft).

It is not possible to guarantee with certainty that there are no bugs in
the Linux kernel. However, it is possible to decrease the probability
that a bug in the kernel will cause damage to a particular area of
memory or storage. This protected area could then be used with greater
confidence to hold sensitive user or product data.

Portions of the product memory and storage should be made resistant to
kernel bugs. A protected RAM file system would remain consistent if any
of the kernel data pointers are corrupted, or if the kernel starts
executing unexpectedly in the wrong location.

## Specifications

1.  A configuration option for the Linux kernel SHALL be provided which
    controls whether or not the kernel supports the PRAM file system.
    This option MUST be called CONFIG\_PRAM\_FS. 2. A full-featured
    read/write file system for Linux that is RAM-based.
2.  If the memory is non-volatile, the file system SHALL be persistent.
3.  File I/O in PRAMFS is always direct, synchronous, and never blocks.
4.  PRAMFS should be write-protected.
5.  In case there are systems where the write protection is not
    possible, this feature can be disabled with the CONFIG\_PRAMFS\_NOWP
    configuration option.

## Notes (informational and non-normative)

There is only minimal effort required to back-port the 2.4.22 version of
the PRAMFS patch set to the CELF source tree.

## References

Patches are available for PRAMFS against the kernel.org trees for kernel
versions 2.4.22 and 2.6.4 at
[http://pramfs.sourceforge.net](http://pramfs.sourceforge.net).

## Remaining Issues

    #noprint
    [this is a placeholder section for listing issues while the spec is under development.
    It should be empty when the spec is completed (or the issues should be deferrable to
    a subsequent version of the spec).]
    #noprint


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [File Systems](http://eLinux.org/Category:File_Systems "Category:File Systems")
-   [Specification](http://eLinux.org/Category:Specification "Category:Specification")

