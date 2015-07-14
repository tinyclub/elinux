> From: [eLinux.org](http://eLinux.org/Kernel_XIP_Instructions_For_OMAP "http://eLinux.org/Kernel_XIP_Instructions_For_OMAP")


# Kernel XIP Instructions For OMAP



This page describes how to configure the kernel, write the kernel to an
appropriate area of flash memory, and boot it, using a CELF CE-Linux
kernel (linux version 2.4.20) on an OMAP innovator board. These
instructions are somewhat old now, but they have general information
which may still be useful for using [Kernel
XIP](http://eLinux.org/Kernel_XIP "Kernel XIP") on some boards.

* * * * *

Atsushi Settsu of Mitsubishi Electric Corp. wrote the following:

This is a procedure to set up kernel with Kernel-XIP when we try on
Innovator OMAP.

The software used for this test was the CELinux-040126 kernel.

CELinux-040304. 1. Configure the kernel.

-   General setup-\>Kernel Execute-In-Place from ROM =y
-   General setup-\>Kernel .text physical address = 60400

Attached is the .config file used: Media:XIP.config

2. Create the kernel.

-   \$ make clean; make dep; make xipImage;

If you execute above, a kernel with Kernel-XIP is made as vmlinux.rr in
arch/arm/boot/ .

3. Write the kernel to OMAP Flash by BootLoader(rrload).

      1) Erase kernel area.

       "E. Erase [comp] from Flash.." ->
          "3. Erase [Kernel]" ->
              "Are you sure?" = "y"

      2) Load kernel(vmlinux.rr to be made at 2.) to memory.

      "1. Load [comp] from I/O port..." ->
         "3. Load [Kernel]"

      3) Write kernel to flash.

      "2. Store RAM [comp] to Flash..." ->
         "3. Store [Kernel]"

This completes the setup.

4. Boot the kernel Use

    "4. Boot Kernel/filesystem (boot_auto)"

When this option is selected in the BootLoader, the BootLoader jumps to
0x60400 of physical address in OMAP Flash, and the kernel with
Kernel-XIP is booted.

The console output is as follows:

    +-------------------------------------+
    |           Welcome to the            |
    |         DSPLinux Bootloader         |
    |                                     |
    |     rrload v4.8 by RidgeRun, Inc    |
    |     rev D by MontaVista Software    |
    |     platform: OMAP1510_INNOVATOR    |
    +-------------------------------------+

    MAIN MENU
    ---------
      1. Load [comp] from I/O port...
      2. Store RAM [comp] to Flash...
      3. View/Edit Params...
      4. Boot Kernel/filesystem (boot_auto)
      5. CmdLine Mode
      6. Dump memory

      r. Run Default Boot Cmd
      E. Erase [comp] from Flash...

      Which? 4
    Jumping to 0x00060400
    Linux version 2.4.20-celf1 (settsu@tux) (gcc %P!<%8%g%s 3.2.1 20020930 (MontaViT
    CPU: Arm925Tsid(wt) [54029252] revision 2 (ARMv4T)
    CPU: D write-back cache
    CPU: I cache: 16384 bytes, associativity 2, 16 byte lines, 512 sets
    CPU: D cache: 8192 bytes, associativity 2, 16 byte lines, 256 sets
    Machine: TI-Innovator/OMAP1510
    On node 0 totalpages: 8192
    zone(0): 8192 pages.
    zone(1): 0 pages.
    zone(2): 0 pages.
    Kernel command line: mem=32M console=ttyS0,115200n8 noinitrd root=/dev/nfs ip=bp
    Console: colour dummy device 80x30
    Calibrating delay loop... 83.76 BogoMIPS
    Use CONFIG_INSTANT_ON_LPJ=418816 for Instant On.
    Memory: 32MB = 32MB total
    Memory: 32088KB available (1405K code, 274K data, 59K init)
    Dentry cache hash table entries: 4096 (order: 3, 32768 bytes)
    Inode cache hash table entries: 2048 (order: 2, 16384 bytes)
    Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
    Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
    Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
    POSIX conformance testing by UNIFIX
    Initializing the Linux Driver Model...
    Linux NET4.0 for Linux 2.4
    Based upon Swansea University Computer Society NET3.039
    Initializing RT netlink socket
    Innovator FPGA Rev 2.0 Board Rev 16
    Power Management for the OMAP1510 is initialized pm_idle 0xd807ad00
    OMAP1510 Innovator Dynamic Power Management
    Starting kswapd
    Disabling the Out Of Memory Killer
    pty: 256 Unix98 ptys configured
    Serial driver version 5.05c (2001-07-08) with no serial options enabled
    ttyS00 at 0xfffb0000 (irq = 46) is a OMAP UART
    ttyS01 at 0xfffb0800 (irq = 47) is a OMAP UART
    ttyS02 at 0xfffb9800 (irq = 15) is a OMAP UART
    TI Innovator/OMAP1510 keypad driver.
    innovator_ps2: Innovator PS/2 keyboard/mouse driver v1.0
    smc9194.c:v0.15 12/15/00 by Erik Stahlman (erik@vt.edu)
    eth0: SMC91C94/91C96 (rev 9) at 0xe8000300 IRQ:93 INTF:TP MEM:6144b ADDR: 00:0b0
    RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
    nvrd: NVRD size in bytes must be specified
    PPP generic driver version 2.4.2
    PPP Deflate Compression module registered
    DSPLinux FB (c) 2001 RidgeRun, Inc.
    Console: switching to colour frame buffer device 30x40
    mice: PS/2 mouse device common for all mice
    NET4: Linux TCP/IP 1.0 for NET4.0
    IP Protocols: ICMP, UDP, TCP
    IP: routing cache hash table of 512 buckets, 4Kbytes
    TCP: Hash tables configured (established 2048 bind 4096)
    Sending BOOTP requests . OK
    IP-Config: Got BOOTP answer from 192.168.128.2, my address is 192.168.128.34
    IP-Config: Complete:
          device=eth0, addr=192.168.128.34, mask=255.255.255.0, gw=192.168.128.1,
         host=192.168.128.34, domain=isl.melco.co.jp, nis-domain=(none),
         bootserver=192.168.128.2, rootserver=192.168.128.2, rootpath=/opt/mvlcee/ds
    NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
    NetWinder Floating Point Emulator V0.95 (c) 1998-1999 Rebel.com
    Looking up port of RPC 100003/2 on 192.168.128.2
    Looking up port of RPC 100005/1 on 192.168.128.2
    VFS: Mounted root (nfs filesystem).
    INIT: version 2.78 booting
    Activating swap...
    Checking all file systems...
    Parallelizing fsck version 1.22 (22-Jun-2001)
    Mounting local filesystems...
    nothing was mounted
    Cleaning: /etc/network/ifstate.
    Setting up IP spoofing protection: rp_filter.
    Disable TCP/IP Explicit Congestion Notification: done.
    Configuring network interfaces: done.
    Starting portmap daemon: portmap.
    Cleaning: /tmp /var/lock /var/run.
    INIT: Entering runlevel: 3
    Starting system log daemon: syslogd klogd.
    Starting internet superserver: inetd.

    192.168.128.34 login:


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [OMAP](http://eLinux.org/Category:OMAP "Category:OMAP")

