> From: [eLinux.org](http://eLinux.org/Kernel_Debugging_Tips "http://eLinux.org/Kernel_Debugging_Tips")


# Kernel Debugging Tips



Here are some miscellaneous tips for debugging a kernel:

## Contents

-   [1 Using printks](#using-printks)
    -   [1.1 Log levels](#log-levels)
    -   [1.2 Adding timing information](#adding-timing-information)
    -   [1.3 Viewing log messages](#viewing-log-messages)
    -   [1.4 Controlling console output](#controlling-console-output)
    -   [1.5 Changing the size of the printk
        buffer](#changing-the-size-of-the-printk-buffer)
-   [2 Using kernel symbols](#using-kernel-symbols)
-   [3 Using a kernel debugger](#using-a-kernel-debugger)
-   [4 Debugging early boot problems](#debugging-early-boot-problems)
-   [5 Triggering a kernel event](#triggering-a-kernel-event)
    -   [5.1 Overloading the sync system
        call](#overloading-the-sync-system-call)
-   [6 Interpreting an Oops message](#interpreting-an-oops-message)
-   [7 Compilation tricks for the
    kernel](#compilation-tricks-for-the-kernel)
    -   [7.1 Build an individual file](#build-an-individual-file)
    -   [7.2 Create the preprocessed file for an individual source
        file](#create-the-preprocessed-file-for-an-individual-source-file)
    -   [7.3 Create the assembly file for an individual source
        file](#create-the-assembly-file-for-an-individual-source-file)
    -   [7.4 Alter the flags for a
        compilation](#alter-the-flags-for-a-compilation)

## Using printks

To add your own debug message to the kernel, you can place a "printk()"
in the kernel code.

See [Debugging by printing -\>
Usage](http://eLinux.org/Debugging_by_printing#Usage "Debugging by printing") for more
details.

### Log levels

Each kernel message can be pre-pended with a tag indicating the
importance of the message.

See [Debugging by printing -\>
Log\_Levels](http://eLinux.org/Debugging_by_printing#Log_Levels "Debugging by printing")
for more details.

### Adding timing information

Sometimes, it is useful to add timing information to the printk values,
so you can see when a particular event occurred. The kernel includes an
feature for doing this called printk times.

See the help for CONFIG\_PRINTK\_TIMES in the file lib/Kconfig.debug for
more information on this feature. This option is found on the "Kernel
Hacking" menu when configuring the kernel.

The timestamps which are inserted into the printk output consist of
seconds and microseconds, as absolute values from the start of machine
operation (or from the start of kernel timekeeping).

There is also tool in the kernel source which will convert the timestamp
values to relative values (so you can see the interval between events).
This tools is called show\_delta and is located in the kernel 'scripts'
directory.

See [Printk Times](http://eLinux.org/Printk_Times "Printk Times") for more information.

### Viewing log messages

The `klogd` program will extract messages from the kernel log buffer,
and send them to the system log (which winds up in /var/log/messages on
most systems). This command runs in the background on most desktop or
server systems, and continually transfers messages from the kernel log
buffer to the system log.

You can view the contents of the log buffer directly, using the `dmesg`
command. Note that by default `dmesg` displays the messages from the
buffer, but does not remove them. So this command can be run multiple
times to view the kernel printk messages. See the dmesg man page for
more things you can do with this tool.

### Controlling console output

In order to have the kernel boot be less "noisy", or in order to boot
more quickly, it is sometimes useful to control the amount of messages
displayed to the console during boot. You can do this by setting the
kernel log level at boot time via a kernel command line option. See the
"loglevel=" argument in
[`Documentation/kernel-parameters.txt`](https://www.kernel.org/doc/Documentation/kernel-parameters.txt).

You can turn off all messages using the kernel command line option
"quiet". See [Disable Console](http://eLinux.org/Disable_Console "Disable Console") for
information on how much time this can save at boot up.

Note that even if the log level is changed, or "quiet" is used, although
the printk messages are not print to console, they are still entered
into the log buffer, and they can still be extracted and displayed later
using the `dmesg` command.

### Changing the size of the printk buffer

See [Debugging by printing -\> Internals / Changing the size of the
printk
buffer](http://eLinux.org/Debugging_by_printing#Internals_.2F_Changing_the_size_of_the_printk_buffer "Debugging by printing")

## Using kernel symbols

You can look up the source code for a function address using your
toolchain's addr2line program. See [Find a kernel function
line](http://eLinux.org/Find_a_kernel_function_line "Find a kernel function line") or
[Addr2line for kernel
debugging](http://eLinux.org/Addr2line_for_kernel_debugging "Addr2line for kernel debugging").

## Using a kernel debugger

You can use the in-kernel debugger: [KDB](http://eLinux.org/KDB "KDB")

You can use the in-kernel remote debugger: [Kgdb](http://eLinux.org/Kgdb "Kgdb")

Also, you can use QEMU and gdb (and a high-level IDE like eclipse).

See [Debugging the Linux kernel using Eclipse/CDT and
Qemu](http://issaris.blogspot.com/2007/12/download-linux-kernel-sourcecode-from.html)
for a great article on using Eclipse (with the CDT plugin) to debug the
Linux kernel.

## Debugging early boot problems

See
[Debugging\_by\_printing\#Debugging\_early\_boot\_problems](http://eLinux.org/Debugging_by_printing#Debugging_early_boot_problems "Debugging by printing")

## Triggering a kernel event

### Overloading the sync system call

Sometimes, it is nice to trigger an event to happen in the kernel from
user space. Instead of creating infrastructure to handle a /proc event,
an ioctl() or making a new syscall, it can be quick and easy to just
overload an existing function. One function not used very often is sync.
(I have found that the sync system call is not normally called by user
space programs (or during standard linux booting).

It is quite easy to put a hook to your own kernel program in the
sys\_sync() routine (located in fs/sync.c) and cause it to execute by
issuing 'sync' from the shell command line. This is handy as a temporary
mechanism to test things that you have put in the kernel.

## Interpreting an Oops message

When the kernel encounters an internal fault, it will print an Oops
message. Here are some tips on using the Oops message to find the source
of the problem.

-   See
    [Documentation/oops-tracing.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;f=Documentation/oops-tracing.txt;hb=HEAD)
-   See [HOWTO find oops
    location](http://vmlinux.org/jocke/linux/howto-find-oops-location.shtml)
    by Denis Vlasenko

## Compilation tricks for the kernel

Sometimes, you want to modify how the compiler builds an individual
kernel file. The following are tips for doing tasks related to this.

### Build an individual file

You can build an individual output object file, with:

    make fs/buffer.o

This will build JUST fs/buffer.o (if it needs rebuilding) and not the
entire kernel. To force it to need re-building, use 'touch' on the
associated source file:

    touch fs/buffer.c

### Create the preprocessed file for an individual source file

Using the same technique, you can create the preprocessed file for a C
source file. This is useful if you're having trouble tracking down macro
expansion or where defines/prototypes are coming from exactly.

    make fs/buffer.i

### Create the assembly file for an individual source file

Using the same technique, you can create the assembly file for a C
source file. This is useful to get an idea what actual machine
instructions are generated from the C source code.

    make fs/buffer.s

Another way to get the raw assembly, is to dump the object file using
'objdump'

    objdump -d fs/buffer.o > fs/buffer.disassem

This will produce a disassembly of the object file, which should show
how the assembly was translated into machine instructions.

If the object has been compiled with debug symbols (using '-g'), then
you might get more information using the '-S' option with objdump:

    objdump -S -d fs/buffer.o >fs/buffer.disassem

You can also request that the toolchain show mixed source and assembly,
by passing extra flags:

    make EXTRA_CFLAGS="-g -Wa,-a,-ad -fverbose-asm" fs/buffer.o >fs/buffer.mixed

### Alter the flags for a compilation

Sometimes, you need to alter the compilation flags for an individual
file. There are two ways to do this. One is to add the extra flags on
the make command line:

    make EXTRA_CFLAGS="-g -finstrument-functions" fs/buffer.o

This will work if the flags can be appended to the regular set of C
flags used for compiling the object.

However, if you need to do something more complicated, like removing or
modifying flags, then you can build your own command line by hand. To do
this, it is easiest to have 'make' produce the default compilation
command (which will be several lines long), then copy, paste and edit
it, to run on the command line directly. To see the exact compile
commands used to compile a particular object, use the V=1 option with
the kernel build system:

    make V=1 fs/buffer.o

For me, this produced something like this:

mipsel-linux-gcc -Wp,-MD,fs/.buffer.o.d -nostdinc -isystem
/home/usr/local/mipsel-linux-glibc/bin/../lib/gcc/mipsisa32el-linux/3.4.3/include
-D\_\_KERNEL\_\_ -Iinclude -Iinclude2 -I/home/tbird/work/linux/include
-I/home/tbird/work/linux/fs -Ifs -Wall -Wstrict-prototypes
-Wno-trigraphs -fno-strict-aliasing -fno-common -ffreestanding -O2
-fomit-frame-pointer -g -I/home/tbird/work/linux/ -I
/home/tbird/work/linux/include/asm/gcc -G 0 -mno-abicalls -fno-pic -pipe
-finline-limit=100000 -mabi=32 -march=mips32r2 -Wa,-32
-Wa,-march=mips32r2 -Wa,-mips32r2 -Wa,--trap
-I/home/tbird/work/linux/include/asm-mips/ati -Iinclude/asm-mips/ati
-I/home/tbird/work/linux/include/asm-mips/mach-generic
-Iinclude/asm-mips/mach-generic -Wdeclaration-after-statement
-DKBUILD\_BASENAME=buffer -DKBUILD\_MODNAME=buffer -c -o fs/buffer.o
/home/tbird/work/linux/fs/buffer.c


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

