> From: [eLinux.org](http://eLinux.org/Debugging_The_Linux_Kernel_Using_Gdb "http://eLinux.org/Debugging_The_Linux_Kernel_Using_Gdb")


# Debugging The Linux Kernel Using Gdb



## Contents

-   [1 Debugging the linux kernel using
    gdb](#debugging-the-linux-kernel-using-gdb)
    -   [1.1 Requirements](#requirements)
    -   [1.2 The basics](#the-basics)
        -   [1.2.1 vmlinuz v.s zImage](#vmlinuz-v-s-zimage)
        -   [1.2.2 Debugging the kernel](#debugging-the-kernel)
        -   [1.2.3 Loading a kernel in
            memory](#loading-a-kernel-in-memory)
        -   [1.2.4 Getting the kernel log
            buffer](#getting-the-kernel-log-buffer)
        -   [1.2.5 Debugging a kernel module (.o and -ko
            )](#debugging-a-kernel-module-o-and-ko)
    -   [1.3 Determining the module load
        address](#determining-the-module-load-address)
    -   [1.4 Loading Symbols of a loaded
        module](#loading-symbols-of-a-loaded-module)
    -   [1.5 Pointers](#pointers)

# Debugging the linux kernel using gdb

The majority of day to day kernel debugging is done by adding print
statements to code by using the famous printk function. This technique
is well described in [Kernel Debugging
Tips](http://eLinux.org/Kernel_Debugging_Tips "Kernel Debugging Tips"). Using printk is a
relatively simple, effective and cheap way to find problems. But there
are also many other Linux-grown techniques that take debugging and
profiling to a higher level. On this page, we will discuss using the GNU
debugger (GDB) to do kernel debugging. The [GDB](http://eLinux.org/GDB "GDB") page
describes some basic gdb command and also gives good links to
documentation. Overall, starting using gdb to do kernel debugging is
relatively easy.

Most of the examples here will work in two (open source) situations.
When using [JTAG](http://eLinux.org/JTAG "JTAG") and when using [QEMU](http://eLinux.org/Qemu "Qemu")
system emulation. As the second option does not require any hardware,
you can go on and try it right away!

The open source JTAG debugging world is not that big. One project that
stands out in terms of debugging capabilities is OpenOCD and this is the
tool used in this documentation.
[OpenOCD](http://openocd.berlios.de/web/) is pretty usable on the ARM11
and ARM9 targets we tested.

## Requirements

GDB:

You need to get a GDB that is capable of understanding your target
architecture. Often, this comes with your cross-compiler, but if you
have to, you can compile it yourself, but you need to understand the
difference between --target and --host configure options. GDB will be
running on the host (e.g. x86) but will be able to understand the target
(e.g. armv6). You may also want to have the gdbserver that can serve as
a stub for your user land debugging.

OpenOCD:

TODO...

A JTAG Dongle:

TODO...

## The basics

[![Kernel gdb debugging component overvierw
small.png](http://eLinux.org/images/3/3c/Kernel_gdb_debugging_component_overvierw_small.png)](http://eLinux.org/File:Kernel_gdb_debugging_component_overvierw_small.png)

To debug the kernel, you will need to configure it to have debug
symbols. Once this is done, you can do your normal kernel development.
When needed, you can "hook-up" your debugger. Start debugging a running
kernel.

- start openocd

### vmlinuz v.s zImage

When you want to debug the kernel you need a little understanding of how
the kernel is composed. Most important is the difference between your
vmlinux and the zImage. What you need to understand at this point is
that the zImage is a container. This container gets loaded by a boot
loader and that execution is handed over to the zImage. This zImage
unpacks the kernel to the same memory location and starts executing the
kernel. (explain that vmlinux does not have to be the real kernel as it
is possible to debug a "stripped" kernel using a non stripped vmlinux).
overall if we look at a compiled kernel we will see that vmlinux is
located at the root of the kernel tree whiles the zImage is located
under arch/arm/boot

    vmlinux
    arch/arm/boot
    `-- zImage

vmlinux is what we will be using during debugging of the Linux kernel.

### Debugging the kernel

The JTAG based debugging method described here is not intrusive. This
means that besides debugging symbols you don't need to modify the kernel
in any way. This is because we operate on the hardware, CPU core level.
Overall this means that you can follow your normal development method.
You can let your bootstrap and boot loader do their work and for example
start debugging a running kernel. If your gdb-aware debugger is running
it can be as simple as loading the vmlinuz and connecting to the remote
target:

    load vmlinuz
    target remote :3333

### Loading a kernel in memory

Once you are used to using gdb to debug kernels you will want to use gdb
to directly load kernels onto your target. The most practical way of
doing this is to set a hardware breakpoint at the start of the kernel
and reset your board using the JTAG reset signal. Your boot loader will
initialize your board and the execution will stop at the start of the
kernel. After that you can load a kernel into memory and run it.

Execute the following:

    (gdb) file vmlinux
    (gdb) target remote :3333
    (gdb) break __init_begin
    (gdb) cont
    (gdb) mon reset #perhaps this needs to be done from the openocd telnet session..
    Breakpoint 1, 0xc0008000 in stext ()
    (gdb) load vmlinux
    Loading section .text.head, size 0x240 lma 0xc0008000
    Loading section .init, size 0xe4dc0 lma 0xc0008240
    Loading section .text, size 0x219558 lma 0xc00ed000
    Loading section .text.init, size 0x7c lma 0xc0306558
    Loading section __ksymtab, size 0x4138 lma 0xc0307000
    Loading section __ksymtab_gpl, size 0x1150 lma 0xc030b138
    Loading section __kcrctab, size 0x209c lma 0xc030c288
    Loading section __kcrctab_gpl, size 0x8a8 lma 0xc030e324
    Loading section __ksymtab_strings, size 0xc040 lma 0xc030ebcc
    Loading section __param, size 0x2e4 lma 0xc031ac0c
    Loading section .data, size 0x1e76c lma 0xc031c000
    Start address 0xc0008000, load size 3345456
    Transfer rate: 64 KB/sec, 15632 bytes/write.
    (gdb) cont

This will boot your kernel that was loaded into memory via JTAG.

### Getting the kernel log buffer

Sometimes the kernel will panic before the serial is up and running. In
such situations is it **very** handy to be able to dump the kernel log
buffer. This can be done by looking at the content of the \_\_log\_buf
in the kernel. In gdb this can be done by issuing

    p (char*) &__log_buf[log_start]

There must be a simple way of printing the memory area between
log\_start and log\_end.

The problem is that gdb stops after the first line. Currently we use
this routine that copied from wchar.gdb until something "normal" came
out. We defined dmesg it like this:

    define dmesg
            set $__log_buf = $arg0
            set $log_start = $arg1
            set $log_end = $arg2
            set $x = $log_start
            echo "
            while ($x < $log_end)
                    set $c = (char)(($__log_buf)[$x++])
                    printf "%c" , $c
            end
            echo "\n
    end
    document dmesg
    dmesg __log_buf log_start log_end
    Print the content of the kernel message buffer
    end

and call it like this:

    dmesg __log_buf log_start log_end

### Debugging a kernel module (.o and .ko )

Debugging a kernel module is harder.

## Determining the module load address

gdb itself does not have knowledge about kernel modules and when
debugging a kernel module. We will need to help gdb a little. One
problem with modules is that it is not possible to determine where in
the memory a module will be loaded before it is actually loaded so only
once it is loaded we need to determine the address in memory it is
loaded and tell gdb about it. There are many ways of determining this
information. Here are 3 ways:

    lsmod

    cat /sys/module/mydriver/sections/.text

     #gdb implementation of the linux lsmod
     define lsmod
            set $current = modules.next
            set $offset =  ((int)&((struct module *)0).list)
        printf "Module\tAddress\n"
     
        while($current.next != modules.next)
                    printf "%s\t%p\n",  \
                            ((struct module *) (((void *) ($current)) - $offset ) )->name ,\
                            ((struct module *) (((void *) ($current)) - $offset ) )->module_core
                    set $current = $current.next
            end
    end

## Loading Symbols of a loaded module

    add-symbol-file drivers/mydrivers/mydriver.o 0xbf098000

Note that we use the .o file and not the .ko one. The address at the end
is the address where the kernel decided to load the module

## Pointers

In the Linux Documentation directory under the kdump you will find file
called gdbmacros.txt and it looks very promising as among other things
it contains the a dmesg implementation

    head  linux-2.6.22.1/Documentation/kdump/gdbmacros.txt
    #
    # This file contains a few gdb macros (user defined commands) to extract
    # useful information from kernel crashdump (kdump) like stack traces of
    # all the processes or a particular process and trapinfo.
    #


 A "find . -name "\*gdb\*" in the linux kernel directory also shows up a
few interesting .gdbinit files that apparently can perform low level
initialization.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

