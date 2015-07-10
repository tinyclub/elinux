> From: [eLinux.org](http://eLinux.org/Crash_Diagnostics "http://eLinux.org/Crash_Diagnostics")


# Crash Diagnostics



kernel crash debugging technique using "crash" utility.

## Introduction

Most frequent issue in debugging kernel programs is lack of information;
lack of information in terms of stack trace, kernel logs and crash
screen-shots. Crash utility provides solution for this. It provides gdb
like interface for debugging.

## Prerequisites

       vmlinux object file.

This is kernel image with debugging information. By default, we get
compressed kernel image with no debug information. For getting, vmlinux
object file, you need to install "kernel-debuginfo" rpm. If you want to
debug any module, make sure it is compiled with gcc flag '-g'.

## Installation

We receive crash utility as rpm.

       rpm name is of format: crash-$version.$arch.rpm

Here, \$version shows version number and \$arch shows system
architecture.

For getting crash dump: For getting crash dump, we need to add
"crashkernel" option to grub command line. i.e. we can have:

       ro root=LABEL=/1 rhgb quiet crashkernel=128M@16M

instead of,

       ro root=LABEL=/1 rhgb quiet

Here, parameter "crashkernel=128M@16M" reserves 128MB of physical memory
starting at 16MB. This reserved memory is used to preload and run the
capture kernel (i.e. to capture crash dump). This command line option
ensures that, whenever crash occurs, it stores crash dump at
"/var/crash" and they are stored according to date and time.

There are other options to get crash dump like diskdump, netdump, etc.

Running crash Utility: 1. Debugging last kernel panic:

      #crash <patht to vmlinux> /var/crash/crash_dump_name

2. Watching current running kernel:

       #crash

This will prompt to crash shell. Just as example, following are
commands:

       crash> help
       crash> bt                    ---> for backtrace
       crash> log                  ---> for dumping current system buffer

For more information on this, you can visit at:
[http://www.redhatmagazine.com/2007/08/15/a-quick-overview-of-linux-kernel-crash-dump-analysis/](http://www.redhatmagazine.com/2007/08/15/a-quick-overview-of-linux-kernel-crash-dump-analysis/)
[http://people.redhat.com/anderson/crash\_whitepaper/](http://people.redhat.com/anderson/crash_whitepaper/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

