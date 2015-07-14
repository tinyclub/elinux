> From: [eLinux.org](http://eLinux.org/Instrumentation_API "http://eLinux.org/Instrumentation_API")


# Instrumentation API



We seek to define an API to allow for simple measurement of timing data
inside the Linux kernel.



## Contents

-   [1 Requirements](#requirements)
-   [2 Proposed Specification](#proposed-specification)
    -   [2.1 Old proposed spec.](#old-proposed-spec)
    -   [2.2 Another old proposed spec.
        (deprecated)](#another-old-proposed-spec-deprecated)
    -   [2.3 New proposed spec.](#new-proposed-spec)
-   [3 APIs needed by current systems](#apis-needed-by-current-systems)
    -   [3.1 printk-times](#printk-times)
    -   [3.2 KFI](#kfi)
    -   [3.3 kernel tracing](#kernel-tracing)
    -   [3.4 Linux Trace Toolkit](#linux-trace-toolkit)
    -   [3.5 kgdb instrument functions](#kgdb-instrument-functions)
-   [4 Current APIs](#current-apis)
    -   [4.1 Current Linux (2-4)
        get\-cycles()](#current-linux-2-4-get-cycles)
    -   [4.2 Current Linux (2-6)
        sched\-clock()](#current-linux-2-6-sched-clock)
    -   [4.3 do\-gettimeofday()](#do-gettimeofday)
    -   [4.4 Fast Timestamp (proposal)](#fast-timestamp-proposal)
-   [5 Other information](#other-information)
    -   [5.1 System Tap timestamp notes](#system-tap-timestamp-notes)

## Requirements

(these notes are from the face-to-face meeting on Jan 10th)

    - The clock needs to support instrumentation lasting during the boot up period.  This
    may be up to 2 minutes.  For warm resets, the clock may not be reinitialized (is this true?)
    Therefore, even for bootup measurements, the clock may be running far into its cycle when
    the measurements are made.
      - Note that embedded processors have CPU clock ranging from a few MHZ to
      a few GHZ.  A 1 GHZ clock will overrun 32 bits in about 4 seconds.
      - result is that we should probably use a 64-bit clock value.
      - for supporting periods of several seconds, a clock driver will need
      to manage upper bits to handle hardware clock overrun or wrap.
    - There should be a config option to turn on or off support for the feature
    - The instrumentation clock must be available early
    (before calibrate_delay()). It should probably be initialized inside setup_arch()
      - Note that a free-running clock could be set up by firmware
      (before kernel start)
      - Note that often you can use same clock as system clock (used for
      jiffies)
    - 1 usec or greater resolution is desired.
    - 100 usec accuracy is desired for our current bootup time measurement work
    - the value returned should not fluctuate with changes in CPU frequency.
      - Alternative, the CPU frequency should not be modified during the
      timing period.  For the BTWG, the timing period is system bootup, so it
      should be easy to avoid changing CPU frequency during this period. (??)
    - the value returned should be monotonically increasing (except for rollover or
    some process specifically setting the clock)
    - the values returned need not be linearly related.  That is, it is acceptable
    for the values to be non-linear, as long as the conversion to time results (sec, nsec)
    is correct.  Thus, as one example of value management, it is possible to
    store the hardware clock value in the low 32 bits, and the number of rollovers
    in the high 32 bits.  This works even if the clock source itself is less than
    32 bits wide (eg 12 bits, or 16 bits).
    - the API should be available on all architectures of interest (eg. cpu cycle read
    is not available on ARM or SH)
    - it should add minimal overhead to the system.

## Proposed Specification

### Old proposed spec.

    - unsigned long long get_cycles(void) - which maps to get_arch_cycles()
    - unsigned long cycles_to_usec(unsigned long long) - which maps to arch_cycles_to_usec()

Problems:

    - usecs returned in a unsigned 32-bit overflows at about 4000 seconds.  This
    should be enough for a reasonable bootup time.

### Another old proposed spec. (deprecated)

    - see Timing APISpecification _R2

### New proposed spec.

    - use sched_clock(), and admonish board support authors to support it properly
    - also, document methods to provide scaling factor prior to time_init()
    to that measurements are available from very start of kernel execution.

## [APIs](../../../.././dev_portals/Boot_Time/Boot-up_Time_Reduction_Howto/IDE_Preempt/APIs/APIs.md "APIs") needed by current systems

### printk-times

    - static inline void highres_timer_read_ticks (u32 *slow, u32 *fast)
    - static inline void highres_timer_ticks_to_timeval(u32 slow, u32 fast, struct timeval *tv)

In the patch submitted to the forum, this was only supported on x86. The
highres\_timer\_ticks\_to\_timeval used a hardcoded value which had to
be set at compile time. highres\_timer\_read\_ticks used a read of the
Time Stamp Counter (TSC) of the central processor. Also,
highres\_timer\_ticks\_to\_timeval did not handle rollover from fast to
slow very well.

Current implementation for x86 (see [Printk
Times](../../../.././dev_portals/Boot_Time/Bootup_Time_Spec/Bootup_time/Printk_Times/Printk_Times.md "Printk Times")) uses hardcoded cpu\_fixed\_khz (in
the 2.4 version of the patch), which requires a code change for
different targets.

These techniques are not portable.

Problems:

    - separation of timer value into high and low 32-bit values
    doesn't seem necessary
    - it doesn't resemble other  clock read APIs in the kernel
    - it should use term "clock" instead of "timer"
    - uses hard-coded (compiled in) value for conversion function

### KFI

    - unsigned long kfi_readclock(void)
      (which maps to do_getmachinecycles() )
    - unsigned long kfi_clock_to_usecs(unsigned long clocks)
      (which maps to machinecycles_to_usecs() )

Problems:

    - has kfi in name
    - only supports 32-bit clock value

### kernel tracing

    - get_profiler_timestamp()
      - defined in /asm-<arch>/profiler.h

On alpha get\_profiler\_timestamp is:

     - #define get_profiler_timestamp()                     \
    +    ( {                                                \
    +       register u32 __res;                             \
    +       asm volatile ("rpcc %0" : "=r" (__res));        \
    +       __res;                                          \
    +    } )
    +
    +/* Always u32, even when CONFIG_TRACE_TRUNCTIME */
    +typedef u32 profiler_timestamp_t;


 On x86 get\_profiler\_timestamp is:

    #ifdef CONFIG_TRACE_TIMESTAMP
    +#define get_profiler_timestamp()                               \
    +    ( {                                                        \
    +           register u64 __res;                                 \
    +           if (test_bit(X86_FEATURE_TSC, boot_cpu_data.x86_capability)) { \
    +               __asm__ __volatile__(                           \
    +                       "rdtsc" : "=A"(__res)                   \
    +               );                                              \
    +           }                                                   \
    +           else {                                              \
    +               /* no rdtsc, use jiffies instead */             \
    +               __res = jiffies;                                \
    +           }                                                   \
    +           __res;                                              \
    +    } )
    +
    +#ifdef CONFIG_TRACE_TRUNCTIME
    +typedef u32 profiler_timestamp_t;
    +#else
    +typedef u64 profiler_timestamp_t;


 Problems:

    - only supported on ALPHA and x86


 See
[http://www.kernel.org/pub/linux/kernel/people/andrea/ikd/README](http://www.kernel.org/pub/linux/kernel/people/andrea/ikd/README)
for information and for patches.

### Linux Trace Toolkit

[don't know - need to find out]

### kgdb instrument functions

    - rdtsc(t1,t2)
    - extern unsigned long fast_gettimeoffset_quotient;

I'm not sure where fast\_gettimeoffset\_quotient comes from, but it is
used like this:

    ll = 1LL << 32;
    do_div(ll, fast_gettimeoffset_quotient);
    cycles = (unsigned int)ll;


 This is later used with the values returned from rdtsc, to convert it
to integer and fractional seconds.

Problems:

    - this only works on x86 (rdtsc)

## Current [APIs](../../../.././dev_portals/Boot_Time/Boot-up_Time_Reduction_Howto/IDE_Preempt/APIs/APIs.md "APIs")

### Current Linux (2.4) get\_cycles()

Linux version 2.4.20 has:

    - typedef unsigned long long cycles_t
    - cycles_t get_cycles(void) defined in include/asm/timex.h
      This returns 0 on x86 processors without a TSC, and 0 on some other processors
      - supported on x86, ppc, mips, alpha
      - not supported on arm, sh

There appears to be no supporting function to convert to usecs.

### Current Linux (2.6) sched\_clock()

Linux version 2.6.7 has:

    - sched_clock() - returns current time in nanosec units.
      - unsigned long long sched_clock(void)
      - this routine won't function correctly (it returns 0) until a valid scale
      factore is set (for x86 and ppc).  For x86, this means until the routine
      set_cyc2ns_scale() is called.  This is normally called from time_init().
      - on x86, it reads TSC.
      - on x86, found in arch/i386/kernel/timers/timer_tsc.c
    - set_cyc2ns_scale() (x86 only)
      - static inline void set_cyc2ns_scale(unsigned long cpu_mhz)
      - initializes the conversion factor for the clock scaling of sched clock.
      - this is also called?? for CPU frequency changes

    - for a large number of architectures, sched_clock is defined as:

    unsigned long long sched_clock(void)
    {
         return (unsigned long long)jiffies * (1000000000 / HZ);
    }

      - this only give jiffy accuracy (10 ms, when HZ=100)
        - this is completely unacceptable for microsecond timings

### do\_gettimeofday()

This is supported all platforms. Most (??) have sub-jiffy resolution
(usecs or better?).

- When is this available in boot cycle? - What is overhead of call?

I'm assuming the overhead of the call to do\_gettimeofday is what has
prompted the proposal for Fast Timestamps (see next section).

Todd Poynor writes:

    Re: gettimeofday(), the implementation can vary considerably between
    architectures.  Generally, I believe architectures read the count of
    jiffies and also a board-specific microsecond timer source, if any, to
    add the number of microseconds that have elapsed since the last timer
    interrupt bumped jiffies.  And a spinlock is expected to be held during
    this operation.  gettimeofday() is available everywhere, but not all
    boards necessarily implement microsecond accuracy -- I don't know
    statistics on this.  You would probably also need some hook to
    compensate for the place in the boot sequence in which the system time
    is seeded from the RTC or set via settimeofday, etc.  gettimeofday()
    isn't setup immediately at kernel startup, but not long afterwards, and
    it would probably be easy to force the init earlier.

    Directly using the microsecond-level accuracy time source for
    gettimeofday would be board-specific, so an API wrapper would still be
    needed.

Greg Ungerer writes:

    On many platforms (I would think most) it [gettimeofday] gives much better
    than jiffy resolution.

    Looking around the underlying architecture and platform code
    in 2.6 it looks like most have code to deal with determining
    the time reasonably accurately in do_gettimeofday(). Even on
    the small/slower embedded processors I deal with this is easy
    to do, and mostly gives resoutions in the usec's range.

    The support do this on an architectural and platform basis
    is flexible enough and easy to implement I would argue there
    is more value in implementing a better do_gettimeofday()
    [if it is only jiffie resolution on your platform of interest]
    than to have a separate API. A good gettimeofday helps all
    system timing calculations.



### Fast Timestamp (proposal)

This was a proposal for a mechanism that could quickly record a timer
value that could be translated into timeofday (timeval) at some later
time. The purpose of this would be to separate the operations of
acquiring the timing data, and converting the units into a recognizable
form. I didn't understand the full context, but I gather that this was
decoupled to allow for very quick time recording, with later subsequent
interpretation, possible to preserve performance inside the network
stacks.

1) Some kind of fast\_timestamp\_t, the property is that this stores

      enough information at time "T" such that at time "T + something"
      the fast_timestamp_t can be converted what the timeval was back at
      time "T".

      For networking, make skb->stamp into this type.

2) store\_fast\_timestamp(fast\_timestamp\_t \*)

      For networking, change do_gettimeofday(&skb->stamp) into
      store_fast_timestamp(&skb->stamp)

3) fast\_timestamp\_to\_timeval(arch\_timestamp\_t \*, struct timeval
\*)

      For networking, change things that read the skb->stamp value
      into calls to fast_timestamp_to_timeval().

It is defined that the timeval given by fast\_timestamp\_to\_timeval()
needs to be the same thing that do\_gettimeofday() would have recorded
at the time store\_fast\_timestamp() was called.

See [http://lwn.net/Articles/61269/](http://lwn.net/Articles/61269/)

what was final status of this? David Miller was going to push this
proposal to arch maintainers for sanity checking. I don't know what
happened.

## Other information

### System Tap timestamp notes

See [System Tap Timestamp
Notes](../../../.././dev_portals/Boot_Time/Bootup_Time_Working_Group/Instrumentation_API/System_Tap_Timestamp_Notes/System_Tap_Timestamp_Notes.md "System Tap Timestamp Notes")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

