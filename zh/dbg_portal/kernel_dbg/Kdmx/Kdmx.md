> From: [eLinux.org](http://eLinux.org/Kdmx "http://eLinux.org/Kdmx")


# Kdmx



## Contents

-   [1 overview](#overview)
-   [2 source location](#source-location)
-   [3 example 1 (simple)](#example-1-simple)
-   [4 example 2 (automate paths of gdb pty and terminal emulator
    pty)](#example-2-automate-paths-of-gdb-pty-and-terminal-emulator-pty)

## overview

If the target board has a single serial port then a proxy on the host is
needed to be share the target port between the console and kgdb.

kdmx (kgdb demux) is one of the available proxy programs.

## source location

The source is located in the agent-proxy git

     https://git.kernel.org/cgit/utils/kernel/kgdb/agent-proxy.git/
     git clone git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git/

## example 1 (simple)

This is a simple example, where I am using a USB serial port to connect
between my host and target.

I did all of the commands in "host window 1" before I did the commands
in "host window 2".

I did all of the commands in "host window 2" before I did the commands
in "host window 3".



    +---------------------  HOST  -------------------------------------+                +--  TARGET  --+
    |                                                                  |                |              |
    |                                                                  |                |              |
    v                                                                  v                v              v

    terminal  <---->  /dev/pty/29  <---->  +------+
    emulator                               |      |
                                           | kdmx |  <---->  serial port  <== cable ==> target console
    gdb  <--------->  /dev/pty/53  <---->  |      |          /dev/ttyUSB0
                                           +------+


 The absolute path of the kernel source directory is in
\${LINUX\_SOURCE}.

The path of the kernel build directory, relative to the kernel source
directory, is in \${KBUILD\_OUTPUT}

    $ echo ${LINUX_SOURCE}
    /xxx/linux--3.17

    $ echo ${KBUILD_OUTPUT}
    ../build/dragon_linus_3.17

    $ echo ${LINUX_SOURCE}/${KBUILD_OUTPUT}
    /xxx/linux--3.17/../build/dragon_linus_3.17

    -----  host window 1 - kdmx  -----

    $ export PS1='[1]: '
    [1]: ./kdmx -n -d -p/dev/ttyUSB0 -b115200
    serial port: /dev/ttyUSB0
    Initalizing the serial port to 115200 8n1
    /dev/pts/29 is slave pty for for terminal emulator
    /dev/pts/53 is slave pty for gdb

    -----  host window 2 - terminal emulator  -----

    # In this example, I am using the sysrq debug command instead of the
    # kernel command line 'kgdbwait' option to enter kgdb.
    #
    # The minicom "-o" option tells it not to initialize, so it does not
    # send the "Init string" (defaults to "At S7=45 S0=0...") when you run
    # minicom.

    $ export PS1='[2]: '
    [2]: minicom -o -w -p /dev/pts/29
    Welcome to minicom 2.5

    OPTIONS: I18n
    Compiled on May  2 2011, 10:05:24.
    Port /dev/tty8

    Press CTRL-A Z for help on special keys

    # Now in minicom, connected to the target console.
    # CONFIG_PRINTK_TIME=y, so timestamps will be added to
    # printk() messages to the console.

    $ export PS1='% '
    % cat /proc/version
    Linux version 3.17.0-dirty (frank@ussvlx) (gcc version 4.6.x-google 20120106 (prerelease) (GCC) ) #1 SMP PREEMPT Mon Oct 6 10:19:37 PDT 2014
    % echo g >/proc/sysrq-trigger
    [   24.246292] SysRq : DEBUG
    [   24.247184] Entering KGDB

    -----  host window 3 - gdb  -----

    $ export PS1='[3]: '
    [3]: echo ${CROSS_COMPILE}
    arm-eabi-
    [3]: cd ${LINUX_SOURCE}
    [3]: strings $KBUILD_OUTPUT/vmlinux | grep "^Linux version"
    Linux version 3.17.0-dirty (frank@ussvlx) (gcc version 4.6.x-google 20120106 (prerelease) (GCC) ) #1 SMP PREEMPT Mon Oct 6 10:19:37 PDT 2014
    Linux version
    [3]: ${CROSS_COMPILE}gdb $KBUILD_OUTPUT/vmlinux
    GNU gdb (GDB) 7.3.1-gg2
    Copyright (C) 2011 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "--host=x86_64-linux-gnu --target=arm-linux-android".
    For bug reporting instructions, please see:
    <http://www.gnu.org/software/gdb/bugs/>...
    Reading symbols from /xxx/git_linus/build/dragon_linus_3.17/vmlinux...done.
    (gdb) target remote  /dev/pts/53
    Remote debugging using /dev/pts/53
    kgdb_breakpoint ()
        at /xxx/git_linus/linux--3.17/kernel/debug/debug_core.c:1050
    1050            arch_kgdb_breakpoint();
    (gdb) b sys_sync
    Breakpoint 1 at 0xc031d450: file /xxx/git_linus/linux--3.17/fs/sync.c, line 103.
    (gdb) c
    Continuing.

## example 2 (automate paths of gdb pty and terminal emulator pty)

Keeping track of the paths of the pty slaves created by kdmx can be
annoying, so the status file feature has been added in kdmx version
141210a to automate use of the paths by gdb and the terminal emulator.

The status file feature is enabled with the '-s' option, which will
create files containing the paths of the gdb slave pty and the terminal
emulator pty. Each time a slave pty is opened, the contents of the
respective status file is updated. The '-s' option provides the path,
including a root for the file name, for the location of the status
files. The strings '\_gdb' and '\_trm' will be appended to the path to
form the names of the status files.

The absolute path of the kernel source directory is in
\${LINUX\_SOURCE}.

The path of the kernel build directory, relative to the kernel source
directory, is in \${KBUILD\_OUTPUT}

    $ echo ${LINUX_SOURCE}
    /xxx/linux--3.18

    $ echo ${KBUILD_OUTPUT}
    ../build/dragon_linus_3.18

    $ echo ${LINUX_SOURCE}/${KBUILD_OUTPUT}
    /xxx/linux--3.18/../build/dragon_linus_3.18

In this example, I place the status files in my kernel build directory.

    -----  host window 1 - kdmx  -----

    $ export PS1='[1]: '
    [1]: kdmx -n -d -p/dev/ttyUSB0 -b115200 -s${LINUX_SOURCE}/${KBUILD_OUTPUT}/zzz__kdmx_pty
    gdb status file: /xxx/linux--3.18/../build/dragon_linus_3.18/zzz__kdmx_pty_gdb
    terminal emulator status file: /xxx/linux--3.18/../build/dragon_linus_3.18/zzz__kdmx_pty_trm
    serial port: /dev/ttyUSB0
    Initalizing the serial port to 115200 8n1
    /dev/pts/44 is slave pty for terminal emulator
    /dev/pts/45 is slave pty for gdb

    Use <ctrl>C to terminate program

Here are the contents of the status files:

    $ ls -l ${LINUX_SOURCE}/${KBUILD_OUTPUT}/zzz__kdmx_pty*
    -rw-r----- 1 frank frank_group 12 Dec 10 22:07 /xxx/linux--3.18/../build/dragon_linus_3.18/zzz__kdmx_pty_gdb
    -rw-r----- 1 frank frank_group 12 Dec 10 22:07 /xxx/linux--3.18/../build/dragon_linus_3.18/zzz__kdmx_pty_trm
    $ for k in `ls ${LINUX_SOURCE}/${KBUILD_OUTPUT}/zzz__kdmx_pty*`; do echo "$k:" ; cat $k; echo ; done
    /xxx/linux--3.18/../build/dragon_linus_3.18/zzz__kdmx_pty_gdb:
    /dev/pts/45

    /xxx/linux--3.18/../build/dragon_linus_3.18/zzz__kdmx_pty_trm:
    /dev/pts/44

The terminal emulator slave pty path is retrieved from the proper status
file and provided to minicom:

    -----  host window 2 - terminal emulator  -----

    $ export PS1='[2]: '
    [2]: minicom -o -w -p `cat ${LINUX_SOURCE}/${KBUILD_OUTPUT}/zzz__kdmx_pty_trm`
    Welcome to minicom 2.5

    OPTIONS: I18n
    Compiled on May  2 2011, 10:05:24.
    Port /dev/tty8

    Press CTRL-A Z for help on special keys

    $ export PS1='% '
    % cat /proc/version
    Linux version 3.18.0-dirty (frank@ussvlx) (gcc version 4.6.x-google 20120106 (prerelease) (GCC) ) #1 SMP PREEMPT Mon Dec 8 12:27:26 PST 2014
    % echo g > /proc/sysrq-trigger
    [210227.044514] SysRq : DEBUG

The task of getting the path of the gdb slave pty into gdb is a little
bit more complicated. (Any suggestions of a more straightforward method
are welcome.)

The following shell script is used to invoke the proper gdb and create a
user defined gdb command to connect to the correct pty path. The
\${CROSS\_COMPILE} ensures that the gdb built for the target
architecture is used.

    #! /bin/bash

    kgdb_set_pty_cmd=`mktemp --tmpdir kgdb_set_pty_cmd.XXXXXXXXXX` || exit 1


    # user defined command
    #
    #   \x5c is '\'
    #
    echo -e \
       "define tr"                                                                 \
       "\ndont-repeat"                                                             \
       "\necho target remote"                                                      \
       "`cat ${LINUX_SOURCE}/${KBUILD_OUTPUT}/zzz__kdmx_pty_gdb`"                  \
       "\x5cn"                                                                     \
       "\ntarget remote"                                                           \
       `cat ${LINUX_SOURCE}/${KBUILD_OUTPUT}/zzz__kdmx_pty_gdb`                    \
       "\nend"                                                                     \
       "\n"                                                                        \
       "\ndocument tr"                                                             \
       "\ntarget remote to the kdmx gdb pty"                                       \
       "\n"                                                                        \
       "\nThe kdmx gdb pty to be used is: "                                        \
       `cat ${LINUX_SOURCE}/${KBUILD_OUTPUT}/zzz__kdmx_pty_gdb`                    \
       "\nThe kdmx gdb pty was determined at gdb startup.  If the kdmx gdb pty"    \
       "\nhas changed since then, restart gdb"                                     \
       "\n"                                                                        \
       "\nend"                                                                     \
       > ${kgdb_set_pty_cmd}



    echo "${CROSS_COMPILE}gdb -x ${kgdb_set_pty_cmd} $KBUILD_OUTPUT/vmlinux"
          ${CROSS_COMPILE}gdb -x ${kgdb_set_pty_cmd} $KBUILD_OUTPUT/vmlinux


    rm ${kgdb_set_pty_cmd}

    -----  host window 3 - gdb  -----

    $ export PS1='[3]: '
    [3]: echo ${CROSS_COMPILE}
    arm-eabi-
    [3]: cd ${LINUX_SOURCE}
    [3]: tcgdb
    arm-eabi-gdb -x /tmp/kgdb_set_pty_cmd.4xKNf2ah0T ../build/dragon_linus_3.18/vmlinux
    GNU gdb (GDB) 7.3.1-gg2
    Copyright (C) 2011 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "--host=x86_64-linux-gnu --target=arm-linux-android".
    For bug reporting instructions, please see:
    <http://www.gnu.org/software/gdb/bugs/>...
    Reading symbols from /local/nobackup/src/git_linus/build/dragon_linus_3.18/vmlinux...done.
    (gdb) help tr
    target remote to the kdmx gdb pty

    The kdmx gdb pty to be used is:  /dev/pts/45
    The kdmx gdb pty was determined at gdb startup.  If the kdmx gdb pty
    has changed since then, restart gdb

    (gdb) tr
    target remote /dev/pts/45
    kgdb_breakpoint () at /local/nobackup/src/git_linus/linux--3.18/kernel/debug/debug_core.c:1050
    1050        arch_kgdb_breakpoint();
    (gdb) b sys_sync
    Breakpoint 1 at 0xc031f7b4: file /local/nobackup/src/git_linus/linux--3.18/fs/sync.c, line 103.
    (gdb) c
    Continuing.


