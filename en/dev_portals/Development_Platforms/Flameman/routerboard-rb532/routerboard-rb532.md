> From: [eLinux.org](http://eLinux.org/routerboard-rb532 "http://eLinux.org/routerboard-rb532")


# Flameman/routerboard-rb532


\< [Flameman](http://eLinux.org/Flameman "Flameman")


For more interesting projects done by Flameman, be sure to check out his
[project index](http://eLinux.org/Flameman#master_index "Flameman")

## Contents

-   [1 RouterBoard-rb532-Flameman](#routerboard-rb532-flameman)
    -   [1.1 Note](#note)
    -   [1.2 Introduction](#introduction)
        -   [1.2.1 People you could contact if you need
            help](#people-you-could-contact-if-you-need-help)
        -   [1.2.2 About the board](#about-the-board)
        -   [1.2.3 features](#features)
        -   [1.2.4 Overview](#overview)
        -   [1.2.5 Memory Locations](#memory-locations)
        -   [1.2.6 Problems](#problems)
        -   [1.2.7 Images of the board](#images-of-the-board)
    -   [1.3 Kernel](#kernel)
        -   [1.3.1 status](#status)
        -   [1.3.2 download](#download)
    -   [1.4 rootfs](#rootfs)
        -   [1.4.1 dev](#dev)
            -   [1.4.1.1 cfa](#cfa)
    -   [1.5 gpio](#gpio)
        -   [1.5.1 sources](#sources)
            -   [1.5.1.1 gpio.c](#gpio-c)
    -   [1.6 About Gentoo](#about-gentoo)
        -   [1.6.1 what/where](#what-where)
        -   [1.6.2 dmesg](#dmesg)
        -   [1.6.3 About devtools](#about-devtools)
    -   [1.7 Project](#project)
        -   [1.7.1 Router 3 port ethernet](#router-3-port-ethernet)

# RouterBoard-rb532-Flameman

## Note

i'm developing for this board, the wiki page will be improved soon

feel free to contact me (see the contact below)

## Introduction

The Target-goal of this page is

-   install gentoo-mipsel into microdrive
-   make the board able to boot from it
-   describe how to build a jtag cable (to debug and recover from
    "Brickage")
-   describe something useful with you can do with the board
-   describe other Operating Systems avalaible for the board


 logical steps about installing gentoo

-   add the JTAG connector at J10 (you could skip it, it is suggested)
-   build the JTAG cable (you could skip it, it is suggested))
-   study the bootloader
-   make partitions on the microdrive
-   populate them
-   set the bootloader environment to boot from the microdrive

### People you could contact if you need help

-   flameman, i'm currently use this board for a project, email
    -   msn daredevil-coder@hotmail.it
    -   email flamemaniii@gmail.com
    -   irc.nick flameman (channel \#edev, \#gentoo-ppc)
-   you ... if you want ;-)

* * * * *

### About the board

rb532 is a shortened name for the routerboard

you could get your board from
[http://routerboard.com/rb500.html](http://routerboard.com/rb500.html)

see the nearest reseller of the area where you live mind a brand new
boards costs 140Euro + shipping and VAT cheaper way requires (fortune
and) ebay searched for



### features

       * MIPS 32 4Kc based 266MHz (BIOS adjustable from 200 to 333 MHz; 400MHz processor factory option) embedded processor
       * 32MB DDR onboard memory
       * Boot loader, RouterBOOT, 1Mbit Flash chip
       * Data storage, 128MB onboard
       * CompactFlash type I/II slot (also supports IBM/Hitachi Microdrive)
       * Two VIA VT6105, One IDT Korina, 10/100 Mbit/s Fast Ethernet
       * Two MiniPCI Type IIIA/IIIB slots
       * Daughterboard connector Present
       * One DB9 RS232C asynchronous serial port
       * LEDs. Power, 2 LED pairs for MiniPCI slots, 1 user LED
       * Watchdog IDT internal SoC hardware watchdog timer
       * IEEE802.3af Power over Ethernet: 12V or 48V DC Power jack: 11..60V DC
       * Power jack/header 6..22V or 25..56V DC jumper selectable.
       * Dimensions. 14.0 cm x 14.0 cm (5.51 in x 5.51 in)
       * Temperature. Operational: -20°C to +70°C (-4°F to 158°F)
       * Humidity. Operational: 70% relative humidity (non-condensing)
       * Currently supported OS. RouterOS 2.9, Linux 2.4, Linux 2.6

### Overview

The board consists of:

-   **CPU** IDT MIPS 79RC32434, a solid & smart implementation of the
    mipsel little endian MIPS 32 4Kcore CPU architecture, running at
    400mhz (adjustable from 200 to 400MHz; 400MHz default and
    recommended)
-   **RAM** soldered 64MB DDR onboard memory chip
-   **LAN** On-chip 3 ethernet: One IDT Korina 10/100 Mbit/s Fast
    Ethernet port supporting Auto-MDI/X, Two VIA VT6105 10/100 Mbit/s
    Fast Ethernet ports supporting Auto-MDI/X.
-   **UART** One DB9 RS232C asynchronous serial port, speeds up to 230k,
    tested up to 115200bps
-   **miniPCI** Two MiniPCI Type IIIA/IIIB slots
-   **CF** support for IBM/Hitachi Microdrive (http://eLinux.org/dev/cfa)
-   **ROM** 1Mbit NAND flash where it is stored the bootloader
-   **POWER** IEEE802.3af Power over Ethernet: 12V or 48V DC, Power
    jack/header 6..22V or 25..56V DC jumper selectable. PoE does not
    support power over datalines
-   **System PCB 14.0 cm x 14.0 cm**
-   **RTC** the real time clock chip is missing
-   **LED** Power, 2 LED pairs for MiniPCI slots, 1 user LED
-   **Watchdog** IDT internal SoC hardware watchdog timer


 NOTE: from the base configuration of 3 Ethernet ports and 2 MiniPCI
slots (for wireless cards) it can be extended by using daughterboards
for four more MiniPCI slots, or even up to a total of 15 interfaces (9
Ethernet ports and 6 MiniPCI slots). A wide range of accepted input
power means that you can connect to almost any direct current power
source you already have on site. It also can be powered through an
Ethernet port using Power-over-Ethernet technology (802.3af) or passive
non-standard PoE.

NOTE2: there is a daughterboard for the RB532. It is called RouterBOARD
564, and It attaches to the RB532 by means of special daughterboard
connector and adds four more MiniPCI slots and six ethernet ports. You
can not use more than two AR5414 chipset (e.g. R52) cards in RB/564. If
you want to use three or four miniPCI cards in RB/564, you should use
other chipset based ones for those extra slots, like CM9. For example,
two R52 + two CM9 is OK, four CM9 is also OK, but not three or four R52.

### Memory Locations

memory map of the board will be added as soon as possible



<table>
<thead>
<tr class="header">
<th align="left">addr begin</th>
<th align="left">addr end</th>
<th align="left">area</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">...</td>
<td align="left"> ??</td>
<td align="left">ram, userspace</td>
</tr>
<tr class="even">
<td align="left">400000</td>
<td align="left"> ??</td>
<td align="left">ram, userspace</td>
</tr>
</tbody>
</table>

Open questions

* * * * *

1) how/where is ram mapped ?

2) how/where is microdrive mapped ?

3) how/where is pci mapped ?

3) what is the bootstrap addr of the flash ?

...

### Problems

...

### Images of the board

[![Rb532r5 s.jpg](http://eLinux.org/images/f/f7/Rb532r5_s.jpg)](http://eLinux.org/File:Rb532r5_s.jpg)

also see a detailed imate @ www routerboard.com/img/rb500\_l.jpg

## Kernel

### status

Korina ethernet VIA Rhine

Rhine-I-VT86C100A x Rhine-II-VT6102 Rhine-III-VT6105



<table>
<thead>
<tr class="header">
<th align="left">version</th>
<th align="left">host</th>
<th align="left">target</th>
<th align="left">toolchain</th>
<th align="left">note</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">2.6.22 vanilla+patch</td>
<td align="left">compiled on ppc-7410, minerva</td>
<td align="left">arc=mips-el, target=mips-1</td>
<td align="left">gcc-4.1.2-glibc binutils-2.19</td>
<td align="left">rocks, 6 days uptime hardly compiling, korina sometime stalls, VIA works</td>
</tr>
<tr class="even">
<td align="left">2.6.24 vanilla+patch</td>
<td align="left">compiled on ppc-7410, minerva</td>
<td align="left">arc=mips-el, target=mips-1</td>
<td align="left">gcc-4.1.2-glibc binutils-2.19</td>
<td align="left">korina is now working, VIA works (korina and VIA statically compiled)</td>
</tr>
<tr class="odd">
<td align="left">2.6.30.6 vanilla+patch --- REMOVED from kernel tree line ---</td>
<td align="left">compiled on ppc-7410, minerva</td>
<td align="left">arc=mips-el, target=mips-1</td>
<td align="left">gcc-4.1.2-glibc binutils-2.19</td>
<td align="left">korina is working, VIA is not working, name eth0 inversion, korina is not eth0, korina and VIA statically compiled, the suggestion looks like compiling the via-rhine driver as module and load it after the korina, this may works for 2.6.30.6,2.6.30.5,2.6.30.1 also with rc6</td>
</tr>
<tr class="even">
<td align="left">2.6.37 vanilla+patch</td>
<td align="left">compiled on ppc-7550, vittoria</td>
<td align="left">arc=mips-el, target=mips-1</td>
<td align="left">gcc-4.1.2-glibc binutils-2.19</td>
<td align="left">korina is working, VIA is working, intel-ipw2200(wifi minipci) is working (with an hack), cmdline patched, kernel-panik() has been patched</td>
</tr>
</tbody>
</table>

### download

kernel 2.6.22 full tested and working
[kernel-gentoo-rb532-2.6.22.gz](http://eLinux.org/index.php?title=Special:Upload&wpDestFile=Kernel-gentoo-rb532-2.6.22.gz "Kernel-gentoo-rb532-2.6.22.gz")
(suggested for production)

## rootfs

### dev

#### cfa

mknod /dev/cfa b 13 0 mknod /dev/cfa1 b 13 1 mknod /dev/cfa2 b 13 2
mknod /dev/cfa3 b 13 3



## gpio

### sources

[http://tomoyo.sourceforge.jp/cgi-bin/lxr/source/arch/mips/rb532/gpio.c](http://tomoyo.sourceforge.jp/cgi-bin/lxr/source/arch/mips/rb532/gpio.c)



#### gpio.c

    arch.mips.rb532.gpio

    001 /*
    002  *  Miscellaneous functions for IDT EB434 board
    003  *
    004  *  2004 IDT Inc. (rischelp@idt.com)
    005  *  2006 Phil Sutter <n0-1@freewrt.org>
    006  *  2007 Florian Fainelli <florian@openwrt.org>
    007  *
    027  */
    028
    029 #include <linux/kernel.h>
    030 #include <linux/gpio.h>
    031 #include <linux/init.h>
    032 #include <linux/types.h>
    033 #include <linux/pci.h>
    034 #include <linux/spinlock.h>
    035 #include <linux/io.h>
    036 #include <linux/platform_device.h>
    037
    038 #include <asm/addrspace.h>
    039
    040 #include <asm/mach-rc32434/rb.h>
    041
    042 struct rb532_gpio_reg __iomem *rb532_gpio_reg0;
    043 EXPORT_SYMBOL(rb532_gpio_reg0);
    044
    045 struct mpmc_device dev3;
    046
    047 static struct resource rb532_gpio_reg0_res[] = {
    048         {
    049                 .name   = "gpio_reg0",
    050                 .start  = (u32)(IDT434_REG_BASE + GPIOBASE),
    051                 .end    = (u32)(IDT434_REG_BASE + GPIOBASE + sizeof(struct rb532_gpio_reg)),
    052                 .flags  = IORESOURCE_MEM,
    053         }
    054 };
    055
    056 static struct resource rb532_dev3_ctl_res[] = {
    057         {
    058                 .name   = "dev3_ctl",
    059                 .start  = (u32)(IDT434_REG_BASE + DEV3BASE),
    060                 .end    = (u32)(IDT434_REG_BASE + DEV3BASE + sizeof(struct dev_reg)),
    061                 .flags  = IORESOURCE_MEM,
    062         }
    063 };
    064
    065 void set_434_reg(unsigned reg_offs, unsigned bit, unsigned len, unsigned val)
    066 {
    067         unsigned long flags;
    068         unsigned data;
    069         unsigned i = 0;
    070
    071         spin_lock_irqsave(&dev3.lock, flags);
    072
    073         data = *(volatile unsigned *) (IDT434_REG_BASE + reg_offs);
    074         for (i = 0; i != len; ++i) {
    075                 if (val & (1 << i))
    076                         data |= (1 << (i + bit));
    077                 else
    078                         data &= ~(1 << (i + bit));
    079         }
    080         writel(data, (IDT434_REG_BASE + reg_offs));
    081
    082         spin_unlock_irqrestore(&dev3.lock, flags);
    083 }
    084 EXPORT_SYMBOL(set_434_reg);
    085
    086 unsigned get_434_reg(unsigned reg_offs)
    087 {
    088         return readl(IDT434_REG_BASE + reg_offs);
    089 }
    090 EXPORT_SYMBOL(get_434_reg);
    091
    092 void set_latch_u5(unsigned char or_mask, unsigned char nand_mask)
    093 {
    094         unsigned long flags;
    095
    096         spin_lock_irqsave(&dev3.lock, flags);
    097
    098         dev3.state = (dev3.state | or_mask) & ~nand_mask;
    099         writel(dev3.state, &dev3.base);
    100
    101         spin_unlock_irqrestore(&dev3.lock, flags);
    102 }
    103 EXPORT_SYMBOL(set_latch_u5);
    104
    105 unsigned char get_latch_u5(void)
    106 {
    107         return dev3.state;
    108 }
    109 EXPORT_SYMBOL(get_latch_u5);
    110
    111 int rb532_gpio_get_value(unsigned gpio)
    112 {
    113         return readl(&rb532_gpio_reg0->gpiod) & (1 << gpio);
    114 }
    115 EXPORT_SYMBOL(rb532_gpio_get_value);
    116
    117 void rb532_gpio_set_value(unsigned gpio, int value)
    118 {
    119         unsigned tmp;
    120
    121         tmp = readl(&rb532_gpio_reg0->gpiod) & ~(1 << gpio);
    122         if (value)
    123                 tmp |= 1 << gpio;
    124
    125         writel(tmp, (void *)&rb532_gpio_reg0->gpiod);
    126 }
    127 EXPORT_SYMBOL(rb532_gpio_set_value);
    128
    129 int rb532_gpio_direction_input(unsigned gpio)
    130 {
    131         writel(readl(&rb532_gpio_reg0->gpiocfg) & ~(1 << gpio),
    132                (void *)&rb532_gpio_reg0->gpiocfg);
    133
    134         return 0;
    135 }
    136 EXPORT_SYMBOL(rb532_gpio_direction_input);
    137
    138 int rb532_gpio_direction_output(unsigned gpio, int value)
    139 {
    140         gpio_set_value(gpio, value);
    141         writel(readl(&rb532_gpio_reg0->gpiocfg) | (1 << gpio),
    142                (void *)&rb532_gpio_reg0->gpiocfg);
    143
    144         return 0;
    145 }
    146 EXPORT_SYMBOL(rb532_gpio_direction_output);
    147
    148 void rb532_gpio_set_int_level(unsigned gpio, int value)
    149 {
    150         unsigned tmp;
    151
    152         tmp = readl(&rb532_gpio_reg0->gpioilevel) & ~(1 << gpio);
    153         if (value)
    154                 tmp |= 1 << gpio;
    155         writel(tmp, (void *)&rb532_gpio_reg0->gpioilevel);
    156 }
    157 EXPORT_SYMBOL(rb532_gpio_set_int_level);
    158
    159 int rb532_gpio_get_int_level(unsigned gpio)
    160 {
    161         return readl(&rb532_gpio_reg0->gpioilevel) & (1 << gpio);
    162 }
    163 EXPORT_SYMBOL(rb532_gpio_get_int_level);
    164
    165 void rb532_gpio_set_int_status(unsigned gpio, int value)
    166 {
    167         unsigned tmp;
    168
    169         tmp = readl(&rb532_gpio_reg0->gpioistat);
    170         if (value)
    171                 tmp |= 1 << gpio;
    172         writel(tmp, (void *)&rb532_gpio_reg0->gpioistat);
    173 }
    174 EXPORT_SYMBOL(rb532_gpio_set_int_status);
    175
    176 int rb532_gpio_get_int_status(unsigned gpio)
    177 {
    178         return readl(&rb532_gpio_reg0->gpioistat) & (1 << gpio);
    179 }
    180 EXPORT_SYMBOL(rb532_gpio_get_int_status);
    181
    182 void rb532_gpio_set_func(unsigned gpio, int value)
    183 {
    184         unsigned tmp;
    185
    186         tmp = readl(&rb532_gpio_reg0->gpiofunc);
    187         if (value)
    188                 tmp |= 1 << gpio;
    189         writel(tmp, (void *)&rb532_gpio_reg0->gpiofunc);
    190 }
    191 EXPORT_SYMBOL(rb532_gpio_set_func);
    192
    193 int rb532_gpio_get_func(unsigned gpio)
    194 {
    195         return readl(&rb532_gpio_reg0->gpiofunc) & (1 << gpio);
    196 }
    197 EXPORT_SYMBOL(rb532_gpio_get_func);
    198
    199 int __init rb532_gpio_init(void)
    200 {
    201         rb532_gpio_reg0 = ioremap_nocache(rb532_gpio_reg0_res[0].start,
    202                                 rb532_gpio_reg0_res[0].end -
    203                                 rb532_gpio_reg0_res[0].start);
    204
    205         if (!rb532_gpio_reg0) {
    206                 printk(KERN_ERR "rb532: cannot remap GPIO register 0\n");
    207                 return -ENXIO;
    208         }
    209
    210         dev3.base = ioremap_nocache(rb532_dev3_ctl_res[0].start,
    211                                 rb532_dev3_ctl_res[0].end -
    212                                 rb532_dev3_ctl_res[0].start);
    213
    214         if (!dev3.base) {
    215                 printk(KERN_ERR "rb532: cannot remap device controller 3\n");
    216                 return -ENXIO;
    217         }
    218
    219         return 0;
    220 }
    221 arch_initcall(rb532_gpio_init);

## About Gentoo

the kernel bootstrap from the micro drive

[![Rb532 md.jpg](http://eLinux.org/images/a/a4/Rb532_md.jpg)](http://eLinux.org/File:Rb532_md.jpg)



#### what/where

-   **kernel 2.4.x** there is a port of linux 2.4.30/31 that has been
    tested and it is perfectly working: see
    [http://routerboard.com/files/linux-2.4.30-yaffs2.patch.gz](http://routerboard.com/files/linux-2.4.30-yaffs2.patch.gz)
    ,
    [http://routerboard.com/files/linux-2.4.31.patch.gz](http://routerboard.com/files/linux-2.4.31.patch.gz)
-   **kernel 2.6.x**
    -   2.6.22: in use on my board with success, and has it has been
        tested for a very long uptime it is known to be very robust
        (suggested for production)
    -   2.6.23: is under porting, see the git @
        [http://www.linux-mips.org/git?p=linux-routerboard.git;a=summary](http://www.linux-mips.org/git?p=linux-routerboard.git;a=summary)
        (actually i have an issue and it doesn't boot ... there is an
        issue with the firmware bootloader)
    -   2.6.24: no sup, repository romoved cause it still has the 2.6.23
        issue
    -   2.6.26: interesting for the thickness feature, r3 is under
        development
    -   2.6.28: interesting for ext4, it's in my repository, r4 under
        development

#### dmesg

on 04-12-2007 i was able to compile a perfectly working kernel 2.6.22,
here the dmesg

    Version 2.6.22-manatnees-batman-mipsel-rb532 (root@queen-vittoria)
    (gcc version 4.1.2 (Gentoo 4.1.2 p1.0.2)) #6 Tue Dec 4 17:12:23 CET 2007
    CPU revision is: 0001800a
    Determined physical RAM map:
     memory: 03fffa00 @ 00000400 (usable)
    Wasting 32 bytes for tracking 1 unused pages
    Initrd not found or empty - disabling initrd
    On node 0 totalpages: 16383
      Normal zone: 127 pages used for memmap
      Normal zone: 0 pages reserved
      Normal zone: 16256 pages, LIFO batch:3
    Built 1 zonelists.  Total pages: 16256
    Kernel command line: root=/dev/cfa3 console=ttyS0,9600
    gpio=8191 kmac=00:0C:42:0E:8F:01 board=500r5 boot=1
    korina mac = 00:0C:42:0E:8F:01
    Primary instruction cache 8kB, physically tagged, 4-way, linesize 16 bytes.
    Primary data cache 8kB, 4-way, linesize 16 bytes.
    Synthesized TLB refill handler (20 instructions).
    Synthesized TLB load handler fastpath (32 instructions).
    Synthesized TLB store handler fastpath (32 instructions).
    Synthesized TLB modify handler fastpath (31 instructions).
    Initializing IRQ's: 168 out of 256
    PID hash table entries: 256 (order: 8, 1024 bytes)
    calculating r4koff... 001e846c(1999980)
    CPU frequency 400.00 MHz
    Using 199.998 MHz high precision timer.
    Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
    Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
    Memory: 61120k/65528k available
    (2187k kernel code, 4348k reserved, 352k data, 120k init, 0k highmem)
    Calibrating delay loop... 398.95 BogoMIPS (lpj=1994752)
    Mount-cache hash table entries: 512
    NET: Registered protocol family 16
    PCI: Initializing PCI
    registering PCI controller with io_map_base unset
    NET: Registered protocol family 2
    Time: MIPS clocksource has been installed.
    IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
    TCP established hash table entries: 2048 (order: 2, 16384 bytes)
    TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
    TCP: Hash tables configured (established 2048 bind 2048)
    TCP reno registered
    Registering mini_fo version $Id$
    JFFS2 version 2.2. (NAND) (SUMMARY)  Â© 2001-2006 Red Hat, Inc.
    yaffs Dec  4 2007 17:07:52 Installing.
    io scheduler noop registered
    io scheduler deadline registered (default)
    Serial: 8250/16550 driver $Revision: 1.90 $ 2 ports, IRQ sharing disabled
    serial8250: ttyS0 at MMIO 0x0 (irq = 104) is a 16550A
    cf-mips module loaded
    cf-mips: resetting..
    cf-mips: identify drive..
    cf-mips: CF card detected, C/H/S=3968/16/63 sectors=3999744 (1953MB)
    cf-mips: detecting block size
    cf-mips: multiple sectors = 32
    init done: cfa: cfa1 cfa2 cfa3
    Using NAPI with weight 64
    eth0: Rx IRQ 40, Tx IRQ 41, 00:0c:42:0e:8f:01
    via-rhine.c:v1.10-LK1.4.3 2007-03-06 Written by Donald Becker
    PCI: Enabling device 0000:00:02.0 (0080 -> 0083)
    PCI: Setting latency timer of device 0000:00:02.0 to 64
    io_map_base of root PCI bus 0000:00 unset.  Trying to continue but you better
    fix this issue or report it to linux-mips@linux-mips.org or your vendor.
    eth1: VIA Rhine III at 0xb8800000, 00:0c:42:0e:8f:02, IRQ 142.
    eth1: MII PHY found at address 1, status 0x7849 advertising 05e1 Link 0000.
    PCI: Enabling device 0000:00:03.0 (0080 -> 0083)
    PCI: Setting latency timer of device 0000:00:03.0 to 64
    eth2: VIA Rhine III at 0xb8800100, 00:0c:42:0e:8f:03, IRQ 143.
    eth2: MII PHY found at address 1, status 0x7849 advertising 05e1 Link 0000.
    block2mtd: version $Revision: 1.30 $
    NAND device: Manufacturer ID: 0xad, Chip ID: 0xf1 (Hynix NAND 128MiB 3,3V 8-bit)
    Scanning device for bad blocks
    Bad eraseblock 92 at 0x00b80000
    Creating 2 MTD partitions on "NAND 128MiB 3,3V 8-bit":
    0x00000000-0x00400000 : "Routerboard NAND boot"
    0x00400000-0x08000000 : "rootfs"
    mtd: partition "rootfs" set to be root filesystem
    split_squasfs: no squashfs found in "NAND 128MiB 3,3V 8-bit"
    Registered led device: rb500led:amber
    nf_conntrack version 0.5.0 (511 buckets, 4088 max)
    ip_tables: (C) 2000-2006 Netfilter Core Team
    TCP vegas registered
    NET: Registered protocol family 1
    NET: Registered protocol family 17
    802.1Q VLAN Support v1.8 Ben Greear <greearb@candelatech.com>
    All bugs added by David S. Miller <davem@redhat.com>
    EXT3-fs: INFO: recovery required on readonly filesystem.
    EXT3-fs: write access will be enabled during recovery.
    kjournald starting.  Commit interval 5 seconds
    EXT3-fs: recovery complete.
    EXT3-fs: mounted filesystem with ordered data mode.
    VFS: Mounted root (ext3 filesystem) readonly.
    Freeing unused kernel memory: 120k freed
    Algorithmics/MIPS FPU Emulator v1.5
    EXT3 FS on cfa3, internal journal


 @15-02-2009 i have to update the kernel to 2.6.26/2.6.28 (still under
proof status in my repositories) and i am looking for {miniPCI-sATA,
miniPCI-netwifi}

### About devtools

@16-02-2009

you can ask me a working kernel tarball of the sources

## Project

### Router 3 port ethernet

coming soon


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Mips](http://eLinux.org/Category:Mips "Category:Mips")

