> From: [eLinux.org](http://eLinux.org/Filesystem_Information "http://eLinux.org/Filesystem_Information")


# Filesystem Information



## Boot Time with various file systems

Noboru Wakabayashi of Hitachi provided the following report.

On the OMAP Innovator he built the following file systems:

-   CRAMFS
-   CRAMFS with XIP
-   ROMFS
-   JFFS2
-   ext2 over RAM disk

He measured the time to initialize these file systems by logic analyzer.
This was done by modifying the busybox init program to make LED turn on
red. When innovator power on, the LED lights up green. So the time from
the light turning from green to red was measured. Also, he measured the
time using KFI (from start\_kernel() to to\_usrspace()).

Results are shown in the following table. (The result is average of 10
trials for each configuration.)

<table>
<thead>
<tr class="header">
<th align="left"><strong>Configuration/Filesystem</strong></th>
<th align="left"><strong>logic analyzer(sec)</strong></th>
<th align="left"><strong>KFI(usec)</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">CRAMFS*</td>
<td align="left">3.638850</td>
<td align="left">842789.1</td>
</tr>
<tr class="even">
<td align="left">CRAMFS with XIP</td>
<td align="left">2.788076</td>
<td align="left">764141.3</td>
</tr>
<tr class="odd">
<td align="left">CRAMFS with XIP and PLPJ</td>
<td align="left">2.583988</td>
<td align="left">551735.5</td>
</tr>
<tr class="even">
<td align="left">ROMFS</td>
<td align="left">3.510876</td>
<td align="left">839078.2</td>
</tr>
<tr class="odd">
<td align="left">JFFS2*</td>
<td align="left">4.822642</td>
<td align="left">1241068.4(log full)</td>
</tr>
<tr class="even">
<td align="left">ext2 over RAM disk</td>
<td align="left">cannot measure</td>
<td align="left">2952081.6(log full)</td>
</tr>
</tbody>
</table>

-   JFFS2: JFFS2 required much time at first boot time, so he measured
    from the 2nd starting.

-   CRAMFS: At first, he also measured the time with CONFIG\_KFI by
    logic analyzer. The result is 4.324660 sec. It costs more than
    without CONFIG\_KFI. So, he measured file systems without
    CONFIG\_KFI when he used logic analyzer.

The attached zip file has the kfi logfiles for these different tests: no
zip found: kfi-results-omap-filesystems.zip

Next he remeasured the time to initialize "CRAMFS with XIP and PLPJ"
using the "quiet" option. The result is 280676 usec from start\_kernel()
to to\_userspace(). The above result is 551735.5 usec.The time is
reduced about 50%.

The following table shows output from 'kd' on the kfi logfile.



<table>
<caption> output from 'kd' on the kfi logfile </caption>
<thead>
<tr class="header">
<th align="left"><strong>Function</strong></th>
<th align="left"><strong>Count</strong></th>
<th align="left"><strong>Time</strong></th>
<th align="left"><strong>Average</strong></th>
<th align="left"><strong>Local</strong></th>
<th align="left"><strong>Max-sub</strong></th>
<th align="left"><strong>Ms count</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">do_basic_setup</td>
<td align="left">1</td>
<td align="left">114068</td>
<td align="left">114068</td>
<td align="left">509</td>
<td align="left">do_initcalls</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">mem_init</td>
<td align="left">1</td>
<td align="left">110376</td>
<td align="left">110376</td>
<td align="left">490</td>
<td align="left">free_all_bootmem_node</td>
<td align="left">1</td>
</tr>
<tr class="odd">
<td align="left">free_all_bootmem_node</td>
<td align="left">1</td>
<td align="left">109378</td>
<td align="left">109378</td>
<td align="left">12</td>
<td align="left">free_all_bootmem_core</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">free_all_bootmem_core</td>
<td align="left">1</td>
<td align="left">109366</td>
<td align="left">109366</td>
<td align="left">109366</td>
<td align="left">-</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">schedule</td>
<td align="left">10</td>
<td align="left">84482</td>
<td align="left">8448</td>
<td align="left">34</td>
<td align="left">do_schedule</td>
<td align="left">10</td>
</tr>
<tr class="even">
<td align="left">do_schedule</td>
<td align="left">10</td>
<td align="left">84448</td>
<td align="left">8444</td>
<td align="left">574</td>
<td align="left">switch_to</td>
<td align="left">9</td>
</tr>
<tr class="odd">
<td align="left">do_initcalls</td>
<td align="left">1</td>
<td align="left">84159</td>
<td align="left">84159</td>
<td align="left">3831</td>
<td align="left">device_init</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">switch_to</td>
<td align="left">9</td>
<td align="left">83874</td>
<td align="left">9319</td>
<td align="left">83874</td>
<td align="left">-</td>
<td align="left">0</td>
</tr>
<tr class="odd">
<td align="left">register_proc_table</td>
<td align="left">22</td>
<td align="left">39161</td>
<td align="left">1780</td>
<td align="left">13079</td>
<td align="left">register_proc_table</td>
<td align="left">18</td>
</tr>
<tr class="even">
<td align="left">device_register</td>
<td align="left">11</td>
<td align="left">22297</td>
<td align="left">2027</td>
<td align="left">415</td>
<td align="left">device_add</td>
<td align="left">11</td>
</tr>
<tr class="odd">
<td align="left">device_add</td>
<td align="left">11</td>
<td align="left">21882</td>
<td align="left">1989</td>
<td align="left">1439</td>
<td align="left">kobject_add</td>
<td align="left">11</td>
</tr>
<tr class="even">
<td align="left">device_init</td>
<td align="left">1</td>
<td align="left">20633</td>
<td align="left">20633</td>
<td align="left">30</td>
<td align="left">net_dev_init</td>
<td align="left">1</td>
</tr>
<tr class="odd">
<td align="left">tifb_init</td>
<td align="left">1</td>
<td align="left">18759</td>
<td align="left">18759</td>
<td align="left">844</td>
<td align="left">register_framebuffer</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">register_framebuffer</td>
<td align="left">1</td>
<td align="left">13092</td>
<td align="left">13092</td>
<td align="left">88</td>
<td align="left">take_over_console</td>
<td align="left">1</td>
</tr>
<tr class="odd">
<td align="left">take_over_console</td>
<td align="left">1</td>
<td align="left">13004</td>
<td align="left">13004</td>
<td align="left">819</td>
<td align="left">redraw_screen</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">kobject_add</td>
<td align="left">15</td>
<td align="left">12996</td>
<td align="left">866</td>
<td align="left">738</td>
<td align="left">create_dir</td>
<td align="left">15</td>
</tr>
<tr class="odd">
<td align="left">setup_arch</td>
<td align="left">1</td>
<td align="left">12542</td>
<td align="left">12542</td>
<td align="left">131</td>
<td align="left">paging_init</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">paging_init</td>
<td align="left">1</td>
<td align="left">12411</td>
<td align="left">12411</td>
<td align="left">386</td>
<td align="left">free_area_init_node</td>
<td align="left">1</td>
</tr>
<tr class="odd">
<td align="left">create_dir</td>
<td align="left">15</td>
<td align="left">12258</td>
<td align="left">817</td>
<td align="left">3625</td>
<td align="left">populate_dir</td>
<td align="left">9</td>
</tr>
<tr class="even">
<td align="left">free_area_init_node</td>
<td align="left">1</td>
<td align="left">12025</td>
<td align="left">12025</td>
<td align="left">30</td>
<td align="left">free_area_init_core</td>
<td align="left">1</td>
</tr>
<tr class="odd">
<td align="left">free_area_init_core</td>
<td align="left">1</td>
<td align="left">11995</td>
<td align="left">11995</td>
<td align="left">7496</td>
<td align="left">__alloc_bootmem_node</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">rs_init</td>
<td align="left">1</td>
<td align="left">11794</td>
<td align="left">11794</td>
<td align="left">377</td>
<td align="left">printk</td>
<td align="left">3</td>
</tr>
<tr class="odd">
<td align="left">inet_init</td>
<td align="left">1</td>
<td align="left">11696</td>
<td align="left">11696</td>
<td align="left">1718</td>
<td align="left">ip_init</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">redraw_screen</td>
<td align="left">2</td>
<td align="left">11247</td>
<td align="left">5623</td>
<td align="left">871</td>
<td align="left">do_update_region</td>
<td align="left">1</td>
</tr>
<tr class="odd">
<td align="left">printk</td>
<td align="left">18</td>
<td align="left">10870</td>
<td align="left">603</td>
<td align="left">10870</td>
<td align="left">-</td>
<td align="left">0</td>
</tr>
<tr class="even">
<td align="left">net_dev_init</td>
<td align="left">1</td>
<td align="left">10334</td>
<td align="left">10334</td>
<td align="left">3102</td>
<td align="left">ethif_probe</td>
<td align="left">1</td>
</tr>
</tbody>
</table>

# Probe times for various file systems

As part of work supported by Sony/Matsushita, Todd Poynor got the
following numbers using KFI on a 200MHz IBM 405GP "Walnut" evaluation
board with a 100MHz core bus and 33MHz PCI bus. A Seagate Barracuda ATA
IV 60GB disk drive is cabled to one of the two IDE interfaces on a
Promise Ultra66 PCI-IDE bridge card (PDC20262 chipset). All of the
drivers for PCI, IDE, PCI-IDE disk, and EXT2 filesystem are built into
the kernel.

Boot execution time of IDE/PCI-IDE/MS-DOS partition drivers: 262 msecs.
This includes the time to probe and identify the IDE drive device and
read the disk partition information from the drive. We booted the kernel
with option hdf=none to turn off the slave device on interface ide2, so
that it would not be probed. We also modified the kernel to turn off
probes of the second IDE interface on the Promise card. (This was prior
to fixing the "ide\<x\>=noprobe" option bug. If you don't turn off
probing the second empty IDE interface then probling takes 1.3 seconds
on both a PPC 405GP and a MIPS ITE8172!)

About 250 msecs of the time is spent during the bus probe in repeated
calls to ide\_delay\_50ms() during probe and drive identification, which
busywaits (in order to let the IDE controller make progress before
polling for status or to allow previous operations to complete). Reading
capacity info, etc. also blocks using a wait\_for\_completion(). The
MSDOS partition code also locks pages, which can call schedule() to wait
for locks.

If the IDE drivers are made modules for delayed initialization, allowing
concurrent module initialization with application execution, then kernel
preemption is turned off for about 252 msecs during init of the
ide-probe-mod module, which could significantly interfere with real-time
response of other threads. (This was verified using the
CONFIG\_PREEMPT\_TIMES feature that gives preemption lock times in
/proc/latencytimes, which is also supported in the CELF kernel.) Because
the Big Kernel Lock (BKL) is held during module initialization,
preemption is disabled while the module init routines runs and uses
busywait calls, but preemption is allowed when CPU-yielding wait calls
are employed (the linux scheduler drops and reacquires the BKL in this
case).

So we changed the ide\_delay\_50ms() busywaits to call
schedule\_timeout() instead (this is also in the CELF kernel; select
CONFIG\_IDE\_PREEMPT), resulting in a 9.68 msec maximum preempt off
time. Note that if you're not using modules but are instead building the
drivers statically into the kernel, then the CPU-yielding calls do add
some amount of time to the total execution time due to context-switch
overhead, etc.

My coworker Dave Singleton also did some analysis and improvement of IDE
on the MIPS ITE8172 (again for Sony/Matsushita). He found that with his
7200RPM Maxtor drive, he could reduce the 50ms probe delays to 1ms with
no problem. With this, plus some context switch removal and the other
optimizations given above, the following boot times were observed, by
filesystem type:

{{{ ext2: 167 milliseconds ext3: 457 milliseconds xfs: 236 milliseconds
}}}

He explains: "Both EXT3 and XFS file systems cause a log replay at
boot/mount time. To improve this time the log recovery feature was by
passed in the case of XFS. The log was not replayed and the root file
system was mounted readonly. The first init script after booting
remounted the root file system readwrite and replayed the log to ensure
file system integrity. No such changes were made to EXT3, which is the
reason it had the slowest boot times of all 3 file system types."


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [File Systems](http://eLinux.org/Category:File_Systems "Category:File Systems")

