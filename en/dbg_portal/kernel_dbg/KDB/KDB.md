> From: [eLinux.org](http://eLinux.org/KDB "http://eLinux.org/KDB")


# KDB



## Contents

-   [1 Introduction and basic
    resources](#introduction-and-basic-resources)
    -   [1.1 Older Information](#older-information)
-   [2 General Information](#general-information)
    -   [2.1 Kernel Versions supported](#kernel-versions-supported)
-   [3 Kernel configuration](#kernel-configuration)
    -   [3.1 Config variables](#config-variables)
    -   [3.2 Steps](#steps)
-   [4 Enabling kdb](#enabling-kdb)
    -   [4.1 At runtime](#at-runtime)
    -   [4.2 At boot time (via kernel command
        line)](#at-boot-time-via-kernel-command-line)
-   [5 Invoking kdb](#invoking-kdb)
    -   [5.1 Invoking with Magic SysRq
        'g'](#invoking-with-magic-sysrq-g)
    -   [5.2 Invocation by panic](#invocation-by-panic)
    -   [5.3 Invocation by breakpoint](#invocation-by-breakpoint)
-   [6 Using gdb to see the kernel source
    listing](#using-gdb-to-see-the-kernel-source-listing)
-   [7 KDB environment variables](#kdb-environment-variables)
-   [8 Hints and tips](#hints-and-tips)
    -   [8.1 Command line completion](#command-line-completion)
    -   [8.2 Defining a set of commands](#defining-a-set-of-commands)
    -   [8.3 Executing commands on kdb
        initialization](#executing-commands-on-kdb-initialization)
    -   [8.4 Piping command results through
        'grep'](#piping-command-results-through-grep)
    -   [8.5 Command history](#command-history)
-   [9 Feature extension notes (by
    Tim)](#feature-extension-notes-by-tim)
    -   [9.1 internals](#internals)

## Introduction and basic resources

Here is some information about KDB - the in-kernel debugger for the
Linux kernel.

The KDB and KGDB official wiki:
[https://kgdb.wiki.kernel.org/](https://kgdb.wiki.kernel.org/) (this
only has 2 pages?)

Jason Wessel is the current KDB maintainer. Here is a presentation from
him at LinuxCon 2010 (August 2010):
[http://kernel.org/pub/linux/kernel/people/jwessel/dbg\_webinar/State\_Of\_kernel\_debugging\_LinuxCon2010.pdf](http://kernel.org/pub/linux/kernel/people/jwessel/dbg_webinar/State_Of_kernel_debugging_LinuxCon2010.pdf)

Here are some videos showing use of KDB and KGDB:

-   video 1 of 6:
    [http://www.youtube.com/watch?v=V6Qc8ppJ\_jc](http://www.youtube.com/watch?v=V6Qc8ppJ_jc)
    - example of a call to panic from a test module (without a debugger)
-   video 2 of 6:
    [http://www.youtube.com/watch?v=LqAhY8K3XzI](http://www.youtube.com/watch?v=LqAhY8K3XzI)
    - example of catching the panic with KDB, and looking up the source
    line with gdb
-   video 3 of 6:
    [http://www.youtube.com/watch?v=bBEh\_UduX04](http://www.youtube.com/watch?v=bBEh_UduX04)
    - example of a bad access request, and looking up the source line
    with gdb
-   video 4 of 6:
    [http://www.youtube.com/watch?v=MfJU2E0aJwg](http://www.youtube.com/watch?v=MfJU2E0aJwg)
    - example of using a hardware breakpoint with kdb
-   video 5 of 6:
    [http://www.youtube.com/watch?v=sWiHV5mt8\_k](http://www.youtube.com/watch?v=sWiHV5mt8_k)
    - use an address watch (hardware watchpoint) using kgdb (data access
    hardware breakpoint on tp\_address\_ref)
-   video 6 of 6:
    [http://www.youtube.com/watch?v=nnopzcwvLTs](http://www.youtube.com/watch?v=nnopzcwvLTs)
    - use of kgdb over serial - Start up the agent-proxy and connect and
    hit a breakpoint a sys\_sync

Documentation, up-to-date as of 2010, for KDB and KGDB is at:
[http://kernel.org/pub/linux/kernel/people/jwessel/kdb/](http://kernel.org/pub/linux/kernel/people/jwessel/kdb/)

### Older Information

See
[http://www.ibm.com/developerworks/linux/library/l-kdbug/](http://www.ibm.com/developerworks/linux/library/l-kdbug/)
for a tutorial for the 2.4.20 kernel (from June 2003)

Here's an article from 2002 on KDB vs. KGDB:
[http://kerneltrap.org/node/112](http://kerneltrap.org/node/112) It has
a good discussion excerpt between Andrew Morton and Keith Owens about
the relative merits of KDB versus KGDB.

## General Information

### Kernel Versions supported

kgdb was added to the mainline Linux kernel in version 2.6.26.

kdb support was added to the mainline Linux kernel in version 2.6.35.

Before those versions, kgdb and kdb were available as patches which
could be applied to the Linux kernel source.



## Kernel configuration

The following descriptions are for a 2.6.35 kernel, using KDB over a
serial line between host and target:

All these options on are the "Kernel Hacking" menu.

In order to support KDB, "KGDB" support must be turned on first (even if
you aren't using kgdb/gdb)

### Config variables

-   CONFIG\_DEBUG\_KERNEL=Y - includes debug information in the kernel
    compilation - required for basic kernel debugging support
-   CONFIG\_KGDB=Y - turn on basic kernel debug agent support
-   CONFIG\_KGDB\_SERIAL\_CONSOLE=Y - to share a serial console with
    kgdb.
    -   Sysrq-g must be used to break in initially.
    -   Selecting this will automatically set:
        -   CONFIG\_CONSOLE\_POLL=Y
        -   CONFIG\_MAGIC\_SYSRQ=Y - turn on MAGIC-SYSRQ key support
-   CONFIG\_KGDB\_KDB=Y - actually turn on the KDB debugger feature
-   CONFIG\_DEBUG\_RODATA=N - you must disable this on x86 in order to
    set breakpoints on code or data

Optional other configuration settings:

-   CONFIG\_FRAME\_POINTER=Y - this allows for better backtrace support
    in KDB
-   CONFIG\_KALLSYMS=Y - this adds symbolic information to the kernel,
    useful to see symbols instead of addresses
-   CONFIG\_KDB\_KEYBOARD - use KDB with an attached keyboard (not for
    use with serial console)
-   CONFIG\_KGDB\_TESTS - used to turn on kgdb internal self-tests - see
    the config help for this for more information

### Steps

To turn on KDB over serial console, do the following:

-   'make menuconfig'
    -   go to "Kernel Hacking" sub-menu
    -   turn on "KGDB: kernel debugger", and choose "\<Select\>" to go
        to sub-menu
    -   verify that "KGDB: use kgdb over the serial console" is set
    -   set "KGDB\_KDB: include kdb frontend for kgdb"
-   save and exit

Results:

    []$ diffconfig
    KGDB n -> y
    +CONSOLE_POLL y
    +KDB_KEYBOARD n
    +KGDB_KDB y
    +KGDB_SERIAL_CONSOLE y
    +KGDB_TESTS n

## Enabling kdb

### At runtime

Once the kernel is compiled with kdb support and is running on your
target board, you need to enable it. This can be done on a running
system, binding the kdb/kgdb feature to a serial port, by writing a
value into the sys filesystem.

If your machine starts a serial console on ttyS0, you can bind kdb/kgdb
to this serial console by writing the string "ttyS0" to
/sys/module/kgdboc/parameters/kgdboc. The kernel will respond with a
message indicating that that driver is registered.

    $ echo ttyS0 >/sys/module/kgdboc/parameters/kgdboc
    kgdb: Registered I/O driver kgdboc.

### At boot time (via kernel command line)

You can enable kdb support in your kernel at boot time by using the
'kgdboc' option on the kernel command line. Normally, you specify the
tty device name, followed by the serial port speed.

    kgdboc=ttyS0,115200

## Invoking kdb

Once the kernel is running, and the kgdb/kdb is bound to the serial
console, you can invoke the debugger in numerous ways.

First, you can enter the debugger using a [Magic
SysRq](http://en.wikipedia.org/wiki/Magic_SysRq_key) command.

kdb will also be entered automatically if the kernel panics.

Finally, you can set a breakpoint (either hardware or software), such
that the debugger is invoked when the breakpoint condition is met. For a
code breakpoint, this means when the instruction is executed at the
breakpoint location, and for a data breakpoint, when the particular
access is made at the breakpoint address.

### Invoking with Magic SysRq 'g'

To invoke the debugger using the Magic SysRq command, you use the 'g'
command, which can be issued any of the ways supported by the Magic
SysRq feature. This can be done by 1) typing the key sequence on a
connected keyboard, 2) echoing a value to /proc/sysrq-trigger, or 3)
sending a break key sequence through the serial console

Examples:

-   sysrq trigger from local shell, via procfs: 'echo g
    \>/proc/sysrq-trigger'
-   sysrq trigger via serial console break sequence:
    -   in minicom, type 'ctrl-a f g' (quickly)
    -   in telnet, through a server that supports sending a break: type

### Invocation by panic

When a kernel panic occurs, then something has gone seriously wrong and
the kernel automatically enters kdb. From here you can look at memory,
do a traceback, examine registers, and do other operations to find out
more about the state of the system and debug the problem.

### Invocation by breakpoint

To enter kdb using a breakpoint, first invoke kdb using the Magic SysRq
key (see above), then set a breakpoint. Then type 'go' to continue
execution. When the breakpoint is hit, the debugger shell will appear.

In the example that follows, items in italics are commands typed by a
user. Items following a '\$' are commands entered at a shell command
(normal Linux user-space runtime), and items following 'kgdb\>' are
commands entered at the kdb interactive shell.

    $ echo g >/proc/sysrq-trigger
    SysRq : DEBUG

    Entering kdb (current=0xdfdff040, pid 71) due to Keyboard Entry
    kdb> bp sys_sync+4
    Instruction(i) BP #0 at 0xc00c9f00 (sys_sync+0x4)
       is enabled  addr at 00000000c00c9f00, hardtype=0 installed=0

    kdb> go
    $ sync

    Entering kdb (current=0xdfdaa360, pid 72) due to Breakpoint @ 0xc00c9f00
    kdb> bt
    Stack traceback for pid 72
    0xdfdaa360       72       71  1    0   R  0xdfdaa560 *sync
    [<c0028cb4>] (unwind_backtrace+0x0/0xe4) from [<c0026d50>] (show_stack+0x10/0x14)
    [<c0026d50>] (show_stack+0x10/0x14) from [<c0079e78>] (kdb_show_stack+0x58/0x80)
    [<c0079e78>] (kdb_show_stack+0x58/0x80) from [<c0079f1c>] (kdb_bt1.clone.0+0x7c/0xcc)
    [<c0079f1c>] (kdb_bt1.clone.0+0x7c/0xcc) from [<c007a240>] (kdb_bt+0x2d4/0x338)
    [<c007a240>] (kdb_bt+0x2d4/0x338) from [<c0078328>] (kdb_parse+0x4d4/0x5f8)
    [<c0078328>] (kdb_parse+0x4d4/0x5f8) from [<c0078a8c>] (kdb_main_loop+0x448/0x6b0)
    [<c0078a8c>] (kdb_main_loop+0x448/0x6b0) from [<c007acb4>] (kdb_stub+0x210/0x398)
    [<c007acb4>] (kdb_stub+0x210/0x398) from [<c0073280>] (kgdb_handle_exception+0x384/0x574)
    [<c0073280>] (kgdb_handle_exception+0x384/0x574) from [<c0028518>] (kgdb_brk_fn+0x18/0x20)
    [<c0028518>] (kgdb_brk_fn+0x18/0x20) from [<c0022198>] (do_undefinstr+0x10c/0x1a8)
    [<c0022198>] (do_undefinstr+0x10c/0x1a8) from [<c0022b84>] (__und_svc+0x44/0x60)
    Exception stack(0xdfe09f58 to 0xdfe09fa0)
    9f40:                                                       00000000 bec93e74
    9f60: 000437ac 00034738 00000001 bec93e74 00000049 00000024 c00230e8 dfe08000
    9f80: 00000000 bec93e54 00000000 dfe09fa0 c0022f40 c00c9f00 80000013 ffffffff
    [<c0022b84>] (__und_svc+0x44/0x60) from [<c00c9f00>] (sys_sync+0x4/0x28)
    [<c00c9f00>] (sys_sync+0x4/0x28) from [<c0022f40>] (ret_fast_syscall+0x0/0x30)
    kdb>

This example shows an invocation of kdb, followed by setting a
breakpoint, then resuming execution with 'go'. Then, at the Linux
user-space shell, the 'sync' command is run to cause the breakpoint to
occur. When kdb is entered due to the breakpoint, then 'bt' is run to
get a backtrace from the stack of the current process.

## Using gdb to see the kernel source listing

You can use the addresses printed out in kdb, with a host-side gdb
session, to see the source code or assembly instructions around a
particular address.

The target address can come from a backtrace or register dump (e.g.
instruction pointer).

To load the source for a kernel, start gdb (or the appropriate
arch-specific gdb) with the vmlinux that matches the image running on
target. The kernel should have been compiled with debug symbols
(CONFIG\_DEBUG\_KERNEL=y). gdb will start, and load the symbol
information for the kernel.

Use the following commands to see various bits of information:

-   source file and line number for an instruction address
    -   *info line \*0x\<target\_addr\>*
-   source lines around an instruction address
    -   *list \*0x\<target\_addr\>*
-   assembly instructions at an address
    -   *disas 0x\<target\_addr\>*, or
    -   *x/20i 0x\<target\_addr\>*

## KDB environment variables

Here are some environment variables supported by kdb (in 2.6.35):

-   LINES - set the number of lines for paging output from KDB (default
    24)
-   BTAPROMPT - prompt after each process in bta command (default 0)
-   LOGGING - if 1, echo all KDB output to the kernel log buffer (printk
    log) (default 0)
-   PROMPT - string to use for kdb interactive shell prompt (default
    '[%d]kdb\>' on SMP or 'kdb\>' on UP)
-   MOREPROMPT - string to use for kdb paged output prompt (default
    '[%d]more\>' on SMP or 'more\>' on UP)
-   RADIX - base used to print out (default 16)
-   MDCOUNT - number of lines of data for md command if not specified
    (default 8)
-   BYTESPERWORD - number of bytes per word for md command (default 4)
-   DTABCOUNT - number of symbols to display for tab completion (default
    30)
-   NOSECT - avoid displaying section information with md commands
    (default 1)
-   PS - specify a list of task states (one letter per state) for
    filtering the 'ps' command (default 'DRSTCZEU')
    -   letters can be used from the list: DRSTCZEUIMA, each letter
        corresponding to a task state (see the PS man page for task
        states)
        -   D = uninterruptible sleep
        -   R = running
        -   S = interruptible sleep
        -   T = stopped
        -   C = traced
        -   Z = exited and zombied
        -   E = exited and dead
        -   U = unrunnable
        -   I = idle
        -   M = daemon
        -   A = all

Unused args (in 2.6.35):

-   BTARGS - number of arguments to show in bt command (default 9)
    -   is used for argcount for internal routine kdb\_bt1, but argcount
        is never used in that routine
-   BTSYMARG - ??? [set in kdb\_cmds 'dumpall' and 'dumpcpu', but not
    used in code)
    -   appears to be an integer

## Hints and tips

### Command line completion

kdb supports command line completion using the tab key. While typing at
the interactive shell, you can press the tab key to get a list of
symbols to use as part of the command. If you type the first few letters
of a symbol name, then press the tab key, the shell will complete the
name for you. If more than one symbol matches what you have typed, then
a list is shown of matching symbols. The number of symbols shown is
controlled by the DTABCOUNT variable.

### Defining a set of commands

You can define a set of commands to be run as a group (in sequence),
using the 'defcmd' command. This group essentially becomes a new command
which you can run, using the indicated name.

The second two strings after the new command name are the Usage string
and the Description string. These appear in the online help when the
'help' or '?' commands are run.

Here is an example of the definition of a new command:

    defcmd dumpcommon "" "Common kdb debugging"
      set BTAPROMPT 0
      set LINES 10000
      -summary
      -cpu
      -ps
      -dmesg 600
      -bt
    endefcmd

A leading dash indicates to ignore any errors processing a command.

### Executing commands on kdb initialization

In the kernel source, you can place commands in the file 'kdb\_cmds'.
These commands will be executed by kdb on it's initialization. By
default, a few command sets are declared: 'dumpcommon', 'dumpall', and
'dumpcpu'.

### Piping command results through 'grep'

kdb includes a grep-like capability, which provides the ability to
filter command results using a pattern. To use this, type the regular
command, and at the end of the line add '| grep \<pattern\>', where
pattern is the pattern to match.

To see online help for this feature, type 'grephelp' at the kdb shell
prompt.

The pattern may include a very limited set of metacharacters:

      pattern or ^pattern or pattern$ or ^pattern$

And if there are spaces in the pattern, you may quote it:

      "pat tern" or "^pat tern" or "pat tern$" or "^pat tern$"

### Command history

You can access the command history by typing up-arrow and down-arrow,
and select a previous command to run.

If you hit \<enter\> without typing a command, sometimes (when it makes
sense) the last command run will be run again. For 'md' commands, the
next command will continue at the address where the last command left
off.

## Feature extension notes (by Tim)

This section just has some random notes on Tim Bird's investigation of
KDB (for kernel version 2.6.35)

Regular users of KDB can ignore this...

-   Can break on \_\_do\_user\_fault, to break into kdb on user process
    SIGSEGV (on ARM, anyway)
-   See CONFIG\_DEBUG\_USER (on ARM) for extra information shown and
    code paths used, on user-space faults

-   I can't set a breakpoint from kdb\_cmds (on kdb initialization)
    -   I get a hang (likely a panic before the console starts) on any
        breakpoint set on kdb initialization
        -   how to debug: 1) printk and logbuf visibility over reset? 2)
            use of qemu??

### internals

internal functions to retrieve environment variables:

-   kdbgetintenv()
-   kdbgetenv()
-   kdbgetulenv() - get unsigned long env variable


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

