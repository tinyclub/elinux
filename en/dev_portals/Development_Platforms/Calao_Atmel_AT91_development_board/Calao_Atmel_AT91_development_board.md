> From: [eLinux.org](http://eLinux.org/Calao_Atmel_AT91_development_board "http://eLinux.org/Calao_Atmel_AT91_development_board")


# Calao Atmel AT91 development board



Calao System propose Atmel AT91 ARM development Board with small form
factor USB, Tiny, QIL

## Contents

-   [1 USB Form Factor](#usb-form-factor)
    -   [1.1 USB-A9G20-LPW-C01](#usb-a9g20-lpw-c01)
        -   [1.1.1 AT19Bootstrap](#at19bootstrap)
        -   [1.1.2 Barebox](#barebox)
        -   [1.1.3 Linux](#linux)
        -   [1.1.4 RootFS](#rootfs)
        -   [1.1.5 OpenOCD](#openocd)

# USB Form Factor

## USB-A9G20-LPW-C01

[![USB-A9G20-LPW-C01-TOP-0-25.jpg](http://eLinux.org/images/thumb/f/f0/USB-A9G20-LPW-C01-TOP-0-25.jpg/600px-USB-A9G20-LPW-C01-TOP-0-25.jpg)](http://www.calao-systems.com/articles.php?lng=fr&pg=5940)

<table>
<tbody>
<tr class="odd">
<td align="left">Booard Dimension</td>
<td align="left">36 x 85 mm</td>
</tr>
<tr class="even">
<td align="left">Soc</td>
<td align="left">ATMEL AT91SAM9G20 @ 400MHz</td>
</tr>
<tr class="odd">
<td align="left">NAND</td>
<td align="left">256MB NAND Flash (8bits),</td>
</tr>
<tr class="even">
<td align="left">SDRAM</td>
<td align="left">64MB SDRAM (32bits @ 133MHz)</td>
</tr>
<tr class="odd">
<td align="left">Ethernet</td>
<td align="left">1x 10/100</td>
</tr>
<tr class="even">
<td align="left">USB Host</td>
<td align="left">2x Ports</td>
</tr>
<tr class="odd">
<td align="left">USB Device</td>
<td align="left">1x Port USB (front shared with DBGU/JTAG or back)</td>
</tr>
<tr class="even">
<td align="left">Debug</td>
<td align="left">1x JTAG &amp; 1x DBGU over USB (FTDI FT2232D) or 1x JTAG &amp; 1x DBGU on board</td>
</tr>
<tr class="odd">
<td align="left">RTC</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">SD Card</td>
<td align="left">1x Micro-SD (SPI under ethernet port) or 1 via Expansion port</td>
</tr>
<tr class="odd">
<td align="left">Expansion</td>
<td align="left">1x 50 pins connector (I2C, SPI, USART, SSC, MCI, ISI, TC)</td>
</tr>
</tbody>
</table>

### AT19Bootstrap

### Barebox

You can use barebox on with the following support

uart

nand

ethernet

usb host

sd card (mci)

spi

generic barebox features (menu, hush, multi-devices, etc...)

1) First you need to clone the tree

The board support is currently in the next branch

    git clone git://git.pengutronix.de/git/barebox.git
    git checkout -b work origin/next

2) Then you need to configure it

For the 64 MiB board

    make usb_a9g20_defconfig

For the 128 MiB board

    make usb_a9g20_128mib_defconfig

3) Compile it

    make

4) Flash it

now you need to flash it via

SAM-BA

OpenOCD

5) start the board

    barebox 2011.10.0-00144-gc9145e1 (Oct 25 2011 - 17:48:18)

    Board: Calao USB-A9G20
    Clocks: CPU 399 MHz, master 133 MHz, main 12.000 MHz
    NAND device: Manufacturer ID: 0x2c, Chip ID: 0xaa (Micron NAND 256MiB 1,8V 8-bit)
    Scanning device for bad blocks
    Bad eraseblock 591 at 0x049e0000
    Bad eraseblock 920 at 0x07300000
    Bad eraseblock 1026 at 0x08040000
    Bad eraseblock 1388 at 0x0ad80000
    Bad eraseblock 1764 at 0x0dc80000
    Malloc space: 0x23500000 -> 0x23f00000 (size 10 MB)
    Stack space : 0x234f8000 -> 0x23500000 (size 32 kB)
    envfs: wrong magic on /dev/env0
    no valid environment found on /dev/env0. Using default environment
    running /env/bin/init...

    Hit any key to stop autoboot:  0
    barebox@Calao USB-A9G20:/
    #

### Linux

You can use the mainline kernel (merge in release 3.1)

1) First you need to clone the tree

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
    git checkout -b work

2) Then you need to configure it

currently no defconfig is merge for the next release you could use
at91sam9g20\_defconfig but right now you need to use
at91sam9g20ek\_defconfig and select it via Kconfig "CALAO USB-A9G20"

    make at91sam9g20ek_defconfig
    make menuconfig

or

    make at91sam9g20ek_defconfig
    sed -i -e "s:# CONFIG_MACH_USB_A9G20 is not set:CONFIG_MACH_USB_A9G20=y:g" .config

3) Compile it

    make uImage

4) Run it

You can run it via nfs or tftp from barebox

for this you need to modify the /env/config

a) on board

