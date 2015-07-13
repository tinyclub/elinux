> From: [eLinux.org](http://eLinux.org/DHT-Walnut_Jtag_Bootloader_Installation "http://eLinux.org/DHT-Walnut_Jtag_Bootloader_Installation")


# DHT-Walnut Jtag Bootloader Installation



## Recovering a bricked DHT Walnut board

Using OCD Commander, a JTAG adapter, and GPSFan's ram resident ppcboot,
it is possible to reprogram the flash. In short, use OCD Commander to
turn on the sdram, download the ram targeted ppcboot, and install a new
bootloader.

You'll need a macro file
[recovery\_config.mac](http://elinux.org/wiki/DHT-Walnut?action=AttachFile&do=get&target=recovery_config.mac)
and the ppcboot image [[[Media:ppcboot\_ram.s19]] ppcboot\_ram.s19].

There's also an experimental ram-resident version of u-boot-1.1.4
[[[Media:u-boot-ram.s19]] u-boot-ram.s19] that can be downloaded to
0x400000. Source diffs against the current version from CVS,
incorporating the patches from both GPSFan and dfarnsworth:
[[[Media:u-boot-ram.patch]] u-boot-ram.patch]. Expect to see much more
output at boot, as this version has debug output turned on. (Other
changes include setting the entry point in the linker script, output
files renamed to u-boot.s19 and u-boot.elf, sdram config disabled, added
debug info on code relocation, and a modified default environment.)

-   Start OCD Commander, connect to the board, reset, and halt.

\>*reset*

-   The CPU should be ready to fetch the first instruction:

\>*cpu*

     PC: FFFFFFFC    CR: 00000000  MSR: 00000000  LR: 01FD327C
    B  -524028

-   Configure the system:

\>*recovery\_config* (Or hit the macro button and navigate to the
recovery\_config.mac file.)

    >endian big
    BIG Endian set for WORD and DASM commands
    >dcr 0x086 = 0x0400D038 ; 0x086: PLB0_BEAR R PLB Bus Error Address Register
    >dcr 0x0A0 = 0x03000000 ; 0x0A0: POB0_BESR0 R/Clear PLB to OPB Bus Error Status Register 0
    >dcr 0x0B1 = 0x0000102E ; 0x0B1: CPC0_CR0 R/W Chip Control Register 0
    >dcr 0x010 = 0x30
    >dcr 0x11 = 0x20880000  ; offset 0x30: SDRAM0_RTR R/W Refresh Timer Register
    >dcr 0x010 = 0x40
    >dcr 0x11 = 0x00046001  ; offset 0x40: SDRAM0_B0CR R/W Memory Bank 0 Configuration Register
    >dcr 0x010 = 0x48
    >dcr 0x11 = 0x01046001  ; offset 0x48: SDRAM0_B2CR R/W Memory Bank 2 Configuration Register
    >dcr 0x010 = 0x80
    >dcr 0x11 = 0x010A801A  ; offset 0x80: SDRAM0_TR R/W SDRAM Timing Register 1
    >dcr 0x010 = 0x20
    >dcr 0x11 = 0x80800000  ; offset 0x20: SDRAM0_CFG R/W Memory Controller Options 1
    >dcr 0x012 = 0x00
    >dcr 0x13 = 0xFFF18000  ; offset 0x00: EBC0_B0CR R/W Peripheral Bank 0 Configuration Register
    >dcr 0x012 = 0x01
    >dcr 0x13 = 0xF0018000  ; offset 0x01: EBC0_B1CR R/W Peripheral Bank 1 Configuration Register
    >dcr 0x012 = 0x02
    >dcr 0x13 = 0xF0118000  ; offset 0x02: EBC0_B2CR R/W Peripheral Bank 2 Configuration Register
    >dcr 0x012 = 0x03
    >dcr 0x13 = 0xF0218000  ; offset 0x03: EBC0_B3CR R/W Peripheral Bank 3 Configuration Register
    >dcr 0x012 = 0x04
    >dcr 0x13 = 0x400DA000  ; offset 0x04: EBC0_B4CR R/W Peripheral Bank 4 Configuration Register
    >dcr 0x012 = 0x07
    >dcr 0x13 = 0xF0318000  ; offset 0x07: EBC0_B7CR R/W Peripheral Bank 7 Configuration Register
    >dcr 0x012 = 0x10
    >dcr 0x13 = 0x9B015480  ; offset 0x10: EBC0_B0AP R/W Peripheral Bank 0 Access Parameters
    >dcr 0x012 = 0x11
    >dcr 0x13 = 0x02815480  ; offset 0x11: EBC0_B1AP R/W Peripheral Bank 1 Access Parameters
    >dcr 0x012 = 0x12
    >dcr 0x13 = 0x04815A80  ; offset 0x12: EBC0_B2AP R/W Peripheral Bank 2 Access Parameters
    >dcr 0x012 = 0x13
    >dcr 0x13 = 0x01815280  ; offset 0x13: EBC0_B3AP R/W Peripheral Bank 3 Access Parameters
    >dcr 0x012 = 0x14
    >dcr 0x13 = 0x03800480  ; offset 0x14: EBC0_B4AP R/W Peripheral Bank 4 Access Parameters
    >dcr 0x012 = 0x17
    >dcr 0x13 = 0x01815280  ; offset 0x17: EBC0_B7AP R/W Peripheral Bank 7 Access Parameters
    >word 0xEF400000 = 0x00000080    ; 0xEF400000: PCIL0_PMM0LA R/W PMM 0 Local Address
    >word 0xEF400004 = 0x010000E0    ; 0xEF400004: PCIL0_PMM0MA R/W PMM 0 Mask/Attribute
    >word 0xEF400008 = 0x00000080    ; 0xEF400008: PCIL0_PMM0PCILA R/W PMM 0 PCI Low Address
    >word 0xEF400014 = 0x010000E0    ; 0xEF400014: PCIL0_PMM1MA R/W PMM 1 Mask/Attribute
    >spr 0x009 = 0x00000000    ; CTR Count Register 9 0x009 0x120 Read/Write
    >spr 0x3FB = 0x80000001    ; ICCR Instruction Cache Cachability Register 1019 0x3FB 0x37F Read/Write
    >spr 0x3DB = 0x0001568B    ; PIT Programmable Interval Timer 987 0x3DB 0x37E Read/Write
    >spr 0x3B9 = 0x00000000    ; SGR Storage Guarded Register 953 0x3B9 0x33D Read/Write
    >spr 0x3DA = 0x04400000    ; TCR Timer Control Register 986 0x3DA 0x35E Read/Write

-   Download the ppcboot image to ram:

\>*down*

    E:\src\ppc\ppcboot\ppcboot_ram.s19: downloaded 163100 bytes in 0 minutes, 22.785 seconds
    PC set to starting address 0x00400000

-   Jump to the startup (which isn't the same as the download address):

\>*go 0x400100*

At this point, you should have a running ppcboot v1.1.6. Install a new
flash resident bootloader using the bootloader update procedure
[wiki:DHT-WalnutInstallingTheUpdatedBootloader Installing the Updated
Bootloader]


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [DHT-Walnut](http://eLinux.org/Category:DHT-Walnut "Category:DHT-Walnut")

