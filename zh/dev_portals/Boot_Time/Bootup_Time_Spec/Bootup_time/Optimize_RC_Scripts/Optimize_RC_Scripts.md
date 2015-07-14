> From: [eLinux.org](http://eLinux.org/Optimize_RC_Scripts "http://eLinux.org/Optimize_RC_Scripts")


# Optimize RC Scripts



## Contents

-   [1 RC Scripts Speed-Up](#rc-scripts-speed-up)
-   [2 Introduction](#introduction)
    -   [2.1 Purpose of Feature](#purpose-of-feature)
    -   [2.2 Feature requirements](#feature-requirements)
    -   [2.3 Acceptance Criteria](#acceptance-criteria)
-   [3 BusyBox Optimization](#busybox-optimization)
    -   [3.1 Known Problems](#known-problems)
-   [4 How to Optimize Init Scripts for
    BusyBox](#how-to-optimize-init-scripts-for-busybox)
    -   [4.1 Examples of Init Scripts
        Optimization](#examples-of-init-scripts-optimization)
        -   [4.1.1 Unnecessary codes
            elimination](#unnecessary-codes-elimination)
        -   [4.1.2 Built-in usage](#built-in-usage)
        -   [4.1.3 Piped command usage](#piped-command-usage)
        -   [4.1.4 Back-quoted command
            usage](#back-quoted-command-usage)
-   [5 Init Scripts Optimization](#init-scripts-optimization)
    -   [5.1 Benchmark Environment and
        Procedure](#benchmark-environment-and-procedure)
-   [6 Optimization Results](#optimization-results)
-   [7 Downloads](#downloads)

## RC Scripts Speed-Up

This material was excerpted from a document with the following copyright
statement:

-   Copyright 2002, 2003, 2004 Sony Corporation
-   Copyright 2002, 2003, 2004 Matsushita Electric Industrial Co., Ltd.
-   Copyright 2002-2004 by MontaVista Software.

It was submitted as input to the forum by Sony Corporation, on April 8,
2004.

## Introduction

The init scripts of the existing Embedded Linux distribution are the
shell scripts to be executed with ’bash’. To reduce system boot time,
some modifications to be applied to the scripts and faster shell
interpreter to be used. The document describes the BusyBox
optimizations; the init scripts modifications; how to reduce the system
boot time using the optimized BusyBox, and to optimize shell scripts for
BusyBox. Also, the benchmark procedure and optimization results are
described.

### Purpose of Feature

The init scripts execution time, i.e. the time interval between the
start of the init process and the start of user applications, must be
reduced.

### Feature requirements

-   The modified init scripts must be run with "bash" as well as the
    BusyBox "ash" shell.
-   The execution time of the init scripts and the total system boot
    time must be reduced.
-   The guide to speed-optimization of the init scripts must be
    provided.

### Acceptance Criteria

-   The modified init scripts are able to successfully run with "bash"
    as well as the BusyBox "ash" shell.
-   The execution time of the init scripts with BusyBox is reduced in
    the comparison with the original init scripts with "bash"; the total
    system boot time is not greater then 5 sec.
-   The guide to speed-optimization of the init scripts is available.

## BusyBox Optimization

Since ’bash’ and GNU utilities are very heavy applications, BusyBox is
useful to reduce system boot time. BusyBox combines tiny versions of
many common UNIX utilities (shellutils, fileutils, etc.) into a single
small executable. The commands and utilities included in BusyBox are
divided into the classes: built-ins and applets. The built-ins are
simply invoked as functions, and applets are invoked by means of the
’fork/exec’ system calls. Also, BusyBox scripts can use external
commands and utilities.

Usage of the BusyBox built-ins is rather than the applets and external
commands by performance reasons, because the ’fork/exec’ system calls
are very heavy and they make the main contribution to shell
inefficiency. Because the original BusyBox is only size-optimized, the
following features must be considered from the performance standpoint:

-   Each command including built-ins within pipes are forked.
-   Each back-quoted command is forked.
-   The ’echo’, ’test’, and ’[’ commands and other most frequent
    commands in the scripts are implemented as applets.

To avoid such drawbacks, we optimized BusyBox 1.00-pre3 in order to
speed up script execution. The BusyBox optimizations for the ’ash’ shell
are listed below:

-   The set of shell commands and utilities is implemented as built-ins.
-   The invoked ’cat’ command at the beginning of pipes is eliminated
    and file descriptors are passed only into the next command of the
    pipe.

The following shell commands and utilities are implemented as built-ins
in the optimized BusyBox ’ash’ shell: ’,’, ’:’,’[’, ’alias’, ’break’,
’cd’, ’chdir’, ’continue’, ’echo’, ’eval’, ’exec’, ’exit’, ’export’,
’false’, ’kill’, ’let’, ’local’, ’pidof’, ’pwd’, ’read’, ’readonly’,
’return’, ’set’, ’shift’, ’test’, ’times’, ’trap’, ’true’, ’type’,
’ulimit’, ’umask’, ’unalias’, ’unset’, ’wait’.

NOTES:

-   This need seems to be addressed for all applets at least in Busybox
    1.1.1 (and perhaps in earlier versions). The "Shells -\> Standalone
    shell" configuration setting is supposed to address this need. See
    the menuconfig help for details.
-   In newer BusyBox releases (1.13.0 and maybe even earlier releases)
    the most frequently used applets, 'test', 'echo' can be configured
    as being 'built-in'. The newer BusyBox releases are also smaller in
    size and can save some extra milliseconds in execution of startup
    scripts.

### Known Problems

The following BusyBox commands work in the different manner from the
’bash’ commands and GNU utilities: ’nice’, ’find’, ’mount’, ’umount’,
’init’, ’halt’, ’shutdown’, ’syslogd’, ’klogd’, ’hwclock’, ’cron’,
’anacron’, ’crontab’, 'pidof'.

If the different behaviour is unwanted or these BusyBox applets do not
provide the necessary utility, use the external commands instead of
them, or simply do not configure them as applets.

## How to Optimize Init Scripts for BusyBox

Follow the rules listed below to reduce execution time for the init
scripts:

-   Do not use unnecessary codes in the scripts.
-   Replace external commands and utilities with the BusyBox built-ins
    as far as possible.
-   Do not use the piped commands as far as possible.
-   Reduce the number of commands within a pipe.
-   Do not use the back-quoted commands as far as possible.

The main goal of such optimization is to reduce the number of the
"fork/exec" calls during a script execution.

### Examples of Init Scripts Optimization

The following examples demonstrate how the recommendations of shell
scripts optimization can be applied to the init scripts.

#### Unnecessary codes elimination

This example demonstrates the elimination of duplicate codes from the
"mountswap.sh" and "checkrootfs.sh" scripts: the command "swapon" runs
one time in the modified scripts.

-   Before optimization:

checkrootfs.sh:

    if [ "$FSCKSWAP" !== no ]
    then
       if [ -x /sbin/swapon ]
       then
           mount -n /proc
           if ! grep -qs resync /proc/mdstat
           then
               [ "$VERBOSE" !== no ] && echo "Activating swap..."

               swapon -a 2> /dev/null
           fi
           umount -n /proc
        fi
    fi

mountswap.sh:

    grep -qs resync /proc/mdstat || swapon -a 2> /dev/null

-   After optimization:

checkrootfs.sh:

mountswap.sh:


    if [ "$FSCKSWAP" !== "no" ]; then
        if [ ! ‘grep -qs resync /proc/mdstat‘ ]
        then
            log_status_msg "Starting $DESC: " -n
            log_status_msg "$BASENAME1" -n
            $DAEMON1 $ARGS1
            RET==$?
            if [ $RET -eq 0 ]; then
                log_success_msg ". " -n
            else
                log_failure_msg " failed ($RET: $ERROR)."
                return 1
            fi
        fi
    fi

#### Built-in usage

This example demonstrates usage of the "echo" built-in instead of the
external command "printf" in the "nfs-common" script.

-   Before optimization:

nfs-common:

       printf "Starting $DESC:"
       printf " statd"

-   After optimization: init-functions:

<!-- -->

    log_status_msg() {
       if [ "$1" !== "" ] && [ "$1" !== "-n" ]
       then

          if [ "$2" == "-n" ]
          then echo -n "$1"
          else echo "$1"
          fi

        fi
    return 0
    }


 nfs-common.sh:

     log_status_msg "Starting $DESC: " -n
     log_status_msg "$BASENAME1" ?n

#### Piped command usage

This example demonstrates the elimination of the piped commands (the
example is hypothetic, because the init scripts do not contain such
inefficiencies).

-   Before optimization:

<!-- -->

    cat /proc/mounts | grep ext3 | cut -d’ ’ -f2,3

-   After optimization:

<!-- -->

    sed -n ’s/^[^ ]* \([^ ]*\) \(ext3\) .*$/\1 \2/p’ /proc/mounts

This example demonstrates the reduction of the commands in the pipe (the
example is also hypothetic). Note, the optimized version does not invoke
the "fork" call, because the "cat" optimization is used.

-   Before optimization:

<!-- -->

    cat /etc/passwd | grep user | wc -l | tr -d ’’ | sed ’s/ *//’

-   After optimization:

<!-- -->

    cat /etc/passwd | grep -c user

#### Back-quoted command usage

This example demonstrates the back-quoted command elimination (the
example is hypothetic, because the init scripts do not contain such
inefficiencies).

-   Before optimization:

<!-- -->

    if [ "‘grep rpcuser /etc/passwd‘" !== "" ]
    then
        echo "rpcuser"
    else
        echo "no rpcuser"
    fi

-   After optimization:

<!-- -->

    if grep rpcuser /etc/passwd >/dev/null
    then
        echo "rpcuser"
    else
        echo "no rpcuser"
    fi

## Init Scripts Optimization

The existing init scripts were modified to reduce their execution time
following the recommendations, which are described above.

### Benchmark Environment and Procedure

To estimate the results of the init script optimization and the BusyBox
usage, the TI OMAP 1510 Innovator platform is used. To measure the
duration of the kernel loading, the KFI support is used (to measure the
init script execution time, the KFI support is disabled). The
measurements are performed on the systems with/without XIP support To
take measurements without the XIP support, the following kernel
configuration is used:

    CONFIG_ARM==y
    CONFIG_UID16==y
    CONFIG_RWSEM_GENERIC_SPINLOCK==y
    CONFIG_EXPERIMENTAL==y
    CONFIG_ADVANCED_OPTIONS==y
    CONFIG_MODULES==y
    CONFIG_KMOD==y
    CONFIG_ARCH_OMAP==y
    CONFIG_OMAP_INNOVATOR==y
    CONFIG_INNOVATOR_MISSED_IRQS==y
    CONFIG_ARCH_OMAP1510==y
    CONFIG_CLOCK_COUNTS_DOWN==y
    CONFIG_CPU_32==y
    CONFIG_CPU_ARM925T==y
    CONFIG_CPU_ARM925_CPU_IDLE==y
    CONFIG_CPU_ARM925_I_CACHE_ON==y
    CONFIG_CPU_ARM925_NON_STREAMING_ON==y
    CONFIG_CPU_ARM925_D_CACHE_ON==y
    CONFIG_CPU_32v4==y
    CONFIG_KERNEL_START==0xc0000000
    CONFIG_ZBOOT_ROM_TEXT==0
    CONFIG_ZBOOT_ROM_BSS==0
    CONFIG_NET==y
    CONFIG_SYSVIPC==y
    CONFIG_SYSCTL==y

    CONFIG_MAX_USER_RT_PRIO==100
    CONFIG_MAX_RT_PRIO==0
    CONFIG_FPE_NWFPE==m
    CONFIG_KCORE_ELF==y
    CONFIG_BINFMT_AOUT==m
    CONFIG_BINFMT_ELF==y
    CONFIG_OMAP1510_PM==y
    CONFIG_DPM==y
    CONFIG_BOOT_FREQ==y
    CONFIG_OMAP_ARM_168MHZ==y
    CONFIG_OMAP1510_DPM==y
    CONFIG_INNOVATOR_DPM==y
    CONFIG_CMDLINE=="mem==32M console==ttyS0,115200n8 noinitrd root==/dev/null rootflags==physaddr==0x0260000"
    CONFIG_ALIGNMENT_TRAP==y
    CONFIG_PREEMPT==y
    CONFIG_LOCK_BREAK==y
    CONFIG_MTD==y
    CONFIG_MTD_PARTITIONS==y
    CONFIG_MTD_CONCAT==y
    CONFIG_MTD_CHAR==y
    CONFIG_MTD_BLOCK==y
    CONFIG_MTD_CFI==y
    CONFIG_MTD_GEN_PROBE==y
    CONFIG_MTD_CFI_ADV_OPTIONS==y
    CONFIG_MTD_CFI_NOSWAP==y
    CONFIG_MTD_CFI_GEOMETRY==y
    CONFIG_MTD_CFI_B2==y
    CONFIG_MTD_CFI_I1==y
    CONFIG_MTD_CFI_INTELEXT==y
    CONFIG_MTD_CFI_AMDSTD==y
    CONFIG_MTD_OMAP==y
    CONFIG_MTD_OMAP_0==y
    CONFIG_MTD_OMAP_1==y
    CONFIG_BLK_DEV_LOOP==m
    CONFIG_BLK_DEV_RAM==y
    CONFIG_BLK_DEV_RAM_SIZE==4096
    CONFIG_BLK_DEV_INITRD==y
    CONFIG_PACKET==m
    CONFIG_NETFILTER==y
    CONFIG_UNIX==y
    CONFIG_INET==y
    CONFIG_IP_MULTICAST==y
    CONFIG_IP_PNP==y
    CONFIG_NETDEVICES==y
    CONFIG_NET_ETHERNET==y
    CONFIG_NET_VENDOR_SMC==y
    CONFIG_SMC9194==y
    CONFIG_PPP==m
    CONFIG_PPP_MULTILINK==y
    CONFIG_PPP_ASYNC==m
    CONFIG_PPP_DEFLATE==m
    CONFIG_PPPOE==m
    CONFIG_IRDA==m
    CONFIG_IRLAN==m
    CONFIG_IRNET==m
    CONFIG_IRCOMM==m
    CONFIG_OMAP_SIR==m
    CONFIG_INPUT==m
    CONFIG_INPUT_KEYBDEV==m
    CONFIG_INPUT_MOUSEDEV==m
    CONFIG_INPUT_MOUSEDEV_SCREEN_X==240
    CONFIG_INPUT_MOUSEDEV_SCREEN_Y==320
    CONFIG_INPUT_EVDEV==m
    CONFIG_VT==y
    CONFIG_VT_CONSOLE==y
    CONFIG_SERIAL==y
    CONFIG_SERIAL_CONSOLE==y
    CONFIG_UNIX98_PTYS==y

    CONFIG_UNIX98_PTY_COUNT==256
    CONFIG_I2C==m
    CONFIG_I2C_ALGOBIT==m
    CONFIG_I2C_OMAP1510==m
    CONFIG_I2C_CHARDEV==m
    CONFIG_I2C_PROC==m
    CONFIG_SENSORS==y
    CONFIG_SENSORS_OTHER==y
    CONFIG_SENSORS_EEPROM==m
    CONFIG_WATCHDOG==y
    CONFIG_OMAP_WATCHDOG==m
    CONFIG_OMAP_RTC==m
    CONFIG_RV5C387_RTC==m
    CONFIG_RV5C387_RTC==m
    CONFIG_VIDEO_DEV==m
    CONFIG_VIDEO_PROC_FS==y
    CONFIG_AUTOFS4_FS==m
    CONFIG_EXT3_FS==m
    CONFIG_JBD==m
    CONFIG_FAT_FS==m
    CONFIG_MSDOS_FS==m
    CONFIG_VFAT_FS==m
    CONFIG_JFFS_FS==m
    CONFIG_JFFS_FS_VERBOSE==0
    CONFIG_JFFS2_FS==y
    CONFIG_JFFS2_FS_DEBUG==0
    CONFIG_CRAMFS==y
    CONFIG_CRAMFS_LINEAR==y
    CONFIG_CRAMFS_LINEAR_XIP==y
    CONFIG_ROOT_CRAMFS_LINEAR==y
    CONFIG_TMPFS==y
    CONFIG_RAMFS==y
    CONFIG_PROC_FS==y
    CONFIG_DEVPTS_FS==y
    CONFIG_EXT2_FS==m
    CONFIG_NFS_FS==y
    CONFIG_NFS_V3==y
    CONFIG_NFSD==m
    CONFIG_NFSD_V3==y
    CONFIG_SUNRPC==y
    CONFIG_LOCKD==y
    CONFIG_LOCKD_V4==y
    CONFIG_SMB_FS==m
    CONFIG_MSDOS_PARTITION==y
    CONFIG_SMB_NLS==y
    CONFIG_NLS==y
    CONFIG_NLS_DEFAULT=="iso8859-1"
    CONFIG_NLS_CODEPAGE_437==m
    CONFIG_PC_KEYMAP==y
    CONFIG_FB==y
    CONFIG_DUMMY_CONSOLE==y
    CONFIG_FB_OMAP==y
    CONFIG_FBCON_ADVANCED==y
    CONFIG_FBCON_CFB16==y
    CONFIG_FBCON_FONTWIDTH8_ONLY==y
    CONFIG_FBCON_FONTS==y
    CONFIG_FONT_8x8==y
    CONFIG_FONT_ACORN_8x8==y
    CONFIG_SOUND==m
    CONFIG_SOUND_OMAP==m
    CONFIG_SOUND_OMAP_AIC23==m
    CONFIG_INNOVATOR_TS==y
    CONFIG_MMC==m
    CONFIG_OMAP_MMC==m
    CONFIG_INSTANT_ON==y
    CONFIG_DEFAULT_LPJ==414720
    CONFIG_INSTANT_ON_LPJ==414720
    CONFIG_FRAME_POINTER==y

    CONFIG_DEBUG_INFO==y
    CONFIG_DEBUG_KERNEL==y
    CONFIG_MAGIC_SYSRQ==y
    CONFIG_DEBUG_BUGVERBOSE==y
    CONFIG_DEBUG_ERRORS==y
    CONFIG_ZLIB_INFLATE==y
    CONFIG_ZLIB_DEFLATE==y

To take measurements with the XIP support, the following kernel
configuration is used:

    CONFIG_ARM==y
    CONFIG_UID16==y
    CONFIG_RWSEM_GENERIC_SPINLOCK==y
    CONFIG_EXPERIMENTAL==y
    CONFIG_ADVANCED_OPTIONS==y
    CONFIG_MODULES==y
    CONFIG_KMOD==y
    CONFIG_ARCH_OMAP==y
    CONFIG_OMAP_INNOVATOR==y
    CONFIG_INNOVATOR_MISSED_IRQS==y
    CONFIG_ARCH_OMAP1510==y
    CONFIG_CLOCK_COUNTS_DOWN==y
    CONFIG_CPU_32==y
    CONFIG_CPU_ARM925T==y
    CONFIG_CPU_ARM925_CPU_IDLE==y
    CONFIG_CPU_ARM925_I_CACHE_ON==y
    CONFIG_CPU_ARM925_NON_STREAMING_ON==y
    CONFIG_CPU_ARM925_D_CACHE_ON==y
    CONFIG_CPU_32v4==y
    CONFIG_KERNEL_START==0xc0000000
    CONFIG_ZBOOT_ROM_TEXT==0
    CONFIG_ZBOOT_ROM_BSS==0
    CONFIG_NET==y
    CONFIG_SYSVIPC==y
    CONFIG_SYSCTL==y
    CONFIG_MAX_USER_RT_PRIO==100
    CONFIG_MAX_RT_PRIO==0
    CONFIG_XIP_ROM==y
    CONFIG_XIP_PHYS_ADDR==60400
    CONFIG_FPE_NWFPE==m
    CONFIG_KCORE_ELF==y
    CONFIG_BINFMT_AOUT==m
    CONFIG_BINFMT_ELF==y
    CONFIG_OMAP1510_PM==y
    CONFIG_DPM==y
    CONFIG_BOOT_FREQ==y
    CONFIG_OMAP_ARM_168MHZ==y
    CONFIG_OMAP1510_DPM==y
    CONFIG_INNOVATOR_DPM==y
    CONFIG_CMDLINE=="mem==32M console==ttyS0,115200n8 noinitrd root==/dev/null rootflags==physaddr==0x0260000"
    CONFIG_ALIGNMENT_TRAP==y
    CONFIG_PREEMPT==y
    CONFIG_LOCK_BREAK==y
    CONFIG_MTD==y
    CONFIG_MTD_DEBUG==y
    CONFIG_MTD_DEBUG_VERBOSE==0
    CONFIG_MTD_PARTITIONS==y
    CONFIG_MTD_CONCAT==y
    CONFIG_MTD_CHAR==y
    CONFIG_MTD_BLOCK==y
    CONFIG_MTD_CFI==y
    CONFIG_MTD_GEN_PROBE==y
    CONFIG_MTD_CFI_ADV_OPTIONS==y
    CONFIG_MTD_CFI_NOSWAP==y
    CONFIG_MTD_CFI_GEOMETRY==y
    CONFIG_MTD_CFI_B2==y
    CONFIG_MTD_CFI_I1==y

    CONFIG_MTD_CFI_INTELEXT==y
    CONFIG_MTD_CFI_AMDSTD==y
    CONFIG_MTD_OMAP==y
    CONFIG_MTD_OMAP_1==y
    CONFIG_BLK_DEV_LOOP==m
    CONFIG_BLK_DEV_RAM==y
    CONFIG_BLK_DEV_RAM_SIZE==4096
    CONFIG_BLK_DEV_INITRD==y
    CONFIG_PACKET==m
    CONFIG_NETFILTER==y
    CONFIG_UNIX==y
    CONFIG_INET==y
    CONFIG_IP_MULTICAST==y
    CONFIG_IP_PNP==y
    CONFIG_NETDEVICES==y
    CONFIG_NET_ETHERNET==y
    CONFIG_NET_VENDOR_SMC==y
    CONFIG_SMC9194==y
    CONFIG_PPP==m
    CONFIG_PPP_MULTILINK==y
    CONFIG_PPP_ASYNC==m
    CONFIG_PPP_DEFLATE==m
    CONFIG_PPPOE==m
    CONFIG_IRDA==m
    CONFIG_IRLAN==m
    CONFIG_IRNET==m
    CONFIG_IRCOMM==m
    CONFIG_OMAP_SIR==m
    CONFIG_INPUT==m
    CONFIG_INPUT_KEYBDEV==m
    CONFIG_INPUT_MOUSEDEV==m
    CONFIG_INPUT_MOUSEDEV_SCREEN_X==240
    CONFIG_INPUT_MOUSEDEV_SCREEN_Y==320
    CONFIG_INPUT_EVDEV==m
    CONFIG_VT==y
    CONFIG_VT_CONSOLE==y
    CONFIG_SERIAL==y
    CONFIG_SERIAL_CONSOLE==y
    CONFIG_UNIX98_PTYS==y
    CONFIG_UNIX98_PTY_COUNT==256
    CONFIG_I2C==m
    CONFIG_I2C_ALGOBIT==m
    CONFIG_I2C_OMAP1510==m
    CONFIG_I2C_CHARDEV==m
    CONFIG_I2C_PROC==m
    CONFIG_SENSORS==y
    CONFIG_SENSORS_OTHER==y
    CONFIG_SENSORS_EEPROM==m
    CONFIG_WATCHDOG==y
    CONFIG_OMAP_WATCHDOG==m
    CONFIG_OMAP_RTC==m
    CONFIG_RV5C387_RTC==m
    CONFIG_RV5C387_RTC==m
    CONFIG_VIDEO_DEV==m
    CONFIG_VIDEO_PROC_FS==y
    CONFIG_AUTOFS4_FS==m
    CONFIG_EXT3_FS==m
    CONFIG_JBD==m
    CONFIG_FAT_FS==m
    CONFIG_MSDOS_FS==m
    CONFIG_VFAT_FS==m
    CONFIG_JFFS_FS==m
    CONFIG_JFFS_FS_VERBOSE==0
    CONFIG_JFFS2_FS==y
    CONFIG_JFFS2_FS_DEBUG==0
    CONFIG_CRAMFS==y
    CONFIG_CRAMFS_LINEAR==y
    CONFIG_CRAMFS_LINEAR_XIP==y

    CONFIG_ROOT_CRAMFS_LINEAR==y
    CONFIG_TMPFS==y
    CONFIG_RAMFS==y
    CONFIG_PROC_FS==y
    CONFIG_DEVPTS_FS==y
    CONFIG_EXT2_FS==m
    CONFIG_NFS_FS==y
    CONFIG_NFS_V3==y
    CONFIG_NFSD==m
    CONFIG_NFSD_V3==y
    CONFIG_SUNRPC==y
    CONFIG_LOCKD==y
    CONFIG_LOCKD_V4==y
    CONFIG_SMB_FS==m
    CONFIG_MSDOS_PARTITION==y
    CONFIG_SMB_NLS==y
    CONFIG_NLS==y
    CONFIG_NLS_DEFAULT=="iso8859-1"
    CONFIG_NLS_CODEPAGE_437==m
    CONFIG_PC_KEYMAP==y
    CONFIG_FB==y
    CONFIG_DUMMY_CONSOLE==y
    CONFIG_FB_OMAP==y
    CONFIG_FBCON_ADVANCED==y
    CONFIG_FBCON_CFB16==y
    CONFIG_FBCON_FONTWIDTH8_ONLY==y
    CONFIG_FBCON_FONTS==y
    CONFIG_FONT_8x8==y
    CONFIG_FONT_ACORN_8x8==y
    CONFIG_SOUND==m
    CONFIG_SOUND_OMAP==m
    CONFIG_SOUND_OMAP_AIC23==m
    CONFIG_INNOVATOR_TS==y
    CONFIG_MMC==m
    CONFIG_OMAP_MMC==m
    CONFIG_TRACE==y
    CONFIG_TRACE_BOOT==y
    CONFIG_INSTANT_ON==y
    CONFIG_DEFAULT_LPJ==414720
    CONFIG_INSTANT_ON_LPJ==414720
    CONFIG_FRAME_POINTER==y
    CONFIG_DEBUG_INFO==y
    CONFIG_DEBUG_KERNEL==y
    CONFIG_MAGIC_SYSRQ==y
    CONFIG_DEBUG_BUGVERBOSE==y
    CONFIG_DEBUG_ERRORS==y
    CONFIG_ZLIB_INFLATE==y
    CONFIG_ZLIB_DEFLATE==y

The set of the init scripts of the consumer packages is divided into the
minimal and optional subsets. The following scripts belong to the
minimal subset: ’bootmisc.sh’, ’checkfs.sh’, ’checkroot.sh’,
’hwclock.sh’, ’modutils.sh’, ’mountall.sh’, ’networking.sh’,
’urandom.sh’.

The following scripts belong to the optional subset: ’anacron.sh’,
’cron.sh’, ’devfsd.sh’, ’devshm.sh’, ’ifupdown.sh’, ’rmnologin.sh’,
’syslog.sh’.

Thus,

-   the minimal packages are: "initscripts", "util-linux", "modutils",
    and "netbase";
-   the optional packages are: "initscripts", "anacron", "cron",
    "devfsd", "ifupdown", "sysklogd", "util-linux", "modutils", and
    "netbase".

The init scripts are used with the "bash", BusyBox, 0.60.3 and the
optimized BusyBox 1.00-pre3. The sizes of the shell executables are:

Since profiling tools slow up program execution, the Linux Trace Toolkit
(LTT) is not used to measure the execution time of the init scripts.



<table>
<thead>
<tr class="header">
<th align="left">Shell</th>
<th align="left">Size</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">bash</td>
<td align="left">562 Kb</td>
</tr>
<tr class="even">
<td align="left">BusyBox 0.60.3</td>
<td align="left">872 Kb</td>
</tr>
<tr class="odd">
<td align="left">BusyBox 1.00-pre3</td>
<td align="left">210 Kb</td>
</tr>
<tr class="even">
<td align="left">The optimized BusyBox 1.00-pre3</td>
<td align="left">259 Kb</td>
</tr>
</tbody>
</table>

To obtain the start time of the init scripts, the modified "init"
utility is used. The following patch for the "init" utility is applied:

    diff -Naur sysvinit-2.78.orig/src/init.c sysvinit-2.78/src/init.c
    --- sysvinit-2.78.orig/src/init.c 2000-02-11 14:17:02.000000000 +0300
    +++ sysvinit-2.78/src/init.c 2003-12-08 20:20:15.000000000 +0300
    @@ -684,7 +684,7 @@
        (void) tcgetattr(fd, &tty);
        tty.c_cflag &== CBAUD|CBAUDEX|CSIZE|CSTOPB|PARENB|PARODD;
    -   tty.c_cflag |== HUPCL|CLOCAL;
    +   tty.c_cflag |== CREAD|HUPCL|CLOCAL;
        tty.c_cc[VINTR] == 3; /* ctrl(’c’) */
        tty.c_cc[VQUIT] == 28; /* ctrl(’\\’) */
    @@ -2443,6 +2443,13 @@
        FILE *fp;
        char *p;
        int f, fd;
    +
    +#ifdef TIME_MEASURE
    + struct timeval current;
    + if (!gettimeofday (&current, 0))
    + printf ("INIT: started at %ld\n", (current.tv_sec * 1000) + (current.tv_usec / 1000));
    +#endif
     /* Get my own name */
     if ((p == strrchr(argv[0], ’/’)) !== NULL)

To obtain the time of the end of the init script execution, the
following program is used in the inittab:

    #include <sys/time.h>
    #include <stdio.h>
    int main (int argc, char **argv)
    {
        struct timeval current;
        if (!gettimeofday (&current, 0))
        printf ("printtime: current time %ld ms\n", (current.tv_sec * 1000) + (current.tv_usec / 1000));
        return 0;
    }

Thus, we consider the sum of the init script execution time and the
kernel loading time, which are measured in ways described above, is the
total system boot time.

## Optimization Results

<table>
<caption> Measurement results with the XIP support Kernel loading time: 0.6 sec. Init script execution time: </caption>
<thead>
<tr class="header">
<th align="left"><strong>Script set</strong></th>
<th align="left"><strong>Shell</strong></th>
<th align="left"><strong>Time</strong></th>
<th align="left"><strong>%</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">minimal</td>
<td align="left">bash</td>
<td align="left">3.6 sec.</td>
<td align="left">35%</td>
</tr>
<tr class="even">
<td align="left">minimal</td>
<td align="left">BusyBox 0.60.3</td>
<td align="left">5.3 sec.</td>
<td align="left">52%</td>
</tr>
<tr class="odd">
<td align="left">minimal</td>
<td align="left">optimized BusyBox 1.00-pre3</td>
<td align="left">2.6 sec.</td>
<td align="left">25%</td>
</tr>
<tr class="even">
<td align="left">minimal + optional</td>
<td align="left">bash</td>
<td align="left">7.6 sec.</td>
<td align="left">74%</td>
</tr>
<tr class="odd">
<td align="left">minimal + optional</td>
<td align="left">BusyBox 0.60.3</td>
<td align="left">10.1 sec.</td>
<td align="left">100%</td>
</tr>
<tr class="even">
<td align="left">minimal + optional</td>
<td align="left">optimized BusyBox 1.00-pre3</td>
<td align="left">4.9 sec.</td>
<td align="left">48%</td>
</tr>
</tbody>
</table>



<table>
<caption>Total system boot time (kernel loading time + init script execution time): </caption>
<thead>
<tr class="header">
<th align="left"><strong>Script set</strong></th>
<th align="left"><strong>Shell</strong></th>
<th align="left"><strong>Time</strong></th>
<th align="left"><strong>%</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">minimal</td>
<td align="left">bash</td>
<td align="left">4.3 sec.</td>
<td align="left">39%</td>
</tr>
<tr class="even">
<td align="left">minimal</td>
<td align="left">BusyBox 0.60.3</td>
<td align="left">6.0 sec.</td>
<td align="left">55%</td>
</tr>
<tr class="odd">
<td align="left">minimal</td>
<td align="left">optimized BusyBox 1.00-pre3</td>
<td align="left">3.2 sec.</td>
<td align="left">29%</td>
</tr>
<tr class="even">
<td align="left">minimal + optional</td>
<td align="left">bash</td>
<td align="left">8.2 sec.</td>
<td align="left">76%</td>
</tr>
<tr class="odd">
<td align="left">minimal + optional</td>
<td align="left">BusyBox 0.60.3</td>
<td align="left">10.7 sec.</td>
<td align="left">100%</td>
</tr>
<tr class="even">
<td align="left">minimal + optional</td>
<td align="left">optimized BusyBox 1.00-pre3</td>
<td align="left">5.5 sec.</td>
<td align="left">51%</td>
</tr>
</tbody>
</table>



<table>
<caption>Measurement results without the XIP support Kernel loading time: 0.4 sec. Init script execution time: </caption>
<thead>
<tr class="header">
<th align="left"><strong>Script set</strong></th>
<th align="left"><strong>Shell</strong></th>
<th align="left"><strong>Time</strong></th>
<th align="left"><strong>%</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">minimal</td>
<td align="left">bash</td>
<td align="left">4.4 sec.</td>
<td align="left">52%</td>
</tr>
<tr class="even">
<td align="left">minimal</td>
<td align="left">BusyBox 0.60.3</td>
<td align="left">5.0 sec.</td>
<td align="left">59%</td>
</tr>
<tr class="odd">
<td align="left">minimal</td>
<td align="left">optimized BusyBox 1.00-pre3</td>
<td align="left">2.9 sec.</td>
<td align="left">34%</td>
</tr>
<tr class="even">
<td align="left">minimal + optional</td>
<td align="left">bash</td>
<td align="left">6.8 sec.</td>
<td align="left">82%</td>
</tr>
<tr class="odd">
<td align="left">minimal + optional</td>
<td align="left">BusyBox 0.60.3</td>
<td align="left">8.3 sec.</td>
<td align="left">100%</td>
</tr>
<tr class="even">
<td align="left">minimal + optional</td>
<td align="left">optimized BusyBox 1.00-pre3</td>
<td align="left">4.6 sec.</td>
<td align="left">55%</td>
</tr>
</tbody>
</table>



<table>
<caption>*Total system boot time (kernel loading time + init script execution time): </caption>
<thead>
<tr class="header">
<th align="left"><strong>Script set</strong></th>
<th align="left"><strong>Shell</strong></th>
<th align="left"><strong>Time</strong></th>
<th align="left"><strong>%</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">minimal</td>
<td align="left">bash</td>
<td align="left">4.8 sec.</td>
<td align="left">55%</td>
</tr>
<tr class="even">
<td align="left">minimal</td>
<td align="left">BusyBox 0.60.3</td>
<td align="left">5.4 sec.</td>
<td align="left">61%</td>
</tr>
<tr class="odd">
<td align="left">minimal</td>
<td align="left">optimized BusyBox 1.00-pre3</td>
<td align="left">3.3 sec.</td>
<td align="left">38%</td>
</tr>
<tr class="even">
<td align="left">minimal + optional</td>
<td align="left">bash</td>
<td align="left">7.3 sec.</td>
<td align="left">83%</td>
</tr>
<tr class="odd">
<td align="left">minimal + optional</td>
<td align="left">BusyBox 0.60.3</td>
<td align="left">8.7 sec.</td>
<td align="left">100%</td>
</tr>
<tr class="even">
<td align="left">minimal + optional</td>
<td align="left">optimized BusyBox 1.00-pre3</td>
<td align="left">5.0 sec.</td>
<td align="left">57%</td>
</tr>
</tbody>
</table>

## Downloads

-   [busybox-1.00-pre3-optimized.patch](http://eLinux.org/images/6/65/Busybox-1.00-pre3-optimized.patch "Busybox-1.00-pre3-optimized.patch")
-   [init\_scripts.tgz](http://eLinux.org/images/d/db/Init_scripts.tgz "Init scripts.tgz")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Optimize RC
    Scripts](http://eLinux.org/Category:Optimize_RC_Scripts "Category:Optimize RC Scripts")

