> From: [eLinux.org](http://eLinux.org/Kernel_Size_Tuning_Guide_Config_Option_Impact "http://eLinux.org/Kernel_Size_Tuning_Guide_Config_Option_Impact")


# Kernel Size Tuning Guide Config Option Impact



Table Of Contents:



## Contents

-   [1 Overview](#overview)
-   [2 Examination Result](#examination-result)
    -   [2.1 Impact of config items](#impact-of-config-items)
    -   [2.2 Kernel Overall Size and RAM
        Usage](#kernel-overall-size-and-ram-usage)
-   [3 Examination Detail](#examination-detail)
    -   [3.1 Environment](#environment)
    -   [3.2 Examination Method](#examination-method)
        -   [3.2.1 Impact Examination](#impact-examination)
        -   [3.2.2 Overall size/RAM Usage](#overall-size-ram-usage)
    -   [3.3 Note : About RAM Usage
        Measurement](#note-about-ram-usage-measurement)
-   [4 Tips](#tips)

## Overview

This page describes examination result which tries to make clear how
much impact each config item has for kernel size and RAM usage. Examined
config items are basically ones listed in the table in "4.3 Kernel
Configuration Options" of [Kernel Size Tuning
Guide](http://eLinux.org/Kernel_Size_Tuning_Guide "Kernel Size Tuning Guide"). This
result was presented at [Japan Technical Jamboree
11](http://eLinux.org/Japan_Technical_Jamboree_11 "Japan Technical Jamboree 11")] ,
titled "Difference of the Kernel size between "default" and "small" ".
Presentation slides are available on the [Japan Technical Jamboree
11](http://eLinux.org/Japan_Technical_Jamboree_11 "Japan Technical Jamboree 11") page.

## Examination Result

### Impact of config items

The table below shows kernel size and RAM usage difference between when
config item is set as "from" and "to". Most of items are same as listed
in "4.3 Kernel Configuration Options" of [Kernel Size Tuning
Guide](http://eLinux.org/Kernel_Size_Tuning_Guide "Kernel Size Tuning Guide"), but some
were not examined, and several items are added. Please see "note" cell
about the reason to be omitted or added. The data were taken from kernel
2.6.16.19 for i386. More detail of measurement conditions are described
in "Examination Detail" later.

Column "avail on" means whether the config item is available for vanilla
kernel, or for only Linux-Tiny applied kernel.

**config option**

**avail on**

**setting**

**difference[byte]**

**note**

**from**

**to**

**vmlinux**

**bzImage**

**used mem**

CONFIG\_BASE\_FULL

tiny

Y

N

-4096

-32

-16384

changed from CONFIG\_CORE\_SMALL(which was for 2.6.10 in
core-small.patch)

CONFIG\_NET\_SMALL

tiny

N

Y

0

32

16384

CONFIG\_KMALLOC\_ACCOUNTING

tiny

N

N

-

-

-

compilation failure when enabled(mm/slab.c : \_\_do\_kmalloc()
kmem\_cache has no member of "cs\_size")

CONFIG\_AUDIT\_BOOTMEM

tiny

Y

N

0

-128

-135168

CONFIG\_MEASURE\_INLINES

tiny

Y

N

0

0

0

changed from CONFIG\_DEPRECATE\_INLINES (typo?)

CONFIG\_PRINTK

vanilla

Y

N

-365530

-142176

-

mem measurement uses printk

CONFIG\_BUG

vanilla

Y

N

-43287

-14848

12288

CONFIG\_ELF\_CORE

vanilla

Y

N

-4424

-2880

-8192

CONFIG\_PROC\_KCORE

vanilla

Y

N

-4467

-3328

20480

CONFIG\_AIO

tiny

Y

N

-9329

-7328

-16384

CONFIG\_XATTR

tiny

Y

N

-21517

-10816

77824

see "Tips"

CONFIG\_FILE\_LOCKING

tiny

Y

Y

-

-

-

compilation failure (see "Tips")

/\\ CONFIG\_DIRECTIO

-

-

-

-

-

-

obsolete (was 2.6.10 in direct-io-core.patch)

CONFIG\_MAX\_SWAPFILES\_SHIFT

tiny

5

0

0

-96

-4096

CONFIG\_NR\_LDISCS

tiny

16

2

0

-64

-163840

CONFIG\_MAX\_USER\_RT\_PRIO

tiny

100

5

0

-96

-143360

CONFIG\_KALLSYMS

vanilla

Y

N

-235189

-130592

-4096

CONFIG\_SHMEM

vanilla

Y

N

-14233

-7360

-12288

CONFIG\_SWAP

vanilla

Y

N

-19266

-11136

8192

CONFIG\_SYSVIPC

vanilla

Y

N

-27365

-12640

-4096

changed from CONFIG\_SYSV\_IPC (typo?)

CONFIG\_POSIX\_MQUEUE

vanilla

Y

N

-9681

-3936

-4096

CONFIG\_SYSCTL

vanilla

Y

N

-84593

-28000

-57344

CONFIG\_LOG\_BUF\_SHIFT

vanilla

15

12

0

32

20480

see "Tips"

CONFIG\_UID16

vanilla

Y

N

-4408

-3040

-163840

CONFIG\_CC\_OPTIMIZE\_FOR\_SIZE

vanilla

N

Y

-487424

-167904

12288

CONFIG\_MODULES

vanilla

Y

N

-369445

-44608

-147456

CONFIG\_KMOD

vanilla

Y

N

-4959

-4128

-159744

CONFIG\_PCI

vanilla

Y

N

-1217753

-463200

-249856

/\\ CONFIG\_XIP\_KERNEL

-

-

-

-

-

-

not supported for i386 (arch depend)

/\\ CONFIG\_MAX\_RESERVE\_AREA

-

-

-

-

-

-

 ?? (arch depend?)

CONFIG\_BLK\_DEV\_LOOP

vanilla

Y

N

-14292

-7488

-163840

CONFIG\_BLK\_DEV\_RAM

vanilla

Y

N

-10237

-4512

-40960

CONFIG\_BLK\_DEV\_RAM\_COUNT

vanilla

16

2

0

-32

-28672

CONFIG\_BLK\_DEV\_RAM\_SIZE

vanilla

4096

1024

0

0

-16384

CONFIG\_IOSCHED\_AS

vanilla

Y

N

-10982

-7680

-8192

CONFIG\_IOSCHED\_DEADLINE

vanilla

Y

N

-6107

-3008

-147456

CONFIG\_IOSCHED\_CFQ

vanilla

Y

N

-12393

-6880

-28672

CONFIG\_IP\_PNP

vanilla

Y

N

-14156

-7168

-16384

CONFIG\_IP\_PNP\_DHCP

vanilla

Y

N

-101

-224

-4096

CONFIG\_IP\_PNP\_BOOTP

vanilla

Y

N

0

0

-20480

Added to contrast with IP\_PNP\_DHCP

CONFIG\_IP\_PNP\_RARP

vanilla

Y

N

-4190

-2784

-135168

Added to contrast with IP\_PNP\_DHCP

CONFIG\_IDE

vanilla

Y

N

-175576

-69568

-

mem measurement environment uses IDE as a root device

CONFIG\_SCSI

vanilla

Y

N

-284965

-114720

-315392

CONFIG\_SMP

vanilla

Y

N

-177845

-64064

-61440

Added 'cause probably effective

CONFIG\_NFS\_FS

vanilla

Y

N

-63186

-28384

-86016

Added 'cause probably effective

CONFIG\_NFSD

vanilla

Y

N

-56816

-24256

-454656

Added 'cause probably effective

### Kernel Overall Size and RAM Usage

The table below shows static size of kernel configured as "default" and
"small". The difference of them means overall impact of config items
listed in the table "Impact of config items" above. Please see
"Examination detail" about detail of "default" and "small"
configurations.

Kernel static size[BYTE]

**kernel source**

**configuration**

**vmlinux**

**bzImage**

**\$(size vmlinux)**

**text**

**data**

**bss**

vanilla

"default"

5267762

2019678

3606842

561724

186972

"small"

2190346

903209

1547095

159976

64276

tiny

"default"

5267871

2014684

3603061

562236

185788

"small"

2112179

863484

1478058

159836

57844

And the table below shows RAM usage of kernel configured as "default"
and "small(+)". Please see "Examination detail" about detail of
"default" and "small(+)" configurations.

RAM usage [BYTE]

**kernel source**

**configuration**

**used**

**free**

**total**

vanilla

"default"

3829760

124260352

128090112

"small(+)"

2920448

127713280

130633728

tiny

"default"

3977216

124112896

128090112

"small(+)"

3022848

127692800

130715648

## Examination Detail

### Environment

<table>
<tbody>
<tr class="odd">
<td align="left">kernel</td>
<td align="left">2.6.16.19 + Linux-Tiny patches</td>
</tr>
<tr class="even">
<td align="left">arch</td>
<td align="left">i386</td>
</tr>
<tr class="odd">
<td align="left">platform for RAM usage measurement</td>
<td align="left">qemu 0.6.2 (mem=128MB)(on Pentium IV 3.4GHz, mem=1.0GB)</td>
</tr>
<tr class="even">
<td align="left">gcc</td>
<td align="left">3.3.5</td>
</tr>
<tr class="odd">
<td align="left">binutils</td>
<td align="left">2.15</td>
</tr>
</tbody>
</table>

### Examination Method

#### Impact Examination

The examination was basically done by using Kconfig Size tool (see
[Kernel Config Weight](http://eLinux.org/Kernel_Config_Weight "Kernel Config Weight")),
but partially by manual manipulation because of some limitation of the
tool. The overview of method to measure impact is :

1.  Make a default .config file by "make defconfig".
2.  Change all "=m" in the .config file into "=y".
3.  Enable (which means to set "=y") all boolean or tristate examination
    target config items.This .config file is now called "base config
    file".
4.  Make "base kernel" from the base config file.And then, measure size
    of the base kernel (S0) and RAM usage (M0).
5.  Make examination kernel for each target item.
    1.  For boolean or tristate config item, make .config file to
        disable (set "=n") the item, and make kernel from the .config
        file.
    2.  For item which has numerical value (ie. int), make .config file
        to set the item as a certain value, and make kernel from the
        .config file.

6.  Then measure size (Sx) and RAM usage (Mx) of the made kernel.
7.  Impact of the config item is calculated as :Impact for size : Sx -
    X0 Impact for RAM usage : Mx - M0

The base config file used for this examination is
[[[Media:2.6.16.19-tiny-base.config]] here(2.6.16.19-tiny-base.config)].

#### Overall size/RAM Usage

The method to measure overall size and RAM usage is very simple, which
means making .config files and measure. We used 2 kinds of
kernel-sources, and 3 configurations as below.

Kinds of kernel-sources

**name**

**description**

vanilla

Source code downloaded from kernel.org

tiny

Source code which is applied Linux-Tiny patches on vanilla



Kinds of kernel configurations

**config name**

**description**

**.config file**

default

Mostly same as defconfig, but modified little bit as below. (1) Change
all "=m" into "=y" to measure size of vmlinux/bzImage. (2) Enable
CONFIG\_SERIAL\_8250\_CONSOLE because our platform for RAM usage
measurement uses serial console.

[Media:2.6.16.19-vanilla-default.config](http://eLinux.org/images/4/40/2.6.16.19-vanilla-default.config "2.6.16.19-vanilla-default.config")
[Media:2.6.16.19-tiny-default.config](http://eLinux.org/images/6/60/2.6.16.19-tiny-default.config "2.6.16.19-tiny-default.config")

small

Based on "default" configuration, but set config items listed in "Impact
of config items" to make kernel size smaller.This configuration is used
only for size measurement because it is not bootable for our platform
for RAM usage measurement.

[Media:2.6.16.19-vanilla-small.config](http://eLinux.org/images/f/fc/2.6.16.19-vanilla-small.config "2.6.16.19-vanilla-small.config")
[Media:2.6.16.19-vanilla-small.config](http://eLinux.org/images/f/fc/2.6.16.19-vanilla-small.config "2.6.16.19-vanilla-small.config")

small(+)

Modify "small" configuration as to enable CONFIG\_PRINTK and CONFIG\_IDE
of "small" configuration.The reason why to modify is our RAM measurement
method uses PRINTK and our platform for RAM measurement uses IDE as a
root device.This configuration is used only for RAM usage measurement.

[Media:2.6.16.19-vanilla-small-plus.config](http://eLinux.org/images/1/11/2.6.16.19-vanilla-small-plus.config "2.6.16.19-vanilla-small-plus.config")
[Media:2.6.16.19-tiny-small-plus.config](http://eLinux.org/images/1/19/2.6.16.19-tiny-small-plus.config "2.6.16.19-tiny-small-plus.config")

### Note : About RAM Usage Measurement

The definition of "RAM usage" here is amount of RAM which BUDDY system
recognizes as in-use just after boot of kernel ( = just before execution
of userland ). It should be "just-for-reference" because reproducibility
error is known from our experiences.



## Tips

Appearing below are "Tips" to help one who tries to examine moreover.

-   **CONFIG\_XATTR** When XATTR=n, EXT3\_FS\_XATTR=y causes compilation
    failure. ( EXT3\_FS\_XATTR=y in defconfig )

-   **CONFIG\_FILE\_LOCKING** When FILE\_LOKING=n, NFSD=y causes
    compilation failure. ( NFSD=y in defconfig )

-   **CONFIG\_LOG\_BUF\_SHIFT** LOG\_BUF\_SHIFT can't be set unless
    DEBUG\_KERNEL=y because "if DEBUG\_KERNEL" in lib/Kconfig. Please
    make sure to disable below items to make kernel compact, which are
    "depends on DEBUG\_KERNEL" and "default y".
    -   DETECT\_SOFTLOCKUP
    -   DEBUG\_PREEMPT
    -   DEBUG\_MUTEXES
    -   FORCED\_INLINING

-   **CONFIG\_PCI** Disable ACPI in advance if you want to disable PCI
    because ACPI selects PCI.

-   **CONFIG\_PRINTK** syslogd needs PRINTK=y. You shouldn't launch
    syslogd on kernel configured as PRINTK=n.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

