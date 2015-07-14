> From: [eLinux.org](http://eLinux.org/Technology_Watch_List "http://eLinux.org/Technology_Watch_List")


# Technology Watch List



This page lists technologies and projects that CELF members are
interested in the status of. This includes kernel patches, new
technology research, and middleware and user-space projects of key
interest for consumer electronics products. The projects may be the
topics of discussion at CELF meetings, and we plan to watch and report
the status of these technologies.

Please add any information you have about the technology items listed below!!

## Contents

-   [1 Latest Watchlist](#latest-watchlist)
-   [2 Kernel Stuff](#kernel-stuff)
    -   [2.1 Size Stuff](#size-stuff)
    -   [2.2 File Systems](#file-systems)
    -   [2.3 Tracing and instrumentation](#tracing-and-instrumentation)
    -   [2.4 Realtime](#realtime)
    -   [2.5 Security](#security)
    -   [2.6 Power Management](#power-management)
    -   [2.7 Bootup Time](#bootup-time)
    -   [2.8 Miscellaneous](#miscellaneous)
-   [3 Middleware](#middleware)

## Latest Watchlist

The **Status** field in the table below indicates whether this feature
is on track for being mainlined. The **When was last activity** field
indicates the kernel version number or date when the last activity was
noted for this feature. This could be the last kernel version where bits
from this patch were mainlined, or the last date of visible feature
development activity outside the main tree.

See also: [Embedded linux
status](../.././tech_watch_list/Technology_Watch_List/Embedded_linux_status/Embedded_linux_status.md "Embedded linux status")



## Kernel Stuff

### Size Stuff

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<thead>
<tr class="header">
<th align="left">Technology, Feature or Patch</th>
<th align="left">Status</th>
<th align="left">When was last activity</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><a href="http://elinux.org/Linux_Tiny">Linux-tiny</a></td>
<td align="left">In active maintenance. Path set published for 2.6.24</td>
<td align="left">Latest full patchset was published Oct. 13, 2007, Latest patch (CONSOLE_TRANSLATIONS) was mainlined in June 2008</td>
<td align="left">Maintainer is Michael Opdenacker (with help from Thomas Petazzoni). See <a href="http://elinux.org/Linux_Tiny_Patch_Details" title="Linux Tiny Patch Details">Linux Tiny Patch Details</a> for details about the patch status.</td>
</tr>
<tr class="even">
<td align="left">kpagemap - memory instrumentation</td>
<td align="left">mainlined in Feb, 2008 (for 2.6.25)</td>
<td align="left">Feb 2008</td>
<td align="left"><ul>
<li>Can show details about every allocated and virtual page on the system.</li>
<li>Introduces PSS and USS size metrics
<ul>
<li>PSS - Proportional Set Size</li>
<li>USS - Unique Set Size</li>
</ul></li>
<li>Resources:
<ul>
<li>ELC 2007 presentation: <a href="http://selenic.com/repo/pagemap/raw-file/tip/memory-profiling.html">http://selenic.com/repo/pagemap/raw-file/tip/memory-profiling.html</a></li>
<li>LWN.net article: <a href="http://lwn.net/Articles/230975/">http://lwn.net/Articles/230975/</a></li>
<li>Visualization tools: <a href="http://selenic.com/repo/pagemap">http://selenic.com/repo/pagemap</a></li>
</ul></li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><a href="http://www.selenic.com/bloatwatch/">Bloatwatch</a> (2.0)</td>
<td align="left">Now actively reporting kernel sizes</td>
<td align="left">April 2008</td>
<td align="left">See <a href="http://www.celinux.org/elc08_presentations/elc2008.odp">Matt's presentation from ELC 2008</a></td>
</tr>
<tr class="even">
<td align="left">gcc -ffunction-sections -fdata-sections</td>
<td align="left">Patches submitted to LKML</td>
<td align="left">July 2008</td>
<td align="left">See <a href="http://elinux.org/Function_sections" title="Function sections">Function sections</a></td>
</tr>
</tbody>
</table>

### File Systems

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<thead>
<tr class="header">
<th align="left">Technology, Feature or Patch</th>
<th align="left">Status</th>
<th align="left">When was last activity</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><a href="http://elinux.org/Squash_Fs" title="Squash Fs">Squash Fs</a></td>
<td align="left">Mainlined in January 2009 (for 2.6.29) See <a href="http://lwn.net/Articles/314326/">http://lwn.net/Articles/314326/</a>.</td>
<td align="left">As of Feb, 2009, Phillip was working on some user-space tools issues, to support the new filesystem format (version 4.0)</td>
<td align="left">Good job Phillip!</td>
</tr>
<tr class="even">
<td align="left"><a href="http://elinux.org/AXFS" title="AXFS">AXFS</a></td>
<td align="left">Not mainlined.</td>
<td align="left">Some required (predecessor) bits were mainlined in March, 2008, A version was submitted to LKML in August 2008</td>
<td align="left">Flash filesystem that allows for tuning the amount of <a href="http://elinux.org/Application_XIP" title="Application XIP">XIP</a>
<ul>
<li>See <a href="http://www.celinux.org/elc08_presentations/AXFS_at_ELC_2008.ppt">AXFS: Architecture and Results</a> - Jared Hulbert's presentation for ELC 2008</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">LogFS</td>
<td align="left">Not mainlined.</td>
<td align="left">Last mainline attempt was May, 2008.</td>
<td align="left"><ul>
<li>Home page is at: <a href="http://logfs.org/logfs/">http://logfs.org/logfs/</a></li>
<li>Jörn Engel is working on a re-write to address several major issues.</li>
<li>CELF is funding this work.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left">UBIFS</td>
<td align="left">mainlined in 2.6.27</td>
<td align="left"></td>
<td align="left"><p>Resources:</p>
<ul>
<li><a href="http://www.linux-mtd.infradead.org/doc/ubifs.html">home page?</a></li>
<li><a href="http://www.linux-mtd.infradead.org/doc/ubifs_whitepaper.pdf">white paper</a></li>
<li><a href="http://lwn.net/Articles/276025/">LWN.net article</a></li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><a href="http://elinux.org/Pram_Fs" title="Pram Fs">Pram Fs</a></td>
<td align="left">submitted for review for 2.6.31</td>
<td align="left">June 2009</td>
<td align="left">See <a href="http://lkml.org/lkml/2009/6/13/86">http://lkml.org/lkml/2009/6/13/86</a></td>
</tr>
</tbody>
</table>

### Tracing and instrumentation

<table>
<thead>
<tr class="header">
<th align="left">Technology, Feature or Patch</th>
<th align="left">Status</th>
<th align="left">When was last activity</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">LTTng</td>
<td align="left">core not mainlined. Markers were mainlined in 2.6.24</td>
<td align="left">?</td>
<td align="left">LTTng instrumentation was changed to use markers, in early 2007</td>
</tr>
<tr class="even">
<td align="left"><a href="http://elinux.org/System_Tap">SystemTap</a> (and Kprobes) for non-i386 arches</td>
<td align="left">ARM support merged for 2.6.25</td>
<td align="left">?</td>
<td align="left">KProbes ports for ARM, MIPS and PPC32 were reported on at ELC 2007, SystemTap for SH was demo'ed at ELC 2007</td>
</tr>
<tr class="odd">
<td align="left"><a href="http://elinux.org/Kernel_Function_Trace">Kernel Function Trace</a> (KFT)</td>
<td align="left">not mainlined</td>
<td align="left">Last published patches for 2.6.22</td>
<td align="left">Nicholas McGuire was taking over maintainership from Tim Bird, with funding from CELF. Haven't heard much recently (as of June 2008)</td>
</tr>
<tr class="even">
<td align="left">ftrace</td>
<td align="left">mainlined in 2.6.27</td>
<td align="left"></td>
<td align="left">This was formerly the latency-trace features from the RT-preempt patch set, refactored for general use</td>
</tr>
<tr class="odd">
<td align="left">printk-times (arch support)</td>
<td align="left">fully mainlined?</td>
<td align="left">April, 2005</td>
<td align="left">Some arches had problems with accessing the clock too early in the kernel bootup sequence, but a new setup routine defers turning on the timestamping until after timekeeping is initialized</td>
</tr>
</tbody>
</table>

### Realtime

<table>
<thead>
<tr class="header">
<th align="left">Technology, Feature or Patch</th>
<th align="left">Status</th>
<th align="left">When was last activity</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">KTimers</td>
<td align="left">mainlined, but needs lots of porting to embedded architectures</td>
<td align="left">2.6.23 / 2.6.24</td>
<td align="left">Adding clock driver support for various architectures is an ongoing process</td>
</tr>
<tr class="even">
<td align="left">RT-preempt</td>
<td align="left">some parts mainlined</td>
<td align="left">current RT patches are still against 2.6.26</td>
<td align="left">Next target is to integrate threaded interrupts in 2.6.29 - as discussed on LinuxPlumbers conference Oregon 2008</td>
</tr>
<tr class="odd">
<td align="left">Xenomai</td>
<td align="left">external project</td>
<td align="left">2.6.25 - stable release, newer in development</td>
<td align="left">Xenomai is a real-time development framework cooperating with the Linux kernel, in order to provide a pervasive, interface-agnostic, hard real-time support to user-space applications, seamlessly integrated into the GNU/Linux environment. Ready to deploy.</td>
</tr>
</tbody>
</table>

### Security

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<thead>
<tr class="header">
<th align="left">Technology, Feature or Patch</th>
<th align="left">Status</th>
<th align="left">When was last activity</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">App Armour</td>
<td align="left">not mainlined</td>
<td align="left">May, 2007</td>
<td align="left"><ul>
<li>LSM framework was removed from kernel in 2.6.24</li>
<li>AppArmour group was let go from Novell in late 2007
<ul>
<li>See <a href="http://www.news.com/8301-13580_3-9796140-39.html">http://www.news.com/8301-13580_3-9796140-39.html</a></li>
<li><a href="http://lwn.net/SubscriberLink/254740/f71fe8e26c906233/">LWN.net article</a></li>
</ul></li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><a href="http://elinux.org/TomoyoLinux">TOMOYO Linux</a></td>
<td align="left">not mainlined</td>
<td align="left"><a href="http://lwn.net/Articles/258905/">Nov 17, 2007</a> (4th post) <a href="http://elinux.org/TomoyoLinux#Mainline">(trying now)</a></td>
<td align="left">&quot;TOMOYO Linux has only recently surfaced on the wider mailing lists; its reception has not been entirely friendly. This project's developers have some work to do if they are (1) to get past the same obstacles which have slowed AppArmor, and (2) show that their project is sufficiently different from AppArmor to merit inclusion as yet another security framework.&quot; (from <a href="http://www.linux-foundation.org/en/Linux_Weather_Forecast/security">Linux Weather Forecast</a>)</td>
</tr>
<tr class="odd">
<td align="left">SMACK</td>
<td align="left">mainlined in 2.6.25</td>
<td align="left">.</td>
<td align="left"><a href="http://lwn.net/Articles/244531/">LWN.net article on SMACK</a></td>
</tr>
<tr class="even">
<td align="left">SELinux (usable in embedded)</td>
<td align="left">SELinux is mainlined, but some issues for making SELinux usable for embedded remain</td>
<td align="left">April 2008</td>
<td align="left"><ul>
<li>There has been much progress recently to support SELinux in the embedded space</li>
<li>Requires filesytem with xattrs (some flash filesystems do not support xattrs)</li>
<li>at ELC 2008, Yuichi Nakamura described an embedded configuration of SELinux in as little as 700K
<ul>
<li><a href="http://www.celinux.org/elc08_presentations/ELC2008_nakamura.pdf">Development of Embedded SELinux</a> - Yuichi Nakamura presentation at ELC 2008</li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

### Power Management

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<thead>
<tr class="header">
<th align="left">Technology, Feature or Patch</th>
<th align="left">Status</th>
<th align="left">When was last activity</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">powertop</td>
<td align="left">support for powertop is mainlined (for x86 architecture)</td>
<td align="left">?</td>
<td align="left"><ul>
<li>Powertop shows timers and power state durations</li>
<li>Only well-supported on x86??
<ul>
<li>To support on other architectures, the platform needs to support CPUIdle interface, in order to show C-state (power state) ** There has been some activity for non-Intel processors</li>
</ul></li>
</ul></td>
</tr>
<tr class="even">
<td align="left">PM QoS</td>
<td align="left">in 2.6.23-mm1</td>
<td align="left">Oct '07</td>
<td align="left">(see <a href="http://lesswatts.org">http://lesswatts.org</a>) need Embedded folks to take a look and help define the interface, expand the features and raise issues from the embedded perspective.</td>
</tr>
<tr class="odd">
<td align="left">Wolfson voltage regulator stuff</td>
<td align="left">not mainlined??</td>
<td align="left">March 2008?</td>
<td align="left">See <a href="http://www.celinux.org/elc08_presentations/regulator-api-celf.pdf">Every Microamp is Sacred - A Dynamic Voltage and Current Control Interface for the Linux Kernel</a> - Liam Girdwood's ELC 2008 presentation</td>
</tr>
</tbody>
</table>

### Bootup Time

<table>
<thead>
<tr class="header">
<th align="left">Technology, Feature or Patch</th>
<th align="left">Status</th>
<th align="left">When was last activity</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">deferred module load</td>
<td align="left">not mainlined, no patches</td>
<td align="left">July 2008</td>
<td align="left">Proposed, without patches, by Tim Bird on linux-embedded list</td>
</tr>
<tr class="even">
<td align="left">async initcalls</td>
<td align="left">not mainlined</td>
<td align="left">July 2008</td>
<td align="left">Patches submitted by Arjan van de Ven</td>
</tr>
<tr class="odd">
<td align="left">snapshot boot</td>
<td align="left">not mainlined</td>
<td align="left">July 2006</td>
<td align="left">Sony presented paper at OLS 2006. This technology is used in Sony products.</td>
</tr>
<tr class="even">
<td align="left">fastboot kernel configuration option</td>
<td align="left">not mainlined?</td>
<td align="left">July 2006</td>
<td align="left">Arjan van de Ven submitted as part of his async initcalls patches</td>
</tr>
</tbody>
</table>

### Miscellaneous

<table>
<thead>
<tr class="header">
<th align="left">Technology, Feature or Patch</th>
<th align="left">Status</th>
<th align="left">When was last activity</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Userspace I/O</td>
<td align="left">Seems to be merged into mainline (see: <a href="http://lwn.net/Articles/242483/">http://lwn.net/Articles/242483/</a> )</td>
<td align="left">July, 2007</td>
<td align="left">References: <a href="http://www.kroah.com/log/linux/uio.html">http://www.kroah.com/log/linux/uio.html</a></td>
</tr>
</tbody>
</table>

## Middleware

<table>
<thead>
<tr class="header">
<th align="left">Project</th>
<th align="left">Status</th>
<th align="left">When was last activity</th>
<th align="left">Notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">libdlna</td>
<td align="left">Developer has added support for all profiles except MPEG-4 and WMV ( <a href="http://hg.geexbox.org/libdlna/">http://hg.geexbox.org/libdlna/</a> )</td>
<td align="left">29 Aug, 07</td>
<td align="left">Short term goal is to provide DLNA support to Ushare media server, long term goal is to provide generic DLNA reference library <br /> References: <a href="http://libdlna.geexbox.org/">http://libdlna.geexbox.org/</a></td>
</tr>
</tbody>
</table>


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Community](http://eLinux.org/Category:Community "Category:Community")

