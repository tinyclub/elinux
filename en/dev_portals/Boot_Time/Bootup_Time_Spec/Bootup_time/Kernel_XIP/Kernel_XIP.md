> From: [eLinux.org](http://eLinux.org/Kernel_XIP "http://eLinux.org/Kernel_XIP")


# Kernel XIP



This page describes the use of Kernel Execute-In-Place as a bootup time
reduction technique.

## Contents

-   [1 Description](#description)
-   [2 How to implement or use](#how-to-implement-or-use)
-   [3 Expected Improvement - about .5
    seconds](#expected-improvement-about-5-seconds)
-   [4 Resources](#resources)
    -   [4.1 Projects](#projects)
    -   [4.2 Specifications](#specifications)
    -   [4.3 Patches](#patches)
-   [5 Case Studies](#case-studies)
    -   [5.1 Case 1 - XIP on Arctic III PowerPC
        board](#case-1-xip-on-arctic-iii-powerpc-board)
    -   [5.2 Case 2 - XIP on OMAP
        Innovator](#case-2-xip-on-omap-innovator)
        -   [5.2.1 Case 3 - comparing NOR XIP with OneNAND quick-copy to
            RAM](#case-3-comparing-nor-xip-with-onenand-quick-copy-to-ram)
-   [6 Questions](#questions)
-   [7 Implementation Notes (from the
    field)](#implementation-notes-from-the-field)
    -   [7.1 Notes on configuring Linux for XIP (for
        PPC)](#notes-on-configuring-linux-for-xip-for-ppc)
    -   [7.2 Using XIP with U-Boot on
        Arm](#using-xip-with-u-boot-on-arm)
    -   [7.3 How to determine offsets for
        sections](#how-to-determine-offsets-for-sections)

## Description

Execute-in-Place ([Wikipedia
entry](http://en.wikipedia.org/wiki/Execute_in_place)) is a method of
executing code directly from long-term storage, instead of first loading
it into RAM.

When the kernel is executed in place, the bootloader does not have to:

1.  read the kernel from flash or
2.  decompress the kernel and
3.  write the kernel to RAM.



## How to implement or use

TODO: describe how to achieve the technique (config options, command
args, etc.)

see [Kernel XIP Instructions For
OMAP](http://eLinux.org/Kernel_XIP_Instructions_For_OMAP "Kernel XIP Instructions For OMAP")

## Expected Improvement - about .5 seconds

The expected improvement from using this technique depends on the size
of the kernel, and the time to load it and decompress it from persistent
storage.

In general, time savings of about .5 seconds have been observed.

## Resources

### Projects

-   [Configure Linux For
    XIP](http://www.denx.de/twiki/bin/view/DULG/ConfigureLinuxForXIP)
    describes experience with using both Kernel XIP and application XIP.

-   In this
    [e-mail](http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2003-June/015571.html),
    David Woodhouse described issues with implementing support for
    KERNEL XIP in flash. The requirements here are a bit different from
    supporting KERNEL XIP in ROM, since the flash may be unreadable
    during certain flash operations. Therefore, portions of the kernel
    must be copied to RAM, and certain kernel operations must be
    disallowed when the flash is unavailable.

### Specifications

TODO: list or link to CELF specifications related to this technique

### Patches

-   Kernel 2.6.10 now includes XIP support:

> ARM PATCH 2154/2: XIP kernel for ARM
>
> Patch from Nicolas Pitre
>
> This patch allows for the kernel to be configured for XIP. A lot of
> people are using semi hacked up XIP patches already so it is a good
> idea to have a generic and clean implementation supporting all ARM
> targets. The patch isn't too intrusive.
>
> It involves:
>
> -   modifying the kernel entry code to map separate .text and .data
>     sections in the initial page table, as well as relocating .data to
>     ram when needed
>
> -   modifying the linker script to account for the different VMA and
>     LMA for .data, as well as making sure that .init.data gets
>     relocated to ram
>
> -   adding the final kernel mapping with a new MT\_ROM mem type
>
> -   distinguishing between XIP and non-XIP for bootmem and memory
>     resource declaration
>
> -   and adding proper target handling to Makefiles.
>
> While at it, this also cleans up the kernel boot code a bit so the
> kernel can now be compiled for any address in ram, removing the need
> for a relation between kernel address and start of ram. Also throws in
> some more comments.
>
> And finally the \_text, \_etext, \_end and similar variables are now
> declared extern void instead of extern char, or even extern int. That
> allows for operations on their address directly without any cast, and
> trying to reference them by mistake would yield an error which is a
> good thing.
>
> Tested both configurations: XIP and non XIP, the later producing a
> kernel for execution from ram just as before.
>
> Signed-off-by: Nicolas Pitre Signed-off-by: Russell King

## Case Studies

### Case 1 - XIP on Arctic III PowerPC board

XIP was used on a PowerPC board, with the following results:

-   Hardware: PowerPC 405LP Arctic III, running at 266 MHZ
-   Kernel Version: MontaVista Linux CEE 3.0 (based on 2.4.20)
-   Configuration: Features built statically into the kernel included:
    Arctic ethernet, audio, and MTD; 405LP LCD and touchscreen; 405
    onchip I2C; and pinned TLBs; Dynamic Power Management; preemptible
    kernel with selected spinlock breaking; serial driver and serial
    console (kernel messages are disabled for boot time measurements);
    TCP/IP (IP addresses are configured after boot) with network
    devices, network packet filtering, packet protocol, and IP
    multicast; virtual terminal; UNIX domain sockets and UNIX98 PTYs;
    Linux Driver Model; and /proc, sysfs, tmpfs, ramfs, cramfs, devpts
    filesystems.
-   Time without change: 1357 milliseconds
-   Time with change: 894 milliseconds
-   Total Reduction in boot time: 463 milliseconds

Table of bootup times:



<table>
<thead>
<tr class="header">
<th align="left"><strong>Boot Stage</strong></th>
<th align="left"><strong>Non-XIP Time</strong></th>
<th align="left"><strong>XIP Time</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Copy kernel to RAM</td>
<td align="left">85 ms</td>
<td align="left">12 ms *</td>
</tr>
<tr class="even">
<td align="left">Decompress kernel</td>
<td align="left">453 ms</td>
<td align="left">0 ms</td>
</tr>
<tr class="odd">
<td align="left">Kernel time to initialize<br />(time to first user space program)</td>
<td align="left">819 ms</td>
<td align="left">882 ms</td>
</tr>
<tr class="even">
<td align="left">Total kernel boot time</td>
<td align="left">1357 ms</td>
<td align="left">894 ms</td>
</tr>
<tr class="odd">
<td align="left"><strong>Reduction:</strong></td>
<td align="left">*</td>
<td align="left"><strong>463 ms</strong></td>
</tr>
</tbody>
</table>



-   still have to copy data segment

Thanks to Todd Poynor of MontaVista for providing this information.

### Case 2 - XIP on OMAP Innovator

XIP was used on a TI OMAP (Innovator board), with the following results:

-   Hardware: TI OMAP 1510, running at 168 MHZ
-   Kernel Version: 2.4.20 (precursor to CELF tree)
-   Configuration: [need to put config information here]
-   see [Kernel XIP Instructions For
    OMAP](http://eLinux.org/Kernel_XIP_Instructions_For_OMAP "Kernel XIP Instructions For OMAP")



<table>
<thead>
<tr class="header">
<th align="left"><strong>Boot Stage</strong></th>
<th align="left"><strong>Non-XIP Time<br />Kernel compressed</strong></th>
<th align="left"><strong>Non-XIP Time<br />Kernel not compressed</strong></th>
<th align="left"><strong>XIP Time</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Copy kernel to RAM</td>
<td align="left">56 ms</td>
<td align="left">120 ms</td>
<td align="left">0 ms</td>
</tr>
<tr class="even">
<td align="left">Decompress kernel</td>
<td align="left">545 ms</td>
<td align="left">0 ms</td>
<td align="left">0 ms</td>
</tr>
<tr class="odd">
<td align="left">Kernel time to initialize<br />(time to first user space program)</td>
<td align="left">88 ms</td>
<td align="left">208 ms</td>
<td align="left">110 ms</td>
</tr>
<tr class="even">
<td align="left">Total kernel boot time</td>
<td align="left">689 ms</td>
<td align="left">208 ms</td>
<td align="left">110 ms</td>
</tr>
<tr class="odd">
<td align="left"><strong>Reduction:</strong></td>
<td align="left">*</td>
<td align="left"><strong>481 ms</strong></td>
<td align="left"><strong>579 ms</strong></td>
</tr>
</tbody>
</table>


 Thanks to Hiroyuki Machida of Sony for providing this information.

#### Case 3 - comparing NOR XIP with OneNAND quick-copy to RAM

-   Hardware: TI OMAP 5912, running at 196 MHZ (OSK5912 from Spectrum
    Digital)
-   Kernel Version: 2.6.10-omap1 (binary size is about 2MBytes
    uncompressed)

Dongjun Shin of Samsung Electronics reports:

As I've mentioned in AG meeting, we've done some boot time measurements
on OMAP 5912 target platform (OSK5912 from Spectrum Digital). We've done
this experiment in order to identify the timing gap between NOR XIP and
NAND shadowing. Here is the result (the number represents time in
microseconds).

The column noted as "XIP tuning" means that we changed the NOR I/F
setting of OMAP (EMIFS) so that the synchronous read is used instead of
(default) asynchronous read.

In case of OneNAND, only 1Kbytes of initial part of OneNAND can be used
as XIP region and we used 1Kbytes IPL for loading u-boot. Shadowing
means that kernel copy (to RAM) is used.

The reason why the kernel initialization time are broken into 2 phases
is that we used timer register for measurement and the timer is
initialized during kernel booting. You can just add the values for 2
phases to get the total kernel booting time.



Boot stage

NOR

OneNAND

XIP

Shadowing

Normal

Tuning

Compressed

Uncompressed

**Boot loader CPU frequency**

96MHz

96 MHz

**Boot loader (IPL)**

0

0

5,999

5,999

**Boot loader (u-boot)**

388,146

372,538

356,821

356,810

**Copy kernel to RAM**

0

0

35,029

56,884

**Decompress kernel**

0

0

1,178,481

0

**Kernel time to initialize - 1 phase**

18,964

12,826

9,091

9,119

**Kernel time to initialize - 2 phase**

61,176

51,263

50,118

50,126

**Total**

468,287

436,626

1,635,540

478,938

*times are in microseconds*



-   Related info
    -   [omap patch archive](http://www.muru.com/linux/omap)
    -   [Samsung NAND flash memory
        datasheet](http://www.samsung.com/Products/Semiconductor/Flash/TechnicalInfo/datasheets.htm)
    -   [OneNAND
        e-brochure](http://www.samsung.com/Products/Semiconductor/Support/ebrochure/memory/onenand_v10.pdf)

## Questions

TimRiker asks:

-   What is the ram/rom footprint of these?
-   Are we close to using sram only for some implementations?
-   Has anyone looked at romfs and XIP user space?

## Implementation Notes (from the field)

-   [Discussion](http://lists.infradead.org/pipermail/linux-mtd/2003-June/007918.html)
    about XIP when flash might be in use - note mention of '\_\_xipram'
    attribute (for partial XIP??)

### Notes on configuring Linux for XIP (for PPC)

-   [Notes](http://www.denx.de/twiki/publish/DULG/ConfigureLinuxForXIP.html)
    on configuring XIP

### Using XIP with U-Boot on Arm

Wolfgang Denks, the primary author of the UBoot bootloader, wrote the
following:

    >> Yes. But... _Does_ mkimage -x put header on the front of it?

    Yes, it does.

    >>> > * You program the resulting image at 0x10004000.
    >>> >
    >>> > What is programmed at 0x10004000 ?  The xipImage code or the uboot header?
    >
    >>
    >> The u-boot headers, yes. Thats wrong. But how to use mkimage -x then?
    >> Is the header-caused offset known?

    Yes. The U-Boot header is 64 bytes.

    U-Boot expects (and verifies) that the entry point is  equal  to  the load address plus the size of the U-Boot header.

Lots more details are in the thread (split across months in the
archives):

-   [Thread: Nov.
    2004](http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2004-November/025472.html)
-   [http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2004-December/025674.html](http://lists.arm.linux.org.uk/pipermail/linux-arm-kernel/2004-December/025674.html)
    Thread: Dec. 2004]

### How to determine offsets for sections

Dick Johnson talks about how to set the physical address for ELF
sections by editing the kernel link files.

    On Fri, 21 Oct 2005, Sreeni wrote:
    >> Hi,<br>
    >><br>
    >> I have a montavista XIP kernel running on ARM and my kernel will be in<br>
    >> the flash. Since its XIP, I know that the ".text" portion of the<br>
    >> kernel will be executed from flash but that ".data" needs to be placed<br>
    >> in SDRAM. Now my question is - based on what offset this data will be<br>
    >> placed?<br>
    >><br>
    >> My SDRAM physicall address starts at 3000_0000 and flash starts at<br>
    >> 0100_0000. when i allocated a global variable in the kernel module and<br>
    >> when i try to check its actually physical address using virt_to_phys,<br>
    >> its giving me the address in the range of 0100_0000 ~ 0600_0000 which<br>
    >> is my flash (the PAGE_OFFSET doesn't work in case of XIP).<br>
    >><br>
    >> Can you please help in knowing the physical address of my .data<br>
    >> portion in this situation.<br>
    >><br>
    >> Thanks<br>
    >> Shree<br>
    </code><br>
    I don't know about the ARM in particular, but if you look in ../arch/arm/boot/compressed/vmlinux.lds.in,
    you will see that this linker-file simply allocates the start addresses of each section as the next
    available address. The same is true of ../arch/arm/boot/bootp.lds. If you expect to have code the data
    elements and stack accessed at a specific physical offset, you modify the linker files().

    Note that "." means "right here", just like '$' in many assemblers. You can specify a physical offset
    simply as:

     ENTRY(_start)
     SECTIONS
     {
       . == 0x01000000  <==== like this for code
       .text : {
        ...
        ... }
        .rodata : { }
        . == 0x30000000 <==== like this data
        .data : {  }
        .bss  : {  }
     }

    In the above, we have put .rodata (initialized ASCII stuff) right after the code in the .text section.
    You may need to extract this from the binary blob to put into your NVRAM.

    Also, any initialzed data needs to be relocated to your writable SDRAM and the .bss stuff needs to be
    zeroed. This is non-trivial. You may want to create a ".reloc" section which contains your initialized
    data, put it in your flash, and relocate it at startup.

    ...

    Cheers,
    Dick Johnson


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Bootloader](http://eLinux.org/Category:Bootloader "Category:Bootloader")
-   [Kernel XIP](http://eLinux.org/Category:Kernel_XIP "Category:Kernel XIP")
-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")