via

    ed /env/config

b) on pc

by editing

    diff --git a/arch/arm/boards/usb-a926x/env/config b/arch/arm/boards/usb-a926x/env/config
    index d77f678..660cb3c 100644
    --- a/arch/arm/boards/usb-a926x/env/config
    +++ b/arch/arm/boards/usb-a926x/env/config
    @@ -2,16 +2,16 @@

     # use 'dhcp' to do dhcp in barebox and in kernel
     # use 'none' if you want to skip kernel ip autoconfiguration
    -ip=dhcp
    +#ip=dh

     # or set your networking parameters here
    -#eth0.ipaddr=a.b.c.d
    -#eth0.netmask=a.b.c.d
    -#eth0.gateway=a.b.c.d
    -#eth0.serverip=a.b.c.d
    +eth0.ipaddr=192.168.201.33
    +eth0.netmask=255.255.255.0
    +eth0.gateway=192.168.201.98
    +eth0.serverip=192.168.201.98

     # can be either 'nfs', 'tftp', 'nor' or 'nand'
    -kernel_loc=tftp
    +kernel_loc=nfs
     # can be either 'net', 'nor', 'nand' or 'initrd'
     rootfs_loc=net

    @@ -29,6 +29,9 @@ kernelimage=uImage
     #kernelimage_type=raw_lzo
     #kernelimage=Image.lzo

    +nfsroot="${eth0.serverip}:/opt/work/buildroot/build/usb_9g20/target/"
    +kernelimage="/opt/work/buildroot/build/usb_9g20/images/uImage-usb-a9g20"
    +
     nand_device=atmel_nand
     nand_parts="128k(at91bootstrap),256k(barebox)ro,128k(bareboxenv),128k(bareboxenv2),4M(kernel),120M(rootfs),-(data)"
     rootfs_mtdblock_nand=5

5) start the board

Note that the kernel you see in this log is a development kernel using
the Device tree

