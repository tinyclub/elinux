> From: [eLinux.org](http://eLinux.org/Realtime_Testing_Best_Practices "http://eLinux.org/Realtime_Testing_Best_Practices")


# Realtime Testing Best Practices



## Contents

-   [1 Introduction](#introduction)
    -   [1.1 Terminology](#terminology)
-   [2 Test programs](#test-programs)
    -   [2.1 RT Measurement programs](#rt-measurement-programs)
        -   [2.1.1 lpptest](#lpptest)
        -   [2.1.2 RealFeel](#realfeel)
        -   [2.1.3 RealFeel (ETRI version
            rf-etri)](#realfeel-etri-version-rf-etri)
        -   [2.1.4 Cyclictest](#cyclictest)
        -   [2.1.5 LRTB](#lrtb)
        -   [2.1.6 Hourglass](#hourglass)
        -   [2.1.7 Woerner test](#woerner-test)
        -   [2.1.8 Senoner test](#senoner-test)
    -   [2.2 Test Features Table](#test-features-table)
        -   [2.2.1 Benchmarking programs](#benchmarking-programs)
    -   [2.3 Stress programs](#stress-programs)
        -   [2.3.1 Stress actions](#stress-actions)
-   [3 Test Hardware](#test-hardware)
-   [4 Issues and Techniques](#issues-and-techniques)
    -   [4.1 ping flood isn't good as stress
        test](#ping-flood-isn-t-good-as-stress-test)
    -   [4.2 Using the LATENCY\-TRACE
        option](#using-the-latency-trace-option)
    -   [4.3 Number of samples
        recommended](#number-of-samples-recommended)
    -   [4.4 Things to watch for in
        testing](#things-to-watch-for-in-testing)
-   [5 Tests results taxonomy](#tests-results-taxonomy)
    -   [5.1 Test Table](#test-table)
-   [6 Test presentations and
    documents](#test-presentations-and-documents)
    -   [6.1 Presentations](#presentations)
    -   [6.2 OLS papers](#ols-papers)
    -   [6.3 Real Time Linux Foundation RTL
        Workshops](#real-time-linux-foundation-rtl-workshops)
-   [7 Uncategorized stuff](#uncategorized-stuff)
    -   [7.1 Notes on ineffective tests](#notes-on-ineffective-tests)
    -   [7.2 Notes on test requirements - need to test kernel error
        paths](#notes-on-test-requirements-need-to-test-kernel-error-paths)
    -   [7.3 Notes on test requirements - need for usage
        profile](#notes-on-test-requirements-need-for-usage-profile)

## Introduction

This page is intended to serve as a collecting point for presentations,
documents, results, links and descriptions about testing Realtime
performance of Linux systems. In the first section, please upload or
place links to presentations or documentsion on the subject of RT
testing for linux.

### Terminology

This document uses the definitions for real time terminology found in:
[Real Time Terms](http://eLinux.org/Real_Time_Terms "Real Time Terms")

## Test programs

### RT Measurement programs

Here is a list of programs that have been used for realtime testing:

#### lpptest

-   lpptest - included in the RT-preempt patch
    -   It consists of a
        1. driver in the linux kernel, to toggle a bit on the parallel
        port, and watch for a response toggle back
        2. a user program to cause the measurement to happen
        3. a driver to respond to this toggling
-   with the RT-preempt patch applied, see:
    -   drivers/char/lpptest.c
    -   scripts/testlpp.c
-   For some other modifications, see
    [http://www.ussg.iu.edu/hypermail/linux/kernel/0702.2/0342.html](http://www.ussg.iu.edu/hypermail/linux/kernel/0702.2/0342.html)
    -   remove dependency on TSC

This requires a separate machine to send the signal on the parallel port
and receive the response. (Can this be run with a loopback cable? It
seems like this would disturb the findings).

Are there any writeups of use of this test?

#### RealFeel

-   RealFeel -
    -   code at:
        [http://brain.mcmaster.ca/\~hahn/realfeel.c](http://brain.mcmaster.ca/~hahn/realfeel.c)

This program is a very simple test of how well a periodic interrupt is
processed. The program programs a periodic interrupt using /dev/rtc to
fire at a fixed interval. The program measures the time duration from
interrupt to interrupt, and compares this to the expected value for the
duration. This simple program just prints a list of variances from the
expected value, forever.

This program uses the TSC in user space for timestamps.

#### RealFeel (ETRI version rf-etri)

This program (latency.c) extends realfeel in several ways:

-   it adds command line arguments to allow runtime control of most
    parameters
-   it adds a histogram feature to dump the results to a histogram
    -   it can do both linear and logarithmic histograms
-   it locks the process pages in memory (very important)
-   it changes the scheduling priority to SCHED\_FIFO, at highest
    priority (very important)
-   it adds conditional code to trigger output to a parallel port pin
    (for capture to an external probe or logic analyzer)
-   it abstracts the routine to get the timestamp, with the function:
    getticks()
-   it handles the interrupt signal and does a clean exit of the main
    loop (on user break?)
-   it tracks min, max and average latency for whole run, and for every
    1000 cycles of the loop
-   it adds a timestamp to the /dev/rtc driver, and reads this as part
    of the rtc data
    -   how is rtc timestamp used??

#### Cyclictest

-   Cyclictest - See
    [http://rt.wiki.kernel.org/index.php/Cyclictest](http://rt.wiki.kernel.org/index.php/Cyclictest)

#### LRTB

-   Linux Real-Time Benchmarking Framework - See
    [http://www.opersys.com/lrtbf/](http://www.opersys.com/lrtbf/)
    -   quickie overview at:
        [http://groups.google.com/group/linux.kernel/msg/11860ef9e4263fa3?hl=en&](http://groups.google.com/group/linux.kernel/msg/11860ef9e4263fa3?hl=en&)

#### Hourglass

-   Hourglass is a synthetic real-time application that can be used to
    learn how CPU scheduling in a general-purpose operating system works
    at microsecond and millisecond granularities
    -   See:
        [http://www.cs.utah.edu/\~regehr/hourglass/](http://www.cs.utah.edu/~regehr/hourglass/)

#### Woerner test

Trevor Woerner wrote an interesting test which received an interrupt on
the serial port, and pushed data through several processes, before
sending back out the serial port. This test requires an external machine
for triggering the test and measuring the results.

See [Trevor Woerner's latency
tests](http://geek.vtnet.ca/embedded/LatencyTests/html/index.html)

#### Senoner test

Benno Senoner has a latency test that simulates and audio workload. See
[http://www.gardena.net/benno/linux/audio/](http://www.gardena.net/benno/linux/audio/)

Used (and extended??) by Takahashi Iwai - see
[http://www.alsa-project.org/\~iwai/latencytest-0.5.6.tar.gz](http://www.alsa-project.org/~iwai/latencytest-0.5.6.tar.gz)

### Test Features Table

<table>
<thead>
<tr class="header">
<th align="left">Feature</th>
<th align="left">Rf-etri</th>
<th align="left">Williams</th>
<th align="left">LRTB</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Is it platform specific (for target)?</td>
<td align="left">yes - i386</td>
<td align="left">no, but requires serial port on target</td>
<td align="left">no, but requires parallel port on target</td>
</tr>
<tr class="even">
<td align="left">How is interrupt generated?</td>
<td align="left">periodic timer programmed via /dev/rtc</td>
<td align="left">data on serial port</td>
<td align="left">data on parallel port</td>
</tr>
<tr class="odd">
<td align="left">What does test measure?</td>
<td align="left">interrupt and scheduling latency</td>
<td align="left">end-to-end response latency</td>
<td align="left">end-to-end response latency</td>
</tr>
</tbody>
</table>

#### Benchmarking programs

-   see [Benchmark Programs](http://eLinux.org/Benchmark_Programs "Benchmark Programs")
-   some to look into:
    -   hackbench
    -   lmbench
    -   unixbench

### Stress programs

-   Ingo Molnar has a shell script which he calls
    [dohell](http://groups.google.com/group/linux.kernel/msg/0c88c397347cbd2a?hl=en&)
    -   good candidates seem to be:
        -   find
        -   du
        -   ping
-   [Cache Calibrator](http://monetdb.cwi.nl/Calibrator/) - see
    [RT-Preempt
    howto](http://rt.wiki.kernel.org/index.php/RT_PREEMPT_HOWTO)

#### Stress actions

Here are some things that will kill your RT performance:

-   write the time of day to the CMOS of your RTC (see
    drivers/char/rtc.c - only by code inspection, no test yet)
-   have a bus-master device do a long DMA on the bus
-   get a page fault on your RT process (can be prevented with mlockall)
-   get multiple TLB flushes on your RT code path (how to cause this??)
-   get lots of instruction and data cache misses on your RT code path
    -   how to cause this?
        -   go down error paths in the RT case?
        -   be ON a big error case when the RT event happens?
        -   push your main RT code path and data sets out of cache with
            other work (in your RT process), prior to the next RT event?
        -   access data in a very non-localized way on your RT code path

## Test Hardware

-   LRTB uses a 3-machine system:
    -   target, host, and logger
    -   target is the system under test
    -   host is a control system, and it also collects the data
    -   logger is a special machine used to cause interrupts on the
        target, and record the time it takes for the target to respond
    -   Paulo Marqes
        [offered](http://marc.info/?l=linux-kernel&m=111953832212835&w=2)
        to create custom hardware for the logger

## Issues and Techniques

This is a list of issues and techniques for dealing with them, having to
do with testing realtime performance in Linux.

### ping flood isn't good as stress test

At one of the sessions at ELC 2007, Nicholas McGuire stated that a
pingflood test is actually a poor test of RT performance, since it
causes locality in the networking code rather than stressing the system.

Here is a list of issues that have to be dealt with:

-   what tests are available on all platforms?
    -   is special clock hardware or registers required for a test (e.g.
        realfeel, which only supports i386?)
    -   does the program cross-compile?
    -   Does generation of the test conditions perturb the test results?
    -   Is special external hardware required?
    -   How is the system stressed?
        -   How to stress memory (cause cache-flushes and swapping)
        -   How to stress bad code paths (long error paths, fault
            injection?)
-   How is performance measured?

### Using the LATENCY\_TRACE option

Quote about latency-test from Ingo:

    I'm seeing roughly half of that worst-case IRQ latency on similar
    hardware (2GHz Athlon64), so i believe your system has some hardware
    latency that masks the capabilities of the underlying RTOS. It would be
    interesting to see IRQSOFF_TIMING + LATENCY_TRACE critical path
    information from the -RT tree. Just enable those two options in the
    .config (on the host side), and do:

            echo 0 > /proc/sys/kernel/preempt_max_latency

    and the kernel will begin measuring and tracing worst-case latency
    paths. Then put some load on the host when you see a 50+ usec latency
    reported to the syslog, send me the /proc/latency_trace. It should be a
    matter of a few minutes to capture this information.

### Number of samples recommended

Ingo wrote:

    also, i'm wondering why you tested with only 1,000,000 samples. I
    routinely do 100,000,000 sample tests, and i did one overnight test with
    more than 1 billion samples, and the latency difference is quite
    significant between say 1,000,000 samples and 100,000,000 samples. All
    you need to do is to increase the rate of interrupts generated by the
    logger - e.g. my testbox can handle 80,000 irqs/sec with only 15% CPU
    overhead.

### Things to watch for in testing

Another note from Ingo - see
[here](http://groups.google.com/group/linux.kernel/msg/8c7e61d0926dba80?hl=en&)

-   Note the bit about IRQ 7 - what's up with that?

<!-- -->

    > First things first, we want to report back that our setup is validated
    > before we go onto this one. So we've modified LRTBF to do the
    > busy-wait thing.

    here's another bug in the way you are testing PREEMPT_RT irq latencies.
    Right now you are doing this in lrtbf-0.1a/drivers/par-test.c:

        if (request_irq ( PAR_TEST_IRQ,
                                              &par_test_irq_handler,
    #if CONFIG_PREEMPT_RT
                                               SA_NODELAY,
    #else //!CONFIG_PREEMPT_RT
                                               SA_INTERRUPT,
    #endif //PREEMPT_RT

    you should set the SA_INTERRUPT flag in the PREEMPT_RT case too! I.e.
    the relevant line above should be:

                                               SA_NODELAY | SA_INTERRUPT,

    otherwise par_test_irq_handler will run with interrupts enabled, opening
    the window for other interrupts to be injected and increasing the
    worst-case latency! Take a look at drivers/char/lpptest.c how to do this
    properly. Also, double-check that there is no IRQ 7 thread running on
    the PREEMPT_RT kernel, to make sure you are measuring irq latencies.

## Tests results taxonomy

### Test Table

<table border="1" cellspacing="0" cellpadding="5">

<tr bgcolor="#80d0d0">
<th>Person           </th>
<th>Company</th>
<th>Hardware                 </th>
<th>Kernel           </th>
<th>test method   </th>
<th>Measurement method</th>
<th>Results
</th></tr>
<tr>
<td>Sangbae Lee      </td>
<td>Samsung</td>
<td>OSK - OMAP (ARM) 192 MHZ)</td>
<td>2.4.20 and 2.6.10</td>
<td>using two machine test</td>
<td>ZI instrumentation - measure interrupt reponse latency</td>
<td>2.4.20 - 30~35us, 2.6.10 - 30~35us max </td>
<td>
</td></tr>
<tr>
<td>Sangbae Lee      </td>
<td>Samsung</td>
<td>MIPS 264 MHZ             </td>
<td>2.6.10&#160;??        </td>
<td>??            </td>
<td>??                </td>
<td>??</td>
<td>
</td></tr>
<tr>
<td>Katsuya Matsubara</td>
<td>IGEL   </td>
<td>SH4                      </td>
<td>2.6.??           </td>
<td>??            </td>
<td>??                </td>
<td>??</td>
<td>
</td></tr>
<tr>
<td>YungJoon Jung    </td>
<td>ETRI   </td>
<td>Via Nehemiah (i386)      </td>
<td>2.6.12           </td>
<td>periodic interrupt</td>
<td>rf-etri - measure scheduling latency minus interrupt latency </td>
<td>30 us max scheduling latency with RT-preempt</td>
<td>
</td></tr>
<tr>
<td>Tsutomu Owa      </td>
<td>Toshiba</td>
<td>Cell (ppc64)             </td>
<td>2.6.12           </td>
<td>??            </td>
<td>?? </td>
<td>??</td>
<td>
</td></tr></table>

## Test presentations and documents

### Presentations

[Add links here, most recent at top]

-   [TBD Linux Kernel's performance comparison] by HyoJun Im of LG at
    RTWG 2nd Face-to-Face Meeting in Korea
    -   Tested Linux Kernel's performance by using opensource benchmarks
    -   Test Target : Intel Pentium 4 2GHz, 1GB Memory
        -   compared among linux kernel 2.4.22, 2.6.18 with preemption
            patch, 2.6.23-rc
        -   used opensource benchmark test programs
            -   Realfeel : measure interrupt latency time
                -   2.6(preemption) - 3.3ms, 2.6(rc3) - 3.5ms, 2.4 -
                    258.9ms
            -   Hackbench Test : measure the scalability of scheduler
                -   TBD
            -   InterBench Test : measure the latency time of
                interactive task under load
                -   He has good result table to see
            -   LMbench Test : measure context switching latency time
                -   TBD

-   [Analysis of Interrupt Entry Latency in Linux 2.4 vs
    2.6](http://tree.celinuxforum.org/CelfPubWiki/ELC2007Presentations?action=AttachFile&do=get&target=CELF_ELC_Interrupt_Latency_2.4_vs_2.6.pdf)
    by !SangBae Lee of Samsung for ELC 2007
    -   Analyzed MV 3.1 (2.4.20) and MV 4.0 (2.6.10), using LTT, on OSK
        board (OMAP 5920 ARM 192 MHZ)
        -   This is not a realtime-preempt patch applied test. Only
            tested between 2.4.20 and 2.6.10 kernel
    -   Initial results were that linux.2.4.20 was 3X fast for best-case
        interrupt latency by using LTT
        -   This test's problem was to use LTT, LTT had really high
            overhead for this test's comparing
    -   After reviewing code and finding that the interrupt code path
        was almost identical, a different, more lightweight tracer was
        used (Zoom-in tracer) showing latencies were almost the same
        between 2.4 kernel and 2.6 kernel
        -   This ZI instrumentation has low overhead, so it is suitable
            for interrupt reponse time measurement. It was written by
            SangBae Lee
    -   Also measured on MIPS 264 MHZ (for real TV system), but
        following data was measured on OSK board
        -   Interrupt response time measured:
            -   with LTT instrumentation:
                -   2.6.10 - min = 30 us, max = 400 us
                -   2.4.20 - min = 10 us, max = 30 us
            -   with ZI instrumentation:
                -   2.6.10 - min = 3 us, max = 30\~35 us
                -   2.4.20 - min = 3 us, max = 30\~35 us
        -   Basic result = Don't use LTT for measuring RT performance
-   [Porting and Evaluating the Linux Realtime Preemption on Embedded
    Platform](http://tree.celinuxforum.org/CelfPubWiki/ELC2007Presentations?action=AttachFile&do=get&target=preempt070418celfelc.pdf)
    by Katsuya Matsubara of Igel at ELC 2007
-   [Realtime Preempt Patch Adaptation Experience (and Real Time BOF
    notes)](http://tree.celinuxforum.org/CelfPubWiki/ELC2007Presentations?action=AttachFile&do=get&target=RT-BoF-2007-04-17.pdf)
    - !YungJoon Jung of ETRI at ELC 2007
    -   This is the presentation of Realtime BoF in ELC 2007. It
        includes realtime preempt patch adaptation kernel's test
    -   Test on VIA Nehemiah board, 1GHZ, 256M memory
    -   See
        [http://tree.celinuxforum.org/CelfPriWiki/RealTime\_20Performance\_20Test](http://tree.celinuxforum.org/CelfPriWiki/RealTime_20Performance_20Test)
        (need to make this public)
    -   has good charts comparing vanilla, voluntary preempt,
        preemptible kernel and RT-preempt
    -   min = 5.6 us, max = 41.1 us
    -   showed RT-preempt has throughput problems (reported by
        hackbench)
-   [Performance Measurement of PPC64 RT patch
    (update)](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree13?action=AttachFile&do=get&target=CELF_PPC64_RT_20070222.pdf)
    ([english
    text](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree13?action=AttachFile&do=get&target=CELF_PPC64_RT_20070222-en.txt))
    - by Tsutomu Owa of Toshiba at CELF Jamboree 13
-   [Porting pre-empt RT patch on
    SuperH](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree13?action=AttachFile&do=get&target=preempt070222celfjambo13.pdf)
    ([english
    text](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree13?action=AttachFile&do=get&target=preempt070222celfjambo13-en.txt))
    - by Katsuya Matsubara (IGEL) at CELF Jamboree 13
-   [Performance Measurement of PPC64 RT
    Patch](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree12?action=AttachFile&do=get&target=CELF_PPC64_RT_20061208.pdf)
    ([english
    text](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree12?action=AttachFile&do=get&target=MS_CELF-TJ12-07-en.txt))
    - by Tsutomu Owa of Toshiba at CELF Jamboree 12
-   [Linux Realtime Preemption and Its Impact on
    ULDD](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree11?action=AttachFile&do=get&target=preempt061027celfjambo11-en.odp)
    by Katsuya Matsubara & Hitomi Takahashi of IGEL, for CELF Jamboree
    11
    -   very good summary of RT-preempt patch. Also good description of
        work done on SH4 and work on User Level device drivers.
    -   Describes basic steps to do a new port of RT-preempt
-   [Experience with Realtime
    Performance](http://tree.celinuxforum.org/CelfPubWiki/ELC2006Presentations?action=AttachFile&do=get&target=ExperienceWithRealtimePerformance.pdf)
    - by Shinichi Ochiai of Mitsubishi Electric Corporation at CELF ELC
    2006
    -   This describes RT features and how they evolved from 2.4.20 to
        2.6.16. Test results are shown for preemptible kernel (2.4.20),
        voluntary preemption, RT-preempt, and hybrid kernel approach
        (RTAI). The platforms tested were an SH4 board and an EDEN
        board, with a VIA processor (i386 clone). RT-preempt is shown to
        have good RT characteristics, for later kernel versions.
-   [PREEMPT-RT vs I-PIPE: the numbers, take
    3](http://groups.google.com/group/linux.kernel/msg/d420ad15b1215e54)
    - by Kristian Benoit, LKML message, 2005
    -   about extensive testing by Kristian Benoit and Karim Yaghmour
    -   See also [PREEMPT RT vs ADEOS: the numbers, part
        1](http://groups.google.com/group/linux.kernel/msg/b59137a4da507a55?hl=en&)
    -   and [PREEMPT\_RT vs I-PIPE: the numbers, take
        2](http://groups.google.com/group/linux.kernel/msg/43360d2d2ba5121a?hl=en&)
-   [Trevor Woerner's latency
    tests](http://geek.vtnet.ca/embedded/LatencyTests/html/index.html)
    -   Interesting host/target test of latency via transmission and
        reception of strings over serial port
-   [Real-Time Preemption
    Patchset](http://tree.celinuxforum.org/CelfPubWiki/TechConference2005Docs?action=AttachFile&do=get&target=Real-Time-Preemption-Patchset.pdf)
    - by Manas Saksena, CELF tech conference 2005
    -   Good paper with overview of RT-preempt patch features
-   [Audio Latency on Linux
    Kernels](http://www.alsa-project.org/~iwai/suselabs2003-audio-latency.pdf)
    - Takahashi Awai, SUSE, 2003
-   [Linux Scheduler
    Latency](http://www.linuxdevices.com/articles/AT8906594941.html) -
    by Clark Williams, Red Hat, March 2002
-   [Realfeel Test of the Preemptible Kernel
    Patch](http://www.linuxjournal.com/article/6405) - article in Linux
    Journal, 2002 by Andrew Webber
    -   This is a test of the preemptible kernel feature in 2.4.19, on
        i386 hardware.
-   [Real Time and Linux, Part 3: Sub-Kernels and
    Benchmarks](http://www.linuxdevices.com/articles/AT6320079446.html)
    - article in Embedded Linux Journal, online, 2002 by Kevin Dankwardt

-   [attachment:p-a03\_wilshire.pdf Real Time Linux: Testing and
    Evaluation] - By Phil Wilshire of Lineo at the Second Real Time
    Linux Workshop, 2000
    -   This paper discusses the different benchmarking tools used to
        evaluate the performance of Linux and their suitability for
        evaluating Real Time system Performance. It is focused on RTAI.

### OLS papers

[FIXTHIS - need to scan for past papers]

-   OLS 2006 BOF - Steven Rostedt, RedHat and Klaas Van Gend, MontaVista
    - See [The State of RT and Common Mistakes (OLS 2006
    BOF)](http://www.opentux.nl/artikelen/OLS2006_state_of_RT_and_common_mistakes.odp)
-   OLS 2007 - Paper by Steven Rostedt - see
    [https://ols2006.108.redhat.com/2007/Reprints/rostedt-Reprint.pdf](https://ols2006.108.redhat.com/2007/Reprints/rostedt-Reprint.pdf)

Darren Hart wrote:

    I have contributed some testing results to Steven Rostedt's OLS RT Internals
    paper.  That will be available to link to after the conference sometime.

### Real Time Linux Foundation RTL Workshops

Nicholas said:

There are a number of publications related to both benchmarking and
analysis of hardware related artifacts (cache,BTB,TLB,etc.) which were
published at the real-time Linux Workshops.

Here is a link to the RTLF events page:

-   [http://www.realtimelinuxfoundation.org/events/events.html](http://www.realtimelinuxfoundation.org/events/events.html)

So far, I've scanned 1999-2000 for interesting links.

## Uncategorized stuff

This section has random stuff I haven't organized yet:

-   [http://eaglet.rain.com/rick/linux/schedstat/](http://eaglet.rain.com/rick/linux/schedstat/)
    - scheduler statistics
    -   maybe this can be used to analyze process wakeup latency?? Need
        to see what stats are kept.

-   Low-latency HowTo (for audio) -
    [http://lowlatency.linuxaudio.org/](http://lowlatency.linuxaudio.org/)

### Notes on ineffective tests

Nicholas McGuire wrote:

    The tests noted in the LKML post on this page are very problematic,
    ping - -f is not testing RT at all, it keeps the kernel in a very small active
    page set thus reducing page related penalties, the while loop using dd
    is also not too helpfull as it will de-facto run only in memory and cause
    absolutely no disk/mass-storage related interaction (try the same with
    mount -o remount,sync /  first and it will be devastating ! (limited to ext2/ext3/ufs))



### Notes on test requirements - need to test kernel error paths

Nicholas McGuire wrote:

    The big problem with RT tests published is that they are all looking at the good case,
    they are loading the system but assuming successfull operations. The worst cases pop
    up when you run in the error paths of the kernel - then a trivial application can
    induce very large jitter in the system (run crashme in the background and rerun
    the tests...)

### Notes on test requirements - need for usage profile

Also lmbench can give a statistic view of things (and not even that very
precisely in some case i.e. context switch measurements are flawed) so
this is not of much help for descision makers which variant to use - it
does not help if the average performance is good but the mobile phone or
mp3 klicks at 1s intervals "deterministically" - so I guess RT
benchmarks need a notion of usage-profile to be of value.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")

