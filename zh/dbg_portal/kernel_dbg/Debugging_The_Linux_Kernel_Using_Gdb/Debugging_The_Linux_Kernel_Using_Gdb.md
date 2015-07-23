> 原文：[eLinux.org](http://eLinux.org/Debugging_The_Linux_Kernel_Using_Gdb "http://eLinux.org/Debugging_The_Linux_Kernel_Using_Gdb") <br />
> 翻译：[@codingbelief](https://github.com/codingbelief) <br />
> 校订：[@lzufalcon](https://github.com/lzufalcon) <br />

# 使用 Gdb 调试Linux Kernel


## Contents
## 目录
-   [1 使用 gdb 调试 linux 内核](#debugging-the-linux-kernel-using-gdb)
    -   [1.1 需求](#requirements)
    -   [1.2 基础](#the-basics)
        -   [1.2.1 vmlinuz 与 zImage](#vmlinuz-v-s-zimage)
        -   [1.2.2 调试内核](#debugging-the-kernel)
        -   [1.2.3 加载内核到内存](#loading-a-kernel-in-memory)
        -   [1.2.4 获取内核日志缓冲区](#getting-the-kernel-log-buffer)
        -   [1.2.5 调试内核模块（.o和.ko）](#debugging-a-kernel-module-o-and-ko)
    -   [1.3 确定内核模块的加载地址](#determining-the-module-load-address)
    -   [1.4 加载已载入内存的内核模块的符号信息](#loading-symbols-of-a-loaded-module)
    -   [1.5 提示](#pointers)

# 使用 gdb 调试 linux 内核

在代码中添加 printk 打印语句是日常内核调试中最主要的方法，该方法在 [Kernel Debugging
Tips](http://eLinux.org/Kernel_Debugging_Tips "Kernel Debugging Tips") 中有很详细的描述。
使用 printk 是一种相对简单、高效并且成本较低的定位问题所在的方法。然而，在 linux 世界中还有很多其他的调试方法，
可以进行更高层次的调试和分析。在此篇文章中，我们将探讨下使用 GNU 调试器（即，GDB）进行内核的调试。
在 [GDB](http://eLinux.org/GDB "GDB") 文章中，我们将介绍基本的 gdb 命令，同时也会提供一些优秀的参考文章的链接。
总的来说，使用 gdb 进行内核的调试，是比较容易的。

本文中的绝大部分例程，都可以在 [JTAG](http://eLinux.org/JTAG "JTAG") 或者 [QEMU](http://eLinux.org/Qemu "Qemu") 模拟器两种环境下运行。另外，使用 QEMU 模拟器的话，不需要具体硬件的支持，可以很快上手。

开源的 JTAG 调试工具并不多，OpenOCD 是其中调试能力比较优秀的一个。在本文中，主要也是使用这一工具进行调试。
经我们的实测，[OpenOCD](http://openocd.berlios.de/web/) 在 ARM11 和 ARM9 平台下，都可以很好的完成调试任务。

## 需求

GDB：

首先你需要获取能够适配待调试目标板（target）CPU 架构的 GDB 工具。通常，你的交叉编译工具包中会包含适用的 GDB。
当然，你也可以自行编译生成 GDB。如果是自行编译生成 GDB，那么需要注意理清楚 `--target` 和 `--host` 配置项的区别。
GDB 是需要运行在 host 端（例如：x86），同时 GDB 还需要能够适配 target 端的架构（例如：armv6）。
如果你还需要进行用户空间的调试，你还需要 gdbserver。

OpenOCD:

TODO...

A JTAG Dongle:

TODO...

## 基础

[![Kernel gdb debugging component overvierw
small.png](http://eLinux.org/images/3/3c/Kernel_gdb_debugging_component_overvierw_small.png)](http://eLinux.org/File:Kernel_gdb_debugging_component_overvierw_small.png)

进行内核的调试前，首先需要配置内核，使其包含符号信息。然后在开发过程中，需要进行调试的时候，只需要接入调试器
就可以开始内核的调试。

- 启动OpenOCD

### vmlinuz 与 zImage

想要进行内核的调试，首先要弄明白内核的组成。其中最重要的一点，是 vmlinuz 与 zImage 之间
的区别。zImage 可以理解为一个容器，这个容器会在启动的时候，被 bootloader 加载到内存，然后 bootloader 再
将执行权转交给 zImage。而后，zImage 会将其包含的内核解压到内存中特定的一个地址，
该地址与 zImage 被 bootloader 加载到的地址相同。内核解压完毕后，就会重新从内核开始执行。
（调试内核时，并不是一定要使用实际运行在机器上的 “stripped” 的内核，我们可以使用没有 “stripped” 的 vmlinuz
来调试 “stripped” 的内核）。内核编译结束后，vmlinux 文件位于内核源码的根目录,而 zImage 则位于 arch/arm/boot 目录下。

    vmlinux
    arch/arm/boot
    `-- zImage

vmlinux 就是我们进行 Linux 内核调试时需要用到的内核镜像。

### 调试内核

这里描述的基于 JTAG 的调试方法是非侵入式的，即除了配置添加符号信息外，
不需要对内核的代码进行修改。之所以能做到这点，是因为我们的调试操作是
基于硬件的，CPU 层面的调试。这也意味着，你可以在正常的开发过程中，随时进行调试操作，
例如你可以启动系统后，让 bootloader 加载内核，然后对正在运行的内核进行调试。
如果你的调试器是 “gdb-aware”（即可以支持 GDB 的调试功能），那么你就可以简单的使用下面
的方式加载 vmlinuz，连接到待调试的 target：

    load vmlinuz
    target remote :3333

### 加载内核到内存

当你熟悉了使用 gdb 进行内核调试后，你可能会想要使用 gdb 直接把内核加载到你的目标板上进行调试。
这种情况下，最有效的方法应该是在内核开始执行的地方设置一个硬件断点，然后用 JTAG 复位开发板。复位后，
bootloader 会启动并且初始化开发板，接着代码的执行会停留在设定好的断点处，即内核开始执行的地方。
此时，你就可以主动加载一个内核到内存并执行。

加载内核的操作流程如下：

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

按照上述操作执行就可以通过 JTAG 加载内核到内存并启动。

### 获取内核日志缓冲区

有时候，内核会在串口正常工作前就发生了 panic。在这种情况下，打印内核的日志信息
是件比较麻烦的事。实际上，此时可以通过直接读取内核的 `__log_buf` 来获取日志信息。
使用gdb时，可以通过下面的方式获取到：

    p (char*) &__log_buf[log_start]

另外，我们还有更简单的方式，来打印 `log_start` 到 `log_end` 内存里的内容。

由于 gdb 在遇到换行的时候，就会停止执行，所以打印时，我们使用下面的 routine，
该 routine 是从 wchar.gdb 拷贝过来的，它定义了如下的 dmesg 命令：

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

当需要打印时，按照下面的方式调用即可：

    dmesg __log_buf log_start log_end

### 调试内核模块（.o和.ko）

调试内核模块是一件更为困难的事

## 确定内核模块的加载地址

gdb 本身不能识别内核模块，同时也不清楚是否正在调试内核模块。因此，使用 gdb 调试
内核模块时，我们需要提供一些额外的信息给 gdb。在调试内核模式时，gdb 自身是没办法知道
内核模块在内存中的加载地址的，因此，需要我们先获取到模块的加载地址，然后传递给 gdb。
我们可以通过以下3种方法获取到内核模块的加载地址信息：

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

## 加载已载入内存的内核模块的符号信息

    add-symbol-file drivers/mydrivers/mydriver.o 0xbf098000

上面命令中需要注意的是，我们使用的是 .o 文件，而不是 .ko 文件。命令的最后是内核加载模块的地址。

## 提示

在 Linux 的 Documentation 目录中的 kump 目录下，有一个名为 gdbmacros.txt 的文件，该文件定义了
不少很有用的 gdb 宏，同时他还包含了 dmesg 的实现。

    head  linux-2.6.22.1/Documentation/kdump/gdbmacros.txt
    #
    # This file contains a few gdb macros (user defined commands) to extract
    # useful information from kernel crashdump (kdump) like stack traces of
    # all the processes or a particular process and trapinfo.
    #


在内核源码目录下使用命令 `find . -name "\*gdb\*"`，还可以搜索出一些 .gdbinit 文件，这些文件可以
进行底层的初始化操作。

[分类](http://eLinux.org/Special:Categories "Special:Categories"):

-   [开发工具](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

