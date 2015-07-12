> From: [eLinux.org](http://eLinux.org/Timing_APISpecification "http://eLinux.org/Timing_APISpecification")


# Timing APISpecification



## Contents

-   [1 Introduction](#introduction)
-   [2 Rationale](#rationale)
-   [3 Specifications](#specifications)
-   [4 Notes (informational and
    non-normative)](#notes-informational-and-non-normative)
-   [5 References](#references)
-   [6 Remaining Issues](#remaining-issues)

## Introduction

This specification is for a timing API for the Linux kernel which is
available early during the bootup process.

## Rationale

The purpose of this specification is to provide a platform-neutral API
for timing instrumentation of the Linux kernel. Currently, there are a
few different timing [APIs](http://eLinux.org/APIs "APIs") in the kernel used for such
instrumentation. For example, on the i386 architecture the Time Stamp
Counter (TSC) register of the processor is used for getting fast
timestamps for low overhead and high resolution time measurements. (This
has historically been made available with the get\_cycles() function
call.) Many timing measurement systems for the Linux kernel have been
based on either get\_cycles() or directly on a call to read the TSC
register, such as rdtscll().

There are a few problems with this setup. First, these functions are not
supported on all architectures and platforms of interest. Thus,
measurement systems that utilize them are not portable to these other
platforms. Also, other functions which ARE available on all platforms
are either high overhead, or are not usable from the very beginning of
kernel bootup, or both.

This specification, then, is intended to address the need for a common
API available on all embedded platforms, for a low-overhead, high
resolution clock source accessible very early (even before
setup\_arch()) in the boot sequence of the kernel.

## Specifications

1.  The Linux kernel SHALL support a configuration to provide the
    following described timing API.
    1.  The configuration option to enable this feature MUST be called
        CONFIG\_FAST\_TIMESTAMPS

2.  When CONFIG\_FAST\_TIMESTAMPS is enabled, the kernel SHALL provide
    the following 2 routines:
    1.  void store\_timestamp(timestamp\_t \*t)
    2.  void timestamp\_to\_timeval(timestamp\_t \*t, struct timeval
        \*tv)

3.  The store\_timestamp() API MUST be available and useful no later
    than upon the completion of the setup\_arch() routine in the kernel.
    1.  The store\_timestamp() API SHOULD be available and useful as
        soon as possible after start\_kernel()

4.  The size and resolution of timestamp\_t \*t SHOULD be such that
    timestamps can record at least 30 seconds of timing information.
    1.  The size of timestamp\_t SHOULD be no greater than 64 bits.

5.  store\_timestamp() MUST produce values for timestamp that are
    monotonically increasing with each call *on the same processor*
    (with the exception of overruns or explicit clock value changes).
6.  The resolution of timestamp, after conversion to timeval, MUST NOT
    be less than 1 jiffy.
    1.  The resolution of timestamp, after conversion to timeval, SHOULD
        be at least 100 usec
    2.  A resolution of at least 1 usec for values of timestamp is
        preferred.

## Notes (informational and non-normative)

-   The clock needs to be accessible at least during the boot up period
    of the kernel.
-   A free-running clock could be set up by firmware (before kernel
    start) and polled afterwards by the kernel in order to measure total
    system bootup time. Note that this implies that the timestamp value
    does not need to start at 0 with the beginning of execution of the
    kernel or the setup of the timer device.
-   It is preferred that the timestamp value returned should not
    fluctuate with changes in CPU frequency, but this is not mandatory.
-   Alternative, it should be possible to avoid changes in the CPU
    frequency during the timing period.
-   The values returned need not be linearly related. That is, it is
    acceptable for the values to be non-linear, as long as the
    conversion to timeval (sec, nsec) is correct. Thus, as one example
    of value management, it is possible to store the hardware clock
    value in the low 32 bits, and the number of rollovers in the high 32
    bits. This works even if the clock source itself is less than 32
    bits wide (eg 12 bits, or 16 bits).
-   It is not necessary for there to be an accurate correlation of
    timevals produced by timestamp\_to\_timeval() to wall clock times.
    That is, there is no requirement to implement a strict gettimeofday
    call.
-   the purpose of separating the "store" function from the
    "to\_timeval" function, is to make the overhead of actually
    acquiring the timestamp as little as possible. Some callers may
    immediately convert the timestamp to a timeval, but other
    time-sensitive code may defer the conversion to timeval units until
    some later time (or indefinitely).
-   The size of timestamp\_t should be as small as possible. It is
    expected that timestamp values will be stored in trace logs which
    may accumulate data points quickly. It is expected that on many
    embedded architectures, timestamp\_t will be defined as an unsigned
    long (32 bits), and that it will NOT be defined to be any greater in
    size than an unsigned long long (64 bits).
-   Embedded processors have CPU clock frequencies ranging from a few
    MHZ to a few GHZ. A 1 GHZ clock will overrun 32 bits in about 4
    seconds. This means that for fast-running hardware timestamp\_t
    should probably be an unsigned long long.

## References

There is general information about the requirements, other timing
mechanisms, and proposals at
[InstrumentationAPI](http://tree.celinuxforum.org/pubwiki/moin.cgi/InstrumentationAPI)

## Remaining Issues

-   It would be good to try this out somewhere


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Community](http://eLinux.org/Category:Community "Category:Community")

