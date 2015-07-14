> From: [eLinux.org](http://eLinux.org/Freescale_IMX53QSB "http://eLinux.org/Freescale_IMX53QSB")


# Freescale IMX53QSB



## Contents

-   [1 Topics](#topics)
-   [2 Hardware](#hardware)
-   [3 Barebox](#barebox)
-   [4 Kernel](#kernel)

## Topics

# Hardware

The i.MX53 Quick Start Board (aka LOCO) is a 1 GHz ARM Cortex-A8
embedded computer on a 3-inch by 3-inch board.

The loco boots from SD Card with the boot loader at the first sector of
it.

You can use Barebox on it:

[http://git.pengutronix.de/?p=barebox.git;a=summary](http://git.pengutronix.de/?p=barebox.git;a=summary)

# Barebox

Barebox uses the same build (Kbuild) and configuration (Kconfig) tools
as the Linux kernel.

1) First you need to clone the tree

    git clone git://git.pengutronix.de/git/barebox.git

Most probably you want to use a released Barebox version, by running
'git checkout \<version\>'. Check which versions are available with 'git
tag -l' and use the latest one.

2) Then you need to configure it:

    make freescale_mx53_loco_defconfig

3) Compile it

    make

4) Now you need to generate your SD Card:

Plug the SD Card into your laptop and copy barebox.bin to it:

    dd if=barebox.bin of=/dev/sdb bs=512
    sync

5) plug the SD card into the board and boot it (press the boot button)

Now that you have flash, you will see Barebox booting and trying to
start the kernel from the SD card.

    barebox 2011.09.0-00338-ga6d06f2 (Oct  9 2011 - 23:07:34)

    Board: Freescale i.MX53 LOCO
    registered netconsole as cs1
    eth@eth0: got MAC address from EEPROM: 00:04:9F:01:AB:1D
    Malloc space: 0x7df00000 -> 0x7ff00000 (size 32 MB)
    Stack space : 0x7def8000 -> 0x7df00000 (size 32 kB)
    envfs: wrong magic on /dev/env0
    no valid environment found on /dev/env0. Using default environment
    running /env/bin/init...
    barebox@Freescale i.MX53 LOCO:/

# Kernel

You can use the mainline kernel, but take into account that not all IP
cores available in the MX53 are already supported there. It is also
possible to use Freescale's kernel, which can be found here:

[http://opensource.freescale.com/git?p=imx/linux-2.6-imx.git;a=summary](http://opensource.freescale.com/git?p=imx/linux-2.6-imx.git;a=summary)

1) First you need to clone the tree:

a) Mainline

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

Note that, like with Barebox, if you aim for stability, you should take
a released kernel revision instead of some random version from git.

b) Freescale

    git clone http://opensource.freescale.com/pub/scm/imx/linux-2.6-imx.git

    git checkout -b work imx_2.6.38_11.09.01

or

To speed up the clone, first clone the linus tree, then fetch freescale
as this

or use any already cloned kernel

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

    git remote add freescale http://opensource.freescale.com/pub/scm/imx/linux-2.6-imx.git

    git fetch freescale

    git checkout -b work freescale/imx_2.6.38_11.09.01

2) Then you need to configure the kernel:

    make imx5_defconfig

3) Compile it

    make

If you have a machine with more than one core, add -j
\<number-of-parallel-builds\>.

4) now you need to generate your SD Card:

Plug the sd card on your laptop and copy barebox.bin on it

    dd if=arch/arm/boot/uImage of=/dev/sdb bs=512 seek=768
    sync

5) Plug the SD card into the board and boot it (press the boot button)

