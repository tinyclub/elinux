> From: [eLinux.org](http://eLinux.org/System_Tap_Timestamp_Notes "http://eLinux.org/System_Tap_Timestamp_Notes")


# System Tap Timestamp Notes



This information was copied from the System Tap file
tapsets/timestamp/timeset\_tapset.txt, in May, 2006.



    * Application name: sequence numbers and timestamps

    * Contact:
        Martin Hunt         hunt@redhat.com
        Will Cohen          wcohen@redhat.com
        Charles Spirakis    charles.spirakis@intel.com

    * Motivation:
        On multi-processor systems, it is important to have a way
        to correlate information gathered between cpu's. There are two
        forms of correlation:

            a) putting information into the correct sequence order
            b) providing accurate time deltas between information

        If the resolution of the time deltas is high enough, it can
        also be used to order information.

    * Background:
        Discussion started due to relayfs and per-cpu buffers, but this
        is neede by many people.

    * Target software:
        Any software which wants to correlate data that was gathered
        on a multi-processor system, but the scope will be defined
        specifically for systemtap's needs.

    * Type of description:
        General information and discussion regarding sequencing and timing.

    * Interesting probe points:
        Any probe points where you are trying to get the time between two
        probe points. For example, timing how long a function takes and
        putting probe points at the function entry and function exit.

    * Interesting values:
        Possible ways to order data from multiple sources include:

    Retrieve the sequence/time from a global area

      High Precision Event Timer (HPET)
        Possible implementation:
        multimedia/HPET timer
        arch/i386/kernel/timer_hpet.c
        Advantages:
        granularity can vary (HPET spec says minimum freq of HPET timer
        is 10Mhz =~100ns resolution), can be treated as read-only,
        can bypass cache update and avoid being caced at all if desired,
        desigend to be used as an smp timestamp (see specification)
        Disadvantages:
        may not be available on all platforms, may not be synchronized on
        NUMA systems (ie counts for all processors within a numa node is
        comparable, but counts for processors between nodes may not be
        comparable), potential resource conflict if timers used by
        other software

      Real Time Clock (RTC)
        Possible implementation:
        "external" chip (clock chip) which has time information, accessed via
        ioport or memory-mapped io
        Advantages:
        can be treated as read-only, can bypass cache update and avoid being
        cached at all if desired
        Disadvantages:
        may not be available on all platforms, low granularity (for rtc,
        ~1ms), usually slow access

      ACPI Power Management Timer (pm timer)
        Possible implementation:
        implemented as part of the ACPI specification at 3.579545Mhz
        arch/i386/kernel/timers/timer_pm.c
        Advantages:
        not affected by throttling, halting or power saving states, moderate
        granularity (3.5Mhz ~ 300ns resolution), desigend for use by an OS
        to keep track of time during sleep/power states
        Disadvantages:
        may not be available on all platforms, slower access than hpet timer
        (but still much faster than RTC)

      Chipset counter
        Possible implementation:
        timer on a processor chipset, ??SGI implementation??, do we know of any
        other implementations ?
        Advantages:
        likely to be based on pci bus clock (33Mhz = ~30ns) or front-side-bus
        clock (200Mhz = ~5ns)
        Disadvantages:
        may not be available on all platforms

      Sequence Number
        Possible implementation:
        atomic_t global variable, cache aligned, placed in struct to keep
        variable on a cache line by itself
        Advantages:
        guaranteed correct ordering (even on NUMA systems), architecure
        independent, platform independent
        Disadvantages:
        potential for cache-line ping-pong, doesn't scale, no time
        information (ordering data only), access can be slower on NUMA systems

      Jiffies
        Possible implementation:
        OS counts the number of "clock interrupts" since power on.
        Advantages:
        platform independent, architecture independent, one writer, many
        readers (less cache ping-pong)
        cached at all if desired
        Disadvantages:
        low resolution (usually 10ms, sometimes 1ms).

      Do_gettimeofday
        Possible implementation:
        arch/i386/kernel/time.c
        Advantages:
        platform independent, architecture independent, 1 writer, many
        readers (less cache ping-pong), accuracy of micro-seconds
        Disadvantages:
        the time unit increment value used by this routine changes
        based on information from ntp (i.e if ntp needs to speed up / slow
        down the clock, then callers to this routine will be affected). This
        is a disadvantage for timing short intervals, but an advantage
        for timing long intervals.


    Retrieve the sequence/time from a cpu-unique area

      Timestamp counter (TSC)
        Possible implementation:
        count of the number of core cycles the processor has executed since
        power on, due to lack of synchronization between cpus, would also
        need to keep track of which cpu the tsc came from
        Advantages:
        no external bus access, high granularity (cpu core cycles),
        available on most (not all) architectures, platform independent
        Disadvantages:
        not synchronized between cpus, since it is a count of cpu cycles
        count can be affected by throttling, halting and power saving states,
        may not correlate to "actual" time (ie, just because a 1G processor
        showed a delta of 1G cycles, doesn't mean 1 second has passed)

      APIC timer
        Possible implementation:
        timer implemented within the processor
        Advantages:
        no external bus access, moderate to high granularity (usually
        counting based front-side bus clock or core clock)
        Disadvantages:
        not synchronized between cpus, may be affected by throttling,
        halting/power saving states, may not correlate to "actual" time.

      PMU event
        Possible implementation:
        program a perfmonance counter with a specific event related to time
        Advantages:
        no external bus access, moderate to high granularity (usually
        counting based front-side bus clock or core clock), can be
        virtualized to give moderate to high granularity for individual
        thread paths
        Disadvantages:
        not synchronized between cpus, may be affected by throttling,
        halting/power saving states, may not correlate to "actual" time,
        processor dependent


        For reference, as a quick baseline, on Martin's dual-processor system,
        he gets the following performance measurements:

        kprobe overhead:             1200-1500ns (depending on OS and processor)
        atomic read plus increment:    40ns (single processor access, no conflict)
        monotonic_clock()             550ns
        do_gettimeofday()             590ns

    * Dependencies:
        Not Applicable

    * Restrictions:
        Certain timers may already be in use by other parts of the kernel
        depending on how it is configured (for example, RTC is used by the
        watchdog code). Some kernels may not compile in the necessary code
        (for example, if using the pm timer, need ACPI). Some platforms
        or architectures may not have the timer requested (for example,
        there is no HPET timer on older systesm).

    * Data collection:
       For data collection, it is probably best to keep the concept
       between sequence ordering and timestamp separate within
       systemtap (for both the user as well as the implementation).

       For sequence ording, the initial implementation should use ?? the
       atomic_t form for the sequence ordering (since it is guaranteed
       to be platform and architecture neutral)?? and modify/change the
       implementation later if there is a problem.

       For timestamp, the initial implementation should use
       ?? hpet timer ?? pm timer ?? do_gettimeofday ?? cpu # + tsc ??
       some combination (do_gettimeofday + cpu # & low bits of tsc)?

       We could do something like what LTT does (see below) to
       generate 64-bit timestamps containing the nanoseconds
       since Jan 1, 1970.

       Assuming the implementation keeps these concepts separate now
       (ordering data vs. timing deltas), it is always possible to
       merge them in the future if a high granularity, numa/smp
       synchronized timesource becomes available for a large number
       of platforms and/or processors.

    * Data presentation:
       In general, users prefer output which is based on "actual" time (ie,
       they prefer an output that says the delta is XXX nanoseconds instead
       of YYY cpu cycles). Most of the time users want delta's (how long did
       this take), but occasionally they want absolute times (when / what time
       was this information collected)

    * Competition:
        DTRACE has output in nanoseconds (and it is comparable between
        processors on an mp system), but it is unclear what the actual
        resolution is.  Even if the sparc machine does have hardware
        that provides nanosecond resolution, on x86-64 they are likely
        to have the same problems as discussed here since the solaris
        opteron box tends to be a pretty vanilla box.

        From Joshua Stone (joshua.i.stone at intel.com):

        == BEGIN ===
        DTrace gives you three built-in variables:

        uint64_t timestamp: The current value of a nanosecond timestamp
        counter. This counter increments from an arbitrary point in the
        past and should only be used for relative computations.

        uint64_t vtimestamp: The current value of a nanosecond timestamp
        counter that is virtualized to the amount of time that the current
        thread has been running on a CPU, minus the time spent in DTrace
        predicates and actions. This counter increments from an arbitrary
        point in the past and should only be used for relative time computations.

        uint64_t walltimestamp: The current number of nanoseconds since
        00:00 Universal Coordinated Time, January 1, 1970.

        As for how they are implemented, the only detail I found is that
        timestamp is "similar to the Solaris library routine gethrtime".
        The manpage for gethrtime is here:
        http://docs.sun.com/app/docs/doc/816-5168/6mbb3hr8u?a=view
        == END ==

        What LTT does:

        "Cycle counters are fast to read but may reflect time
        inaccurately.  Indeed, the exact clock frequency varies
        with time as the processor temperature changes, influenced
        by the external temperature and its workload. Moreover, in
        SMP systems, the clock of individual processors may vary
        independently.

        LTT corrects the clock inaccuracy by reading the real time
        clock value and the 64 bits cycle counter periodically, at
        the beginning of each block, and at each 10ms. This way, it
        is sufficient to read only the lower 32 bits of the cycle
        counter at each event. The associated real time value may
        then be obtained by linear interpolation between the nearest
        full cycle counter and real time values. Therefore, for the
        average cost of reading and storing the lower 32 bits of the
        cycle counter at each event, the real time with full resolution
        is obtained at analysis time."


    * Cross-references:
        The profile_tapset is very dependent on sequencing and time when
        ordering of data (i.e. taking a trace history) as well as high
        granularity (when calculating time deltas).

    * Associated files:

        Profile tapset requirements
        .../src/tapsets/profile/profile_tapset.txt

        Intel high precision event timers specification:
        http://www.intel.com/hardwaredesign/hpetspec.htm

        ACPI specification:
        http://www.acpi.info/DOWNLOADS/ACPIspec-2-0b.pdf

        From an internal email sent by Tony Luck (tony.luck at intel.com)
        regarding a clustered environment. For the summary below, hpet and
        pm timer were not an option. For systemtap, they should be considered,
        especially since pm timer and hpet were designed to be a timestamp.

        == BEGIN ===
        For extremely short intervals (<100ns) get some h/w help (oscilloscope
        or logic analyser).  Delays reading TSC and pipeline effects could skew
        your results horribly.  Having a 2GHz clock doesn't mean that you can
        measure 500ps intervals.

        For short intervals (100ns to 10 ms) TSC is your best choice ... but you
        need to sample it on the same cpu, and converting the difference between
        two TSC values to real time will require some system dependent math to find
        the nominal frequency of the system (you may be able to ignore temperature
        effects, unless your system is in an extremely hostile environment).  But
        beware of systems that change the TSC rate when making frequency
        adjustments for power saving.  It shouldn't be hard to measure the
        system clock frequency to about five significant digits of accuracy,
        /proc/cpuinfo is probably good enough.

        For medium intervals (10 ms to a minute) then "gettimeofday()" or
        "clock_gettime()" on a system *NOT* running NTP may be best, but you will
        need to adjust for systematic error to account for the system clock running
        fast/slow.  Many Linux systems ship with a utility named "clockdiff" that
        you can use to measure the system drift against a reference system
        (a system that is nearby on the network, running NTP, prefereably a
        low "stratum" one).

        Just run clockdiff every five minutes for an hour or two, and plot the
        results to see what systematic drift your system has without NTP. N.B. if
        you find the drift is > 10 seconds per day, then NTP may have
        trouble keeping this system synced using only drift corrections,
        you might see "steps" when running NTP.  Check /var/log/messages for
        complaints from NTP.

        For long intervals (above a minute). Then you need "gettimeofday()" on a
        system that uses NTP to keep it in touch with reality.  Assuming reasonable
        network connectivity, NTP will maintain the time within a small number of
        milliseconds of reality ... so your results should be good for
        4-5 significant figures for 1 minute intervals, and better for longer
        intervals.
        == END ==


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

