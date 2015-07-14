> From: [eLinux.org](http://eLinux.org/Kgdb "http://eLinux.org/Kgdb")


# Kgdb



It is fascinating to think that you have control over running Linux
Kernel. You can stop, can single-step, can resume and even can put
break-points on running Kernel. In fact, you can debug the kernel as
easily as you debug any application.

## Contents

-   [1 How to setup kgdb](#how-to-setup-kgdb)
-   [2 Hardware Requirements](#hardware-requirements)
-   [3 Preparing Kernel to be
    Debugged](#preparing-kernel-to-be-debugged)
-   [4 There are several possible problems that you may
    face](#there-are-several-possible-problems-that-you-may-face)
-   [5 Using an IDE](#using-an-ide)

## How to setup kgdb

The steps mentioned here are with reference to 2.6.26 Kernel. The main
reason is KGDB code is merged into Linux tree from 2.6.26-RC5 kernel.
(As a side note, for kernel \< 2.6.26-RC5, you have to get kgdb patch
from [
[http://kgdb.linsyssoft.com/kernel.htm](http://kgdb.linsyssoft.com/kernel.htm)]
and apply them to kernel)

## Hardware Requirements

Two x86 machines are required for using KGDB. One of the machines runs a
kernel to be debugged called "TEST MACHINE". The other machine runs gdb
"DEVELOPMENT MACHINE". A serial line is required between the development
and the test machine. And so obviously, machines need one serial port
each. Basically, you will be sending "Debugging Commands" from
"DEVELOPMENT MACHINE" to "TEST MACHINE".

## Preparing Kernel to be Debugged

1. Download the source of kernel (for e.g., 2.6.26.2)from kernel.org

2. Recompile the Kernel on "DEVELOPMENT MACHINE". Go to Kernel Hacking
and Enable the following options:

    -*- Magic SysRq key
    [*] Compile the kernel with debug info
    [*] KGDB: kernel debugging with remote gdb  --->

And in KGDB:

    --- KGDB: kernel debugging with remote gdb
    <*>   KGDB: use kgdb over the serial console
    [ ]   KGDB: internal test suite

3. Build kernel and modules

        make -j 12 && make modules && make modules_install

4. Transfer the vmlinux and system.map and initrd.img files on "TEST
MACHINE".

5. Now, edit the GRUB entry for that kernel on "TEST MACHINE". Add
kernel options/kernel parameters like kgdbwait and kgdboc=ttyS0,115200

       For e.g., kernel /vmlinux ro root=LABEL=/ rhgb quiet crashkernel=128M@16M kgdbwait kgdboc=ttyS0,115200

kgdbwait -- \> This will make Kernel to wait on boot time and will
expect someone to connect to it and give further commands kgdboc --\>
This is a KGDB I/O driver and we are supplying two arguments. ttyS0 will
tell that communication will happen on Serial Port 0 and 115200 is the
baudrate.

6. Now boot the Kernel with those kernel parameters.

7. On dev machine, start GDB session.

       [dev@einfochips]gdb vmlinux

The argument vmlinux file is the file that is created with Debug
symbols. It will be of much larger size and more than likely to be in
the directory where you gave "make" command..

8. Assuming that on "DEVELOPMENT MACHINE" you have set serial interface
baudrate as 115200. Connect to the "TEST MACHINE" with target command.

       (gdb)target remote /dev/ttyS0

9. This will stop your Kernel booting on "TEST MACHINE" and will give
control to your "DEVELOPMENT MACHINE". Now, you can do Single-stepping
or put breakpoints and etc.

10. Once your Kernel is running on "TEST MACHINE" and you want control
over your running kernel from "DEVELOPMENT MACHINE", You have to send
MANUALLY on TEST machine SysRq command. So, on "TEST MACHINE" press
SysRq + g

       (i.e., press "ALT" key then Press "PrintScreen" Key and then Press "g" key)

## There are several possible problems that you may face

1. Your Kernel is booted and SysRq+g is not working.

       [r00t@einfochips] echo 1 > /proc/sys/kernel/sysrq

This will enable sending SysRq commands.

2. You may find some time that while stopping execution through SysRq
key on "TEST MACHINE", it stops but then it is not able to communicate
over serial cable with "DEVELOPMENT MACHINE". The reason can be, your
KGDB I/O driver is not passed arguments properly and you may need to
reconfigure the driver by following way,

       [root@einfochips]echo "ttyS0,115200" > /sys/modules/<module name>/parameters

3. The target board has a single serial port that needs to be shared
between the console and kgdb.

       The kgdb Docbook refers to using a proxy to split the serial port data stream
       between gdb and the console terminal emulator.  proxy programs include:

         kgdb demux (kdmx) Media:Kdmx_v140904a.tar.gz
                            (moved to agent-proxy git)
         kgdb demux (kdmx)
                            kdmx at elinux.org
                            https://git.kernel.org/cgit/utils/kernel/kgdb/agent-proxy.git/
                            git clone git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git/
         agent-proxy
                            https://git.kernel.org/cgit/utils/kernel/kgdb/agent-proxy.git/
                            git clone git://git.kernel.org/pub/scm/utils/kernel/kgdb/agent-proxy.git/

       (frowand: I have been using kdmx successfully.  I have not tried using agent-proxy.)

## Using an IDE

You can debug Linux Kernel over KGDB with Visual Studio using the
VisualKernel plugin. [This
tutorial](http://visualkernel.com/tutorials/kgdb) shows how to use it
with KGDB.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

