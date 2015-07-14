> From: [eLinux.org](http://eLinux.org/VGF-CP1 "http://eLinux.org/VGF-CP1")


# VGF-CP1



## Contents

-   [1 Sony VAIO Canvas Online - Digital Picture
    Frame](#sony-vaio-canvas-online-digital-picture-frame)
-   [2 Firmware](#firmware)
-   [3 Bootlog](#bootlog)
-   [4 Remote Access](#remote-access)
-   [5 Hardware Disassembly](#hardware-disassembly)
    -   [5.1 **MX31 UART1 CN853 Pinout**](#mx31-uart1-cn853-pinout)
-   [6 External Links](#external-links)

## Sony VAIO Canvas Online - Digital Picture Frame

[http://bb.watch.impress.co.jp/cda/static/image/2008/05/07/cp101s.jpg](http://bb.watch.impress.co.jp/cda/static/image/2008/05/07/cp101s.jpg)

specification in brief:

-   Display Size: 7″
-   Pixel Format: 800 x 480
-   Internal Memory: 100MB (80MB for pic­tures, 15MB for audio)
-   External Storage: CF, MS, SD
-   Image Support: JPEG, BMP, PNG, GIF
-   Audio Support: MP3, WAV
-   CPU: 400Mhz ARM11 (i.MX31)
-   OS: Timesys Linux 2.6.19
-   Wireless: 802.11b/g
-   Availability: May 17, 2008

## Firmware

Though the CP1 was available in the US and UK, there seems to be no
english firmware for download available. Two japanese firmware images
are available. You can flash them by just placing the .IMG file in a
sub-folder called 'Update'.

    VGF-CP1 japanese firmware Ver.2.00.00.09032516: http://vcl.vaio.sony.co.jp/download/EP0000177017.html
    .IMG File: http://dlv.update.sony.net/pub/vaio/download/EP0000177017/EP0000177017.img

    VGF-CP1 japanese firmware Ver.1.01.00.08082520: http://vcl.vaio.sony.co.jp/download/EP0000162984.html
    .IMG File: http://dlv.update.sony.net/pub/vaio/download/EP0000162984/EP0000162984.img

## Bootlog

Captured with serial interface (115200,8,n,1) on MX31 UART1.

``



     Linux 2.6 Freescale MXC processor


     Choose an option from below:

     1. Load kernel to RAM and then boot from [0x80008000]
     2. Change the Linux kernel destination loading address [0x80008000]
     3. Enter command line option for kernel
     4. Change command line option address [0x80000100]

       Please enter selection ->   Timeout occured



     -->Booting from RAM...
     RAM size is 128MB

     Copying pages....

     -->Goint Start

     Copying pages....

     -->Goint Start
     -->Starting kernel...
     Uncompressing Linux............................................................................................................. done, booting the kernel.
     Linux version 2.6.19.2 (akatsuka@akatsuka2.sm.sony.co.jp) () #1 PREEMPT Fri Apr 25 10:29:51 JST 2008
     CPU: Some Random V6 Processor [4107b364] revision 4 (ARMv6TEJ), cr=00e5387f
     Machine: Sony IDAM
     Memory policy: ECC disabled, Data cache writeback
     CPU0: D VIPT write-back cache
     CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
     CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets
     Built 1 zonelists.  Total pages: 32128
     Kernel command line: initrd=0x83000000,8M root=/dev/ram0 rw console=ttymxc0,115200 ip=on
     MXC IRQ initialized
     PID hash table entries: 512 (order: 9, 2048 bytes)
     Actual CLOCK_TICK_RATE is 16625000 Hz
     Console: colour dummy device 80x30
     Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
     Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
     Memory: 64MB 64MB = 128MB total
     Memory: 118072KB available (2416K code, 601K data, 472K init)
     Mount-cache hash table entries: 512
     CPU: Testing write buffer coherency: ok
     checking if image is initramfs...it isn't (no cpio magic); looks like an initrd
     Freeing initrd memory: 8192K
     NET: Registered protocol family 16
     MXC GPIO hardware
     system_rev is: 0x20
     Clock input source is 26000000
     Machine Type: iDAM
     L2 cache: WB
     Using SDMA I.API
     MXC DMA API initialized
     usb: Host 2 registered
     SCSI subsystem initialized
     CSPI: mxc_spi-0 probed
     CSPI: mxc_spi-1 probed
     usbcore: registered new interface driver usbfs
     usbcore: registered new interface driver hub
     usbcore: registered new device driver usb
     MXC I2C driver
     NET: Registered protocol family 23
     NET: Registered protocol family 2
     IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
     TCP established hash table entries: 4096 (order: 2, 16384 bytes)
     TCP bind hash table entries: 2048 (order: 1, 8192 bytes)
     TCP: Hash tables configured (established 4096 bind 2048)
     TCP reno registered
     Low-Level PM Driver module loaded
     JFFS2 version 2.2. (NAND) (SUMMARY)  (C) 2001-2006 Red Hat, Inc.
     io scheduler noop registered
     io scheduler anticipatory registered
     io scheduler deadline registered
     io scheduler cfq registered (default)
     Console: switching to colour frame buffer device 100x30
     mxcfb: fb registered, using mode SAMSUNG-WVGA-32
     MXC WatchDog Driver 2.0
     MXC Watchdog Timer: initial timeout 60 sec
     Serial: MXC Internal UART driver
     mxcintuart.0: ttymxc0 at MMIO 0x43f90000 (irq = 45) is a Freescale MXC
     mxcintuart.2: ttymxc2 at MMIO 0x5000c000 (irq = 18) is a Freescale MXC
     RAMDISK driver initialized: 16 RAM disks of 16384K size 1024 blocksize
     loop: loaded (max 8 devices)
     MXC MTD nor Driver 2.0
     mxc_nor_flash: probe of mxc_nor_flash.0 failed with error -5
     MXC MTD nand Driver 2.0
     NAND device: Manufacturer ID: 0xad, Chip ID: 0xdc (Hynix NAND 512MiB 3,3V 8-bit)
     Scanning device for bad blocks
     Bad eraseblock 732 at 0x05b80000
     Bad eraseblock 1450 at 0x0b540000
     Bad eraseblock 2678 at 0x14ec0000
     Bad eraseblock 2680 at 0x14f00000
     Bad eraseblock 3981 at 0x1f1a0000
     Creating 6 MTD partitions on "NAND 512MiB 3,3V 8-bit":
     0x00000000-0x00040000 : "IPL-SPL"
     0x00040000-0x00440000 : "nand.kernel"
     0x00440000-0x00c40000 : "nand.rootfs"
     0x00c40000-0x02c40000 : "nand.userreg"
     0x02c40000-0x06c40000 : "nand.userprog"
     0x06c40000-0x20000000 : "nand.userdata"
     fsl-ehci fsl-ehci.0: Freescale On-Chip EHCI Host Controller
     fsl-ehci fsl-ehci.0: new USB bus registered, assigned bus number 1
     write priority to fc004400 302154
     iram0 = 1ffc0000 iram1 = 1ffc0800
     fsl-ehci fsl-ehci.0: irq 36, io base 0x43f88400
     fsl-ehci fsl-ehci.0: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
     usb usb1: configuration #1 chosen from 1 choice
     hub 1-0:1.0: USB hub found
     hub 1-0:1.0: 1 port detected
     Initializing USB Mass Storage driver...
     usb 1-1: new high speed USB device using fsl-ehci and address 2
     usb 1-1: configuration #1 chosen from 1 choice
     hub 1-1:1.0: USB hub found
     hub 1-1:1.0: 2 ports detected
     usb 1-1.1: new high speed USB device using fsl-ehci and address 3
     usb 1-1.1: configuration #1 chosen from 1 choice
     scsi0 : SCSI emulation for USB Mass Storage devices
     usbcore: registered new interface driver usb-storage
     USB Mass Storage support registered.
     usbcore: registered new interface driver asix
     MXC keypad loaded
     input: mxckpd as /class/input/input0
     IPU Post-filter loading
     SSI module loaded successfully
     Advanced Linux Sound Architecture Driver Version 1.0.13 (Tue Nov 28 14:07:24 2006 UTC).
     Control ALSA component registered
     MXC audio support initialized
     ALSA device list:
       #0: MXC audio for iDAM
     TCP cubic registered
     NET: Registered protocol family 1
     NET: Registered protocol family 17
     VFP support v0.3: implementor 41 architecture 1 part 20 variant b rev 2
     RAMDISK: Compressed image found at block 0
     VFS: Mounted root (ext2 filesystem).
     Freeing init memory: 472K
     Using fallback suid method
     Using fallback suid method
     Using fallback suid method
     Using fallback suid method
     #/etc/rc.d/rcS start
     Using fallback suid method
     usb_address[0] 3
     scsi 0:0:0:0: Direct-Access     Sony     MCR-U HS-MS      5.58 PQ: 0 ANSI: 0
     sd 0:0:0:0: Attached scsi removable disk sda
     scsi 0:0:0:1: Direct-Access     Sony     MCR-U HS-CF      5.58 PQ: 0 ANSI: 0
     sd 0:0:0:1: Attached scsi removable disk sdb
     scsi 0:0:0:2: Direct-Access     Sony     MCR-U HS-SD      5.58 PQ: 0 ANSI: 0
     k3d_chk_one: ejected, device sda
     k3d_chk_one: ejected, device sdb
     sd 0:0:0:2: Attached scsi removable disk sdc
     k3d_chk_one: ejected, device sdc
     ysdev: module license 'unspecified' taints kernel.
     ysdev: Yosemite misc driver (Mar 13 2008)
     GPIO port 2 (0-based), pin 31 is already reserved!
     GPIO port 2 (0-based), pin 31 is already reserved!
     EnablePA=0x01
     PA Group #0: level=13dbm, Rate Bitmap=0x1800 (54 48 Mbps)
     PA Group #1: level=14dbm, Rate Bitmap=0x7e0 (36 24 18 12 9 6 Mbps)
     PA Group #2: level=16dbm, Rate Bitmap=0x0f (11 5.5 2 1 Mbps)
     eth0      version:sd2480-9.70.3.p20-26409.p43 (r208)
     #/usr/sony/etc/rcS start
     CLCDC_Init: major device 251
     CAMERA_Init: major device 250
     Loaded PowerVR consumer services.
     command : time

     Get time val : 1199232528
     set system clock : date 010200082008.48(1199232528)
     Wed Jan  2 00:08:48 UTC 2008
     Yostart  was started in dll [2]
     Yostar:writeing pid=1064
     Yostart with CHECK was started in dll [2]
     Yostart  was started in dll [6]
     Yostar:writeing pid=1066
     Yostart with CHECK was started in dll [6]
     ysem.c: 230: ysem_open: k != -1 failed
     ysem.c: 230: ysem_open: k != -1 failed
     Yostart  was started in dll [42]
     Yostar:writeing pid=1069
     Yostart with CHECK was started in dll [42]
     zero clear memory
     ysem.c: 230: ysem_open: k != -1 failed
     ysem.c: 230: ysem_open: k != -1 failed
     ADD 0 MTX: msgc_alive_mtx_00, SEM: msgc_result_sem_00
     Yostart  was started in dll [45]
     Yostar:writeing pid=1073
     Yostart with CHECK was started in dll [45]
     Yostart with CHECK was started in dll [30]
     Yostart  was started in dll [30]
     Yostar:writeing pid=1076
     0:08:48 PID1076 event.c( 401)event_open_mem       : failed open_share()
     Yostart  was started in dll [5]
     Yostar:writeing pid=1079
     Yostart with CHECK was started in dll [5]
     ysem.c: 230: ysem_open: k != -1 failed
     ADD 1 MTX: msgc_alive_mtx_01, SEM: msgc_result_sem_01
     Yostart  was started in dll [48]
     Yostar:writeing pid=1083
     Yostart with CHECK was started in dll [48]
     ysem.c: 230: ysem_open: k != -1 failed
     ADD 2 MTX: msgc_alive_mtx_02, SEM: msgc_result_sem_02
     [vunp] 1 hour sleep!!
     Yostart  was started in dll [49]
     Yostar:writeing pid=1091
     Yostart with CHECK was started in dll [49]
     ysem.c: 230: ysem_open: k != -1 failed
     ADD 3 MTX: msgc_alive_mtx_03, SEM: msgc_result_sem_03
     [nled] write : ledset -s -b 80 0

     [systemapi] local_time ti:0  time_st:0  time_js:3600  time_ut:0
     ontimer set event!!!!
     ontimer set event!!!!
     ontimer set event!!!!
     ontimer set event!!!!
     Yostart with CHECK was started in dll [51]
     Yostart  was started in dll [51]
     Yostar:writeing pid=1095
     ysem.c: 230: ysem_open: k != -1 failed
     ADD 4 MTX: msgc_alive_mtx_04, SEM: msgc_result_sem_04
     Yostart with CHECK was started in dll [52]
     Yostart  was started in dll [52]
     Yostar:writeing pid=1099
     Yostart with CHECK was started in dll [10]
     Yostart  was started in dll [10]
     Yostar:writeing pid=1103


     [terahttp] dll_init
     MAIN_LOOP_START_REQ
     MAIN_LOOP_START_END
     Yostart  was started in dll [12]
     Yostar:writeing pid=1106
     Yostart with CHECK was started in dll [12]
     Yostart with CHECK was started in dll [23]
     Yostart  was started in dll [23]
     Yostar:writeing pid=1108
     pmb_start
     pmb_loop
     Message send Success. reply=1
     region_code=0x41
     mode=0x60
     WPA2-PSK CCMP
     error:[commontool.c]:L1373 -Mar 25 2009 ret=-5
     ssid=<yournetworkname>
     pairwise=CCMP
     key=<yournetworkkey>
     udhcpc (v0.9.9-pre+autoip) started
     udhcpc[1230]: udhcpc (v0.9.9-pre+autoip) started
     Sending discover...
     udhcpc[1230]: Sending discover...
     Sending select for 192.168.x.x...
     udhcpc[1230]: Sending select for 192.168.x.x...
     Lease of 192.168.x.x obtained, lease time 86400
     udhcpc[1230]: Lease of 192.168.x.x obtained, lease time 86400
     deleting routers
     route: SIOC[ADD|DEL]RT: No such process
     adding dns 192.168.y.y
     !!!enter ntp callback
     ##### ntp: get network change
     ntp set on
     Message send Success. reply=1
     0:09:00 PID1079 event.c( 969)event_api_add        : -------------------------------
     0:09:00 PID1079 event.c( 970)event_api_add        : TERAAPI_REQ_ADD  registerd ID:3 data:[0]
     0:09:00 PID1079 event.c( 971)event_api_add        : 2008/01/03(THU)10:28:26
     0:09:00 PID1079 event.c( 972)event_api_add        : -------------------------------

     Freescale Semiconductor, Inc.
     i.MX31 Applications Development System

     (none) login: terahttpd bind successfully

     Freescale Semiconductor, Inc.
     i.MX31 Applications Development System

     (none) login:

## Remote Access

Since firmware Ver.2.00 a web server is set up - however in japanese.
Initial login is

     ユーザー名 (loginname): root
     パスワード (password): password

The web server allows you to configure your account data more easily
than with the remote control. Unfortunately this login and password is
not working on the serial console. With a root access account one might
be able to add english translations.

No other services seems to run as all ports are closed.



## Hardware Disassembly

**WARNING ! Disassembling the VGF-CP1 may cause damage ! It's on your
own risk !!**

[![](http://eLinux.org/images/thumb/e/ec/DSC_8955_red.png/200px-DSC_8955_red.png)](http://eLinux.org/File:DSC_8955_red.png)

[](http://eLinux.org/File:DSC_8955_red.png "Enlarge")

remove two screws to seperate acrylic glass

1. To open the nice housing, you first have to remove two white square
shaped sticker on the lower back side. The screws fix two white
bushings, which have to be taken out in order to seperate the acrylic
glass base.



[![](http://eLinux.org/images/thumb/4/4d/DSC_8954_red.png/200px-DSC_8954_red.png)](http://eLinux.org/File:DSC_8954_red.png)

[](http://eLinux.org/File:DSC_8954_red.png "Enlarge")

remove sticker to open cover

2. Next you have to remove a rectangular white sticker. which is used as
a diffusor for the blue led.



[![](http://eLinux.org/images/thumb/4/46/DSC_8954_2_red.png/200px-DSC_8954_2_red.png)](http://eLinux.org/File:DSC_8954_2_red.png)

[](http://eLinux.org/File:DSC_8954_2_red.png "Enlarge")

slightly shift display in arrow direction

3. To seperate the cover, you have to move carefully the display towards
the direction marked with red arrows. The ribbon cable is on the bottom
side, so you can open the housing now.



[![](http://eLinux.org/images/thumb/6/6b/DSC_8950_red.png/200px-DSC_8950_red.png)](http://eLinux.org/File:DSC_8950_red.png)

[](http://eLinux.org/File:DSC_8950_red.png "Enlarge")

next remove 6 screws to open shield

4. The PCBs are shielded with a blank sheet fixed with six screws. For
those you need well fitting screw driver, because the four ones marked
in red are tightend very hard. I had to drill them out !



[![](http://eLinux.org/images/thumb/9/90/DSC_8942_red.png/200px-DSC_8942_red.png)](http://eLinux.org/File:DSC_8942_red.png)

[](http://eLinux.org/File:DSC_8942_red.png "Enlarge")

mainboard with display connector

5. Front display is connected to ribbon connector (red square). Another
pwr button is inside (blue marking), next to it a reset button (green
marking).



[![](http://eLinux.org/images/thumb/6/66/DSC_8947_red.png/200px-DSC_8947_red.png)](http://eLinux.org/File:DSC_8947_red.png)

[](http://eLinux.org/File:DSC_8947_red.png "Enlarge")

UART1 serial connector

6. A serial console can be connected through UART1 CN853. I already
soldered another plug on top of the original one. Pinout see below.
You'll need a level shifter LVTTL-to-RS232 as well in order to connect a
PC serial port.

-   LVTTL/RS232 - Building a Custom Serial Interface
    [http://buffalo.nas-central.org/wiki/Building\_a\_Custom\_Serial\_Interface](http://buffalo.nas-central.org/wiki/Building_a_Custom_Serial_Interface)

Pin 1 of the connector the left one on the picture and it is marked on
the PCB with a white dot.

### **MX31 UART1 CN853 Pinout**

<table>
<caption> </caption>
<tbody>
<tr class="odd">
<td align="left"><strong>Pin </strong></td>
<td align="left"><strong>Signal</strong></td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">Power (3.3V)*</td>
</tr>
<tr class="odd">
<td align="left">2</td>
<td align="left">Transmit (TX)</td>
</tr>
<tr class="even">
<td align="left">3</td>
<td align="left">Receive (RX)</td>
</tr>
<tr class="odd">
<td align="left">4</td>
<td align="left">Ground (GND)</td>
</tr>
</tbody>
</table>

## External Links

-   Unboxing video:
    [http://www.youtube.com/watch?v=oatks-1x8U8](http://www.youtube.com/watch?v=oatks-1x8U8)
-   GPL software from Sony:
    [http://www.sony.net/Products/Linux/VAIO/VGF-CP1.html](http://www.sony.net/Products/Linux/VAIO/VGF-CP1.html)
-   Discussion thread:
    [http://www.artiss.co.uk/2009/09/sony-vaio-vgf-cp1-photo-frame](http://www.artiss.co.uk/2009/09/sony-vaio-vgf-cp1-photo-frame)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Hardware](http://eLinux.org/Category:Hardware "Category:Hardware")
-   [Firmware](http://eLinux.org/index.php?title=Category:Firmware&action=edit&redlink=1 "Category:Firmware (page does not exist)")
-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Hardware
    Hacking](http://eLinux.org/Category:Hardware_Hacking "Category:Hardware Hacking")
-   [HOWTOs](http://eLinux.org/Category:HOWTOs "Category:HOWTOs")

