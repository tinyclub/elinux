> From: [eLinux.org](http://eLinux.org/Ftrace_Function_Graph_ARM "http://eLinux.org/Ftrace_Function_Graph_ARM")


# Ftrace Function Graph ARM



This page holds information from Tim Bird's talk at Linux Symposium
Montreal (July, 2009), and at ELC Europe and the Japan Linux Symposium
(October, 2009).

In Canada, Tim talked about patches against the 2.6.31-rc1 kernel tree
for adding function graph tracing to the ARM architecture, for the
Ftrace system.

In France and Japan, Tim talked about patches against 2.6.32-rc5.

## Contents

-   [1 Presentation](#presentation)
-   [2 Paper](#paper)
-   [3 Documentation](#documentation)
-   [4 Patches](#patches)
    -   [4.1 2.6.33 patches](#2-6-33-patches)
    -   [4.2 2.6.32-rc5 patches](#2-6-32-rc5-patches)
    -   [4.3 2.6.31-rc1 patches](#2-6-31-rc1-patches)
    -   [4.4 2.6- patches](#2-6-patches)
    -   [4.5 patches for gcc 4.4.0](#patches-for-gcc-4-4-0)
-   [5 Tools](#tools)
-   [6 FDD](#fdd)
-   [7 FTD](#ftd)
-   [8 History](#history)
-   [9 Further Work](#further-work)

## Presentation

Here is the presentation from the Japan Linux Symposium (also given at
ELC Europe, in Grenoble France)

-   [Measuring Function Duration with Ftrace (october 2009 update)
    (PDF)](http://eLinux.org/images/3/3e/Measuring-function-duration-with-ftrace-october-2009.pdf "Measuring-function-duration-with-ftrace-october-2009.pdf")

Here is the presentation from the Canada Linux Symposium session:

-   [Measuring Function Duration with Ftrace (first version)
    (PDF)](http://eLinux.org/images/d/d6/Measuring-function-duration-with-ftrace.pdf "Measuring-function-duration-with-ftrace.pdf")

## Paper

Here is Tim's paper for the Canada Linux Symposium for this work:

-   [Measuring Function Duration with Ftrace Paper
    (PDF)](http://eLinux.org/images/0/0c/Bird-LS-2009-Measuring-function-duration-with-ftrace.pdf "Bird-LS-2009-Measuring-function-duration-with-ftrace.pdf")

## Documentation

See the file Documentation/trace/func-duration.txt, after applying the
patches.

(Or, if you applied the 2.6.31 patches, see the file
Documentation/trace/func-graph.txt However, this version is deprecated.)

## Patches

Below are patches for the function graph support and function duration
tracer, for multiple kernel versions.

### 2.6.33 patches

Here are some patches to add support for the function\_graph tracer to
ARM, and to add support for 'tracing\_thresh' to the function\_graph
tracer.

-   [Media:Function-graph-ARM-w-thresh-2.6.33-mar-2010.tgz](http://eLinux.org/images/0/0f/Function-graph-ARM-w-thresh-2.6.33-mar-2010.tgz "Function-graph-ARM-w-thresh-2.6.33-mar-2010.tgz")

To apply, extract the patches and the series file. If you have 'quilt',
extract the file directly into the top level of the kernel source tree
(the top directory is called 'patches'). Then do "quilt push -a".

If you don't have quilt, apply the patches manually, in the order
specified in the 'series' file, with a command like: "patch -p1
\<patches/foo.patch"

### 2.6.32-rc5 patches

-   [Media:Ftrace-patches-oct-2009.tgz](http://eLinux.org/images/e/ee/Ftrace-patches-oct-2009.tgz "Ftrace-patches-oct-2009.tgz")

To apply, extract the patches and the series file. If you have 'quilt',
extract the file directly into the top level of the kernel source tree
(the top directory is called 'patches'). Then do "quilt push -a".

If you don't have quilt, apply the patches manually, in the order
specified in the 'series' file, with a command like: "patch -p1
\<patches/foo.patch"



### 2.6.31-rc1 patches

The following patches were submitted to the kernel mailing list in early
July 2009. There are patches against kernel version 2.6.31-rc1.

-   [Media:Arm-sched\_clock-notrace.patch](http://eLinux.org/images/e/ef/Arm-sched_clock-notrace.patch "Arm-sched clock-notrace.patch")
-   [Media:Add-function-graph-tracer-support-for-ARM.patch](http://eLinux.org/images/0/01/Add-function-graph-tracer-support-for-ARM.patch "Add-function-graph-tracer-support-for-ARM.patch")
-   [Media:Func-graph-duration-filter.patch](http://eLinux.org/images/5/56/Func-graph-duration-filter.patch "Func-graph-duration-filter.patch")
-   [Media:Optimize-duration-filter-discard.patch](http://eLinux.org/images/d/d3/Optimize-duration-filter-discard.patch "Optimize-duration-filter-discard.patch")

### 2.6.29 patches

The following patches were developed internally at Sony, but never
submitted to mainline. They are posted here in the hopes that they will
be useful to someone.

-   [Media:Add-ARM-function-duration-tracer-2.6.29.tgz](http://eLinux.org/images/6/69/Add-ARM-function-duration-tracer-2.6.29.tgz "Add-ARM-function-duration-tracer-2.6.29.tgz")

This tar archive contains a patches directory, with a series file and
several patch files. To use, extract at the source of your 2.6.29 kernel
tree, and apply using quilt with 'quilt push -a'.

Alternatively, apply the patches individually using 'patch -p1
\<patches/p1.patch', for each file listed in patches/series (in the
order specified in the file).

This patch set was tested against a stock (mainline, from kernel.org)
2.6.29 kernel, on an OMAP OSK development board (ARM-based, TI OMAP
chip).

### patches for gcc 4.4.0

Note recent ARM toolchains instrument the code with calls to
'\_\_gnu\_mcount\_nc' instead of 'mcount'. If you get a compiler warning
about missing the symbol '\_\_gnu\_mcount\_nc', you should apply the
patch mentioned in this e-mail also:
([http://marc.info/?l=linux-arm-kernel&m=124946219616111&w=2](http://marc.info/?l=linux-arm-kernel&m=124946219616111&w=2))

    [Thanks to Jean Pihet of MontaVista for pointing this out]

Here is the above patch, and a patch which adds support for
\_\_gnu\_mcount\_nc to the function\_graph tracer.

-   [Media:Support-ftrace-with-newer-compilers.patch](http://eLinux.org/images/8/80/Support-ftrace-with-newer-compilers.patch "Support-ftrace-with-newer-compilers.patch")
    - this is the patch mentioned above
-   [Media:Gnu\_mcount\_nc-func\_graph.patch](http://eLinux.org/images/1/11/Gnu_mcount_nc-func_graph.patch "Gnu mcount nc-func graph.patch")

## Tools

## FDD

The 'fdd' tool is now incorporated into the patch set, and is located in
the kernel *scripts* directory after applying the patches. See the
documentation in the kernel tree for instructions for use.

## FTD

-   [Media:Ftd.txt](http://eLinux.org/images/d/d9/Ftd.txt "Ftd.txt") - Function Trace
    Dump - post-trace analysis tool

To install:

    * Download
    * rename to 'ftd': mv Ftd.txt ftd
    * make it executable: chmod a+x
    * Put it on your path somewhere: sudo mv ftd /usr/local/bin

## History

Based on feeback from ftrace developers on the kernel mailing list, and
from other developers at the tracing mini-summit in Montreal, I started
working on an updated duration tracer, using a different filtering
approach. This work was completed, and resulted in a new trace, the
"function\_duration" tracer, being completed in September of 2009.

This work was described at ELC Europe and the Japan Linux Symposium, in
October, 2009. I was hoping to mainline the patches before the events,
but ran out of time due to bugs on my main testing platform.

## Further Work

I need to try to mainline this feature. I'd like to get it into
Linux-tip or Linux-next sometime before the 2.6.33 merge window.

If you don't see it in mainline, just send me an e-mail asking about the
status.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

