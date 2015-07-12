> From: [eLinux.org](http://eLinux.org/Printk_Times_Sample3 "http://eLinux.org/Printk_Times_Sample3")


# Printk Times Sample3



This is the output from show\_delta using the 'base' option:
`show_delta -b "Calibrating" tim_hp_run1 `

This shows all the timing data relative to the line starting with the
string "Calibrating" (about 19 lines into the output). The "-b" option
can be used to set a different time base for the timing information.
From this you can easily tell that calibrate\_delay\_loop took 268
milliseconds, or more than a quarter of a second.

Compare this output to [Printk Times
Sample1](http://eLinux.org/Printk_Times_Sample1 "Printk Times Sample1") or [Printk Times
Sample2](http://eLinux.org/Printk_Times_Sample2 "Printk Times Sample2")

    base= "Calibrating"
    [13.206492 < -0.453813 >]  Linux version 2.4.20-celf1 (tbird@tim_hp) (gcc version 2.96 20000731 (Red Hat Linux 7.3 2.96-113)) #1 Wed Jan 28 10:10:47 PST 2004
    [13.206505 < -0.453800 >]  BIOS-provided physical RAM map:
    [13.206509 < -0.453796 >]   BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
    [13.206513 < -0.453792 >]   BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
    [13.206516 < -0.453789 >]   BIOS-e820: 00000000000e8000 - 0000000000100000 (reserved)
    [13.206520 < -0.453785 >]   BIOS-e820: 0000000000100000 - 000000001ffe7800 (usable)
    [13.206523 < -0.453782 >]   BIOS-e820: 000000001ffe7800 - 0000000020000000 (reserved)
    [13.206526 < -0.453779 >]   BIOS-e820: 00000000fec00000 - 0000000100000000 (reserved)
    [13.206531 < -0.453774 >]  0MB HIGHMEM available.
    [13.206533 < -0.453772 >]  511MB LOWMEM available.
    [13.207373 < -0.452932 >]  On node 0 totalpages: 131047
    [13.212686 < -0.447620 >]  zone(0): 4096 pages.
    [13.212938 < -0.447367 >]  zone(1): 126951 pages.
    [13.217979 < -0.442326 >]  zone(2): 0 pages.
    [13.218314 < -0.441991 >]  Kernel command line: ro root=/dev/hda3 init=/sbin/celinux-init
    [13.218322 < -0.441983 >]  Initializing CPU#0
    [13.658919 < -0.001387 >]  Detected 2992.547 MHz processor.
    [13.660085 < -0.000221 >]  Console: colour VGA+ 80x25
    [13.660305 < 0.000000 >]  Calibrating delay loop... 5976.88 BogoMIPS
    [13.928392 < 0.268087 >]  Use CONFIG_INSTANT_ON_LPJ=29884416 for Instant On.
    [13.953166 < 0.292861 >]  Memory: 515600k/524188k available (1150k kernel code, 8200k reserved, 455k data, 116k init, 0k highmem)
    [13.953235 < 0.292929 >]  Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
    [13.953398 < 0.293093 >]  Inode cache hash table entries: 32768 (order: 6, 262144 bytes)
    [13.953659 < 0.293354 >]  Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
    [13.953745 < 0.293440 >]  Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
    [13.953883 < 0.293578 >]  Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
    [13.954387 < 0.294081 >]  CPU: L1 I cache: 0K, L1 D cache: 8K
    [13.954404 < 0.294099 >]  CPU: L2 cache: 512K
    [13.954419 < 0.294113 >]  Intel machine check architecture supported.
    [13.954437 < 0.294132 >]  Intel machine check reporting enabled on CPU#0.
    [13.954461 < 0.294155 >]  CPU:     After generic, caps: bfebfbff 00000000 00000000 00000000
    [13.954464 < 0.294159 >]  CPU:             Common caps: bfebfbff 00000000 00000000 00000000
    [13.954467 < 0.294162 >]  CPU: Intel(R) Pentium(R) 4 CPU 3.00GHz stepping 09
    [13.954496 < 0.294191 >]  Enabling fast FPU save and restore... done.
    [13.954517 < 0.294212 >]  Enabling unmasked SIMD FPU exception support... done.
    [13.954545 < 0.294240 >]  Checking 'hlt' instruction... OK.
    [13.988384 < 0.328079 >]  POSIX conformance testing by UNIFIX
    [13.988412 < 0.328107 >]  mtrr: v1.40 (20010327) Richard Gooch (rgooch@atnf.csiro.au)
    [13.988415 < 0.328109 >]  mtrr: detected mtrr type: Intel
    [13.988713 < 0.328407 >]  PCI: PCI BIOS revision 2.20 entry at 0xec6
    ...


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Printk](http://eLinux.org/Category:Printk "Category:Printk")

