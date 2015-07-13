> From: [eLinux.org](http://eLinux.org/Rt_Preempt_Subpatch_Table "http://eLinux.org/Rt_Preempt_Subpatch_Table")


# Rt Preempt Subpatch Table



Here is a table of rt-preempt sub-patches and the kernel features they
introduce and affect:

.

**PATCH**

Kernel item

p-smp

p-cleanup

add-lnr

add-crs

\*fix-scheduling\*

\*keventd\*

idle-thread-p-fix

remove-bkl

spinlock\_t

add break\_lock

.

.

.

.

.

.

.

rwlock\_t

add break\_lock

.

.

.

.

.

.

.

\_raw\_read\_trylock()

create

.

.

.

.

.

.

.

generic\_raw\_read\_trylock()

create

.

.

.

.

.

.

.

cond\_resched\_lock()

check for break\_lock

.

.

.

add calls to

.

.

.

\<spinlock routines\>() (read\_lock(), spin\_lock\_irqsave(),
spin\_lock\_irq(), spin\_lock\_bh(), read\_lock\_irqsave(),
read\_lock\_irq(), read\_lock\_bh(), write\_lock\_irqsave(),
write\_lock\_irq(), write\_lock\_bh())

enabled irqs, check for lock break requests

.

.

.

change some \*\_lock() to \*\_lock\_irq()s

.

.

.

need\_lockbreak()

.

create

.

.

.

.

.

.

cond\_resched()

.

fix

.

.

add calls to

.

.

.

lock\_need\_resched()

.

.

create

.

add calls to

.

.

.

lock/unlock\_kernel()

.

.

.

.

add calls to

.

.

.

cond\_resched\_softirq()

.

.

.

.

add calls to

.

.

.

filemap\_sync()

.

.

.

.

create replacement with cond\_resched()

.

.

.

\_\_filemap\_sync()

.

.

.

.

create?

.

.

.

unmap\_vmas()

.

.

.

.

change ZAP\_BLOCK\_SIZE

.

.

.

helper\_init()

.

.

.

.

.

create

.

.

rest\_init()

.

.

.

.

.

.

enable\_preemption

.

start\_kernel()

.

.

.

.

.

.

disable preemption

.

PREEMPT\_BKL

.

.

.

.

.

.

.

create

\_smp\_processor\_id()

.

.

.

.

.

.

.

create

current\_cpu\_data

.

.

.

.

.

.

.

replace with cpu\_data[]

in\_atomic()

.

.

.

.

.

.

.

alters

nmi\_enter/exit(), irq\_enter()

.

.

.

.

.

.

.

alter to use add/sub\_preempt\_count()

add/sub\_preempt\_count()

.

.

.

.

.

.

.

create

ARRAY(0x1016aca4)release\_kernel\_lock()

.

.

.

.

.

.

.

create

lock/unlock\_kernel()

.

.

.

.

.

.

.

create sem version

DEBUG\_PREEMPT

.

.

.

.

.

.

.

create

smp\_processor\_id()

.

.

.

.

.

.

.

add debug version

might\_sleep()

.

.

.

.

.

.

.

.

created in rtp3

## Sub-patch summaries

-   preempt-smp - spin irq-nicely and request cross-CPU lock-breaks if
    needed.
    -   -   add break\_lock field to spinlock\_t and rwlock\_t, and add
            \_raw\_read\_trylock() function
        -   generic\_raw\_read\_trylock() needs to an ARCH-optimized
            version

-   preempt-cleanup - fixes some issues with cond\_resched, and adds
    need\_lockbreak()
-   add-lock\_need\_resched - self-explanatory
-   sched-add-cond\_resched\_softirq - allows some softirqs-disabled
    codepaths to preempt
-   \*fix-scheduling\*, break-latency\* - add cond\_resched() to lots of
    places
    -   -   add lock\_kernel and unlock\_kernel in a few places
        -   adjust some routines to allow rescheduling better (dependent
            on PREEMPT and SMP)

-   fix-keventd-execution-dependency - schedule work differently during
    kevent initialization
-   idle-thread-preemption-fix - disable preemption during bootup (until
    idle thread is running)
-   remove-the-bkl-by-turning-it-into-a-sempahore - self-explanatory
    -   -   adds \_smp\_processor\_id() to help debug incorrect usage of
            this routine
        -   adds add/sub\_preempt\_count, with debug aids to detect
            underflows
        -   adds DEBUG\_PREEMPT to enable both of the above
        -   replace current\_cpu\_data with
            cpu\_data[\_smp\_processor\_id()]
        -   add PREEMPT\_BKL, and change routines lock/unlock\_kernel to
            use a semaphore



## Terminology

-   voluntary preempt = add preemption points to PREEMPT kernels (mostly
    via added calls to cond\_resched())
-   might\_sleep =
-   latency timing = system for keeping track of preemption request vs.
    actual preemption occurence
    -   this is used to emit warnings when a user-defined threshold is
        exceeded, and is useful for debugging the preemption features of
        this patchset
-   latency trace = system for logging preemption-related events


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

