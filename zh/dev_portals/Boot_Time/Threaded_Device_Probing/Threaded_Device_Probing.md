> From: [eLinux.org](http://eLinux.org/Threaded_Device_Probing "http://eLinux.org/Threaded_Device_Probing")


# Threaded Device Probing



This page describes Threaded device probing, which is a feature which
allows drivers in the Linux kernel to have their probes execute in
parallel threads. One of the most time-consuming parts of the boot up
sequence is the probing by device drivers for their hardware devices.

This patch was created by Greg Kroah-Hartman and with it he was able to
reduce the bootup time of the kernel on one machine by about 400
milliseconds.

## Original post and discussion

See [this article](http://lwn.net/Articles/192851/) for the original
description of this and a patch.

There was discussion about this
[here](http://groups.google.com/group/linux.kernel/browse_frm/thread/921bc0aebcf14d49/2dbc6c11ff212d4f?lnk=st&q=Multi-threaded+device+probing&rnum=1&hl=en#2dbc6c11ff212d4f).

## Kernel Option

Greg Kroah-Hartman posted a patch to LKML on Sep 25 2006 with a config
option to turn this on for the PCI bus. His post is at: [lkml
thread](http://lkml.org/lkml/2006/9/26/30)

The kernel option to turn on this feature for the PCI bus in Linux
version 2.6.18-rc4-mm1 (Andrew Morton's tree) is
CONFIG\_PCI\_MULTITHREAD\_PROBE.

## Status

This code was apparently never integrated into mainline. It appears to
be superceded by the [Asynchronous function
calls](http://eLinux.org/Asynchronous_function_calls "Asynchronous function calls") work.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

