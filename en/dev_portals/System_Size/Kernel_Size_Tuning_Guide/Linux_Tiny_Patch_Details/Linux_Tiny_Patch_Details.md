> From: [eLinux.org](http://eLinux.org/Linux_Tiny_Patch_Details "http://eLinux.org/Linux_Tiny_Patch_Details")


# Linux Tiny Patch Details



This page has a table of patches that are part of the Linux-tiny
project.

patch

type

description

kernel option

2.6.22 status/notes

mainline inclusion status

no-translations.patch

omit feature

Allow omitting support for console charset translation

CONFIG\_CONSOLE\_TRANSLATIONS

mainlined

submitted for mainline in June 2008 by Tim Bird. Should show up in
2.6.27

sysenter.patch

omit feature

Allow disabling syscalls via sysenter (x86-only)

CONFIG\_SYSENTER

OK

no-aio.patch

omit feature

Allow disabling Asynchronous IO syscalls and support

CONFIG\_AIO

OK

Submitted by Thomas Petazzoni on July, 29th 2008. Added to the -mm tree
([mail](http://marc.info/?l=linux-mm-commits&m=121737607321381&w=2)).

no-xattr.patch

omit feature

Allow disabling Extended Attributes syscalls and support

CONFIG\_XATTR

OK

Only removes 3.5 Kbytes. Drop ?

fslock.patch

omit feature

Allow disabling POSIX file locking syscalls and support

CONFIG\_FILE\_LOCKING

OK

Submitted by Thomas Petazzoni on July, 29th 2008. Added to the -mm tree
([mail](http://marc.info/?l=linux-mm-commits&m=121737621921572&w=2)).

direct-io-core.patch

omit feature

Allow disabling directIO syscalls and support

DIRECTIO

patch doesn't apply (bitrotted?)

ethtool.patch

omit feature

Allow disabling support for configuring network devices with ethtool
program

CONFIG\_ETHTOOL

OK

Submitted by Thomas Petazzoni on July, 29th 2008. Initially
[added](http://marc.info/?l=linux-mm-commits&m=121737637021748&w=2) to
the -mm tree, was later removed due to David Miller's NACK of the patch.
New versions be worked on in collaboration with David Woodhouse.

inetpeer.patch

omit feature

Allow disabling INET peer data tracking

CONFIG\_INETPEER

OK

Only removes 1.8 Kb. Drop ?

net-filter.patch

omit feature

Allow disabling old-style packet filtering support

CONFIG\_NET\_SK\_FILTER

OK

Removes 3.5 Kb. Drop ?

dev\_mcast.patch

omit feature

Allow disabling netdev multicast support

CONFIG\_NET\_DEV\_MULTICAST

OK

Removes 0.8 Kb. Drop ?

igmp.patch

omit feature

Allow disabling IGMP (Internet Group Management Protocol) support - used
for multicasts

CONFIG\_IGMP

OK

Submitted by Thomas Petazzoni on July, 29th 2008. Initially
[added](http://marc.info/?l=linux-mm-commits&m=121737629721666&w=2) to
the -mm tree and later removed because of David Miller's NACK of the
patch. Reason: a TCP/IP stack without IGMP support is fundamentally
broken.

binfmt-script.patch

omit feature

Allow disabling support to run shell scripts via standard "\#!" syntax

CONFIG\_BINFMT\_SCRIPT

OK

Only removes 475 bytes. Thomas Petazzoni suggests to drop.

elf-no-aout.patch

omit feature

Allow disabling support for ELF programs with a.out format loader or
libraries

CONFIG\_BINFMT\_ELF\_AOUT

OK

no-doublefault.patch

omit feature

Remove double faut exception handler

None

Already included, CONFIG\_DOUBLEFAULT

sbf.patch

omit feature

Allow disabling simple bootflag support (x86-only)

CONFIG\_BOOTFLAG

patch doesn't apply (bitrotted?)

Only removes 212 bytes. Thomas Petazzoni suggests to drop.

serial-pci.patch

omit feature

Allow disabling support for PCI serial devices

CONFIG\_SERIAL\_PCI

OK

Already merged
([commit](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=0cff260a42c051ee64c184ed05d96d18d243f7f6)).

dmi\_blacklist.patch

omit feature

Allow disabling DMI scanning (x86-only)

CONFIG\_DMI\_SCAN

patch doesn't apply (bitrotted?)

Patch updated by Thomas Petazzoni. In mainline since 2.6.25, see the
[commit](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=7ae9392c0a3bc01562361bb21e23dfb2e5c81c5a)

pci-quirks.patch

omit feature

Allow disabling of workarounds for various PCI chipset bugs and quirks

CONFIG\_PCI\_QUIRKS

OK

tsc.patch

omit feature

Allow disabling use of TSC as kernel timer (x86-only)

CONFIG\_X86\_TSC\_TIMER

patch doesn't apply (bitrotted?)

Removes only 1 Kb. Drop ?

cpu-support.patch

omit feature

Allow disabling vendor-specific x86 CPU features (x86-only)

CONFIG\_PROCESSOR\_SELECT, CONFIG\_CPU\_SUP\_\* (many)

patch doesn't apply (bitrotted?)

A first part has been integrated in 2.6.25
([commit](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=03ae5768b6110ebaa97dc3e7abf1c3d8bec5f874)).
Another part has been merged later
([commit](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=9781f39fd209cd93ab98b669814191acc67f32fd)).
The remaining part, already submitted by Thomas Petazzoni, needs to be
updated and resent.

use-funit-at-a-time.patch

compiler flag

Add -funit-at-a-time to the gcc compilation flags for building the
kernel

None

OK

Not needed anymore, since -funit-at-a-time is enabled by default with
-O, -O2, -O3 and -Os with gcc 4.

config-net-small.patch

add option

Add CONFIG\_NET\_SMALL configuration option

Adds CONFIG\_NET\_SMALL

OK

cache\_defer\_hash.patch

smaller data

Reduce RPC cache hash table size from PageSize to 512

Uses CONFIG\_NET\_SMALL

OK

unix\_socket\_table.patch

smaller data

Reduce AF\_UNIX socket hash table from 256 to 16 entries

Uses CONFIG\_NET\_SMALL

OK

inet\_protos.patch

smaller data

Reduce number of internet protocols supported from 256 to 32

Uses CONFIG\_NET\_SMALL

OK

flow-cache-small.patch

smaller data

Reduce flow cache hash table from 2\^10 (1024) to 2\^3 (8)

Uses CONFIG\_NET\_SMALL

OK

tg3-oops.patch

bugfix

Handle tg3 ring allocation correctly

None

mainlined

namei-inlines.patch

smaller code

Uninline various functions in namei.c

None

OK

Submitted by Thomas Petazzoni on July, 29th 2008. Rejected by Al Viro
([mail](http://lkml.org/lkml/2008/7/29/327)), but reasons questionned by
Andrew ([mail](http://lkml.org/lkml/2008/7/29/337)).

buffer-inlines.patch

smaller code

Uninline function in buffer.c

None

OK

Mainlined
([commit](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=dbacefc9c4f6bd365243db379473ab7041656d90)).
Will show up in 2.6.27.

ext2namei-inlines.patch

smaller code

Uninline ext2\_add\_nondir function

None

OK

Only removes 80 bytes, Thomas Petazzoni suggest to drop.

kmalloc-accounting.patch

measurement feature

Add kmalloc accounting feature

CONFIG\_KMALLOC\_ACCOUNTING

(replaced)

cache-accounting.patch

measurement feature

Add slab accounting feature

CONFIG\_DEBUG\_SLAB\_ACCOUNT

OK

slab-analysis-scripts.patch

measurement feature

Add slabalyze and casort

CONFIG\_DEBUG\_SLAB\_ACCOUNT

OK

audit-bootmem.patch

measurement feature

Cause bootmem code to print callers and sizes for allocations

CONFIG\_AUDIT\_BOOTMEM

OK

deprecate-inline.patch

measurement feature

Add system for counting inline usage by generating deprecation warnings

CONFIG\_MEASURE\_INLINES

OK

deprecate-inline-kconfig-move.patch

measurement feature

Fixup a kconfig entry for measuring inlines

CONFIG\_MEASURE\_INLINES

OK

func-size.patch

measurement feature

Adds a script to count inline function sizes

None

OK

tiny-panic.patch

reduced debug feature

Add option to use smaller panic code

CONFIG\_FULL\_PANIC

OK

nopanic.patch

omit debug feature

Make code for kernel panic configurable

CONFIG\_PANIC

OK

tiny-crc.patch

smaller data

Allow using function instead of table for CRC32 calculations

CONFIG\_CRC32\_TABLES

OK

threadinfo-ool.patch

smaller code

Inline current() and current\_thread\_info() on UP (configurable) (x86
only?)

CONFIG\_INLINE\_THREADINFO

patch doesn't apply (bitrotted?)

In discussion between Thomas Petazzoni and Ingo Molnar. See [this
thread](http://selenic.com/pipermail/linux-tiny/2008-February/000525.html).

slob-accounting.patch

measurement feature

Add kmalloc accounting to SLOB allocator

Uses CONFIG\_SLOB, CONFIG\_DEBUG\_SLOB\_ACCOUNT??

patch applies, but has no effect (missing config item), patch not
completed|

mempool-shrink.patch

reduced feature

Allow disabling mempool allocator feature

CONFIG\_MEMPOOL

OK

max-swapfiles.patch

smaller data

Make the number of swapfiles configurable

CONFIG\_MAX\_SWAPFILES\_SHIFT

OK

ldiscs.patch

smaller data

Make the number of tty line disciplines configurable

CONFIG\_NR\_LDISCS

OK

max\_user\_rt\_prio.patch

smaller data

Make the number of RT priority O(1) scheduling queues configurable

CONFIG\_MAX\_USER\_RT\_PRIO

OK

Switching from 100 to 10 reduces bss of 4k and visible free memory after
boot of 8 k.

ide-hwif.patch

smaller data

Make the number of supported IDE interfaces configurable

CONFIG\_IDE\_HWIFS

OK

mtrr.patch

continuation patch

Make MTRR support depend on vendor-specific CPU selection (x86-only)

None

patch doesn't apply (bitrotted?)

Need to wait for cpu-support to be included

movsl-mask.patch

continuation patch

Make movsl mask usage depend on vendor-specific CPU selection (x86-only)

None

OK

do-printk.patch

reduced feature

Allow fine-grained control of printk message compilation

CONFIG\_PRINTK\_FUNC, uses CONFIG\_PRINTK

OK

inflate-\*.patch (multiple patches)

eliminate redundant code

Allow ARM boot code to re-use existing lib/inflate code

None

patches don't apply (bitrotted!)

A first part has been integrated in 2.6.25
([commit](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=3265e66b1825942c6e0fc457986cdf941a5f7d37)).
Another part has been merged
([commit](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=2d6ffcca623a9a16df6cdfbe8250b7a5904a5f5e))
and should show up in 2.6.27.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux Tiny](http://eLinux.org/Category:Linux_Tiny "Category:Linux Tiny")