nb: sometime the nfs timeout to boot again just type boot enter

    barebox 2011.10.0-00144-gc9145e1 (Oct 25 2011 - 17:48:18)

    Board: Calao USB-A9G20
    Clocks: CPU 399 MHz, master 133 MHz, main 12.000 MHz
    NAND device: Manufacturer ID: 0x2c, Chip ID: 0xaa (Micron NAND 256MiB 1,8V 8-bit)
    Scanning device for bad blocks
    Bad eraseblock 591 at 0x049e0000
    Bad eraseblock 920 at 0x07300000
    Bad eraseblock 1026 at 0x08040000
    Bad eraseblock 1388 at 0x0ad80000
    Bad eraseblock 1764 at 0x0dc80000
    Malloc space: 0x23500000 -> 0x23f00000 (size 10 MB)
    Stack space : 0x234f8000 -> 0x23500000 (size 32 kB)
    envfs: wrong magic on /dev/env0
    no valid environment found on /dev/env0. Using default environment
    running /env/bin/init...

    Hit any key to stop autoboot:  0
    warning: No MAC address set. Using random address D2:E7:9F:56:A2:96
    phy0: Link is up - 100/Full
    T T
    Filename '/opt/work/buildroot/build/usb_9g20/images/uImage-usb-a9g20'.
            [#################################################################NFS failed: Interrupted system call

    barebox@Calao USB-A9G20:/
    # boot
    Filename '/opt/work/buildroot/build/usb_9g20/images/uImage-usb-a9g20'.
           [#################################################################]
    booting kernel of type uimage from /dev/ram0.kernel
       Verifying Checksum ... OK
       Image Name:   Linux-3.0.0+
       Created:      2011-10-24  21:55:00 UTC
       Image Type:   ARM Linux Kernel Image (uncompressed)
       Data Size:    1988582 Bytes =  1.9 MB
       Load Address: 20008000
       Entry Point:  20008000
    OK

    Starting kernel ...

    commandline: console=ttyS0,115200 ip=192.168.201.33:192.168.201.98:192.168.201.98:255.255.255.0::eth0: root=/dev/nfs nfsroot=192.168.201.98:/opt/work/buildroot/build/usb_9g20/target/,v3,tcp noinitrd mtdparts=atmel_nand:128k(at91bootstrap),256k(barebox)ro,128k(bareboxenv),128k(bareboxenv2),4M(kernel),120M(rootfs),-(data)
    arch_number: 1841
    Uncompressing Linux... done, booting the kernel.
    Linux version 3.0.0+ (root@j-debian) (gcc version 4.5.1 (Sourcery G++ Lite 2010.09-50) ) #66 Tue Oct 25 05:54:39 CST 2011
    CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
    CPU: VIVT data cache, VIVT instruction cache
    Machine: Atmel AT91SAM (Device Tree), model: Calao USB A9G20
    Memory policy: ECC disabled, Data cache writeback
    AT91: Detected soc type: at91sam9g20
    AT91: Detected soc subtype: Unknown
    AT91: sram at 0x200000 of 0x4000 mapped at 0xfef74000
    AT91: sram at 0x300000 of 0x4000 mapped at 0xfef70000
    Clocks: CPU 399 MHz, master 133 MHz, main 12.000 MHz
    Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16256
    Kernel command line: console=ttyS0,115200 ip=192.168.201.33:192.168.201.98:192.168.201.98:255.255.255.0::eth0: root=/dev/nfs nfsroot=192.168.201.98:/opt/work/buildroot/build/usb_9g20/target/,v3,tcp noinitrd mtdparts=atmel_nand:128k(at91bootstrap),256k(barebox)ro,128k(bareboxenv),128k(bareboxenv2),4M(kernel),120M(rootfs),-(data)
    PID hash table entries: 256 (order: -2, 1024 bytes)
    Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
    Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
    Memory: 64MB = 64MB total
    Memory: 60960k/60960k available, 4576k reserved, 0K highmem
    Virtual kernel memory layout:
        vector  : 0xffff0000 - 0xffff1000   (   4 kB)
        fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
        DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
        vmalloc : 0xc4800000 - 0xfee00000   ( 934 MB)
        lowmem  : 0xc0000000 - 0xc4000000   (  64 MB)
        modules : 0xbf000000 - 0xc0000000   (  16 MB)
          .text : 0xc0008000 - 0xc0388620   (3586 kB)
          .init : 0xc0389000 - 0xc03a7000   ( 120 kB)
          .data : 0xc03a8000 - 0xc03cc240   ( 145 kB)
           .bss : 0xc03cc264 - 0xc03dd8fc   (  70 kB)
    NR_IRQS:192
    looking for phys_base=fffff000, irq_start=0
    AT91: 96 gpio irqs in 3 banks
    Console: colour dummy device 80x30
    Calibrating delay loop... 199.06 BogoMIPS (lpj=995328)
    pid_max: default: 32768 minimum: 301
    Mount-cache hash table entries: 512
    CPU: Testing write buffer coherency: ok
    pinctrl core: initialized pinctrl subsystem
    NET: Registered protocol family 16
    0x0
    0xfffffff0
    AT91: Power Management
    AT91: Starting after general reset
     pinctrl.0: hogged map DGBU_RX, function dbgu_rxd
     pinctrl.0: hogged map DGBU_TX, function dbgu_txd
    pinmux-at91 pinmux.2: initialized AT91 pinmux driver
    atmel_tcb: probe of atmel_tcb.1 failed with error -22
    bio: create slab <bio-0> at 0
    SCSI subsystem initialized
    usbcore: registered new interface driver usbfs
    usbcore: registered new interface driver hub
    usbcore: registered new device driver usb
    Advanced Linux Sound Architecture Driver Version 1.0.24.
    cfg80211: Calling CRDA to update world regulatory domain
    Switching to clocksource tcb_clksrc
    NET: Registered protocol family 2
    IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
    TCP established hash table entries: 2048 (order: 2, 16384 bytes)
    TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
    TCP: Hash tables configured (established 2048 bind 2048)
    TCP reno registered
    UDP hash table entries: 256 (order: 0, 4096 bytes)
    UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
    NET: Registered protocol family 1
    RPC: Registered named UNIX socket transport module.
    RPC: Registered udp transport module.
    RPC: Registered tcp transport module.
    RPC: Registered tcp NFSv4.1 backchannel transport module.
    NetWinder Floating Point Emulator V0.97 (double precision)
    JFFS2 version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
    msgmni has been set to 119
    io scheduler noop registered (default)
    fffff200.serial: ttyS0 at MMIO 0xfffff200 (irq = 1) is a ATMEL_SERIAL
    console [ttyS0] enabled
    brd: module loaded
    loop: module loaded
    No SmartMedia card inserted.
    ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
    Initializing USB Mass Storage driver...
    usbcore: registered new interface driver usb-storage
    USB Mass Storage support registered.
    mousedev: PS/2 mouse device common for all mice
    ALSA device list:
      No soundcards found.
    TCP cubic registered
    NET: Registered protocol family 17
    lib80211: common routines for IEEE802.11 drivers
    /opt/work/linux-2.6/drivers/rtc/hctosys.c: unable to open rtc device (rtc0)

### RootFS

You can use multiple tools to build the rootfs

    * Debian
    * OpenEmbedded
    * BuildRoot

### OpenOCD

On the Board you will find a FDTI FT2232D that it's use as a UART and
the JTAG.

If you have a old kernel the ftdi drivers will probe the two port of the
FT2232D as UART

(ttyUSB0 as JTAG and ttyUSB1 as UART)

So you will need to patch your kernel with
[http://lkml.org/lkml/2011/9/28/466](http://lkml.org/lkml/2011/9/28/466)

or use a out-of-tree module like this tree
[git://uboot.jcrosoft.org/ftdi-module.git](git://uboot.jcrosoft.org/ftdi-module.git)

now you have a working environment you can use OpenOCD

Most of the recent distribution now use the last release of OpenOCD we
did which is currently the v0.5.0

How to use it?

OpenOCD need two part the


 1) the Interface configuration

This the description of your ICE/JTAG

    cat calao-usb-a9g20-lpw.cfg
    #
    # CALAO Systems USB-A9G20-C02
    #
    # http://www.calao-systems.com/
    #

    interface ft2232
    ft2232_device_desc "USB-A9G20-LPW"
    ft2232_layout jtagkey
    ft2232_vid_pid 0x0403 0x6010

2) the board configuration

    cat usb-a9g20-lpw.cfg
    #################################################################################################
    #                                                                                               #
    # Author: gregory Hermant (gregory.hermant@calao-systems.com)                                   #
    #         Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrsoft.com>                               #
    # Generated for the USB-A9G20-LPW using Amontec JTAGKEY probe                                   #
    #                                                                                               #
    #################################################################################################

    # We add to the minimal configuration.
    source [find mem_helper.tcl]
    source [find target/at91sam9g20.cfg]

    reset_config trst_and_srst

    # Use caution changing the delays listed below.  These seem to be affected by the board and type of
    # debugger dongle.  A value of 200 ms seems to work reliably for the configuration listed in the file header above.

    jtag_nsrst_delay 200
    jtag_ntrst_delay 200

    scan_chain
    #$_TARGETNAME configure -event gdb-attach { reset init }
    #$_TARGETNAME configure -event reset-start {at91sam9g20_reset_start}
    #$_TARGETNAME configure -event reset-init {at91sam9g20_reset_init}

    proc at91sam9g20_reset_start { } {

            # Make sure that the the jtag is running slow, since there are a number of different ways the board
            # can be configured coming into this state that can cause communication problems with the jtag
            # adapter.  Also since this call can be made following a "reset init" where fast memory accesses
            # are enabled, need to temporarily shut this down so that the RSTC_MR register can be written at slower
            # jtag speed without causing GDB keep alive problem.

            arm7_9 fast_memory_access disable
            jtag_khz 2                      ;# Slow-speed oscillator enabled at reset, so run jtag speed slow.
            halt 10000                              ;# Make sure processor is halted, or error will result in following steps.
            wait_halt 1000000
            mww 0xfffffd08 0xa5000501       ;# RSTC_MR : enable user reset.
    }

    proc at91sam9g20_reset_init { } {

            # At reset AT91SAM9G20 chip runs on slow clock (32.768 kHz).  To shift over to a normal clock requires
            # a number of steps that must be carefully performed.  The process outline below follows the
            # recommended procedure outlined in the AT91SAM9G20 technical manual.
            #
            # Several key and very important things to keep in mind:
            # The SDRAM parts used currently on the Atmel evaluation board are -75 grade parts.  This
            # means the master clock (MCLK) must be at or below 133 MHz or timing errors will occur.  The processor
            # core can operate up to 400 MHz and therefore PCLK must be at or below this to function properly.

            mww 0xfffffd44 0x00008000       # WDT_MR : disable watchdog.

            # Set oscillator bypass bit (12.00 MHz external oscillator) in CKGR_MOR register.

            mww 0xfffffc20 0x00000002

            # Set PLLA Register for 798.000 MHz (divider: bypass, multiplier: 132).
            # Wait for LOCKA signal in PMC_SR to assert indicating PLLA is stable.

            mww 0xfffffc28 0x20843F02
            while { [expr [mrw 0xfffffc68] & 0x02] != 2 } { sleep 1 }

            # Set master system clock prescaler divide by 6 and processor clock divide by 2 in PMC_MCKR.
            # Wait for MCKRDY signal from PMC_SR to assert.

            mww 0xfffffc30 0x00001300
            while { [expr [mrw 0xfffffc68] & 0x08] != 8 } { sleep 1 }

            # Now change PMC_MCKR register to select PLLA.
            # Wait for MCKRDY signal from PMC_SR to assert.

            mww 0xfffffc30 0x00001302
            while { [expr [mrw 0xfffffc68] & 0x08] != 8 } { sleep 1 }

            # Processor and master clocks are now operating and stable at maximum frequency possible:
            #       -> MCLK = 133.000 MHz
            #       -> PCLK = 400.000 MHz

            # Switch over to adaptive clocking.

            jtag_khz 0

            # Enable faster DCC downloads.

            arm7_9 dcc_downloads enable

            # To be able to use external SDRAM, several peripheral configuration registers must
            # be modified.  The first change is made to PIO_ASR to select peripheral functions
            # for D15 through D31.  The second change is made to the PIO_PDR register to disable
            # this for D15 through D31.

            mww 0xfffff870 0xffff0000
            mww 0xfffff804 0xffff0000

            # The EBI chip select register EBI_CS must be specifically configured to enable the internal SDRAM controller
            # using CS1.  Additionally we want CS3 assigned to NandFlash.  Also VDDIO is connected physically on
            # the board to the 1.8V VDC power supply so set the appropriate register bit to notify the micrcontroller.

            mww 0xffffef1c 0x000000a

            # The USB-A9G20-LPW Embedded computer has built-in NandFlash.  The exact physical timing characteristics
            # for the memory type used on the current board (MT29F2G08AACWP) can be established by setting
            # four registers in order:  SMC_SETUP3, SMC_PULSE3, SMC_CYCLE3, and SMC_MODE3.

            mww 0xffffec30 0x00020002
            mww 0xffffec34 0x04040404
            mww 0xffffec38 0x00070007
            mww 0xffffec3c 0x00030003

            # Now setup SDRAM.  This is tricky and configuration is very important for reliability!  The current calculations
            # are based on 2 x Micron LPSDRAM MT48H16M16LFBF-75 memory (4 M x 16 bit x 4 banks).  If you use this file as a reference
            # for a new board that uses different SDRAM devices or clock rates, you need to recalculate the value inserted
            # into the SDRAM_CR register.  Using the memory datasheet for the -75 grade part and assuming a master clock
            # of 133.000 MHz then the SDCLK period is equal to 7.6 ns.  This means the device requires:
            #
            #       CAS latency = 3 cycles
            #       TXSR = 10 cycles
            #       TRAS = 6 cycles
            #       TRCD = 3 cycles
            #       TRP = 3 cycles
            #       TRC = 9 cycles
            #       TWR = 2 cycles
            #       9 column, 13 row, 4 banks
            #       refresh equal to or less then 7.8 us for commerical/industrial rated devices
            #
            #       Thus SDRAM_CR = 0xa6339279

            mww 0xffffea08 0xa6339279

            # Memory Device Type: Low-power SDRAM
            mww 0xffffea24 0x00000001

            # Next issue a 'NOP' command through the SDRAMC_MR register followed by writing a zero value into
            # the starting memory location for the SDRAM.

            mww 0xffffea00 0x00000001
            mww 0x20000000 0

            # Issue an 'All Banks Precharge' command through the SDRAMC_MR register followed by writing a zero
            # value into the starting memory location for the SDRAM.

            mww 0xffffea00 0x00000002
            mww 0x20000000 0

            # Now issue an 'Auto-Refresh' command through the SDRAMC_MR register.  Follow this operation by writing
            # zero values eight times into the starting memory location for the SDRAM.

            mww 0xffffea00 0x4
            mww 0x20000000 0
            mww 0x20000000 0
            mww 0x20000000 0
            mww 0x20000000 0
            mww 0x20000000 0
            mww 0x20000000 0
            mww 0x20000000 0
            mww 0x20000000 0

            # Almost done, so next issue a 'Load Mode Register' command followed by a zero value write to the
            # the starting memory location for the SDRAM.

            mww 0xffffea00 0x3
            mww 0x20000000 0

            # Signal normal mode using the SDRAMC_MR register and follow with a zero value write the the starting
            # memory location for the SDRAM.

            mww 0xffffea00 0x0
            mww 0x20000000 0

            # Finally set the refresh rate to about every 7 us (7.5 ns x 924 cycles).

            mww 0xffffea04 0x0000039c
    }

3) start OpenOCD

now you need so start OpenOCD. For this you need to specify the
interface (First) and then the board

    openocd -f tcl/interface/calao-usb-a9g20-lpw.cfg  -f tcl/board/usb-a9g20-lpw.cfg
    Open On-Chip Debugger 0.5.0 (2011-08-09-08:45)
    Licensed under GNU GPL v2
    For bug reports, read
            http://openocd.berlios.de/doc/doxygen/bugs.html
    Info : only one transport option; autoselect 'jtag'
    trst_and_srst separate srst_gates_jtag trst_push_pull srst_open_drain
    adapter_nsrst_delay: 300
    jtag_ntrst_delay: 200
    RCLK - adaptive
    RCLK - adaptive
    trst_and_srst separate srst_gates_jtag trst_push_pull srst_open_drain
    adapter_nsrst_delay: 200
    jtag_ntrst_delay: 200
       TapName             Enabled  IdCode     Expected   IrLen IrCap IrMask
    -- ------------------- -------- ---------- ---------- ----- ----- ------
     0 at91sam9g20.cpu        Y     0x00000000 0x0792603f     4 0x01  0x0f
    at91sam9g20_init
    Info : max TCK change to: 30000 kHz
    Info : RCLK (adaptive clock speed)
    Info : JTAG tap: at91sam9g20.cpu tap/device found: 0x0792603f (mfg: 0x01f, part: 0x7926, ver: 0x0)
    Info : Embedded ICE version 6
    Info : at91sam9g20.cpu: hardware has 2 breakpoint/watchpoint units

you can now connect to you board via gdb or telnet

a) telnet

    telnet 127.0.0.1 4444
    Trying 127.0.0.1...
    Connected to 127.0.0.1.
    Escape character is '^]'.
    Open On-Chip Debugger
    > halt
    target state: halted
    target halted in ARM state due to debug-request, current mode: Supervisor
    cpsr: 0x600000d3 pc: 0x23f0457c
    MMU: disabled, D-Cache: disabled, I-Cache: enabled
    >

b) gdb

    $ arm-none-linux-gnueabi-gdb
    GNU gdb (Sourcery G++ Lite 2010.09-50) 7.2.50.20100908-cvs
    Copyright (C) 2010 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "--host=i686-pc-linux-gnu --target=arm-none-linux-gnueabi".
    For bug reporting instructions, please see:
    <https://support.codesourcery.com/GNUToolchain/>.
    (gdb) target remote :3333
    Remote debugging using :3333
    0x23f07f74 in ?? ()

note that the current board script does not init the hardware when you
connect to gdb

for this you will need to use the monitor

    monitor reset init halt

sometime the halt timeout in this case just do

    monitor halt


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [ARM Development
    Boards](http://eLinux.org/Category:ARM_Development_Boards "Category:ARM Development Boards")

