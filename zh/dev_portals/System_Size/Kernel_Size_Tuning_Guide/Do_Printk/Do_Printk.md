> From: [eLinux.org](http://eLinux.org/Do_Printk "http://eLinux.org/Do_Printk")


# Do Printk



## Contents

-   [1 Description](#description)
    -   [1.1 Rationale](#rationale)
-   [2 Downloads](#downloads)
    -   [2.1 Patch](#patch)
-   [3 How To Use](#how-to-use)
    -   [3.1 Ways to force printks to be
        preserved](#ways-to-force-printks-to-be-preserved)
-   [4 Sample Results](#sample-results)
    -   [4.1 Case Study 1](#case-study-1)
        -   [4.1.1 Summary of image size
            results](#summary-of-image-size-results)
        -   [4.1.2 Image size results compared to
            baseline](#image-size-results-compared-to-baseline)
        -   [4.1.3 Image size results compared to 'printk-off'
            baseline](#image-size-results-compared-to-printk-off-baseline)
    -   [4.2 Case Study 2](#case-study-2)
-   [5 Status](#status)
-   [6 Future Work/Action Items](#future-work-action-items)

## Description

This page describes the "DO\_PRINTK" feature. This is a small tweak on
the already-supported printk configuration option in the kernel, which
allows a developer to configure whether the kernel will be compiled with
or without printk messages.

This feature allows you to turn off printk messages, while preserving
the printk function itself. Then, you can turn on the printk messages
from an individual file, or set of files. This allows you greater
granularity of control over the printk messages that are compiled into
the kernel.

### Rationale

Control over the printk messages in the kernel is important because the
kernel messages comprise a substantial portion of the overall kernel
size (ranging from 5 to 10% of overall kernel image size.)

The kernel (as of this writing, version 2.6.17) already supports an
option to turn off all printk messages. However, sometimes this is too
much. Sometimes, an embedded developer may want to see a few printk
messages from specific files or routines, while still not enabling every
single printk message in the kernel. The DO\_PRINTK feature provides
this fine-grained control.

## Downloads

### Patch

Patch for 2.6.17.4 is here:
[Media:do-printk.patch](http://eLinux.org/images/2/21/Do-printk.patch "Do-printk.patch")
(3KB)

## How To Use

To use DO\_PRINTK, perform the following steps:

-   Apply the patch
-   Configure your kernel with CONFIG\_PRINTK\_FUNC=y and
    CONFIG\_PRINTK=n
    -   These options appear under "General Setup", "Configure standard
        kernel features (for small systems)" in 'make menuconfig'

<!-- -->

        General Setup --->
        [*] Configure standard kernel features (for small systems)  --->
        [*] Enable printk function in the kernel
          [ ]  Enable support for printk messages

-   -   With CONFIG\_PRINTK=n, the compiler will by default omit
        (compile away) the calls to printk in all files
-   Select the individual files you would like to still emit printk
    messages from
    -   Add "\#define DO\_PRINTK" to the files where you wish printk
        messages to be preserved
        -   Make sure this definition appears **before** any `#include`
            lines in the file.
    -   Alternatively, add -DDO\_PRINTK to the compiler flags for files
        you wish to preserve printks in.
        -   (see below for details)
-   Compile the kernel
-   (optionally) Examine the kernel size, and rejoice at your size
    savings
-   Install the kernel

### Ways to force printks to be preserved

There are actually several ways to get DO\_PRINTK defined for a
particular file:

1.  add to the top of the file a line consisting of:

<!-- -->

    #define DO_PRINTK

1.  -   this must appear before any `#include` lines for the file
    -   this definition will override the CONFIG\_PRINTK=n directive,
        and allow printks in the file to work normally

2.  add an option to CFLAGS to the Makefile which controls the building
    of the file(s) you want to affect
    -   To affect an individual file, add -DDO\_PRINTK for the CFLAGS
        for that file:
    -   For example, in the Makefile that compiles foo.c , add the line:

<!-- -->

    CFLAGS_foo.o += -DDO_PRINTK

1.  -   To affect all the files in a directory, set EXTRA\_CFLAGS, like
        so:

<!-- -->

    EXTRA_CFLAGS += -DDO_PRINTK

* * * * *

## Sample Results

Examples of use with measurement of the effects.

### Case Study 1

On an x86 machine, using kernel.org 2.6.17.4 kernel, I got the results
below, using the DO\_PRINTK feature in combination with the PRINTK
configuration option.

Here is the key for the following tables:

<table>
<tbody>
<tr class="odd">
<td align="left">kernel</td>
<td align="left">CONFIG_PRINTK_FUNC</td>
<td align="left">CONFIG_PRINTK</td>
<td align="left">DO_PRINTK used with files...</td>
<td align="left">Notes</td>
</tr>
<tr class="even">
<td align="left">func.yes-printk.yes-do.na/vmlinux</td>
<td align="left">yes</td>
<td align="left">yes</td>
<td align="left">not applicable</td>
<td align="left">This is a pretty regularly-configured kernel (used for baseline in first set of comparisons)</td>
</tr>
<tr class="odd">
<td align="left">func.yes-printk.no-do.none/vmlinux</td>
<td align="left">yes</td>
<td align="left">no</td>
<td align="left">none</td>
<td align="left">Turn off all messages, but leave printk function in place</td>
</tr>
<tr class="even">
<td align="left">func.no-printk.na-do.na/vmlinux</td>
<td align="left">no</td>
<td align="left">not applicable</td>
<td align="left">not applicable</td>
<td align="left">Turn off all messages and remove printk function</td>
</tr>
<tr class="odd">
<td align="left">func.yes-printk.no-do.init.star/vmlinux</td>
<td align="left">yes</td>
<td align="left">no</td>
<td align="left">init/*.c</td>
<td align="left">Turn off most messages, preserve messages from files in 'init' source directory</td>
</tr>
<tr class="even">
<td align="left">func.yes-printk.no-do.init.main.c/vmlinux</td>
<td align="left">yes</td>
<td align="left">no</td>
<td align="left">init/main.c</td>
<td align="left">Turn off most messages, preserve messages from init/main.c</td>
</tr>
</tbody>
</table>

#### Summary of image size results

Kernel sizes (sorted by decreasing size):

<table>
<tbody>
<tr class="odd">
<td align="left">text</td>
<td align="left">data</td>
<td align="left">bss</td>
<td align="left">dec</td>
<td align="left">hex</td>
<td align="left">filename</td>
</tr>
<tr class="even">
<td align="left">2621433</td>
<td align="left">564958</td>
<td align="left">137072</td>
<td align="left">3323463</td>
<td align="left">32b647</td>
<td align="left">func.yes-printk.yes-do.na/vmlinux (a.k.a. baseline)</td>
</tr>
<tr class="odd">
<td align="left">2376317</td>
<td align="left">564958</td>
<td align="left">137072</td>
<td align="left">3078347</td>
<td align="left">2ef8cb</td>
<td align="left">func.yes-printk.no-do.init.star/vmlinux</td>
</tr>
<tr class="even">
<td align="left">2375508</td>
<td align="left">564958</td>
<td align="left">137072</td>
<td align="left">3077538</td>
<td align="left">2ef5a2</td>
<td align="left">func.yes-printk.no-do.init.main.c/vmlinux</td>
</tr>
<tr class="odd">
<td align="left">2374733</td>
<td align="left">564958</td>
<td align="left">137072</td>
<td align="left">3076763</td>
<td align="left">2ef29b</td>
<td align="left">func.yes-printk.no-do.none/vmlinux (a.k.a. printk-off baseline)</td>
</tr>
<tr class="even">
<td align="left">2371463</td>
<td align="left">564514</td>
<td align="left">120688</td>
<td align="left">3056665</td>
<td align="left">2ea419</td>
<td align="left">func.no-printk.na-do.na/vmlinux</td>
</tr>
</tbody>
</table>

#### Image size results compared to baseline

The following tables show the image sizes of various kernels compared
with a baseline kernel. The baseline kernel has a fairly normally i386
configuration, with CONFIG\_PRINTK\_FUNC=y and CONFIG\_PRINTK=y.

Size delta results:

section

baseline/vmlinux

func.no-printk.na-do.na/vmlinux

change

percent

text

2621433

2371463

-249970

-9%

data

564958

564514

-444

0%

bss

137072

120688

-16384

-11%

total

3323463

3056665

-266798

-8% \*

\* Full size reduction using printk elimination is 266K or 8% of vmlinux

* * * * *

Size delta results:

<table>
<tbody>
<tr class="odd">
<td align="left">section</td>
<td align="left">baseline/vmlinux</td>
<td align="left">func.yes-printk.no-do.init.main.c/vmlinux</td>
<td align="left">change</td>
<td align="left">percent</td>
</tr>
<tr class="even">
<td align="left">text</td>
<td align="left">2621433</td>
<td align="left">2375508</td>
<td align="left">-245925</td>
<td align="left">-9%</td>
</tr>
<tr class="odd">
<td align="left">data</td>
<td align="left">564958</td>
<td align="left">564958</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="even">
<td align="left">bss</td>
<td align="left">137072</td>
<td align="left">137072</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="odd">
<td align="left">total</td>
<td align="left">3323463</td>
<td align="left">3077538</td>
<td align="left">-245925</td>
<td align="left">-7%</td>
</tr>
</tbody>
</table>

* * * * *

Size delta results:

<table>
<tbody>
<tr class="odd">
<td align="left">section</td>
<td align="left">baseline/vmlinux</td>
<td align="left">func.yes-printk.no-do.init.star/vmlinux</td>
<td align="left">change</td>
<td align="left">percent</td>
</tr>
<tr class="even">
<td align="left">text</td>
<td align="left">2621433</td>
<td align="left">2376317</td>
<td align="left">-245116</td>
<td align="left">-9%</td>
</tr>
<tr class="odd">
<td align="left">data</td>
<td align="left">564958</td>
<td align="left">564958</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="even">
<td align="left">bss</td>
<td align="left">137072</td>
<td align="left">137072</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="odd">
<td align="left">total</td>
<td align="left">3323463</td>
<td align="left">3078347</td>
<td align="left">-245116</td>
<td align="left">-7%</td>
</tr>
</tbody>
</table>

* * * * *

Size delta results:

<table>
<tbody>
<tr class="odd">
<td align="left">section</td>
<td align="left">baseline/vmlinux</td>
<td align="left">func.yes-printk.no-do.none/vmlinux</td>
<td align="left">change</td>
<td align="left">percent</td>
</tr>
<tr class="even">
<td align="left">text</td>
<td align="left">2621433</td>
<td align="left">2374733</td>
<td align="left">-246700</td>
<td align="left">-9%</td>
</tr>
<tr class="odd">
<td align="left">data</td>
<td align="left">564958</td>
<td align="left">564958</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="even">
<td align="left">bss</td>
<td align="left">137072</td>
<td align="left">137072</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="odd">
<td align="left">total</td>
<td align="left">3323463</td>
<td align="left">3076763</td>
<td align="left">-246700</td>
<td align="left">-7%</td>
</tr>
</tbody>
</table>

* * * * *

#### Image size results compared to 'printk-off' baseline

The following tables show the image sizes of various kernels compared
with a baseline kernel. The baseline kernel has 'printk-off'
configuration, with CONFIG\_PRINTK\_FUNC=y and CONFIG\_PRINTK=n.

Size delta results:

section

func.yes-printk.no-do.none/vmlinux

func.no-printk.na-do.na/vmlinux

change

percent

text

2374733

2371463

-3270 \*

0%

data

564958

564514

-444 \*

0%

bss

137072

120688

-16384 \*

-11%

total

3076763

3056665

-20098 \*

0%

\* Size of printk function alone is about 3.6k in image and 20k in
static memory

* * * * *

Size delta results:

section

func.yes-printk.no-do.none/vmlinux

func.yes-printk.no-do.init.main.c/vmlinux

change

percent

text

2374733

2375508

775 \*

0%

data

564958

564958

0

0%

bss

137072

137072

0

0%

total

3076763

3077538

775

0%

\* Size of printk messages from a single C file (init/main.c in this
case) was 775 bytes. Obviously, this is heavily dependent on the number
of printk calls and the size of the messages in that file.

* * * * *

Size delta results:

<table>
<tbody>
<tr class="odd">
<td align="left">section</td>
<td align="left">func.yes-printk.no-do.none/vmlinux</td>
<td align="left">func.yes-printk.no-do.init.star/vmlinux</td>
<td align="left">change</td>
<td align="left">percent</td>
</tr>
<tr class="even">
<td align="left">text</td>
<td align="left">2374733</td>
<td align="left">2376317</td>
<td align="left">1584</td>
<td align="left">0%</td>
</tr>
<tr class="odd">
<td align="left">data</td>
<td align="left">564958</td>
<td align="left">564958</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="even">
<td align="left">bss</td>
<td align="left">137072</td>
<td align="left">137072</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="odd">
<td align="left">total</td>
<td align="left">3076763</td>
<td align="left">3078347</td>
<td align="left">1584</td>
<td align="left">0%</td>
</tr>
</tbody>
</table>

* * * * *

Size delta results:

<table>
<tbody>
<tr class="odd">
<td align="left">section</td>
<td align="left">func.yes-printk.no-do.none/vmlinux</td>
<td align="left">func.yes-printk.yes-do.na/vmlinux</td>
<td align="left">change</td>
<td align="left">percent</td>
</tr>
<tr class="even">
<td align="left">text</td>
<td align="left">2374733</td>
<td align="left">2621433</td>
<td align="left">246700</td>
<td align="left">10%</td>
</tr>
<tr class="odd">
<td align="left">data</td>
<td align="left">564958</td>
<td align="left">564958</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="even">
<td align="left">bss</td>
<td align="left">137072</td>
<td align="left">137072</td>
<td align="left">0</td>
<td align="left">0%</td>
</tr>
<tr class="odd">
<td align="left">total</td>
<td align="left">3076763</td>
<td align="left">3323463</td>
<td align="left">246700</td>
<td align="left">8%</td>
</tr>
</tbody>
</table>

* * * * *



### Case Study 2

[need to post PPC and MIPS results here also]

## Status

-   Status: tested on multiple platforms
-   Architecture Support:

<!-- -->

      (for each arch, one of: unknown, patches apply, compiles, runs, works, accepted)

-   -   i386: works
    -   ARM: compiles, not run-tested yet
    -   PPC: works
    -   MIPS: works
    -   SH: unknown

## Future Work/Action Items

Here is a list of things that could be worked on for this feature:

    - nothing right now


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Printk](http://eLinux.org/Category:Printk "Category:Printk")

