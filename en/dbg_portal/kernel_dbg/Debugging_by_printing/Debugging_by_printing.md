> From: [eLinux.org](http://eLinux.org/Debugging_by_printing "http://eLinux.org/Debugging_by_printing")


# Debugging by printing



Probably the simplest way to get some debug information from your kernel
code is by printing out various information with the kernel's equivalent
of printf - the printk function and its derivatives. The k in printk is
used to specifically remind kernel developers that the environment is
different.

## Contents

-   [1 Usage](#usage)
-   [2 Log Levels](#log-levels)
-   [3 Rate limiting and one time
    messages](#rate-limiting-and-one-time-messages)
-   [4 Printk from userspace](#printk-from-userspace)
-   [5 Internals / Changing the size of the printk
    buffer](#internals-changing-the-size-of-the-printk-buffer)
-   [6 Pros and Cons](#pros-and-cons)
-   [7 Debugging early boot problems](#debugging-early-boot-problems)
    -   [7.1 Accessing the printk buffer after a silent hang on
        boot](#accessing-the-printk-buffer-after-a-silent-hang-on-boot)
        -   [7.1.1 Redboot example on a Freescale ADS
            board](#redboot-example-on-a-freescale-ads-board)
        -   [7.1.2 U-boot example on an OMAP OSK
            board](#u-boot-example-on-an-omap-osk-board)
        -   [7.1.3 Grub](#grub)
    -   [7.2 Using CONFIG\-DEBUG\-LL and printascii() (ARM
        only)](#using-config-debug-ll-and-printascii-arm-only)
-   [8 NetConsole](#netconsole)
    -   [8.1 Netconsole resources](#netconsole-resources)
-   [9 Misc](#misc)
    -   [9.1 Dmesg / Clearing the
        buffer](#dmesg-clearing-the-buffer)
    -   [9.2 Printk Timestamps](#printk-timestamps)
    -   [9.3 Printing buffers as hex](#printing-buffers-as-hex)
    -   [9.4 Dynamic Debugging](#dynamic-debugging)
-   [10 Disabling printk messages at compile
    time](#disabling-printk-messages-at-compile-time)
-   [11 References and external links](#references-and-external-links)

## Usage

printk works more or less the same way as printf in userspace, so if you
ever debugged your userspace program using printf, you are ready to do
the same with your kernel code, e.g. by adding:

    printk("My Debugger is Printk\n");

This wasn't that difficult, was it?

Usually you would print out some more interesting information like

    printk("Var1 %d var2 %d\n", var1, var2);

just like in userspace.

In order to see the kernel messages, just use the

    $ dmesg

command in one of your shells - this one will print out the whole kernel
log buffer to you.


 Most of the conversion specifiers supported by the user-space library
routine printf() are also available in the kernel; there are some
notable additions, including "%pf", which will print the symbol name in
place of the numeric pointer value, if available.

The supported format strings are quite extensively documented in
[Documentation/printk-formats.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/printk-formats.txt;hb=HEAD)

However please **note**: always use *%zu*, *%zd* or *%zx* for printing
*size\_t* and *ssize\_t* values. ssize\_t and size\_t are quite common
values in the kernel, so please use the *%z* to avoid annoying compile
warnings.



* * * * *

**Author's practical advice:**
 If you want to debug an oops (e.g caused by releasing a resource twice)
in your driver and you don't have a clue where the oops happens, simply
add this line

    printk(KERN_ALERT "DEBUG: Passed %s %d \n",__FUNCTION__,__LINE__);

after each possibly offending statement. Recompile and (re-)load the
module and trigger the error condition - your log now shows you the last
line that was successfully executed before the oops happened.

Of course you should **remove** these 'rude' statements before shipping
your module ;)

* * * * *



## Log Levels

If you look into real kernel code you will always see something like:

    printk(KERN_ERR "something went wrong, return code: %d\n",ret);

where "*KERN\_ERR*" is one of the eight different log levels defined in
[include/linux/kern\_levels.h](http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/linux/kern_levels.h?id=HEAD)
and specifies the severity of the error message.

Note that there is **NO** comma between the *KERN\_ERR* and the format
string (as the preprocessor concatenates both strings)

The log levels are:

<table>
<thead>
<tr class="header">
<th align="left">Name</th>
<th align="left">String</th>
<th align="left">Meaning</th>
<th align="left">alias function</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">KERN_EMERG</td>
<td align="left">&quot;0&quot;</td>
<td align="left">Emergency messages, system is about to crash or is unstable</td>
<td align="left">pr_emerg</td>
</tr>
<tr class="even">
<td align="left">KERN_ALERT</td>
<td align="left">&quot;1&quot;</td>
<td align="left">Something bad happened and action must be taken immediately</td>
<td align="left">pr_alert</td>
</tr>
<tr class="odd">
<td align="left">KERN_CRIT</td>
<td align="left">&quot;2&quot;</td>
<td align="left">A critical condition occurred like a serious hardware/software failure</td>
<td align="left">pr_crit</td>
</tr>
<tr class="even">
<td align="left">KERN_ERR</td>
<td align="left">&quot;3&quot;</td>
<td align="left">An error condition, often used by drivers to indicate difficulties with the hardware</td>
<td align="left">pr_err</td>
</tr>
<tr class="odd">
<td align="left">KERN_WARNING</td>
<td align="left">&quot;4&quot;</td>
<td align="left">A warning, meaning nothing serious by itself but might indicate problems</td>
<td align="left">pr_warning</td>
</tr>
<tr class="even">
<td align="left">KERN_NOTICE</td>
<td align="left">&quot;5&quot;</td>
<td align="left">Nothing serious, but notably nevertheless. Often used to report security events.</td>
<td align="left">pr_notice</td>
</tr>
<tr class="odd">
<td align="left">KERN_INFO</td>
<td align="left">&quot;6&quot;</td>
<td align="left">Informational message e.g. startup information at driver initialization</td>
<td align="left">pr_info</td>
</tr>
<tr class="even">
<td align="left">KERN_DEBUG</td>
<td align="left">&quot;7&quot;</td>
<td align="left">Debug messages</td>
<td align="left">pr_debug, pr_devel if DEBUG is defined</td>
</tr>
<tr class="odd">
<td align="left">KERN_DEFAULT</td>
<td align="left">&quot;d&quot;</td>
<td align="left">The default kernel loglevel</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">KERN_CONT</td>
<td align="left">&quot;&quot;</td>
<td align="left">&quot;continued&quot; line of log printout (only done after a line that had no enclosing \n) <a href="http://lwn.net/Articles/252651/">[1]</a></td>
<td align="left">pr_cont</td>
</tr>
</tbody>
</table>

Note that the actual values of the log levels are prepended by the
KERN\_SOH character whose ASCII value is '\\001'. Read the source for
more details.


 The pr\_\* macros (with exception of pr\_debug) are simple shorthand
definitions in *include/linux/printk.h* for their respective printk call
and should probably be used in newer drivers.

*pr\_devel* and *pr\_debug* are replaced with *printk(KERN\_DEBUG ...*
if the kernel was compiled with *DEBUG*, otherwise replaced with an
empty statement.

For drivers the pr\_debug should not be used anymore (use dev\_dbg
instead).


 If you don't specify a log level in your message it defaults to
*DEFAULT\_MESSAGE\_LOGLEVEL* (usually *"4"*=*KERN\_WARNING*) which can
be set via the *CONFIG\_DEFAULT\_MESSAGE\_LOGLEVEL* kernel config option
(*make menuconfig-\> Kernel Hacking -\> Default message log level*)


 The log level is used by the kernel to determine the importance of a
message and to decide whether it should be presented to the user
immediately, by printing it to the current console (where console could
also be a serial line or even a printer, not an xterm).

For this the kernel compares the log level of the message to the
*console\_loglevel* (a kernel variable) and if the priority is higher
(i.e. a lower value) than the *console\_loglevel* the message will be
printed to the current console.

To determine your current *console\_loglevel* you simply enter:

    $ cat /proc/sys/kernel/printk
        7       4       1       7
        current default minimum boot-time-default

The first integer shows you your current console\_loglevel; the second
the default log level that you have seen above.


 To change your current console\_loglevel simply write to this file, so
in order to get all messages printed to the console do a simple

    # echo 8 > /proc/sys/kernel/printk

and every kernel message will appear on your console.

Another way to change the console log level is to use *dmesg* with the
*-n* parameter

    # #set console_loglevel to print KERN_WARNING (4) or more severe messages
    # dmesg -n 5

Only messages with a value lower (**not** lower equal) than the
console\_loglevel will be printed.

You can also specify the console\_loglevel at boot time using the
*loglevel* boot parameter. (see
[Documentation/kernel-parameters.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/kernel-parameters.txt;hb=HEAD#l1334)
for more details)

* * * * *

**Author's practical advice:**
 Of course you should always specify an appropriate log level for your
messages, but for **debugging**, I guess most developers leave the
console\_loglevel unchanged and simply use KERN\_ERR or KERN\_CRIT to
ensure the message reaches the console.

    pr_err("REMOVE ME: my debug statement that I swear to remove when I'm done\");

Please make sure to remove these 'inappropriately' tagged messages
before shipping the module ;)

* * * * *


 *KERN\_CONT* and *pr\_cont* are special cases since they do not specify
an urgency but rather indicate a 'continued message' e.g.:

    printk(KERN_ERR "Doing something was ");
    /* <100 lines of whatever>*/
    if (success)
       printk(KERN_CONT "successful\n");
    else
       printk(KERN_CONT "NOT successful\n");

    -> "Doing something was successful"

**Important Note:** *KERN\_CONT* and *pr\_cont* should only be used by
core/arch code during early bootup (a continued line is not SMP-safe
otherwise).[[2]](http://lwn.net/Articles/252651/)

## Rate limiting and one time messages

Occasionally you have to insert a message in a section which gets called
quite often. This not only might have a severe performance impact, it
also could overwrite and spam your kernel buffer so it should be
avoided.

As always the kernel already provides you with nice functions that solve
your problems:

    printk_ratelimited(...)

and

    printk_once(...)

*printk\_once* is fairly trivial - no matter how often you call it, it
prints once and never again.

*printk\_ratelimited* is a little bit more complicated - it prints by
default not more than 10 times in every 5 seconds (for each function it
is called in).

If you need other values for the maximum burst count and the timeout,
you can always setup your own ratelimit using the
*DEFINE\_RATELIMIT\_STATE* macro and the *\_\_ratelimit* function - see
the implementation of *printk\_ratelimited* for an example.

Be sure to *\#include \<kernel/ratelimit.h\>* in order to use
*printk\_ratelimited()*

Both functions have also their *pr\_\** equivalents like
*pr\_info\_ratelimited* for *printk\_ratelimited(KERN\_INFO...* and
*pr\_crit\_once* for *printk\_once(KERN\_CRIT...*


 **Note: both did not work as expected in my tests here, will probably
investigate further**

## Printk from userspace

Sometimes, especially when doing automated testing, it is quite useful
to insert some messages in the kernel log buffer in order to annotate
what's going on.

It is as simple as

    # echo "Hello Kernel-World" > /dev/kmsg

Of course this messages gets the default log level assigned, if you want
e.g. to issue a KERN\_CRIT message you have to use the string
representation of the log level - in this case "2"

    # echo "2Writing critical printk messages from userspace" >/dev/kmsg

The message will appear like any other **kernel** message - there is
**no way** to distinguish them!

**Note:** Don't confuse this with printf - we are printing a kernel
message from userspace here.

If /dev/kmsg does not exist, it can be created with: 'mknod -m 600
/dev/kmsg c 1 11'

## Internals / Changing the size of the printk buffer

Printk is implemented by using a ring buffer in the kernel with a size
of *\_\_LOG\_BUF\_LEN* bytes where *\_\_LOG\_BUF\_LEN* equals *(1 \<\<*
CONFIG\_LOG\_BUF\_SHIFT)*(see*
[kernel/printk.c](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=kernel/printk.c;hb=HEAD)
for details).

You can specify the size of the buffer in your kernel config by setting
*CONFIG\_LOG\_BUF\_SHIFT* to an appropriate value (e.g. 17 for 128Kb)
(*make menuconfig -\> General Setup -\> Kernel log buffer size*).

Using a ring buffer implies that older messages get overwritten once the
buffer fills up, but this is only a minor drawback compared to the
robustness of this solution (i.e. minimum memory footprint, callable
from every context, not many resources wasted if nobody reads the
buffer, no filling up of disk space/ram when some kernel process goes
wild and spams the buffer, ...). Using a reasonably large buffer size
should give you enough time to read your important messages before they
are overwritten.

**Note:** dmesg reads by default a buffer of max 16392 bytes, so if you
use a larger logbuffer you have to invoke dmesg with the *-s* parameter
e.g.:

    ### CONFIG_LOG_BUF_SHIFT 17 = 128k
    $ dmesg -s 128000

The kernel log buffer is accessible for reading from userspace by
*/proc/kmsg*. */proc/kmsg* behaves more or less like a FIFO and blocks
until new messages appear.


 **Please note** - reading from */proc/kmsg* consumes the messages in
the ring buffer so they may not be available for other programs. It is
usually a good idea to let *klogd* or *syslog* do this job and read the
content of the buffer via *dmesg*.

## Pros and Cons

The main advantage of printk over other debugging solutions is that it
requires no sophisticated setup and can be called anywhere from any
time. Printk can be called while holding a lock, from interrupt and
process context, is SMP safe and does not need any special preparation.
It is just there and just works. The only precondition is that you have
some kind of working console to display the messages.

For the early stages in the boot process, where no console is available
yet, there is a special function named *early\_printk*, this function
writes directly to the VGA buffer or a serial line but otherwise works
just like printk -- you have to enable this function by setting
*CONFIG\_EARLY\_PRINTK* in your kernel config (*make menuconfig -\>
Kernel Hacking -\> Early printk*).

The major drawback is that printk is quite static, so you have to figure
out what you want to trace beforehand and if you want to trace something
different you have to recompile your code - which can become quite
cumbersome. (And of course printk is not interactive at all, so you
can't modify any variables or the like.)

The other drawback is that printing usually consumes quite some
processing power and io time, so if you're trying to debug a timing
critical section or a timing bug, you're probably out of luck.

## Debugging early boot problems

### Accessing the printk buffer after a silent hang on boot

Sometimes, if the kernel hangs early in the boot process, you get no
messages on the console before the hang. However, there may still be
messages in the printk buffer, which can give you an idea of where the
problem is.

The kernel starts putting messages into the printk buffer as soon as it
starts. They stay buffered there until the console code has a chance to
initialize the console device (often the serial port for embedded
devices). Even though these messages are not printed before the hang, it
is still possible in some circumstances to dump the printk buffer and
see the messages.

The tricky parts of doing this are:

1.  using a warm reset (if possible) so the memory contents are not lost
    when transitioning from the stuck kernel to the bootloader. You
    *can* do a cold boot, but if the memory is left unpowered for very
    long, you will start to see memory corruption.
2.  figuring out the address to use in the bootloader, based on the
    address of \_\_log\_buf in System.map. You will probably need to
    subtract the value of CONFIG\_PAGE\_OFFSET from the \_\_log\_buf
    address. However, there may be other offsets present as well (such
    as TEXT\_OFFSET). Sometimes you can find the buffer by dumping the
    memory in a suspected area and locating the kernel messages visually
    in the dump. Note that the mapping offset between the kernel map of
    memory and the bootloader map of memory should not change. So once
    you figure it out you are set.

Quinn Jensen writes:

Something I've found handy when the console is silent is to dump the
printk buffer from the boot loader. To do it you have to know how your
boot loader maps memory compared to the kernel.

#### Redboot example on a Freescale ADS board

Quinn says: Here's what I do with Redboot on i.MX31:

    fgrep printk_buf System.map

this shows the linked address of the printk\_buf, e.g.:

    c02338f0 b printk_buf.16194

The address "c02338f0" is in kernel virtual, which, in the case of
i.MX31 ADS, redboot will have mapped to 0x802338f0. So, after resetting
the target board, but without letting it try to boot again, at the
redboot prompt:

    dump -b 0x802338f0 -l 10000

And you see the printk buffer that never got flushed to the UART.
Knowing what's there can be **very** useful in debugging your console.

#### U-boot example on an OMAP OSK board

Tim Bird tried these steps and they worked:

    grep __log_buf System.map

or

    grep __log_buf /proc/kallsyms

These show:

    c0352d88 B __log_buf

In the case of the OSK, this address maps to 0x10352d88. So I reset the
target board and use the following:

    OMAP5912 OSK # md 10352d88
    10352d88: 4c3e353c 78756e69 72657620 6e6f6973    <5>Linux version
    10352d98: 362e3220 2e32322e 612d3631 6e5f706c     2.6.22.16-alp_n
    10352da8: 7428206c 64726962 6d697440 6b736564    l (tbird@timdesk
    10352db8: 2e6d612e 796e6f73 6d6f632e 67282029    .am.sony.com) (g
    10352dc8: 76206363 69737265 33206e6f 342e342e    cc version 3.4.4
    10352dd8: 34232029 45525020 54504d45 65755420    ) #4 PREEMPT Tue
    ...

#### Grub

Grub also supports a dump command which you can invoke from the grub
prompt.

    dump  [ -s offset ] [-n length] { FILE | (mem) }



### Using CONFIG\_DEBUG\_LL and printascii() (ARM only)

If the kernel fails before the serial console is enabled, you can use
CONFIG\_DEBUG\_LL to add extra debug output routines to the kernel.
These are printascii, printch and printhex. These routines print
directly to the serial port, bypassing the console code, and are
available earlier in machine initialization.

To see printks earlier in the boot sequence (before the console is
initialized), set CONFIG\_DEBUG\_LL=y and CONFIG\_EARLY\_PRINTK=y.

Alternatively, add your own calls to printascii, printch, and printhex
where you believe the problems are located.

Here is an e-mail exchange seen on the linux-embedded mailing list (with
answer by George
Davis):[[3]](http://www.mail-archive.com/linux-embedded@vger.kernel.org/msg00223.html)

    > When we try to boot a 2.6.21 kernel after uncompressing the kernel the boot process dies somehow.
    > We've figured out so far that the kernel dies somewhere between the gunzip and start_kernel.

    Try enabling DEBUG_LL to see if it's an machine ID error.  If you see:

    Error: unrecognized/unsupported processor variant.

    or:

    Error: unrecognized/unsupported machine ID...

    Then you either don't have proper processor support enabled for your target or your bootloader is passing in the wrong machine number.

    If you still don't see anything, try hacking printk.c to call printascii() (enabled for the DEBUG_LL case) to print directly to the serial port w/o a driver, etc.,.  You can find more details on these low-level debugging hacks via a little googling...

## NetConsole

Sometimes you are in the unlucky situation that the machine crashes or
hangs and you have no way to access the console afterwards, e.g. the
graphic driver hangs and and the kernel dies soon after. In this case
you could either hook up a serial line to your crashing target machine
(if a serial port is available) or use the kernels netconsole feature to
enable printk logging via UDP.

In order to use it you have to enable the *CONFIG\_NETCONSOLE* kernel
config option (*make menuconfig -\> Device Drivers -\> Network device
support -\> Network core driver support -\> Network console logging
support*) and configure it appropriately by using the *netconsole*
configuration parameter

    netconsole=[src-port]@[src-ip]/[<dev>],[tgt-port]@<tgt-ip>/[tgt-macaddr]
        where
            src-port      source for UDP packets (defaults to 6665)
            src-ip        source IP to use (interface address)
            dev           network interface (eth0)
            tgt-port      port for logging agent (6666)
            tgt-ip        IP address for logging agent
            tgt-macaddr   ethernet MAC address for logging agent (broadcast)

e.g. specify at kernel commandline (in your bootloader)

    linux netconsole=4444@10.0.0.1/eth1,9353@10.0.0.2/12:34:56:78:9a:bc

to send messages from 10.0.0.1 port 4444 via eth1 to 10.0.0.2 port 9353
with the MAC 12:34:56:78:9a:bc

or while loading the module e.g

    # insmod netconsole netconsole=@/,@10.0.0.2/

to send messages via broadcast to 10.0.0.2 port 6666

On the other machine you can now simply fire up

    # netcat -u -l -p <port>

e.g.

    $ netcat -u -l -p 6666

and see the printk messages from your target dribbling in.

If you don't see any messages you might have to set the
console\_loglevel to a higher value (see above) or test the connection
via telnet e.g. from the target type

    $ telnet 10.0.0.2 6666



### Netconsole resources

See
[Documentation/networking/netconsole.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/networking/netconsole.txt;hb=HEAD)
for more details.

See [Sarah Sharp's blog entry about using
netconsole](http://sarah.thesharps.us/2009-02-22-09-00)

## Misc

### Dmesg / Clearing the buffer

    dmesg -c

clears the dmesg buffer. Sometimes it is nice to start with a blank
buffer, so you will only see new messages when you invoke *dmesg*

### Printk Timestamps

    CONFIG_PRINTK_TIME

Setting this kernel config option prepends every printk statement with a
timestamp representing the time since boot. This is particularly useful
to get a general idea about the timings of your code.

You can also specify an argument on the kernel command line to enable
this, or you can enable it any time at runtime by doing the following:

     $echo 1 >/sys/module/printk/parameters/time

Also, there are tools available to use the information to show relative
times between printks (scripts/show\_delta) and create graphs of
durations in the kernel (scripts/bootgraph.pl)

See [Printk Times](http://eLinux.org/Printk_Times "Printk Times") for more details

### Printing buffers as hex

If you want to print a buffer as hex within the kernel, don't reinvent
the wheel use *printk\_hex\_dump\_bytes()* instead.

    print_hex_dump_bytes(const char *prefix_str, int prefix_type, const void *buf, size_t len)

this function prints a buffer as hex values to the kernel log buffer
(with level KERN\_DEBUG) Example:

    Kernel Code:
    char mybuf[] = "abcdef";
    print_hex_dump_bytes("", DUMP_PREFIX_NONE, mybuf, ARRAY_SIZE(mybuf));

    dmesg output:
    61 62 63 64 65 66 00                             abcdef.

If you need something more sophisticated and flexible maybe have a look
at *print\_hex\_dump()* and *hex\_dump\_to\_buffer()*

### Dynamic Debugging

It is also possible to enable/disable debug information at runtime using
the dynamic debug functionality of the kernel. For this the
*CONFIG\_DYNAMIC\_DEBUG* kernel config option must be set. See
[Documentation/dynamic-debug-howto.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/dynamic-debug-howto.txt;hb=HEAD)
for more information.

## Disabling printk messages at compile time

There is a configuration option which allows you to turn off all the
printk messages in the whole kernel (*CONFIG\_PRINTK*). This reduces the
size the kernel, usually by at least 100k, since all message strings are
not compiled into the kernel binary image.

However, it also means you get absolutely no output from the kernel
while it is running. Disabling kernel printk messages is usually the
last thing you do when you are tuning your kernel for size.

## References and external links

-   [Linux Kernel
    Development](http://eLinux.org/Linux_Kernel_Development_-_by_Robert_Love "Linux Kernel Development - by Robert Love"),
    Robert Love, 3rd Edition, Chapter 18 Debugging
-   [Linux Device
    Drivers](http://eLinux.org/Linux_Device_Drivers "Linux Device Drivers"), Corbet,
    Rubini and Kroah-Hartmann, 3rd Edition, Chapter 4 Section 2
-   [Essential Linux Device
    Drivers](http://eLinux.org/Essential_Linux_Device_Drivers "Essential Linux Device Drivers")



-   [Documentation/printk-formats.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/printk-formats.txt;hb=HEAD)
-   [Documentation/dynamic-debug-howto.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/dynamic-debug-howto.txt;hb=HEAD)
-   [Documentation/networking/netconsole.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/networking/netconsole.txt;hb=HEAD)
-   [kernel/printk.c](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=kernel/printk.c;hb=HEAD)
    Implementation of printk and others
-   [include/linux/printk.h](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=include/linux/printk.h;hb=HEAD)
    printk header file
-   [include/linux/kern\_levels.h](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=include/linux/kern_levels.h;hb=HEAD)
    logging levels header file
-   [Blog Entry about the different %p format
    specifiers](http://www.embedded-bits.co.uk/2010/printk-format-specifiers/)
-   [LWN.net: The perils of pr\_info()](http://lwn.net/Articles/487437/)
-   [Kernel logging: APIs and implementation, Tim Jones (for
    IBM)](http://www.ibm.com/developerworks/linux/library/l-kernel-logging-apis/index.html)
    (nice article)


 Some page related to printk:

-   [Printk Times](http://eLinux.org/Printk_Times "Printk Times") - has information about
    how to turn on timestamps for each printk message
    -   [printk time stamps
        sample](http://eLinux.org/Printk_Times_Sample_4 "Printk Times Sample 4")
-   [printk size information](http://eLinux.org/Printk_Size_Info "Printk Size Info")
-   [Do Printk](http://eLinux.org/Do_Printk "Do Printk") - has information about a method
    of disabling printk messages on a per-module basis


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")
-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")
-   [Printk](http://eLinux.org/Category:Printk "Category:Printk")

