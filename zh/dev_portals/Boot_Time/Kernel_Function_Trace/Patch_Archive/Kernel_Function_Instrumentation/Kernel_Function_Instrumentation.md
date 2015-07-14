> From: [eLinux.org](http://eLinux.org/Kernel_Function_Instrumentation "http://eLinux.org/Kernel_Function_Instrumentation")


# Kernel Function Instrumentation



[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) - **NOTE:** *KFI
has been renamed to KFT (Kernel Function Trace) starting with the
patches for kernel version 2.6.12. If you are using a recent kernel,
version 2.6.12 or later, please see the [Kernel Function
Trace](http://eLinux.org/Kernel_Function_Trace "Kernel Function Trace") page instead of
this one.*

## Contents

-   [1 Introduction](#introduction)
-   [2 Basic Use](#basic-use)
-   [3 Download](#download)
    -   [3.1 Patches](#patches)
    -   [3.2 KFI utilities](#kfi-utilities)
-   [4 How To Use](#how-to-use)
    -   [4.1 Adding platform support for the kfi clock
        source](#adding-platform-support-for-the-kfi-clock-source)
-   [5 Issues](#issues)
    -   [5.1 Overhead](#overhead)
-   [6 Similar technologies](#similar-technologies)
-   [7 Filter Q&A](#filter-q-26a)
-   [8 Sample results](#sample-results)
    -   [8.1 kfi log output (excerpt)](#kfi-log-output-excerpt)
    -   [8.2 kfi log analysis with
        'kd'](#kfi-log-analysis-with-kd)

## Introduction

Kernel Function Instrumentation (KFI) is a kernel function tracing
system, which uses the "-finstrument-functions" capability of the gcc
compiler to add instrumentation callouts to every function entry and
exit. The KFI system provides for capturing these callouts and
generating a trace of events, with timing details. KFI is excellent at
providing a good timing overview of kernel procedures, allowing you to
see where time is spent in functions and sub-routines in the kernel.

The main mode of operation with KFI is to use the system with a dynamic
trace configuration. That is, you can set a trace configuration after
kernel startup, using the `/proc/kfi` interface, and retrieve trace data
immediately. However, another (special) mode of operation is available,
called STATIC\_RUN mode, where the configuration for a KFI run is
configured and compiled statically into the kernel. This mode is useful
for getting a trace of kernel operation during system bootup (before
user space is running).

The KFI configuration lets you specify how to automatically start and
stop a trace, whether to include interrupts as part of the trace, and
whether to filter the trace data by various criteria (for minimum
function duration, only certain listed functions, etc.) KFI trace data
is retrieved by reading from `/proc/kfi_trace` after the trace is
complete.

Tools are supplied to convert numeric trace data to kernel symbols, and
to process and analyze the data in a KFI trace.

## Basic Use

Documentation for KFI is available (as of 2.6.11) in
Documentation/kfi.txt, after applying the kfi-2.patch.

Here's a presentation about KFI usage:

-   [http://elinux.org/images//8/83/Pdf.gif](http://elinux.org/images//8/83/Pdf.gif)
    ["Learning the Kernel and Finding Performance Problems with
    KFI"](http://eLinux.org/images/7/7c/KFI-presentation.pdf "KFI-presentation.pdf")
    [http://elinux.org/images/d/da/Info\_circle.png](http://elinux.org/File:KFI-presentation.pdf)
-   attachment:omap-serial\_init.trace.txt - Sample trace used with
    presentation

For prior releases of KFI, see [KFI Docs](http://eLinux.org/KFI_Docs "KFI Docs")

## Download

### Patches

-   Patch for CELF kernel (based on linux-2.4.20):
    attachment:kfi-24-test4.patch
-   Patch for Linux 2.6.7 (for x86 only): attachment:kfi-26-test1.patch
-   Patch for Linux 2.6.8.1: see the PatchArchive page
-   Patch for Linux 2.6.11: see the PatchArchive page (or just download
    attachment:kfi-2.patch)

### KFI utilities

-   User-space programs: attachment:kfi-0.8.tar.gz (for KFI version 1)

For KFI version 2 and above, the only user-space programs are scripts,
which are now located in the kernel `scripts` directory:

-   addr2sym - script to convert function addresses to symbols in the
    trace data
-   kd - kfi dump - does filtering, sorting, and analysis of KFI trace
    logs

See Documentation/kfi.txt for instructions on using these programs.

## How To Use

-   download both the patch
-   apply the patch in the kernel top-level directory:
-   patch -p1 \<kfi-2.patch
-   read the rest of the instructions in the Documentation/kfi.txt file.
    (my apologies for being lazy!)

### Adding platform support for the kfi clock source

The current patch (from Sep 2004), uses sched\_clock() as the clock
source for kfi\_readclock(). sched\_clock() is new in the 2.6 kernel,
and returns a 64-bit value containing nanoseconds (not necessarily
relative to any particular time base, but assumed to be monotonically
increasing, and relatively frequency-stable.)

If your platform has good support for sched\_clock(), then KFI should
work for you unmodified. If not, you may wish to do one of two things:

-   improve support for sched\_clock() in your board port, or
-   write a custom kfi\_readclock() routine.

A "good" sched\_clock() routine will provide at least microsecond
resolution on return values. Some architectures have sched\_clock()
returning values based on the `jiffy` variable, which on many embedded
platforms only has resolution to 10 milliseconds.

There are some sample custom kfi\_readclock() routines in the current
patch (one for x86 using the TSC, and one for PPC using the TBU.

## Issues

Here is a list of things that need more work:

-   may need to add noinstrument attributes for some time-critical code
    (need to check this)
-   maybe can check "Function Trace in KDB" patch for help with this
-   would like a tutorial on the configuration language for defining a
    tracing run
-   documentation needs lots of work
-   should especially document how to do a dynamic trace

### Overhead

Mitsubishi measured the overhead of KFI. The period is from
start\_kernel() to smp\_init(). Platform was: SH7751R 240MHz (Memory
Clock 80MHz)

` With KFI    : 922.419 msec Without KFI : 666.982 msec Overhead    : 27.69%`

## Similar technologies

There are other technologies for doing call traces or kernel profiling
that are similar to KFI. Some of these are mentioned on the
KernelInstrumentation page.

One that is very similar is a kernel trace mechanism for use with KDB. A
patch was posted to LKML in January of 2002. See the message:
[http://www.uwsg.iu.edu/hypermail/linux/kernel/0201.3/0888.html](http://www.uwsg.iu.edu/hypermail/linux/kernel/0201.3/0888.html)

## Filter Q&A

Tim asked the question:

Q. Is there a way to adjust the trigger or filters to reduce the memory
usage?

A. Todd Poynor from MontaVista answered: ` kfistatic.conf `

     begin
        trigger start entry start_kernel
        trigger stop entry to_userspace
        filter mintime 1
        filter maxtime 0
     #   filter noints
     end

The above filters out only those routines that take less than 1
microsecond. We usually are not interested in routines that execute so
quickly, and instead use something like "filter mintime 500" to filter
out routines taking less than 500 microseconds.

I didn't track down the original log file being discussed, but if the
"quiet" command line parameter wasn't used then even a 500us filter may
include a lot of calls for serial console printks.

The filters don't affect memory usage so far as I understand. You can
set the amount of memory used for a static run by specifying "logsize
\<n\>", where \<n\> is the number of entries, in kfistatic.conf.

* * * * *

Q. Is it possible to specifically omit certain routines with a filter.

A. I believe there's a filter for including only certain routines
(rather than excluding certain routines). It shouldn't normally be
necessary, but if there's a routine that matches the time filtering
suggested above and is called so often as to be a problem, then adding
attribute "\_\_noinstrument" to the function definition and recompiling
will exclude it; see drivers/char/kfi.c for an example.

## Sample results

Here is an excerpt from a KFI log trace (processed with addr2sym). It
shows all functions which lasted longer than 500 microseconds, from when
the kernel entered start\_kernel() to when it entered to\_userspace().

### kfi log output (excerpt)

` Kernel Instrumentation Run ID 0`

Logging started at 6785045 usec by entry to function start\_kernel
Logging stopped at 8423650 usec by entry to function to\_userspace

Filters: 500 usecs minimum execution time

Filter Counters:

Execution time filter count = 896348 Total entries filtered = 896348
Entries not found = 24

Number of entries after filters = 1757



    Entry      Delta      PID            Function                    Called At

          1          0       0                start_kernel   L6+0x0
         14       8687       0                  setup_arch   start_kernel+0x35
         39        891       0                setup_memory   setup_arch+0x2a8
         53        872       0   register_bootmem_low_pages   setup_memory+0x8f
         54        871       0                free_bootmem   register_bootmem_low_pages+0x95
         54        871       0           free_bootmem_core   free_bootmem+0x34
        930       7432       0                 paging_init   setup_arch+0x2af
        935       7427       0             zone_sizes_init   paging_init+0x4e
        935       7427       0              free_area_init   zone_sizes_init+0x83
        935       7427       0         free_area_init_node   free_area_init+0x4b
        935       3759       0        __alloc_bootmem_node   free_area_init_node+0xc5
        935       3759       0        __alloc_bootmem_core   __alloc_bootmem_node+0x43
       4694       3668       0         free_area_init_core   free_area_init_node+0x75
       4817       3535       0            memmap_init_zone   free_area_init_core+0x2bd
       8807     266911       0                   time_init   start_kernel+0xb6
       8807     261404       0               get_cmos_time   time_init+0x1c
     270211       5507       0                select_timer   time_init+0x41
     270211       5507       0                    init_tsc   select_timer+0x45
     270211       5507       0               calibrate_tsc   init_tsc+0x6c
     275718       1638       0                console_init   start_kernel+0xbb
     275718       1638       0                    con_init   console_init+0x59
     275954        733       0          vgacon_save_screen   con_init+0x288
     277376       6730       0                    mem_init   start_kernel+0xf8
     277376       1691       0            free_all_bootmem   mem_init+0x52
     277376       1691       0       free_all_bootmem_core   free_all_bootmem+0x24
     284118      25027       0             calibrate_delay   start_kernel+0x10f
     293860        770       0                     __delay   calibrate_delay+0x62
     293860        770       0                   delay_tsc   __delay+0x26
     294951       1534       0                     __delay   calibrate_delay+0x62
     294951       1534       0                   delay_tsc   __delay+0x26
     297134       1149       0                     __delay   calibrate_delay+0xbe
     297134       1149       0                   delay_tsc   __delay+0x26
     .
     .
     .
    1638605          0     145              filemap_nopage   do_no_page+0xef
    1638605          0     145                 __lock_page   filemap_nopage+0x286
    1638605          0     145                 io_schedule   __lock_page+0x95
    1638605          0     145                    schedule   io_schedule+0x24
    1638605          0       5                    schedule   worker_thread+0x217
    1638605          0       1                to_userspace   init+0xa6

The log is attached here: attachment:kfiboot-9.lst

A Delta value of 0 usually means the exit from the routine was not seen.

### kfi log analysis with 'kd'

Below is a `kd` dump of the data from the above log.

For the purpose of finding areas of big time in the kernel, the
functions with high "Local" time are important. For example,
`delay_tsc()` is called 156 times, resulting in 619 milliseconds of
duration. Other time-consuming routines were: `isapnp_isolate()`,
`get_cmos_time()`, `default_idle()`.

The top line showing schedule() called 192 times and lasting over 5
seconds, is accounted wrong due to the switch in execution control
inside the schedule routine. (The count of 192 calls is correct, but the
duration is wrong.)

`$~/work/kfi/kfi/kd -n 30 kfiboot-9.lst `

<table>
<thead>
<tr class="header">
<th align="left">Function</th>
<th align="left">Count</th>
<th align="left">Time</th>
<th align="left">Average</th>
<th align="left">Local</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">schedule</td>
<td align="left">192</td>
<td align="left">5173790</td>
<td align="left">26946</td>
<td align="left">5173790</td>
</tr>
<tr class="even">
<td align="left">do_basic_setup</td>
<td align="left">1</td>
<td align="left">1159270</td>
<td align="left">1159270</td>
<td align="left">14</td>
</tr>
<tr class="odd">
<td align="left">do_initcalls</td>
<td align="left">1</td>
<td align="left">1159256</td>
<td align="left">1159256</td>
<td align="left">627</td>
</tr>
<tr class="even">
<td align="left">__delay</td>
<td align="left">156</td>
<td align="left">619322</td>
<td align="left">3970</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">delay_tsc</td>
<td align="left">156</td>
<td align="left">619322</td>
<td align="left">3970</td>
<td align="left">619322</td>
</tr>
<tr class="even">
<td align="left">__const_udelay</td>
<td align="left">146</td>
<td align="left">608427</td>
<td align="left">4167</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">probe_hwif</td>
<td align="left">8</td>
<td align="left">553972</td>
<td align="left">69246</td>
<td align="left">126</td>
</tr>
<tr class="even">
<td align="left">do_probe</td>
<td align="left">31</td>
<td align="left">553025</td>
<td align="left">17839</td>
<td align="left">68</td>
</tr>
<tr class="odd">
<td align="left">ide_delay_50ms</td>
<td align="left">103</td>
<td align="left">552588</td>
<td align="left">5364</td>
<td align="left">0</td>
</tr>
<tr class="even">
<td align="left">isapnp_init</td>
<td align="left">1</td>
<td align="left">383138</td>
<td align="left">383138</td>
<td align="left">18</td>
</tr>
<tr class="odd">
<td align="left">isapnp_isolate</td>
<td align="left">1</td>
<td align="left">383120</td>
<td align="left">383120</td>
<td align="left">311629</td>
</tr>
<tr class="even">
<td align="left">ide_init</td>
<td align="left">1</td>
<td align="left">339778</td>
<td align="left">339778</td>
<td align="left">22</td>
</tr>
<tr class="odd">
<td align="left">probe_for_hwifs</td>
<td align="left">1</td>
<td align="left">339756</td>
<td align="left">339756</td>
<td align="left">103</td>
</tr>
<tr class="even">
<td align="left">ide_scan_pcibus</td>
<td align="left">1</td>
<td align="left">339653</td>
<td align="left">339653</td>
<td align="left">13</td>
</tr>
<tr class="odd">
<td align="left">init_setup_piix</td>
<td align="left">2</td>
<td align="left">339640</td>
<td align="left">169820</td>
<td align="left">0</td>
</tr>
<tr class="even">
<td align="left">ide_scan_pcidev</td>
<td align="left">2</td>
<td align="left">339640</td>
<td align="left">169820</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">piix_init_one</td>
<td align="left">2</td>
<td align="left">339640</td>
<td align="left">169820</td>
<td align="left">0</td>
</tr>
<tr class="even">
<td align="left">ide_setup_pci_device</td>
<td align="left">2</td>
<td align="left">339640</td>
<td align="left">169820</td>
<td align="left">242</td>
</tr>
<tr class="odd">
<td align="left">probe_hwif_init</td>
<td align="left">4</td>
<td align="left">339398</td>
<td align="left">84849</td>
<td align="left">40</td>
</tr>
<tr class="even">
<td align="left">time_init</td>
<td align="left">1</td>
<td align="left">266911</td>
<td align="left">266911</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">get_cmos_time</td>
<td align="left">1</td>
<td align="left">261404</td>
<td align="left">261404</td>
<td align="left">261404</td>
</tr>
<tr class="even">
<td align="left">ide_generic_init</td>
<td align="left">1</td>
<td align="left">214614</td>
<td align="left">214614</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">ideprobe_init</td>
<td align="left">1</td>
<td align="left">214614</td>
<td align="left">214614</td>
<td align="left">0</td>
</tr>
<tr class="even">
<td align="left">wait_for_completion</td>
<td align="left">6</td>
<td align="left">194573</td>
<td align="left">32428</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">default_idle</td>
<td align="left">183</td>
<td align="left">192589</td>
<td align="left">1052</td>
<td align="left">192589</td>
</tr>
<tr class="even">
<td align="left">io_schedule</td>
<td align="left">18</td>
<td align="left">171313</td>
<td align="left">9517</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">__wait_on_buffer</td>
<td align="left">14</td>
<td align="left">150369</td>
<td align="left">10740</td>
<td align="left">141</td>
</tr>
<tr class="even">
<td align="left">i8042_init</td>
<td align="left">1</td>
<td align="left">137210</td>
<td align="left">137210</td>
<td align="left">295</td>
</tr>
<tr class="odd">
<td align="left">i8042_port_register</td>
<td align="left">2</td>
<td align="left">135318</td>
<td align="left">67659</td>
<td align="left">301</td>
</tr>
<tr class="even">
<td align="left">__serio_register_port</td>
<td align="left">2</td>
<td align="left">135017</td>
<td align="left">67508</td>
<td align="left">0</td>
</tr>
</tbody>
</table>


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel Function
    Instrumentation](http://eLinux.org/Category:Kernel_Function_Instrumentation "Category:Kernel Function Instrumentation")

