> From: [eLinux.org](http://eLinux.org/Printk_Times_Sample1 "http://eLinux.org/Printk_Times_Sample1")


# Printk Times Sample1



This shows output from show\_delta from the command: "show\_delta
tim\_hp\_run1"

Note that the time information is shown as the delta from one printk to
the next. From this run, for example, we can see that Calibrating the
delay loop (about 19 lines down) takes 268 milliseconds, or more than a
quarter second!

For an example showing output with all timings relative to a single
base, see [Printk Times
Sample2](http://eLinux.org/Printk_Times_Sample2 "Printk Times Sample2") and [Printk Times
Sample3](http://eLinux.org/Printk_Times_Sample3 "Printk Times Sample3")

    [13.206492 < 13.206492 >]  Linux version 2.4.20-celf1 (tbird@tim_hp) (gcc version 2.96 20000731 (Red Hat Linux 7.3 2.96-113)) #1 Wed Jan 28 10:10:47 PST 2004
    [13.206505 < 0.000013 >]  BIOS-provided physical RAM map:
    [13.206509 < 0.000004 >]   BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
    [13.206513 < 0.000004 >]   BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
    [13.206516 < 0.000004 >]   BIOS-e820: 00000000000e8000 - 0000000000100000 (reserved)
    [13.206520 < 0.000003 >]   BIOS-e820: 0000000000100000 - 000000001ffe7800 (usable)
    [13.206523 < 0.000003 >]   BIOS-e820: 000000001ffe7800 - 0000000020000000 (reserved)
    [13.206526 < 0.000003 >]   BIOS-e820: 00000000fec00000 - 0000000100000000 (reserved)
    [13.206531 < 0.000005 >]  0MB HIGHMEM available.
    [13.206533 < 0.000002 >]  511MB LOWMEM available.
    [13.207373 < 0.000840 >]  On node 0 totalpages: 131047
    [13.212686 < 0.005313 >]  zone(0): 4096 pages.
    [13.212938 < 0.000252 >]  zone(1): 126951 pages.
    [13.217979 < 0.005041 >]  zone(2): 0 pages.
    [13.218314 < 0.000335 >]  Kernel command line: ro root=/dev/hda3 init=/sbin/celinux-init
    [13.218322 < 0.000008 >]  Initializing CPU#0
    [13.658919 < 0.440597 >]  Detected 2992.547 MHz processor.
    [13.660085 < 0.001166 >]  Console: colour VGA+ 80x25
    [13.660305 < 0.000221 >]  Calibrating delay loop... 5976.88 BogoMIPS
    [13.928392 < 0.268087 >]  Use CONFIG_INSTANT_ON_LPJ=29884416 for Instant On.
    [13.953166 < 0.024774 >]  Memory: 515600k/524188k available (1150k kernel code, 8200k reserved, 455k data, 116k init, 0k highmem)
    [13.953235 < 0.000068 >]  Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
    [13.953398 < 0.000163 >]  Inode cache hash table entries: 32768 (order: 6, 262144 bytes)
    [13.953659 < 0.000261 >]  Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
    [13.953745 < 0.000086 >]  Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
    [13.953883 < 0.000137 >]  Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
    [13.954387 < 0.000504 >]  CPU: L1 I cache: 0K, L1 D cache: 8K
    [13.954404 < 0.000017 >]  CPU: L2 cache: 512K
    [13.954419 < 0.000015 >]  Intel machine check architecture supported.
    [13.954437 < 0.000019 >]  Intel machine check reporting enabled on CPU#0.
    [13.954461 < 0.000023 >]  CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
    [13.954464 < 0.000003 >]  CPU:             Common caps: bfebfbff 00000000 00000000 00000000
    [13.954467 < 0.000003 >]  CPU: Intel(R) Pentium(R) 4 CPU 3.00GHz stepping 09
    [13.954496 < 0.000030 >]  Enabling fast FPU save and restore... done.
    [13.954517 < 0.000020 >]  Enabling unmasked SIMD FPU exception support... done.
    [13.954545 < 0.000028 >]  Checking 'hlt' instruction... OK.
    [13.988384 < 0.033839 >]  POSIX conformance testing by UNIFIX
    [13.988412 < 0.000028 >]  mtrr: v1.40 (20010327) Richard Gooch (rgooch@atnf.csiro.au)
    [13.988415 < 0.000002 >]  mtrr: detected mtrr type: Intel
    [13.988713 < 0.000298 >]  PCI: PCI BIOS revision 2.20 entry at 0xec677, last bus=5
    [13.988737 < 0.000025 >]  PCI: Using configuration type 1
    [13.988754 < 0.000017 >]  PCI: Probing PCI hardware
    [13.989415 < 0.000661 >]  Transparent bridge - Intel Corp. 82801BA/CA/DB PCI Bridge
    [13.989443 < 0.000028 >]  PCI: Using IRQ router default [8086/24d0] at 00:1f.0
    [14.030330 < 0.040887 >]  isapnp: Scanning for PnP cards...
    [14.386221 < 0.355891 >]  isapnp: No Plug & Play device found
    [14.386236 < 0.000015 >]  Linux NET4.0 for Linux 2.4
    [14.386250 < 0.000014 >]  Based upon Swansea University Computer Society NET3.039
    [14.386277 < 0.000027 >]  Initializing RT netlink socket
    [14.386312 < 0.000035 >]  apm: BIOS not found.
    [14.386342 < 0.000030 >]  Starting kswapd
    [14.386357 < 0.000015 >]  Disabling the Out Of Memory Killer
    [14.386399 < 0.000043 >]  VFS: Disk quotas vdquot_6.5.1
    [14.388460 < 0.002061 >]  pty: 2048 Unix98 ptys configured
    [14.388503 < 0.000043 >]  Serial driver version 5.05c (2001-07-08) with MANY_PORTS MULTIPORT SHARE_IRQ SERIAL_PCI ISAPNP enabled
    [14.388606 < 0.000103 >]  ttyS00 at 0x03f8 (irq = 4) is a 16550A
    [14.388642 < 0.000036 >]  Real Time Clock Driver v1.10e
    [14.388686 < 0.000044 >]  Uniform Multi-Platform E-IDE driver Revision: 6.31
    [14.388708 < 0.000022 >]  ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
    [14.388741 < 0.000033 >]  PCI_IDE: unknown IDE controller on PCI bus 00 device f9, VID=8086, DID=24db
    [14.388766 < 0.000025 >]  PCI: Enabling device 00:1f.1 (0005 -> 0007)
    [14.388788 < 0.000021 >]  PCI_IDE: chipset revision 2
    [14.388803 < 0.000016 >]  PCI_IDE: not 100% native mode: will probe irqs later
    [14.388826 < 0.000023 >]      ide0: BM-DMA at 0x24c0-0x24c7, BIOS settings: hda:DMA, hdb:pio
    [14.388861 < 0.000034 >]      ide1: BM-DMA at 0x24c8-0x24cf, BIOS settings: hdc:DMA, hdd:pio
    [14.388895 < 0.000034 >]  PCI_IDE: unknown IDE controller on PCI bus 00 device fa, VID=8086, DID=24d1
    [14.388923 < 0.000028 >]  PCI_IDE: chipset revision 2
    [14.388937 < 0.000015 >]  PCI_IDE: 100% native mode on irq 10
    [14.388954 < 0.000017 >]      ide2: BM-DMA at 0x24d0-0x24d7, BIOS settings: hde:pio, hdf:pio
    [14.388988 < 0.000034 >]      ide3: BM-DMA at 0x24d8-0x24df, BIOS settings: hdg:pio, hdh:pio
    [14.758308 < 0.369320 >]  hda: WDC WD400BB-60DGA0, ATA DISK drive
    [16.117774 < 1.359466 >]  hdc: HL-DT-ST CD-ROM GCR-8480B, ATAPI CD/DVD-ROM drive
    [18.714091 < 2.596317 >]  ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
    [18.714208 < 0.000117 >]  ide1 at 0x170-0x177,0x376 on irq 15
    [18.730826 < 0.016619 >]  hda: 78165360 sectors (40021 MB) w/2048KiB Cache, CHS=5169/240/63
    [18.730869 < 0.000042 >]  ide-floppy driver 0.99.newide
    [18.730884 < 0.000015 >]  Partition check:
    [18.730900 < 0.000016 >]   hda: hda1 hda2 hda3 hda4
    [18.740674 < 0.009775 >]  Floppy drive(s): fd0 is 1.44M
    [18.742753 < 0.002079 >]  FDC 0 is a post-1991 82077
    [18.743608 < 0.000855 >]  NET4: Frame Diverter 0.46
    [18.743702 < 0.000094 >]  RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
    [18.743725 < 0.000023 >]  ide-floppy driver 0.99.newide
    [18.743752 < 0.000027 >]  md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
    [18.743846 < 0.000094 >]  md: Autodetecting RAID arrays.
    [18.743861 < 0.000015 >]  md: autorun ...
    [18.743874 < 0.000013 >]  md: ... autorun DONE.
    [18.743894 < 0.000019 >]  NET4: Linux TCP/IP 1.0 for NET4.0
    [18.743908 < 0.000015 >]  IP Protocols: ICMP, UDP, TCP, IGMP
    [18.743966 < 0.000058 >]  IP: routing cache hash table of 4096 buckets, 32Kbytes
    [18.744322 < 0.000356 >]  TCP: Hash tables configured (established 32768 bind 65536)
    [18.744362 < 0.000041 >]  Linux IP multicast router 0.06 plus PIM-SM
    [18.744390 < 0.000028 >]  NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
    [18.752754 < 0.008364 >]  EXT2-fs warning (device ide0(3,3)): ext2_read_super: mounting ext3 filesystem as ext2
    [18.752757 < 0.000002 >]
    [18.764113 < 0.011356 >]  VFS: Mounted root (ext2 filesystem) readonly.
    [18.764140 < 0.000027 >]  Freeing unused kernel memory: 116k freed


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Printk](http://eLinux.org/Category:Printk "Category:Printk")

