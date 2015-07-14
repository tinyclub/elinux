> From: [eLinux.org](http://eLinux.org/Literati "http://eLinux.org/Literati")


# Literati



## Contents

-   [1 Links](#links)
-   [2 Hardware](#hardware)
    -   [2.1 NAND (internal flash)](#nand-internal-flash)
    -   [2.2 Datasheets](#datasheets)
    -   [2.3 JTAG Port](#jtag-port)
    -   [2.4 Serial Port](#serial-port)
    -   [2.5 Opening Your Literati (White Sunway
        Model)](#opening-your-literati-white-sunway-model)
-   [3 Kernel testing](#kernel-testing)
    -   [3.1 dmesg from ygator](#dmesg-from-ygator)

## Links

1.  New Dev forum
    [http://literati.linuxprogrammer.org](http://literati.linuxprogrammer.org)
2.  Old Dev forum
    [http://forum.literatidevs.com/index.php](http://forum.literatidevs.com/index.php)

## Hardware

-   CPU: S3C6410 running at 666Mhz
-   Memory: 64MB
-   LCD: innolux lcd 480 X 800

### NAND (internal flash)

    NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
    Creating 5 MTD partitions on "NAND 512MiB 3,3V 8-bit":
    0x00000000-0x00040000 : "Bootloader"
    0x00040000-0x00340000 : "Kernel"
    0x00340000-0x00d40000 : "resource"
    0x00d40000-0x11140000 : "File System 1"
    0x11140000-0x20000000 : "User space"

### Datasheets

[smdk6410](http://www.mt-system.ru/documents/smdk6410_users_manual_rev1.0.pdf)
it looks to be based on this.
[File:Lookbook-schematics.pdf](http://eLinux.org/File:Lookbook-schematics.pdf "File:Lookbook-schematics.pdf")

[LCD](http://www.gst-lcd.com/spec/tftspec/LTE480WV-F01(4.8inch).pdf)
[quick
view](http://www.diytrade.com/china/4/products/3920682/4_8inch_TFT_LCD_Module_800x480_LTE480WV-F01.html)

### JTAG Port

The JTAG port has yet to be identified on the Literati.

### Serial Port

[Serial Port Access](http://eLinux.org/Literati:Serial_Port "Literati:Serial Port")

### Opening Your Literati (White Sunway Model)

[Opening White
Literati](http://eLinux.org/Literati:Opening_White_Literati "Literati:Opening White Literati")

## Kernel testing

[Burn Kernel/Booting from
SD](http://eLinux.org/Burn_Kernel/Booting_from_SD "Burn Kernel/Booting from SD")

### dmesg from ygator

    Linux version 2.6.24.2 (root@ligang-laptop) (gcc version 4.1.2) #180 Mon Aug 23 00:49:07 CST 2010
    CPU: ARMv6-compatible processor [410fb766] revision 6 (ARMv7), cr=00c5387f
    Machine: SMDK6410
    Ignoring unrecognised tag 0x00000000
    Memory policy: ECC disabled, Data cache writeback
    On node 0 totalpages: 16384
    DMA zone: 128 pages used for memmap
    DMA zone: 0 pages reserved
    DMA zone: 16256 pages, LIFO batch:3
    Normal zone: 0 pages used for memmap
    Movable zone: 0 pages used for memmap
    CPU S3C6410 (id 0x36410101)
    S3C6410: core 666.000 MHz, memory 111.000 MHz, peripheral 55.500 MHz
    S3C6410: EPLL 192.000 MHz
    S3C64XX Clocks, (c) 2007 Samssung Electronics
    CPU0: D VIPT write-back cache
    CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
    CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
    Built 1 zonelists in Zone order, mobility grouping on. Total pages: 16256
    Kernel command line: console=ttySAC0,115200 loglevel=0 ubi.mtd=3 root=ubi0:rootfs rootfstype=ubifs
    Trying to install chained interrupt handler for IRQ0
    Trying to install chained interrupt handler for IRQ1
    Trying to install chained interrupt handler for IRQ32
    Trying to install chained interrupt handler for IRQ33
    PID hash table entries: 256 (order: 8, 1024 bytes)
    timer tcon=00600900, tcnt 29b0, tcfg 00001919,00000040, usec 000077ee
    Console: colour dummy device 80x30
    console [ttySAC0] enabled
    Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
    Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
    Memory: 64MB = 64MB total
    Memory: 61708KB available (2768K code, 265K data, 104K init)
    Calibrating delay loop... 665.19 BogoMIPS (lpj=1662976)
    Mount-cache hash table entries: 512
    CPU: Testing write buffer coherency: ok
    net_namespace: 64 bytes
    NET: Registered protocol family 16
    ================> wifi status change from 0 to 0
    S3C6410 Power Management, (c) 2008 Samsung Electronics
    s3c6410: Initialising architecture
    S3C DMA-pl080 Controller Driver, (c) 2006-2007 Samsung Electronics
    Total 32 DMA channels will be initialized.
    SCSI subsystem initialized
    usbcore: registered new interface driver usbfs
    usbcore: registered new interface driver hub
    usbcore: registered new device driver usb
    NET: Registered protocol family 2
    IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
    TCP established hash table entries: 2048 (order: 2, 16384 bytes)
    TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
    TCP: Hash tables configured (established 2048 bind 2048)
    TCP reno registered
    NetWinder Floating Point Emulator V0.97 (double precision)
    io scheduler noop registered
    io scheduler anticipatory registered (default)
    io scheduler deadline registered
    io scheduler cfq registered
    S3C_LCD clock got enabled :: 111.000 Mhz
    LCD TYPE :: LTE480WV will be initialized
    Window[0] - FB1: map_video_memory: clear ff200000:000bb800
    FB1: map_video_memory: dma=53900000 cpu=ff200000 size=000bb800
    Console: switching to colour frame buffer device 100x30
    fb0: s3cfb frame buffer device
    s3c_lcd_set_power:1
    PWM channel 1 set g_tcnt = 1000, g_tcmp = 480
    S3C ADC driver, (c) 2007 Samsung Electronics
    S3C ADC driver successfully probed !
    s3c-uart.0: s3c_serial0 at MMIO 0x7f005000 (irq = 37) is a S3C
    s3c-uart.1: s3c_serial1 at MMIO 0x7f005400 (irq = 38) is a S3C
    s3c-uart.2: s3c_serial2 at MMIO 0x7f005800 (irq = 39) is a S3C
    s3c-uart.3: s3c_serial3 at MMIO 0x7f005c00 (irq = 40) is a S3C
    RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
    loop: module loaded
    Driver 'sd' needs updating - please use bus_type methods
    S3C NAND Driver, (c) 2007 Samsung Electronics
    S3C NAND Driver is using hardware ECC.
    NAND device: Manufacturer ID: 0xec, Chip ID: 0xdc (Samsung NAND 512MiB 3,3V 8-bit)
    Creating 5 MTD partitions on "NAND 512MiB 3,3V 8-bit":
    0x00000000-0x00040000 : "Bootloader"
    0x00040000-0x00340000 : "Kernel"
    0x00340000-0x00d40000 : "resource"
    0x00d40000-0x11140000 : "File System 1"
    0x11140000-0x20000000 : "User space"
    UBI: attaching mtd3 to ubi0
    UBI: physical eraseblock size: 262144 bytes (256 KiB)
    UBI: logical eraseblock size: 258048 bytes
    UBI: smallest flash I/O unit: 2048
    UBI: VID header offset: 2048 (aligned 2048)
    UBI: data offset: 4096
    UBI: attached mtd3 to ubi0
    UBI: MTD device name: "File System 1"
    UBI: MTD device size: 260 MiB
    UBI: number of good PEBs: 1040
    UBI: number of bad PEBs: 0
    UBI: max. allowed volumes: 128
    UBI: wear-leveling threshold: 4096
    UBI: number of internal volumes: 1
    UBI: number of user volumes: 1
    UBI: available PEBs: 10
    UBI: total number of reserved PEBs: 1030
    UBI: number of PEBs reserved for bad PEB handling: 10
    UBI: max/mean erase counter: 3/1
    ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver
    UBI: background thread "ubi_bgt0d" started, PID 223
    usb_host_clk_en
    otg_phy_init ...................!
    s3c2410-ohci s3c2410-ohci: S3C OHCI
    s3c2410-ohci s3c2410-ohci: new USB bus registered, assigned bus number 1
    s3c2410-ohci s3c2410-ohci: irq 47, io mem 0x74300000
    usb usb1: configuration #1 chosen from 1 choice
    hub 1-0:1.0: USB hub found
    hub 1-0:1.0: 1 port detected
    s3c6410_OTGHCD s3c6410_OTGHCD: S3C6410 OTGHCD
    s3c6410_OTGHCD s3c6410_OTGHCD: new USB bus registered, assigned bus number 2
    s3c6410_OTGHCD s3c6410_OTGHCD: irq 58, io mem 0x7c000000
    ===============Enter ID_DEVICE Mod===============
    ===============Enter ID_DEVICE Mod===============
    usb usb2: configuration #1 chosen from 1 choice
    hub 2-0:1.0: USB hub found
    hub 2-0:1.0: 1 port detected
    otg_phy_init ...................!
    ===============Enter ID_DEVICE Mod===============
    ===============Enter ID_DEVICE Mod===============
    otg_phy_init ...................!
    Loaded s3c-udc version Aug 23 2010 (DMA Mode)
    input: midfun-keys as /devices/platform/midfun-keys/input/input0
    input: s3c-keypad as /devices/platform/s3c-keypad/input/input1
    s3c-keypad Initialized
    S3C Keypad Driver
    S3C24XX RTC, (c) 2004,2006 Simtec Electronics
    s3c2410-rtc s3c2410-rtc: rtc disabled, re-enabling
    s3c2410-rtc s3c2410-rtc: rtc core: registered s3c as rtc0
    S3C PWM Driver, (c) 2006-2007 Samsung Electronics
    i2c /dev entries driver
    s3c2410-i2c s3c2410-i2c: slave address 0x10
    s3c2410-i2c s3c2410-i2c: bus frequency set to 108 KHz
    s3c2410-i2c s3c2410-i2c: i2c-0: S3C I2C adapter
    s3c-hsmmc: card inserted.
    [s3c_hsmmc_probe]: s3c-hsmmc.1: at 0xc5000000 with irq 57. clk src: sclk_DOUTmpll_mmc1
    TCP cubic registered
    NET: Registered protocol family 1
    NET: Registered protocol family 17
    NET: Registered protocol family 15
    ieee80211: 802.11 data/management/control stack, git-1.1.13
    ieee80211: Copyright (C) 2004-2005 Intel Corporation <jketreno@linux.intel.com>
    ieee80211_crypt: registered algorithm 'NULL'
    ieee80211_crypt: registered algorithm 'WEP'
    ieee80211_crypt: registered algorithm 'CCMP'
    ieee80211_crypt: registered algorithm 'TKIP'
    VFP support v0.3: implementor 41 architecture 1 part 20 variant b rev 5
    s3c2410-rtc s3c2410-rtc: setting system clock to 2011-02-06 04:43:51 UTC (1296967431)
    UBIFS: recovery needed
    UBIFS: recovery completed
    UBIFS: mounted UBI device 0, volume 0, name "rootfs"
    UBIFS: file system size: 259854336 bytes (253764 KiB, 247 MiB, 1007 LEBs)
    UBIFS: journal size: 12902400 bytes (12600 KiB, 12 MiB, 50 LEBs)
    UBIFS: media format: w4/r0 (latest is w4/r0)
    UBIFS: default compressor: lzo
    UBIFS: reserved for root: 4952683 bytes (4836 KiB)
    VFS: Mounted root (ubifs filesystem).
    Freeing init memory: 104K
    UART err int.
    s3c-nand: 1 bit(s) error detected, corrected successfully
    s3c-nand: 1 bit(s) error detected, corrected successfully
    s3c-nand: 1 bit(s) error detected, corrected successfully
    mmc0: host does not support reading read-only switch. assuming write-enable.
    mmc0: new SD card at address ebe2
    mmcblk0: mmc0:ebe2 SD512 500224KiB
    mmcblk0: p1
    s3c-nand: 1 bit(s) error detected, corrected successfully
    s3c-nand: 1 bit(s) error detected, corrected successfully
    s3c-nand: 1 bit(s) error detected, corrected successfully
    UBI: attaching mtd4 to ubi1
    UBI: physical eraseblock size: 262144 bytes (256 KiB)
    UBI: logical eraseblock size: 258048 bytes
    UBI: smallest flash I/O unit: 2048
    UBI: VID header offset: 2048 (aligned 2048)
    UBI: data offset: 4096
    UBI: attached mtd4 to ubi1
    UBI: MTD device name: "User space"
    UBI: MTD device size: 238 MiB
    UBI: number of good PEBs: 955
    UBI: number of bad PEBs: 0
    UBI: max. allowed volumes: 128
    UBI: wear-leveling threshold: 4096
    UBI: number of internal volumes: 1
    UBI: number of user volumes: 1
    UBI: available PEBs: 0
    UBI: total number of reserved PEBs: 955
    UBI: number of PEBs reserved for bad PEB handling: 9
    UBI: max/mean erase counter: 2/1
    UBI: background thread "ubi_bgt1d" started, PID 500
    UBIFS: recovery needed
    UBIFS: recovery completed
    UBIFS: mounted UBI device 1, volume 0, name "ubifs1"
    UBIFS: file system size: 240758784 bytes (235116 KiB, 229 MiB, 933 LEBs)
    UBIFS: journal size: 12128256 bytes (11844 KiB, 11 MiB, 47 LEBs)
    UBIFS: media format: w4/r0 (latest is w4/r0)
    UBIFS: default compressor: lzo
    UBIFS: reserved for root: 4952683 bytes (4836 KiB)
    usbcore: registered new interface driver usbhid
    drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
    s3c-nand: 1 bit(s) error detected, corrected successfully
    s3c-nand: 1 bit(s) error detected, corrected successfully
    Adding 64492k swap on /mnt/swap/actual_swap. Priority:-1 extents:1 across:64492k
    usb 1-1: new full speed USB device using s3c2410-ohci and address 2
    usb 1-1: not running at top speed; connect to a high speed hub
    usb 1-1: configuration #1 chosen from 1 choice
    ================> wifi status change from 0 to 1
    rtusb init --->


    === pAd = c4f01000, size = 439728 ===

    RTMPAllocAdapterBlock, Status=0
    usbcore: registered new interface driver rt2870
    RTMPAllocTxRxRingMemory, Status=0
    -->RTUSBVenderReset
    RTUSBVenderReset
    Key1Str is Invalid key length(0) or Type(0)
    Key2Str is Invalid key length(0) or Type(0)
    Key3Str is Invalid key length(0) or Type(0)
    Key4Str is Invalid key length(0) or Type(0)
    1. Phy Mode = 0
    2. Phy Mode = 0
    NVM is Efuse and its size =2d[2d0-2fc]
    3. Phy Mode = 0
    RTMPSetPhyMode: channel is out of range, use first channel=1
    == rt28xx_init, Status=0
    0x1300 = 00073200
    s3c_lcd_set_power:1
    PWM channel 1 set g_tcnt = 1000, g_tcmp = 96
    Terminate the task(RtmpMlmeTask) with pid(559)!
    Terminate the task(RtmpCmdQTask) with pid(560)!
    Terminate the task(RtmpTimerTask) with pid(558)!
    ---> RTMPFreeTxRxRingMemory
    - RTMPFreeTxRxRingMemory
    ================> wifi status change from 1 to 0
    usb 1-1: USB disconnect, address 2
    rtusb_disconnect: unregister usbnet usb-s3c24xx-1
    RtmpOSNetDevDetach(): RtmpOSNetDeviceDetach(), dev->name=ra0!
    RTUSB disconnect successfully

[Categoty:Literati](http://eLinux.org/index.php?title=Categoty:Literati&action=edit&redlink=1 "Categoty:Literati (page does not exist)")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Boards](http://eLinux.org/Category:Development_Boards "Category:Development Boards")

