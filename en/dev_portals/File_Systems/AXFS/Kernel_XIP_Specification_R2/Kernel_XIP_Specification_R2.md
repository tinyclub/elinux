> From: [eLinux.org](http://eLinux.org/Kernel_XIP_Specification_R2 "http://eLinux.org/Kernel_XIP_Specification_R2")


# Kernel XIP Specification R2



VERSION 0.2

## Contents

-   [1 Introduction](#introduction)
-   [2 Rationale](#rationale)
-   [3 Specifications](#specifications)
-   [4 Notes (informational and
    non-normative)](#notes-informational-and-non-normative)
-   [5 References](#references)
-   [6 Remaining Issues](#remaining-issues)

## Introduction

This specification is for Kernel Execute-In-Place (XIP). XIP refers to
the capability for a Linux kernel to be executed directly from a
persistent, read-only memory or media type (usually ROM or FLASH). When
the kernel is executed in this fashion, the bootloader can avoid loading
the kernel from persistent storage, decompressing it, and saving it into
system RAM.

## Rationale

The process of loading, decompressing, and writing a kernel to RAM is
dependent on the size of the kernel and the speed of the processor and
the associated memory devices. An observed time in practice is about 500
milliseconds. (For examples of observed time, please see the page
referred to in the References section below.) This time can be saved by
avoiding these steps and instead executing the kernel directly from its
location in persistent storage.

## Specifications

1.  The Linux kernel SHALL support an option for executing the kernel
    directly from a persistent memory-mapped storage location.
    -   The configuration option for kernel XIP MUST be called
        CONFIG\_XIP\_KERNEL

2.  When the option CONFIG\_XIP\_KERNEL is enabled, compilation of the
    kernel SHALL produce a kernel image that can be directly executed
    from ROM or FLASH.

## Notes (informational and non-normative)

1.  It is possible that FLASH memory being used for kernel XIP may not
    be available for other uses by the kernel which is being executed
    from it. Whether this is the case or not depends on the
    implementation details for the code which supports this
    specification. This specification does not currently require that
    the kernel be able to use the flash from which it executes for other
    uses (like filesystems.)

## References

See the page [Kernel XIP](http://eLinux.org/Kernel_XIP "Kernel XIP") for information
about this feature, and for examples of time reductions that have been
demonstrated with its use.

## Remaining Issues

-   decide if we should address performance side effect of kernel XIP
-   Figure out difference in usage or intent (if any) between use of
    CONFIG\_XIP\_ROM and CONFIG\_XIP\_KERNEL. Determine if the
    difference in feature set for execution from ROM vs. execution from
    FLASH (when flash is also used for filesystem operations) means that
    we should specify these separately.
-   Decide if we should standardize use of CONFIG\_XIP\_PHYS\_ADDR vs.
    CONFIG\_XIP\_KERNEL\_TXTBASE


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel XIP](http://eLinux.org/Category:Kernel_XIP "Category:Kernel XIP")
-   [Specification](http://eLinux.org/Category:Specification "Category:Specification")