Now that you have flashed everything, you will see barebox booting and
trying to start the kernel from the SD card.

    barebox 2011.09.0-00338-ga6d06f2 (Oct  9 2011 - 23:07:34)

    Board: Freescale i.MX53 LOCO
    registered netconsole as cs1
    eth@eth0: got MAC address from EEPROM: 00:04:9F:01:AB:1D
    Malloc space: 0x7df00000 -> 0x7ff00000 (size 32 MB)
    Stack space : 0x7def8000 -> 0x7df00000 (size 32 kB)
    envfs: wrong magic on /dev/env0
    no valid environment found on /dev/env0. Using default environment
    running /env/bin/init...

    Enter the Password within 3s to stop the boot
    Password: booting kernel of type uimage from /dev/disk0.kernel
      Verifying Checksum ... OK
      Image Name:   Linux-2.6.35.3-00745-gce4c61a-di
      Created:      2011-10-09  13:43:29 UTC
      Image Type:   ARM Linux Multi-File Image (uncompressed)
      Data Size:    2885707 Bytes =  2.8 MB
      Load Address: 70008000
      Entry Point:  70008000
      Contents:
         Image 0: 2729640 Bytes =  2.6 MB
         Image 1: 156067 Bytes = 152.4 kB
          Offset = 0x7e5d0708
    use initrd @1
    initrd_start=0x72000000
    OK

    Starting kernel with initrd ...

    commandline: console=ttymxc0,115200 ip=192.168.201.33:192.168.201.98:192.168.201.98:255.255.255.0::eth0: root=/dev/ram0 rdinit=/sbin/init
    arch_number: 3273
    Linux version 2.6.35.3-00745-gce4c61a-dirty (root@j-debian) (gcc version 4.5.1 (Sourcery G++ Lite 2010.09-50) ) #11 PREEMPT Sat Oct 8 21:35:40 CST 2011
    CPU: ARMv7 Processor [412fc085] revision 5 (ARMv7), cr=10c53c7f
    CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
    Machine: Freescale MX53 LOCO Board
    Memory policy: ECC disabled, Data cache writeback
    Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 218112
    Kernel command line: console=ttymxc0,115200 ip=192.168.201.33:192.168.201.98:192.168.201.98:255.255.255.0::eth0: root=/dev/ram0 rdinit=/sbin/init
    PID hash table entries: 4096 (order: 2, 16384 bytes)
    Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
    Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
    Memory: 352MB 512MB = 864MB total
    Memory: 868548k/868548k available, 16188k reserved, 0K highmem
    Virtual kernel memory layout:
       vector  : 0xffff0000 - 0xffff1000   (   4 kB)
       fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
       DMA     : 0xf9e00000 - 0xffe00000   (  96 MB)
       vmalloc : 0xe0800000 - 0xf4000000   ( 312 MB)
       lowmem  : 0x80000000 - 0xe0000000   (1536 MB)
       pkmap   : 0x7fe00000 - 0x80000000   (   2 MB)
       modules : 0x7f000000 - 0x7fe00000   (  14 MB)
         .init : 0x80008000 - 0x8002f000   ( 156 kB)
         .text : 0x8002f000 - 0x8078b000   (7536 kB)
         .data : 0x807ac000 - 0x807f3aa0   ( 287 kB)
    SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
    Hierarchical RCU implementation.
           RCU-based detection of stalled CPUs is disabled.
           Verbose stalled-CPUs detection is disabled.
    NR_IRQS:368
    MXC GPIO hardware
    MXC IRQ initialized
    MXC_Early serial console at MMIO 0x53fbc000 (options '115200')
    bootconsole [ttymxc0] enabled
    Console: colour dummy device 80x30
    Calibrating delay loop... 999.42 BogoMIPS (lpj=4997120)
    pid_max: default: 32768 minimum: 301
    Mount-cache hash table entries: 512
    CPU: Testing write buffer coherency: ok
    devtmpfs: initialized
    regulator: core version 0.5
    NET: Registered protocol family 16
    i.MX IRAM pool: 128 KB@0xe0840000
    IRAM READY
    CPU is i.MX0 Revision 0.0
    Using SDMA I.API
    MXC DMA API initialized
    IMX usb wakeup probe
    IMX usb wakeup probe
    bio: create slab <bio-0> at 0
    SCSI subsystem initialized
    usbcore: registered new interface driver usbfs
    usbcore: registered new interface driver hub
    usbcore: registered new device driver usb
    da9052_i2c_is_connected - i2c read success..............
    regulator: DA9052_LDO1: 600 <--> 1800 mV at 1300 mV normal
    regulator: DA9052_LDO2: 600 <--> 1800 mV at 1300 mV normal
    regulator: DA9052_LDO3: 1725 <--> 3300 mV at 3300 mV normal
    regulator: DA9052_LDO4: 1725 <--> 3300 mV at 2775 mV normal
    regulator: DA9052_LDO5: 1200 <--> 3600 mV at 1300 mV normal
    regulator: DA9052_LDO6: 1200 <--> 3600 mV at 1300 mV normal
    regulator: DA9052_LDO7: 1200 <--> 3600 mV at 2750 mV normal
    regulator: DA9052_LDO8: 1200 <--> 3600 mV at 1800 mV normal
    regulator: DA9052_LDO9: 1250 <--> 3650 mV at 1500 mV normal
    regulator: DA9052_LDO10: 1200 <--> 3600 mV at 1300 mV normal
    regulator: DA9052_BUCK_CORE: 500 <--> 2075 mV at 1100 mV normal
    regulator: DA9052_BUCK_PRO: 500 <--> 2075 mV at 1300 mV normal
    regulator: DA9052_BUCK_MEM: 925 <--> 2500 mV at 1500 mV normal
    regulator: DA9052_BUCK_PERI: 1800 <--> 3600 mV at 3600 mV normal
    IPU DMFC NORMAL mode: 1(0~1), 5B(4,5), 5F(6,7)
    Advanced Linux Sound Architecture Driver Version 1.0.23.
    Bluetooth: Core ver 2.15
    NET: Registered protocol family 31
    Bluetooth: HCI device and connection manager initialized
    Bluetooth: HCI socket layer initialized
    Switching to clocksource mxc_timer1
    NET: Registered protocol family 2
    IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
    TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
    TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
    TCP: Hash tables configured (established 131072 bind 65536)
    TCP reno registered
    UDP hash table entries: 512 (order: 1, 8192 bytes)
    UDP-Lite hash table entries: 512 (order: 1, 8192 bytes)
    NET: Registered protocol family 1
    RPC: Registered udp transport module.
    RPC: Registered tcp transport module.
    RPC: Registered tcp NFSv4.1 backchannel transport module.
    Unpacking initramfs...
    Freeing initrd memory: 152K
    LPMode driver module loaded
    Static Power Management for Freescale i.MX5
    PM driver module loaded
    sdram autogating driver module loaded
    Bus freq driver module loaded
    DI0 is primary
    mxc_dvfs_core_probe
    DVFS driver module loaded
    i.MXC CPU frequency driver
    DVFS PER driver module loaded
    squashfs: version 4.0 (2009/01/31) Phillip Lougher
    msgmni has been set to 1696
    alg: No test for stdrng (krng)
    cryptodev: driver loaded.
    io scheduler noop registered
    io scheduler deadline registered
    io scheduler cfq registered (default)
    mxc_ipu mxc_ipu: Channel already disabled 9
    mxc_ipu mxc_ipu: Channel already uninitialized 9
    Console: switching to colour frame buffer device 100x30
    tve: probe of tve.0 failed with error -1
    sii9022 1-0039: SII9022: cound not find device
    Serial: MXC Internal UART driver
    mxcintuart.0: ttymxc0 at MMIO 0x53fbc000 (irq = 31) is a Freescale i.MX
    console [ttymxc0] enabled, bootconsole disabled
    console [ttymxc0] enabled, bootconsole disabled
    mxcintuart.1: ttymxc1 at MMIO 0x53fc0000 (irq = 32) is a Freescale i.MX
    mxcintuart.2: ttymxc2 at MMIO 0x5000c000 (irq = 33) is a Freescale i.MX
    mxcintuart.3: ttymxc3 at MMIO 0x53ff0000 (irq = 13) is a Freescale i.MX
    mxcintuart.4: ttymxc4 at MMIO 0x63f90000 (irq = 86) is a Freescale i.MX
    loop: module loaded
    ahci: SSS flag set, parallel bus scan disabled
    ahci ahci.0: AHCI 0001.0100 32 slots 1 ports 3 Gbps 0x1 impl platform mode
    ahci ahci.0: flags: ncq sntf stag pm led clo only pmp pio slum part ccc
    scsi0 : ahci
    ata1: SATA max UDMA/133 mmio [mem 0x10000000-0x10000fff] port 0x100 irq 28
    MXC MTD nand Driver 3.0
    vcan: Virtual CAN interface driver
    Freescale FlexCAN Driver
    FEC Ethernet Driver
    fec_enet_mii_bus: probed
    ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
    fsl-ehci fsl-ehci.0: Freescale On-Chip EHCI Host Controller
    fsl-ehci fsl-ehci.0: new USB bus registered, assigned bus number 1
    fsl-ehci fsl-ehci.0: irq 18, io base 0x53f80000
    fsl-ehci fsl-ehci.0: USB 2.0 started, EHCI 1.00
    hub 1-0:1.0: USB hub found
    hub 1-0:1.0: 1 port detected
    fsl-ehci fsl-ehci.1: Freescale On-Chip EHCI Host Controller
    fsl-ehci fsl-ehci.1: new USB bus registered, assigned bus number 2
    ata1: SATA link down (SStatus 0 SControl 300)
    fsl-ehci fsl-ehci.1: irq 14, io base 0x53f80200
    fsl-ehci fsl-ehci.1: USB 2.0 started, EHCI 1.00
    hub 2-0:1.0: USB hub found
    hub 2-0:1.0: 1 port detected
    Initializing USB Mass Storage driver...
    usbcore: registered new interface driver usb-storage
    USB Mass Storage support registered.
    usbcore: registered new interface driver usbserial
    usbserial: USB Serial Driver core
    USB Serial support registered for GSM modem (1-port)
    usbcore: registered new interface driver option
    option: v0.7.2:USB Driver for GSM modems
    mice: PS/2 mouse device common for all mice
    input: gpio-keys as /devices/platform/gpio-keys/input/input0
    MXC keypad loaded
    DA9052 TSI Device Driver, v1.0
    input: da9052-tsi as /devices/virtual/input/input1
    TSI Drv Successfully Inserted da9052-tsi
    input: da9052-onkey as /devices/platform/imx-i2c.0/i2c-0/0-0048/da9052-onkey/input/input2
    mxc_rtc mxc_rtc.0: rtc core: registered mxc_rtc as rtc0
    i2c /dev entries driver
    IR NEC protocol handler initialized
    IR RC5(x) protocol handler initialized
    IR RC6 protocol handler initialized
    IR JVC protocol handler initialized
    IR Sony protocol handler initialized
    Linux video capture interface: v2.00
    mxc_v4l2_output mxc_v4l2_output.0: Registered device video0
    usbcore: registered new interface driver uvcvideo
    USB Video Class driver (v0.1.0)
    APM Battery Driver
    check mma8450 chip ID
    mma8450 0-001c: build time Oct  6 2011 02:19:40
    input: mma8450 as /devices/platform/imx-i2c.0/i2c-0/0-001c/input/input3
    add mma8450 i2c driver
    add mma8451 i2c driver
    MXC WatchDog Driver 2.0
    MXC Watchdog # 0 Timer: initial timeout 60 sec
    Bluetooth: Virtual HCI driver ver 1.3
    Bluetooth: HCI UART driver ver 2.2
    Bluetooth: HCIATH protocol initialized
    Bluetooth: Generic Bluetooth USB driver ver 0.6
    usbcore: registered new interface driver btusb
    VPU initialized
    mxsdhci: MXC Secure Digital Host Controller Interface driver
    mxsdhci: MXC SDHCI Controller Driver.
    mmc0: SDHCI detect irq 0 irq 1 INTERNAL DMA
    mxsdhci: MXC SDHCI Controller Driver.
    mmc1: SDHCI detect irq 203 irq 3 INTERNAL DMA
    usbcore: registered new interface driver usbhid
    usbhid: USB HID core driver
    Cirrus Logic CS42888 ALSA SoC Codec Driver
    sgtl5000-i2c 1-000a: SGTL5000 revision 17
    No device for DAI imx-ssi-1-0
    No device for DAI imx-ssi-1-1
    No device for DAI imx-ssi-2-0
    No device for DAI imx-ssi-2-1
    DMA Sound Buffers Allocated:UseIram=1 buf->addr=f8002000 buf->area=e0842000 size=24576
    DMA Sound Buffers Allocated:UseIram=1 buf->addr=cf480000 buf->area=fa310000 size=24576
    asoc: SGTL5000 <-> imx-ssi-2-0 mapping ok
    mmc0: new SDHC card at address f8a3
    mmcblk0: mmc0:f8a3 SU04G 3.69 GiB
     mmcblk0: p1
    ALSA device list:
     #0: imx-3stack (SGTL5000)
    TCP cubic registered
    NET: Registered protocol family 17
    can: controller area network core (rev 20090105 abi 8)
    NET: Registered protocol family 29
    can: raw protocol (rev 20090105)
    can: broadcast manager protocol (rev 20090105 t)
    Bluetooth: L2CAP ver 2.14
    Bluetooth: L2CAP socket layer initialized
    Bluetooth: SCO (Voice Link) ver 0.6
    Bluetooth: SCO socket layer initialized
    Bluetooth: RFCOMM TTY layer initialized
    Bluetooth: RFCOMM socket layer initialized
    Bluetooth: RFCOMM ver 1.11
    Bluetooth: BNEP (Ethernet Emulation) ver 1.3
    Bluetooth: BNEP filters: protocol multicast
    Bluetooth: HIDP (Human Interface Emulation) ver 1.2
    VFP support v0.3: implementor 41 architecture 3 part 30 variant c rev 2
    regulator_init_complete: incomplete constraints, leaving DA9052_BUCK_MEM on
    regulator_init_complete: incomplete constraints, leaving DA9052_BUCK_PRO on
    regulator_init_complete: incomplete constraints, leaving DA9052_BUCK_CORE on
    regulator_init_complete: incomplete constraints, leaving DA9052_LDO10 on
    regulator_init_complete: incomplete constraints, leaving DA9052_LDO8 on
    regulator_init_complete: incomplete constraints, leaving DA9052_LDO7 on
    regulator_init_complete: incomplete constraints, leaving DA9052_LDO6 on
    regulator_init_complete: incomplete constraints, leaving DA9052_LDO4 on
    regulator_init_complete: incomplete constraints, leaving DA9052_LDO3 on
    regulator_init_complete: incomplete constraints, leaving DA9052_LDO2 on
    regulator_init_complete: incomplete constraints, leaving DA9052_LDO1 on
    mxc_rtc mxc_rtc.0: setting system clock to 1970-01-01 00:00:00 UTC (0)
    eth0: Freescale FEC PHY driver [Generic PHY] (mii_bus:phy_addr=0:00, irq=-1)
    IP-Config: Complete:
        device=eth0, addr=192.168.201.33, mask=255.255.255.0, gw=192.168.201.98,
        host=192.168.201.33, domain=, nis-domain=(none),
        bootserver=192.168.201.98, rootserver=192.168.201.98, rootpath=
    Freeing init memory: 156K
    Checking rootfs signature Success
    Starting logging: OK
    Starting mdev...
    Starting portmap: done
    Initializing random number generator... read-only file system detected...done
    Starting network...
    ip: RTNETLINK answers: File exists
    Starting Network Interface Plugging Daemon: eth0.
    Starting dropbear sshd: OK
    Starting stunnel: Reading configuration from file /etc/stunnel/stunnel.conf
    PRNG seeded successfully
    stunnel.pem: No such file or directory (2)
    OK
    Starting NFS statd: done
    Starting NFS services: exportfs: could not open /var/lib/nfs/.etab.lock for locking: errno 30 (Read-only file system)
    exportfs: can't lock /var/lib/nfs/etab for writing
    exportfs: could not open /var/lib/nfs/.xtab.lock for locking: errno 30 (Read-only file system)
    exportfs: can't lock /var/lib/nfs/xtab for writing
    done
    Starting NFS daemon: rpc.nfsd: Unable to access /proc/fs/nfsd errno 2 (No such file or directory).
    Please try, as root, 'mount -t nfsd nfsd /proc/fs/nfsd' and then restart rpc.nfsd to correct the problem
    done
    Starting NFS mountd: done
    Starting domain name daemon: namedwarning: `named' uses 32-bit capabilities (legacy support in use)
    failed
    Welcome to Loco
    loco login:


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [ARM Development
    Boards](http://eLinux.org/Category:ARM_Development_Boards "Category:ARM Development Boards")

