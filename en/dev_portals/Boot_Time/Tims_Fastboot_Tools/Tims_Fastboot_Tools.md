> From: [eLinux.org](http://eLinux.org/Tims_Fastboot_Tools "http://eLinux.org/Tims_Fastboot_Tools")


# Tims Fastboot Tools



This page has materials to support Tim Bird's presentation "[Tools and
Techniques for Reducing Bootup
Time](http://eLinux.org/images/d/d2/Tools-and-technique-for-reducing-bootup-time.pdf "Tools-and-technique-for-reducing-bootup-time.pdf")".
This presentation was first delivered at the Embedded Linux Conference,
Europe, in November of 2008.

## Contents

-   [1 safe-to-call-sched\-clock.patch](#safe-to-call-sched-clock-patch)
-   [2 grabserial](#grabserial)
-   [3 Tim's quick and dirty process
    trace](#tim-s-quick-and-dirty-process-trace)
    -   [3.1 Patch Download](#patch-download)
    -   [3.2 Usage](#usage)
-   [4 Deferred initcall](#deferred-initcall)

## safe-to-call-sched\-clock.patch

This patch was used by Tim for several kernel versions, to address
problems with the printk-times feature on ARM platforms. It is very
simple, and consists of just adding a flag to avoid calling
sched\_clock() too early.

This patch appears (as of kernel version 2.6.27) to be obsolete. The
2.6.27 kernel now calls cpu\_clock() for printk\_times. This uses a
similar mechanism to flag when it is safe to call.

Here's the patch:

    On most platforms, printk_clock() calls sched_clock(), which provides good
    timestamp resolution.  However, most ARM boards use a timer source for
    sched_clock() which must be initialized at boot.  If sched_clock() is called
    too early, the machine hangs. This code utilizes the default jiffies-based
    value for printk_clock, until told that sched_clock() is safe.  This is
    almost always 0 before the clock is initialized, so this patch causes
    no loss of timing data, or confusing time switchover mid-boot.

    OMAP support is included.

    To utilize this on other ARM platforms, just add "safe_to_call_sched_clock=1"
    in the timer initialization code for your platform, when it is safe to call
    sched_clock().

    Signed-off-by: Tim Bird <tim.bird@am.sony.com>

    ChangeLog:
        2008/02/05
        Location: alp@oak--linux-3/alp-linux--dev-3--3.1
        First changelog version.
    ---
     arch/arm/kernel/time.c      |    8     7 + 1 - 0 !
     arch/arm/mach-omap1/time.c  |    3     3 + 0 - 0 !
     include/asm-arm/mach/time.h |    2     2 + 0 - 0 !
     3 files changed, 12 insertions(+), 1 deletion(-)

    Index: alp-linux/arch/arm/kernel/time.c
    ===================================================================
    --- alp-linux.orig/arch/arm/kernel/time.c
    +++ alp-linux/arch/arm/kernel/time.c
    @@ -84,10 +84,16 @@ static unsigned long dummy_gettimeoffset
      * sched_clock().  This avoids non-bootable kernels when
      * printk_clock is enabled.
      */
    +int safe_to_call_sched_clock = 0;
    +
     unsigned long long printk_clock(void)
     {
    -   return (unsigned long long)(jiffies - INITIAL_JIFFIES) *
    +   if (likely(safe_to_call_sched_clock)) {
    +       return sched_clock();
    +   } else {
    +       return (unsigned long long)(jiffies - INITIAL_JIFFIES) *
                (1000000000 / HZ);
    +   }
     }

     static unsigned long next_rtc_update;
    Index: alp-linux/arch/arm/mach-omap1/time.c
    ===================================================================
    --- alp-linux.orig/arch/arm/mach-omap1/time.c
    +++ alp-linux/arch/arm/mach-omap1/time.c
    @@ -255,6 +255,9 @@ static void __init omap_init_clocksource
        setup_irq(INT_TIMER2, &omap_mpu_timer2_irq);
        omap_mpu_timer_start(1, ~0, 1);

    +   /* allow calls to sched_clock now */
    +   safe_to_call_sched_clock = 1;
    +
        if (clocksource_register(&clocksource_mpu))
            printk(err, clocksource_mpu.name);
     }
    Index: alp-linux/include/asm-arm/mach/time.h
    ===================================================================
    --- alp-linux.orig/include/asm-arm/mach/time.h
    +++ alp-linux/include/asm-arm/mach/time.h
    @@ -76,4 +76,6 @@ extern int (*set_rtc)(void);
     extern void save_time_delta(struct timespec *delta, struct timespec *rtc);
     extern void restore_time_delta(struct timespec *delta, struct timespec *rtc);

    +extern int safe_to_call_sched_clock;
    +
     #endif

## grabserial

"grabserial" is a simple program to grab and display data from a
specified serial port. It can place a timestamp on each line received,
which makes it useful for reporting timing of events seen on a booting
system's serial console output.

See [Grabserial](http://eLinux.org/Grabserial "Grabserial") for detailed information,
sample output and download instructions.

## Tim's quick and dirty process trace

Process trace is Tim's quick and dirty method of tracing early boot
processes. As I write this (Oct, 2008), an boot tracer is being written
and is available in the fastboot git tree on kernel.org. This will
likely be mainlined, and should supersede this work. However, this tool
has worked for me.

This is really quite simple. The "system" consists of a patch which adds
printks to fork, exec and exit, and a script which parses those printks
and prints information about the reported processes.

### Patch Download

Here is the patch: [Media:
tims\_process\_trace.patch](http://eLinux.org/images/a/a2/Tims_process_trace.patch "Tims process trace.patch")

This patch was written against Linux kernel version 2.6.27.

### Usage

To use this patch, apply it to your kernel, with something like:

    cd linux_src ; patch -p1 </path/to/patch/tims_process_trace.patch

You should also increase the size of your kernel log buffer (this is the
buffer where printk messages are stored in the kernel.) I recommend a
value of 18, which is 256K. This is CONFIG\_LOG\_BUF\_SHIFT, and is
found in the "General Setup" menu of the kernel configuration system.

Compile, build and install your kernel. Boot the kernel.

After booting, use dmesg to collect the messages. Note that you need to
specify the (increased) size of the message buffer with the '-s' option:

    dmesg -s 256000 >/tmp/bootlog.txt

Now, process the bootlog with the scripts/procgraph program.

    linux_src/scripts/proc_graph /tmp/bootlog.txt

This script is somewhat badly named. It does not generate a graph, but
just allows you to sort the processes by various attributes (start time,
duration, idle time, etc.) Actual graphing should be added "real soon
now".

## Deferred initcall

Using a short patch (available for kernel version 2.6.27) it is possible
to avoid running certain initcalls at bootup time. This can save time
during the critical, early portion of bootup. Later, deferred initcalls
can be run by triggering them from user space.

See [Deferred Initcalls](../../.././dev_portals/Boot_Time/Deferred_Initcalls/Deferred_Initcalls.md "Deferred Initcalls").


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Measuring](http://eLinux.org/Category:Measuring "Category:Measuring")

