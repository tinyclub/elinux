> From: [eLinux.org](http://eLinux.org/Grabserial "http://eLinux.org/Grabserial")


# Grabserial



grabserial - grab serial port output

## Contents

-   [1 Introduction](#introduction)
-   [2 Download and Installation](#download-and-installation)
    -   [2.1 Older versions](#older-versions)
    -   [2.2 pyserial (required python
        library)](#pyserial-required-python-library)
-   [3 Usage](#usage)
-   [4 Usage Examples](#usage-examples)
-   [5 Sample Output](#sample-output)
-   [6 Usage Notes](#usage-notes)
    -   [6.1 Timing of kernel printk
        messages](#timing-of-kernel-printk-messages)
    -   [6.2 Finding the time to decompress the
        kernel](#finding-the-time-to-decompress-the-kernel)

## Introduction

grabserial is a small program which reads a serial port and writes the
data to standard output. The main purpose of this tool is to collect
messages written to the serial console from a target board running
Linux, and save the messages on a host machine.

## Download and Installation

The latest released version is available here:
[https://github.com/tbird20d/grabserial/releases/latest](https://github.com/tbird20d/grabserial/releases/latest)
(currently 1.7.1)

The source code is here:
[https://github.com/tbird20d/grabserial](https://github.com/tbird20d/grabserial)

### Older versions

I don't know why you'd want these, but here are some older versions of
'grabserial':

An older version (1.5.0) is available here:
[Media:grabserial-1.5.0](http://eLinux.org/images/e/e7/Grabserial-1.5.0 "Grabserial-1.5.0")

Right click on the link and select "Save Link as" to download.

(See [File:Grabserial](http://eLinux.org/File:Grabserial "File:Grabserial") for file
information)

Also available here:
[http://makelinux.com/emb/grabserial](http://makelinux.com/emb/grabserial)

*Note: Due to MediaWiki stupidity, this file downloads with a leading
upper-case letter, and a txt extension. Please rename to lowercase on
download (e.g. "mv Grabserial.txt grabserial")*

To install, you must have the python-setuptools package installed (It
comes bundled with a lot of distribution) and then do:

     sudo python setup.py install

This will place 'grabserial' in your path and will also download and
install the dependencies of 'grabserial' (only pyserial for 1.5.1).

[File:Grabserial-1.0.0](http://eLinux.org/File:Grabserial-1.0.0 "File:Grabserial-1.0.0")

### pyserial (required python library)

Note: You should not have to do this by hand, you should uses the
setup.py script to install 'grabserial'

grabserial requires the python "serial" module. This module is not
shipped with most distributions of python by default. On some recent
distributions of Linux pyserial is available as a package. For example,
to install it on Fedora 12, do this (as root): 'yum -y install
pyserial'. The [BeagleBoard](../../../.././dev_portals/Boot_Time/Tims_Fastboot_Tools/Grabserial/BeagleBoard/BeagleBoard.md "BeagleBoard") with Angstrom
needs a 'opkg install python-pyserial'.

Here's a copy you can install if you don't have it. (You can check if
you already have it by typing: 'python', then "import serial" in the
interactive python interpreter.

[Media:pyserial-2.2.zip](http://eLinux.org/images/b/b6/Pyserial-2.2.zip "Pyserial-2.2.zip")

To install this, download the archive, unzip it, and following the
installation instructions in pyserial-2.2/README.txt.

The latest Pyserial can be obtained from:
[[1]](http://pypi.python.org/pypi/pyserial) The current version as of
November 2011 is 2.6, which is newer than what I've got here.

## Usage

The grabserial program is very simple, but it provides some useful extra
features that make it more than a mere 'cat' program.

Use 'grabserial -h' to see online usage for the program.

You can specify the serial configuration options, including the Linux
device node to use, and the port speed settings on the grabserial
command line. If no options are specified, grabserial uses serial port
/dev/ttyS0, at 115200 baud with "8, None and 1" (8N1) settings.

Normally, the program runs in an infinite loop, reading from the serial
port and writing to standard out until it is interrupted by the user
(usually by typing control-C). However, you can tell the program to stop
after a certain amount of time. This is useful for including the script
in automated test scenarios.

Also, you can tell the program to provide timing information for each
line received. This is useful to measure the time it takes for events to
happen on the target. A common thing to measure on a target running
embedded Linux is bootup time. With grabserial, you can specify a
pattern to match against the lines read from the serial port. When this
pattern is seen, it sets a "base time", and all subsequent time values
printed out will be relative to this base. Thus, you can customize the
start time for the time measurements, to make it easier to see the
duration of events in the system.

## Usage Examples

Here are some examples of use:

    grabserial

This will echo data seen on device /dev/ttyS0, until the user presses
ctrl-C.

    grabserial -v -d "/dev/ttyUSB0" -b 115200 -w 8 -p N -s 1 -e 30 -t -m "Starting kernel.*"

This opens /dev/ttyUSB0, at baud rate 115200, and 8-bit chars, No parity
and 1 stop bit. This will capture and display data for 30 seconds,
putting a timestamp on each line received, and restarting the timestamp
at 0 when a line containing "Kernel start" is seen. The '-v' makes
grabserial verbose (printing some extra messages before starting.

If you want to use grabserial with minicom on the same serial port
without conflict, for example to temporarily set a boot parameter or
specify a different kernel image without changing the parameters in
flash, you could follow this procedure:

-   Prepare the grabserial command in one window but don't hit enter.
-   Open minicom and set the bootloader environment, bootargs, etc. and
    tftp the kernel.
-   Use one bootloader command to delay a few seconds and boot. For
    u-boot this is done with something like: "sleep 5; bootm
    0x80000000".
-   Immediately exit minicom and run grabserial. After the delay
    expires, grabserial measures boot output.



## Sample Output

Here is sample output from grabserial. This shows the reboot of an
ARM-based system (OMAP Starter Kit). Note that the U-Boot prompt appears
at time 0.313168. The grabserial command specifies to restart the
timestamps when "Starting kernel.\*" is seen. This happens at time
8.376117 after grabserial save the first character on the serial port.
(Use the -l option to time from the start of grabserial.)

Note that the first kernel message appears 1.517790 seconds later.
Actually, the kernel starts well before this, but it takes this long
before the kernel to initialize the serial port and start emitting
messages. You will notice that a bunch of messages come out in rapid
succession. These are messages that were queued up during the boot,
before the serial console was initialized.

    [tbird@timdesk data]$ ../grabserial -v -d /dev/ttyUSB1 -e 30 -t -m "Starting kernel.*"
    Opening serial port /dev/ttyUSB1
    115200:8N1:xonxoff=0:rtcdtc=0
    Program will end in 30 seconds
    Printing timing information for each line
    Matching pattern 'Starting kernel.*' to set base time
    Use Control-C to stop...
    [0.000001 0.000001]
    [0.000433 0.000432]
    [0.001908 0.001475] Texas Instruments X-Loader 1.41 (Sep  1 2010 - 13:43:00)
    [0.295940 0.294032] mmc read: Invalid size
    [0.299905 0.003965] Starting OS Bootloader from MMC/SD1 ...
    [0.311140 0.011235]
    [0.313113 0.001973]
    [0.313168 0.000055] U-Boot 1.1.4-gcebe815a-dirty (Aug 16 2010 - 10:34:46)
    [0.317314 0.004146]
    [0.317353 0.000039] Load address: 0x80e80000
    [0.319459 0.002106] DRAM:  512 MB
    [0.321147 0.001688] Flash:  0 kB
    [0.360937 0.039790] *** Warning - bad CRC, using default environment
    [0.366966 0.006029]
    [0.387197 0.020231] In:    serial
    [0.389297 0.002100] Out:   serial
    [0.389563 0.000266] Err:   serial
    [0.765933 0.376370] Net:   KS8851SNL
    [0.770903 0.004970] Hit any key to stop autoboot:  0
    [0.773266 0.002363] PANDA #
    [0.775024 0.001758] PANDA #
    [1.323977 0.548953] PANDA #
    [2.326983 1.003006] PANDA # setenv bootargs 'console=ttyO2,115200n8 mem=463M root=/dev/mmcblk0p3 rw rootwait init=/linuxrc'
    [3.340146 1.013163] PANDA # mmcinit 0;fatload mmc 0 0x80000000 uimage.new; bootm 80000000
    [6.950910 3.610764] mmc read: Invalid size
    [6.953938 0.003028]
    [6.953986 0.000048] 2733352 bytes read
    [6.955974 0.001988] ## Booting image at 80000000 ...
    [6.958304 0.002330]    Image Name:   Linux-2.6.35-g6d019da-dirty
    [6.962329 0.004025]    Image Type:   ARM Linux Kernel Image (uncompressed)
    [6.968092 0.005763]    Data Size:    2733288 Bytes =  2.6 MB
    [6.972061 0.003969]    Load Address: 80008000
    [6.974130 0.002069]    Entry Point:  80008000
    [6.976195 0.002065]    Verifying Checksum ... OK
    [8.374915 1.398720] OK
    [8.376069 0.001154]
    [8.376117 0.000048] Starting kernel ...
    [0.001022 0.001022]
    [0.003100 0.002078] Uncompressing Linux... done, booting the kernel.
    [1.517790 1.514690] Linux version 2.6.35-g6d019da-dirty (danders@ccd-dev) (gcc version 4.3.3 (GCC) ) #11 SMP PREEMPT Wed Sep 1 16:11:03 CDT 2010
    [1.529238 0.011448] CPU: ARMv7 Processor [411fc092] revision 2 (ARMv7), cr=10c53c7f
    [1.535071 0.005833] CPU: VIPT nonaliasing data cache, VIPT nonaliasing instruction cache
    [1.541228 0.006157] Machine: OMAP4430 Panda Board
    [1.544865 0.003637] Memory policy: ECC disabled, Data cache writealloc
    [1.549032 0.004167] OMAP4430 ES2.0
    [1.550879 0.001847] SRAM: Mapped pa 0x40300000 to va 0xfe400000 size: 0x100000
    [1.555136 0.004257] FIXME: omap44xx_sram_init not implemented
    [1.559230 0.004094] Reserving 33554432 bytes SDRAM for VRAM
    [1.563250 0.004020] PERCPU: Embedded 6 pages/cpu @c296a000 s4000 r8192 d12384 u65536
    [1.569195 0.005945] pcpu-alloc: s4000 r8192 d12384 u65536 alloc=16*4096
    [1.574161 0.004966] pcpu-alloc: [0] 0 [0] 1
    [1.576292 0.002131] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 117602
    [1.584048 0.007756] Kernel command line: console=ttyO2,115200n8 mem=463M root=/dev/mmcblk0p3 rw rootwait init=/linuxrc
    [1.592129 0.008081] PID hash table entries: 2048 (order: 1, 8192 bytes)
    [1.597900 0.005771] Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
    [1.603869 0.005969] Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
    [1.608822 0.004953] Memory: 463MB = 463MB total
    [1.611170 0.002348] Memory: 431292k/431292k available, 42820k reserved, 0K highmem
    [1.617212 0.006042] Virtual kernel memory layout:
    [1.620982 0.003770]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    [1.624982 0.004000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    [1.629106 0.004124]     DMA     : 0xffc00000 - 0xffe00000   (   2 MB)
    [1.634850 0.005744]     vmalloc : 0xdd000000 - 0xf8000000   ( 432 MB)
    [1.639111 0.004261]     lowmem  : 0xc0000000 - 0xdcf00000   ( 463 MB)
    [1.643197 0.004086]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
    [1.647311 0.004114]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
    [1.652916 0.005605]       .init : 0xc0008000 - 0xc0033000   ( 172 kB)
    [1.657042 0.004126]       .text : 0xc0033000 - 0xc052e000   (5100 kB)
    [1.661156 0.004114]       .data : 0xc052e000 - 0xc05934a0   ( 406 kB)
    [1.666921 0.005765] SLUB: Genslabs=11, HWalign=32, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
    [1.673146 0.006225] Hierarchical RCU implementation.
    [1.676926 0.003780]     RCU-based detection of stalled CPUs is disabled.
    [1.680951 0.004025]     Verbose stalled-CPUs detection is disabled.
    [1.684982 0.004031] NR_IRQS:388
    [1.686807 0.001825] omap_hwmod: sys_32k_ck: missing clockdomain for sys_32k_ck.
    [1.691105 0.004298] omap_hwmod: l3_div_ck: missing clockdomain for l3_div_ck.
    [1.697134 0.006029] omap_hwmod: dpll_mpu_m2_ck: missing clockdomain for dpll_mpu_m2_ck.
    [1.703230 0.006096] omap_hwmod: gpio2: failed to reset in 10000 usec
    [1.707250 0.004020] omap_hwmod: gpio3: failed to reset in 10000 usec
    [1.712968 0.005718] omap_hwmod: gpio4: failed to reset in 10000 usec
    [1.716947 0.003979] omap_hwmod: gpio5: failed to reset in 10000 usec
    [1.721054 0.004107] omap_hwmod: gpio6: failed to reset in 10000 usec
    [1.725351 0.004297] omap_hwmod: gpu: cannot be enabled (3)
    [1.729211 0.003860] omap_hwmod: i2c1: failed to reset in 10000 usec
    [1.733284 0.004073] omap_hwmod: i2c2: failed to reset in 10000 usec
    [1.738977 0.005693] omap_hwmod: i2c3: failed to reset in 10000 usec
    [1.743060 0.004083] omap_hwmod: i2c4: failed to reset in 10000 usec
    [1.747027 0.003967] omap_hwmod: iva: cannot be enabled (3)
    [1.750949 0.003922] omap_hwmod: omap-mcpdm-dai: cannot be enabled (3)
    [1.755226 0.004277] GPMC revision 6.0
    [1.757173 0.001947]  dmtimer.0: omap_dm_timer_probe:[id=0]
    [1.761072 0.003899]  dmtimer.0:  registered
    [1.763095 0.002023]  dmtimer.1: omap_dm_timer_probe:[id=1]
    [1.767046 0.003951]  dmtimer.1:  registered
    [1.769091 0.002045]  dmtimer.9: omap_dm_timer_probe:[id=9]
    [1.772898 0.003807]  dmtimer.9:  registered
    [1.774946 0.002048] OMAP clockevent source: GPTIMER1 at 32768 Hz
    [1.778961 0.004015] Console: colour dummy device 80x30
    [1.782804 0.003843] Calibrating delay loop... 2013.49 BogoMIPS (lpj=7864320)
    [1.787305 0.004501] pid_max: default: 32768 minimum: 301
    [1.791105 0.003800] Mount-cache hash table entries: 512
    [1.794971 0.003866] CPU: Testing write buffer coherency: ok
    [1.797277 0.002306] Calibrating local timer... 491.16MHz.
    [1.801125 0.003848] L310 cache controller enabled
    [1.804846 0.003721] l2x0: 16 ways, CACHE_ID 0x410000c4, AUX_CTRL 0x0e070000
    [1.809071 0.004225] CPU1: Booted secondary processor
    [1.812884 0.003813] Brought up 2 CPUs
    [1.814805 0.001921] SMP: Total of 2 processors activated (3976.57 BogoMIPS).
    [1.819213 0.004408] devtmpfs: initialized
    [1.821226 0.002013] regulator: core version 0.5
    [1.824931 0.003705] NET: Registered protocol family 16
    [1.827200 0.002269] OMAP GPIO hardware version 0.1
    [1.830892 0.003692] PandaBoard Revision: 003
    [1.832919 0.002027] OMAP DMA hardware revision 0.0
    [1.835089 0.002170] dma dma.0: System DMA registered
    [1.838913 0.003824] bio: create slab <bio-0> at 0
    [1.841073 0.002160] SCSI subsystem initialized
    [1.843169 0.002096] usbcore: registered new interface driver usbfs
    [1.849011 0.005842] usbcore: registered new interface driver hub
    [1.853012 0.004001] usbcore: registered new device driver usb
    [1.856985 0.003973] i2c_omap i2c_omap.1: bus 1 rev4.0 at 400 kHz
    [1.860942 0.003957] Skipping twl internal clock init and using bootloader value (unknown osc rate)
    [1.867124 0.006182] twl6030: PIH (irq 39) chaining IRQs 368..387
    [1.871157 0.004033] regulator: VMMC: 1200 <--> 3000 mV at 3000 mV normal standby
    [1.877312 0.006155] regulator: VPP: 1800 <--> 2500 mV at 1900 mV normal standby
    [1.883126 0.005814] regulator: VANA: 2100 mV normal standby
    [1.887062 0.003936] regulator: VCXIO: 1800 mV normal standby
    [1.890945 0.003883] regulator: VDAC: 1800 mV normal standby
    [1.894850 0.003905] regulator: VUSB: 3300 mV normal standby
    [1.897169 0.002319] regulator: VAUX2_6030: 1200 <--> 2800 mV at 1800 mV normal standby
    [1.903185 0.006016] regulator: VAUX3_6030: 1000 <--> 3000 mV at 1200 mV normal standby
    [1.910987 0.007802] Advanced Linux Sound Architecture Driver Version 1.0.23.
    [1.915210 0.004223] Bluetooth: Core ver 2.15
    [1.917299 0.002089] NET: Registered protocol family 31
    [1.921054 0.003755] Bluetooth: HCI device and connection manager initialized
    [1.926864 0.005810] Bluetooth: HCI socket layer initialized
    [1.929190 0.002326] cfg80211: Calling CRDA to update world regulatory domain
    [1.935198 0.006008] Switching to clocksource timer-32k
    [1.938041 0.002843] NET: Registered protocol family 2
    [1.942055 0.004014] IP route cache hash table entries: 4096 (order: 2, 16384 bytes)
    [1.948004 0.005949] TCP established hash table entries: 16384 (order: 5, 131072 bytes)
    [1.953923 0.005919] TCP bind hash table entries: 16384 (order: 5, 196608 bytes)
    [1.959822 0.005899] TCP: Hash tables configured (established 16384 bind 16384)
    [1.964092 0.004270] TCP reno registered
    [1.966320 0.002228] UDP hash table entries: 256 (order: 1, 8192 bytes)
    [1.971986 0.005666] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
    [1.976153 0.004167] NET: Registered protocol family 1
    [1.980003 0.003850] RPC: Registered udp transport module.
    [1.982875 0.002872] RPC: Registered tcp transport module.
    [1.986036 0.003161] RPC: Registered tcp NFSv4.1 backchannel transport module.
    [1.991977 0.005941] omap-iommu omap-iommu.0: ducati registered
    [1.996071 0.004094] omap-iommu omap-iommu.1: tesla registered
    [2.000135 0.004064] iovmm-omap initialized ducati, major: 251, base-minor: 0
    [2.004342 0.004207] iovmm-omap initialized tesla, major: 251, base-minor: 1
    [2.010074 0.005732] dmtimer dmtimer.0: omap_dm_timer_probe:[id=0]
    [2.014059 0.003985] dmtimer dmtimer.1: omap_dm_timer_probe:[id=1]
    [2.018104 0.004045] dmtimer dmtimer.9: omap_dm_timer_probe:[id=9]
    [2.022233 0.004129] dmtimer dmtimer.2: omap_dm_timer_probe:[id=2]
    [2.028005 0.005772] dmtimer dmtimer.2:  registered
    [2.030183 0.002178] dmtimer dmtimer.3: omap_dm_timer_probe:[id=3]
    [2.034195 0.004012] dmtimer dmtimer.3:  registered
    [2.037994 0.003799] dmtimer dmtimer.4: omap_dm_timer_probe:[id=4]
    [2.041866 0.003872] dmtimer dmtimer.4:  registered
    [2.044870 0.003004] dmtimer dmtimer.5: omap_dm_timer_probe:[id=5]
    [2.048924 0.004054] dmtimer dmtimer.5:  registered
    [2.051100 0.002176] dmtimer dmtimer.6: omap_dm_timer_probe:[id=6]
    [2.055447 0.004347] dmtimer dmtimer.6:  registered
    [2.059001 0.003554] dmtimer dmtimer.7: omap_dm_timer_probe:[id=7]
    [2.063112 0.004111] dmtimer dmtimer.7:  registered
    [2.065279 0.002167] dmtimer dmtimer.8: omap_dm_timer_probe:[id=8]
    [2.070931 0.005652] dmtimer dmtimer.8:  registered
    [2.072994 0.002063] dmtimer dmtimer.10: omap_dm_timer_probe:[id=10]
    [2.077065 0.004071] dmtimer dmtimer.10:  registered
    [2.080876 0.003811] omap-remoteproc omap-remoteproc.0: omap_rproc_probe: adding rproc tesla
    [2.086939 0.006063] omap-remoteproc omap-remoteproc.0: omap-rproc initialized tesla, major: 250, base-minor: 0
    [2.095179 0.008240] omap-remoteproc omap-remoteproc.1: omap_rproc_probe: adding rproc ducati-proc0
    [2.102905 0.007726] omap-remoteproc omap-remoteproc.1: omap-rproc initialized ducati-proc0, major: 250, base-minor: 1
    [2.111086 0.008181] omap-remoteproc omap-remoteproc.2: omap_rproc_probe: adding rproc ducati-proc1
    [2.117950 0.006864] omap-remoteproc omap-remoteproc.2: omap-rproc initialized ducati-proc1, major: 250, base-minor: 2
    [2.128058 0.010108] VFS: Disk quotas dquot_6.5.2
    [2.130214 0.002156] Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
    [2.135960 0.005746] msgmni has been set to 842
    [2.138067 0.002107] alg: No test for stdrng (krng)
    [2.141860 0.003793] io scheduler noop registered
    [2.143952 0.002092] io scheduler deadline registered
    [2.146805 0.002853] io scheduler cfq registered (default)
    [2.151045 0.004240] OMAP DSS rev 4.0
    [2.152977 0.001932] OMAP DISPC rev 4.0
    [2.153343 0.000366] OMAP DSI rev 3.0
    [2.155239 0.001896] OMAP DSI2 rev 3.0
    [2.157197 0.001958] OMAP HDMI W1 rev 2.0
    [2.159062 0.001865] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
    [2.164886 0.005824] omap-hsuart.0: ttyO0 at MMIO 0x4806a000 (irq = 104) is a OMAP UART0
    [2.170947 0.006061] omap-hsuart.1: ttyO1 at MMIO 0x4806c000 (irq = 105) is a OMAP UART1
    [2.177141 0.006194] omap-hsuart.2: ttyO2 at MMIO 0x48020000 (irq = 106) is a OMAP UART2
    [2.183171 0.006030] console [ttyO2] enabled
    [2.185213 0.002042] omap-hsuart.3: ttyO3 at MMIO 0x4806e000 (irq = 102) is a OMAP UART3
    [2.196774 0.011561] brd: module loaded
    [2.201754 0.004980] loop: module loaded
    [2.205050 0.003296] usbcore: registered new interface driver smsc95xx
    [2.211208 0.006158] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
    [2.217036 0.005828] ehci-omap ehci-omap.0: OMAP-EHCI Host Controller
    [2.221129 0.004093] ehci-omap ehci-omap.0: new USB bus registered, assigned bus number 1
    [2.228834 0.007705] ehci-omap ehci-omap.0: irq 109, io mem 0x4a064c00
    [2.246780 0.017946] ehci-omap ehci-omap.0: USB 2.0 started, EHCI 1.00
    [2.251165 0.004385] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
    [2.257125 0.005960] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
    [2.263919 0.006794] usb usb1: Product: OMAP-EHCI Host Controller
    [2.268147 0.004228] usb usb1: Manufacturer: Linux 2.6.35-g6d019da-dirty ehci_hcd
    [2.274060 0.005913] usb usb1: SerialNumber: ehci-omap.0
    [2.277929 0.003869] hub 1-0:1.0: USB hub found
    [2.280029 0.002100] hub 1-0:1.0: 3 ports detected
    [2.309778 0.029749] Initializing USB Mass Storage driver...
    [2.313926 0.004148] usbcore: registered new interface driver usb-storage
    [2.318131 0.004205] USB Mass Storage support registered.
    [2.322791 0.004660] twl_rtc twl_rtc: rtc core: registered twl_rtc as rtc0
    [2.328147 0.005356] twl_rtc twl_rtc: Power up reset detected.
    [2.333926 0.005779] twl_rtc twl_rtc: Enabling TWL-RTC.
    [2.338102 0.004176] i2c /dev entries driver
    [2.341150 0.003048] IR NEC protocol handler initialized
    [2.345096 0.003946] IR RC5(x) protocol handler initialized
    [2.348352 0.003256] IR RC6 protocol handler initialized
    [2.352747 0.004395] IR JVC protocol handler initialized
    [2.355195 0.002448] IR Sony protocol handler initialized
    [2.359110 0.003915] Linux video capture interface: v2.00
    [2.366096 0.006986] OMAP Watchdog Timer Rev 0x00: initial timeout 60 sec
    [2.377771 0.011675] usbcore: registered new interface driver usbhid
    [2.383017 0.005246] usbhid: USB HID core driver
    [2.386925 0.003908] proc4430_drv_initializeModule
    [2.390925 0.004000] omap-devicehandler omap-devicehandler.0: omap_devh_probe: adding devh Tesla
    [2.396959 0.006034] omap-devh initialized Tesla, major: 243, base-minor: 0
    [2.403102 0.006143] omap-devicehandler omap-devicehandler.1: omap_devh_probe: adding devh SysM3
    [2.410138 0.007036] omap-devh initialized SysM3, major: 243, base-minor: 1
    [2.415290 0.005152] omap-devicehandler omap-devicehandler.2: omap_devh_probe: adding devh AppM3
    [2.422176 0.006886] omap-devh initialized AppM3, major: 243, base-minor: 2
    [2.427875 0.005699] SDP4430 SoC init
    [2.431763 0.003888] asoc: null-codec-dai <-> MultiMedia1 mapping ok
    [2.437765 0.006002] asoc: null-codec-dai <-> MultiMedia2 mapping ok
    [2.443850 0.006085] asoc: null-codec-dai <-> Voice mapping ok
    [2.447946 0.004096] asoc: null-codec-dai <-> Tones mapping ok
    [2.452052 0.004106] asoc: null-codec-dai <-> Vibra mapping ok
    [2.460767 0.008715] asoc: null-codec-dai <-> MODEM mapping ok
    [2.465014 0.004247] asoc: HDMI <-> hdmi-dai mapping ok
    [2.469123 0.004109] asoc: FM Digital <-> omap-mcbsp-dai.1 mapping ok
    [2.504818 0.035695] asoc: twl6040-dl1 <-> omap-mcpdm-dai mapping ok
    [2.509218 0.004400] asoc: twl6040-dl1 <-> omap-mcpdm-dai mapping ok
    [2.514846 0.005628] asoc: twl6040-ul <-> omap-mcpdm-dai mapping ok
    [2.518954 0.004108] asoc: twl6040-dl2 <-> omap-mcpdm-dai mapping ok
    [2.523078 0.004124] asoc: twl6040-vib <-> omap-mcpdm-dai mapping ok
    [2.528824 0.005746] asoc: Bluetooth <-> omap-mcbsp-dai.0 mapping ok
    [2.533047 0.004223] asoc: FM Digital <-> omap-mcbsp-dai.1 mapping ok
    [2.537257 0.004210] asoc: MODEM <-> omap-mcbsp-dai.1 mapping ok
    [2.542099 0.004842] asoc: dmic-hifi <-> omap-dmic-dai.0 mapping ok
    [2.546060 0.003961] asoc: dmic-hifi <-> omap-dmic-dai.1 mapping ok
    [2.551806 0.005746] asoc: dmic-hifi <-> omap-dmic-dai.2 mapping ok
    [2.557061 0.005255] input: SDP4430 Headset Jack as /devices/platform/soc-audio/sound/card0/input0
    [2.567831 0.010770] ALSA device list:
    [2.570085 0.002254]   #0: SDP4430
    [2.571874 0.001789] TCP cubic registered
    [2.573953 0.002079] NET: Registered protocol family 17
    [2.577831 0.003878] Bluetooth: L2CAP ver 2.14
    [2.579980 0.002149] Bluetooth: L2CAP socket layer initialized
    [2.583952 0.003972] Bluetooth: SCO (Voice Link) ver 0.6
    [2.587884 0.003932] Bluetooth: SCO socket layer initialized
    [2.591170 0.003286] Bluetooth: RFCOMM TTY layer initialized
    [2.595260 0.004090] Bluetooth: RFCOMM socket layer initialized
    [2.598275 0.003015] mmc0: host does not support reading read-only switch. assuming write-enable.
    [2.604942 0.006667] mmc0: new high speed SDHC card at address 17ba
    [2.610055 0.005113] mmcblk0: mmc0:17ba SD08G 7.42 GiB
    [2.613895 0.003840] Bluetooth: RFCOMM ver 1.11
    [2.615998 0.002103] lib80211: common routines for IEEE802.11 drivers
    [2.620991 0.004993] ThumbEE CPU extension supported.
    [2.623271 0.002280] omap_hwmod: Initialize debugfs support
    [2.626962 0.003691] usb 1-1: new high speed USB device using ehci-omap and address 2
    [2.634784 0.007822] VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 1
    [2.641847 0.007063]  mmcblk0: p1 p2 p3
    [2.692755 0.050908] mmc1: card claims to support voltages below the defined range. These will be ignored.
    [2.731764 0.039009] mmc1: queuing unknown CIS tuple 0x91 (3 bytes)
    [2.737916 0.006152] mmc1: new SDIO card at address 0001
    [2.795848 0.057932] wl1271: loaded
    [2.798015 0.002167] wl1271: initialized
    [2.799997 0.001982] Console: switching to colour frame buffer device 240x67
    [2.804965 0.004968] usb 1-1: New USB device found, idVendor=0424, idProduct=9514
    [2.811900 0.006935] usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
    [2.816913 0.005013] hub 1-1:1.0: USB hub found
    [2.820084 0.003171] hub 1-1:1.0: 5 ports detected
    [2.980800 0.160716] regulator_init_complete: incomplete constraints, leaving VAUX3_6030 on
    [2.988861 0.008061] regulator_init_complete: incomplete constraints, leaving VAUX2_6030 on
    [2.995827 0.006966] regulator_init_complete: incomplete constraints, leaving VUSB on
    [3.003093 0.007266] regulator_init_complete: incomplete constraints, leaving VDAC on
    [3.008788 0.005695] regulator_init_complete: incomplete constraints, leaving VCXIO on
    [3.015795 0.007007] regulator_init_complete: incomplete constraints, leaving VANA on
    [3.022089 0.006294] regulator_init_complete: incomplete constraints, leaving VPP on
    [3.030738 0.008649] twl_rtc twl_rtc: setting system clock to 2000-01-01 00:00:00 UTC (946684800)
    [3.039092 0.008354] omap_vout omap_vout: : registered and initialized video device 0
    [3.045180 0.006088] omap_vout omap_vout: : registered and initialized video device 1
    [3.051171 0.005991] omap_vout omap_vout: : registered and initialized video device 2
    [3.058083 0.006912] omap_wb: registered and initialized wb device 3 [v4l2]
    [3.066092 0.008009] EXT3-fs: barriers not enabled
    [3.256748 0.190656] usb 1-1.1: new high speed USB device using ehci-omap and address 3
    [3.440734 0.183986] usb 1-1.1: New USB device found, idVendor=0424, idProduct=ec00
    [3.448035 0.007301] usb 1-1.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
    [3.455796 0.007761] smsc95xx v1.0.4
    [4.692750 1.236954] smsc95xx 1-1.1:1.0: usb0: register 'smsc95xx' at usb-ehci-omap.0-1.1, smsc95xx USB 2.0 Ethernet, de:8e:e8:81:1a:5d
    [4.792736 0.099986] usb 1-1.2: new low speed USB device using ehci-omap and address 4
    [5.069802 0.277066] usb 1-1.2: New USB device found, idVendor=413c, idProduct=3200
    [5.075842 0.006040] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
    [5.082189 0.006347] usb 1-1.2: Product: Dell USB Mouse
    [5.085237 0.003048] usb 1-1.2: Manufacturer: Dell
    [5.101795 0.016558] input: Dell Dell USB Mouse as /devices/platform/ehci-omap.0/usb1/1-1/1-1.2/1-1.2:1.0/input/input1
    [5.111899 0.010104] generic-usb 0003:413C:3200.0001: input: USB HID v1.10 Mouse [Dell Dell USB Mouse] on usb-ehci-omap.0-1.2/input0
    [5.214793 0.102894] usb 1-1.3: new low speed USB device using ehci-omap and address 5
    [5.441812 0.227019] usb 1-1.3: New USB device found, idVendor=413c, idProduct=2005
    [5.449885 0.008073] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
    [5.454981 0.005096] usb 1-1.3: Product: DELL USB Keyboard
    [5.458793 0.003812] usb 1-1.3: Manufacturer: DELL
    [5.466777 0.007984] input: DELL DELL USB Keyboard as /devices/platform/ehci-omap.0/usb1/1-1/1-1.3/1-1.3:1.0/input/input2
    [5.477803 0.011026] generic-usb 0003:413C:2005.0002: input: USB HID v1.10 Keyboard [DELL DELL USB Keyboard] on usb-ehci-omap.0-1.3/input0
    [5.781789 0.303986] kjournald starting.  Commit interval 5 seconds
    [5.785959 0.004170] EXT3-fs (mmcblk0p3): warning: maximal mount count reached, running e2fsck is recommended
    [6.035796 0.249837] EXT3-fs (mmcblk0p3): using internal journal
    [6.039926 0.004130] EXT3-fs (mmcblk0p3): recovery complete
    [6.044852 0.004926] EXT3-fs (mmcblk0p3): mounted filesystem with writeback data mode
    [6.051857 0.007005] VFS: Mounted root (ext3 filesystem) on device 179:3.
    [6.058062 0.006205] devtmpfs: mounted
    [6.060273 0.002211] Freeing init memory: 172K
    [6.166780 0.106507] init started: BusyBox v1.13.2 (2010-04-06 10:34:20 CDT)
    [7.684801 1.518021] startudev!!!
    [7.695780 0.010979] Starting udev
    [7.698020 0.002240] mounting tempfs
    [7.718777 0.020757] invalidate udev cache!
    [8.204795 0.486018] make extra nodes!
    [8.207095 0.002300] trigger the sorted events!
    [8.208989 0.001894] udevd called!
    [8.278782 0.069793] udevadmin started!
    [8.289778 0.010996] trigger
    [8.698803 0.409025] settle!
    [10.055795 1.356992] EXT3-fs: barriers not enabled
    [10.059797 0.004002] EXT3-fs (mmcblk0p2): warning: maximal mount count reached, running e2fsck is recommended
    [10.069092 0.009295] kjournald starting.  Commit interval 5 seconds
    [10.309834 0.240742] EXT3-fs (mmcblk0p2): using internal journal
    [10.314926 0.005092] EXT3-fs (mmcblk0p2): recovery complete
    [10.318906 0.003980] EXT3-fs (mmcblk0p2): mounted filesystem with writeback data mode
    [13.875808 3.556902] udev startup complete!
    [15.623906 1.748098] starting pid 1452, tty '/dev/ttyO2': '/bin/sh'
    [15.628851 0.004945] / #
    [tbird@timdesk data]$

## Usage Notes

### Timing of kernel printk messages

Note that the kernel printk messages are normally sent to the console at
the time that the printk() function is called in the kernel. So the
timings for printk messages are pretty good at indicating the time where
a particular activity occured. However, during early boot (and
specifically, before the serial console is initialized) the kernel
message are stored in the log buffer. By default, all of the messages
between kernel start and console initialization are dumped to the serial
port at the time of console initialization, which gives these events an
incorrect time.

You can help correct this somewhat using the early printk option with
the kernel. On ARM, you need to configure the kernel for low-level
debugging to enable this feature. To do this, set the following in your
kernel configuration:

-   CONFIG\_DEBUG\_LL=Y
-   CONFIG\_EARLY\_PRINTK=Y

Compile and install your kernel.

Now, kernel printk messages should be emitted to the serial port, during
early boot, much sooner and closer to their actual creation, than
without these options.

### Finding the time to decompress the kernel

On the ARM architecture, during kernel decompression the decompressor
code writes information to the same line of output for the start and end
of the operation. Since grabserial uses line terminations as part of
time measurements, grabserial without any special options would not be
able to measure this operation.

The line starts with "Uncompressing Linux...". When the decompression is
complete, the code writes on the same line: "done, booting the kernel".

You can use the grabserial "-i" option to measure the time a particular
string appears on the port, whether or not the string is at the
beginning of the line. By using both the base time pattern matching, and
the "instant time" (-i) pattern matching, you can determine the time for
the decompression operation.

In the example below, grabserial watches for the string "Uncompressing
Linux" (using the -m option). When it sees this, it resets the time to
0. When it sees the string "done," (using the -i option), it records the
time and prints that at the end of the run. In this example, the kernel
decompression took about 0.421 seconds (or 421 milliseconds).

The results of this example follow:

    $ ../grabserial -v -d /dev/ttyUSB1 -e 30 -t -m "Uncompressing Linux" -i "done,"
    Opening serial port /dev/ttyUSB1
    115200:8N1:xonxoff=0:rtcdtc=0
    Program will end in 30 seconds
    Printing timing information for each line
    Matching pattern 'Uncompressing Linux' to set base time
    Instant pattern 'done,' to set base time
    Use Control-C to stop...
    [0.000001 0.000001]
    [0.000490 0.000489]
    [0.000539 0.000049] Texas Instruments X-Loader 1.41 (Sep  1 2010 - 13:43:00)
    [0.296009 0.295470] mmc read: Invalid size
    [0.298986 0.002977] Starting OS Bootloader from MMC/SD1 ...
    [0.312080 0.013094]
    [0.312176 0.000096]
    [0.312219 0.000043] U-Boot 1.1.4-gcebe815a-dirty (Aug 16 2010 - 10:34:46)
    [0.317143 0.004924]
    [0.317189 0.000046] Load address: 0x80e80000
    [0.319251 0.002062] DRAM:  512 MB
    [0.320312 0.001061] Flash:  0 kB
    [0.360946 0.040634] *** Warning - bad CRC, using default environment
    [0.366068 0.005122]
    [0.385933 0.019865] In:    serial
    [0.388700 0.002767] Out:   serial
    [0.390314 0.001614] Err:   serial
    [0.764960 0.374646] Net:   KS8851SNL
    [0.769953 0.004993] Hit any key to stop autoboot:  0
    [0.773507 0.003554] PANDA #
    [0.774202 0.000695] PANDA #
    [1.317316 0.543114] PANDA #
    [2.320424 1.003108] PANDA # setenv bootargs 'console=ttyO2,115200n8 mem=463M root=/dev/mmcblk0p3 rw rootwait init=/linuxrc'
    [3.333767 1.013343] PANDA # mmcinit 0;fatload mmc 0 0x80000000 uimage.new; bootm 80000000
    [6.942999 3.609232] mmc read: Invalid size
    [6.945956 0.002957]
    [6.946009 0.000053] 2733352 bytes read
    [6.948932 0.002923] ## Booting image at 80000000 ...
    [6.951980 0.003048]    Image Name:   Linux-2.6.35-g6d019da-dirty
    [6.955984 0.004004]    Image Type:   ARM Linux Kernel Image (uncompressed)
    [6.960935 0.004951]    Data Size:    2733288 Bytes =  2.6 MB
    [6.964110 0.003175]    Load Address: 80008000
    [6.966931 0.002821]    Entry Point:  80008000
    [6.969036 0.002105]    Verifying Checksum ... OK
    [8.366958 1.397922] OK
    [8.368996 0.002038]
    [8.369044 0.000048] Starting kernel ...
    [8.370096 0.001052]
    [8.370934 0.000838] Uncompressing Linux... done, booting the kernel.
    [1.518068 1.518068] Linux version 2.6.35-g6d019da-dirty (danders@ccd-dev) (gcc version 4.3.3 (GCC) ) #11 SMP PREEMPT Wed Sep 1 16:11:03 CDT 2010
    ...
    [6.064032 0.003247] Freeing init memory: 172K
    [6.170598 0.106566] init started: BusyBox v1.13.2 (2010-04-06 10:34:20 CDT)

    The instantpat: "done,", was matched at 0.421018


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")
-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")

