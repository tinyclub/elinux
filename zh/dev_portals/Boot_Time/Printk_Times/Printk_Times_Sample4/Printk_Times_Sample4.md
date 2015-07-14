> From: [eLinux.org](http://eLinux.org/Printk_Times_Sample4 "http://eLinux.org/Printk_Times_Sample4")


# Printk Times Sample4



    OS-e820: 0000000007ff0000 - 0000000008000000 (reserved)
    [4294667.296000]  BIOS-e820: 00000000fecf0000 - 00000000fecf1000 (reserved)
    [4294667.296000]  BIOS-e820: 00000000fed20000 - 00000000feda0000 (reserved)
    [4294667.296000] 127MB LOWMEM available.
    [4294667.296000] On node 0 totalpages: 32560
    [4294667.296000]   DMA zone: 4096 pages, LIFO batch:1
    [4294667.296000]   Normal zone: 28464 pages, LIFO batch:6
    [4294667.296000]   HighMem zone: 0 pages, LIFO batch:1
    [4294667.296000] DMI 2.3 present.
    [4294667.296000] ACPI: RSDP (v000 ACPIAM                                ) @ 0x000f6240
    [4294667.296000] ACPI: RSDT (v001 INTEL  D865PERL 0x20030828 MSFT 0x00000097) @ 0x07f30000
    [4294667.296000] ACPI: FADT (v002 INTEL  D865PERL 0x20030828 MSFT 0x00000097) @ 0x07f30200
    [4294667.296000] ACPI: MADT (v001 INTEL  D865PERL 0x20030828 MSFT 0x00000097) @ 0x07f30300
    [4294667.296000] ACPI: ASF! (v016 LEGEND I865PASF 0x00000001 MSFT 0x0100000d) @ 0x07f34620
    [4294667.296000] ACPI: WDDT (v001 INTEL  OEMWDDT  0x00000001 MSFT 0x0100000d) @ 0x07f346b9
    [4294667.296000] ACPI: DSDT (v001 INTEL  D865PERL 0x00000006 MSFT 0x0100000d) @ 0x00000000
    [4294667.296000] Built 1 zonelists
    [4294667.296000] Kernel command line: ro root=/dev/nfs ip=dhcp hdc=ide-scsi console=vga console=ttyS0,115200
    [4294667.296000] ide_setup: hdc=ide-scsi
    [4294667.296000] Initializing CPU#0
    [4294667.296000] PID hash table entries: 512 (order: 9, 8192 bytes)
    [    0.000000] Detected 1995.620 MHz processor.
    [   21.397369] Using tsc for high-res timesource
    [   21.399820] Console: colour VGA+ 80x25
    [   21.537244] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
    [   21.544547] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
    [   21.555066] Memory: 125076k/130240k available (2002k kernel code, 4556k reserved, 1006k data, 140k init, 0k highmem)
    [   21.565775] Checking if this processor honours the WP bit even in supervisor mode... Ok.
    [   21.574089] Calibrating delay loop... 3940.35 BogoMIPS (lpj=1970176)
    [   21.596511] Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
    [   21.603263] CPU: After generic identify, caps: bfebfbff 00000000 00000000 00000000 00004400 00000000 00000000
    [   21.603276] CPU: After vendor identify, caps: bfebfbff 00000000 00000000 00000000 00004400 00000000 00000000
    [   21.603287] CPU: Trace cache: 12K uops, L1 D cache: 8K
    [   21.608884] CPU: L2 cache: 128K
    [   21.612163] CPU: After all inits, caps: bfebfbff 00000000 00000000 00000080 00004400 00000000 00000000
    [   21.612171] Intel machine check architecture supported.
    [   21.617614] Intel machine check reporting enabled on CPU#0.
    [   21.623419] CPU0: Intel P4/Xeon Extended MCE MSRs (12) available
    [   21.629674] CPU: Intel(R) Celeron(R) CPU 2.00GHz stepping 09
    [   21.635616] Enabling fast FPU save and restore... done.
    [   21.641327] Enabling unmasked SIMD FPU exception support... done.
    [   21.647694] Checking 'hlt' instruction... OK.
    [   21.672303] ACPI: setting ELCR to 0200 (from 0e28)
    [   21.678095] NET: Registered protocol family 16
    [   21.683775] PCI: PCI BIOS revision 2.10 entry at 0xf0031, last bus=2
    [   21.690415] PCI: Using configuration type 1
    [   21.694782] mtrr: v2.0 (20020519)
    [   21.698569] ACPI: Subsystem revision 20050125
    [   21.712870]     ACPI-1138: *** Error: Method execution failed [\MCTH] (Node c7f2ec80), AE_AML_BUFFER_LIMIT
    [   21.723005]     ACPI-1138: *** Error: Method execution failed [\OSFL] (Node c7f2e480), AE_AML_BUFFER_LIMIT
    [   21.733159]     ACPI-1138: *** Error: Method execution failed [\_SB_.PCI0.SBRG.PS2K._STA] (Node c7e29f00), AE_AML_BUFFER_LIMIT
    [   21.745385]     ACPI-0158: *** Error: Method execution failed [\_SB_.PCI0.SBRG.PS2K._STA] (Node c7e29f00), AE_AML_BUFFER_LIMIT
    [   21.757677]     ACPI-1138: *** Error: Method execution failed [\MCTH] (Node c7f2ec80), AE_AML_BUFFER_LIMIT
    [   21.767834]     ACPI-1138: *** Error: Method execution failed [\OSFL] (Node c7f2e480), AE_AML_BUFFER_LIMIT
    [   21.777990]     ACPI-1138: *** Error: Method execution failed [\_SB_.PCI0.SBRG.PS2M._STA] (Node c7e29e60), AE_AML_BUFFER_LIMIT
    [   21.790158]     ACPI-0158: *** Error: Method execution failed [\_SB_.PCI0.SBRG.PS2M._STA] (Node c7e29e60), AE_AML_BUFFER_LIMIT
    [   21.804885] ACPI: Interpreter enabled
    [   21.808713] ACPI: Using PIC for interrupt routing
    [   21.814251] ACPI: PCI Root Bridge [PCI0] (00:00)
    [   21.819081] PCI: Probing PCI hardware (bus 00)
    [   21.824418] PCI: Ignoring BAR0-3 of IDE controller 0000:00:1f.1
    [   21.831217] PCI: Transparent bridge - 0000:00:1e.0
    [   21.837245] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
    [   21.837611] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P1._PRT]
    [   21.838792] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P3._PRT]
    [   21.843383]     ACPI-1138: *** Error: Method execution failed [\MCTH] (Node c7f2ec80), AE_AML_BUFFER_LIMIT
    [   21.853813]     ACPI-1138: *** Error: Method execution failed [\OSFL] (Node c7f2e480), AE_AML_BUFFER_LIMIT
    [   21.863936]     ACPI-1138: *** Error: Method execution failed [\_SB_.PCI0.SBRG.PS2K._STA] (Node c7e29f00), AE_AML_BUFFER_LIMIT
    [   21.876219]     ACPI-1138: *** Error: Method execution failed [\MCTH] (Node c7f2ec80), AE_AML_BUFFER_LIMIT
    [   21.886359]     ACPI-1138: *** Error: Method execution failed [\OSFL] (Node c7f2e480), AE_AML_BUFFER_LIMIT
    [   21.896741]     ACPI-1138: *** Error: Method execution failed [\_SB_.PCI0.SBRG.PS2M._STA] (Node c7e29e60), AE_AML_BUFFER_LIMIT
    [   21.911374] ACPI: Power Resource [URP1] (off)
    [   21.916100] ACPI: Power Resource [FDDP] (off)
    [   21.920810] ACPI: Power Resource [LPTP] (off)
    [   21.926848] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 *9 10 11 12 14 15)
    [   21.935248] ACPI: PCI Interrupt Link [LNKB] (IRQs *3 4 5 6 7 9 10 11 12 14 15)
    [   21.943636] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
    [   21.952005] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 *5 6 7 9 10 11 12 14 15)
    [   21.960407] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 *5 6 7 9 10 11 12 14 15)
    [   21.968792] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0, disabled.
    [   21.978388] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0, disabled.
    [   21.987971] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 *10 11 12 14 15)
    [   21.996756] SCSI subsystem initialized
    [   22.001066] usbcore: registered new driver usbfs
    [   22.005935] usbcore: registered new driver hub
    [   22.010673] PCI: Using ACPI for IRQ routing
    [   22.015051] ** PCI interrupts are no longer routed automatically.  If this
    [   22.022224] ** causes a device to stop working, it is probably because the
    [   22.029395] ** driver failed to call pci_enable_device().  As a temporary
    [   22.036476] ** workaround, the "pci=routeirq" argument restores the old
    [   22.043376] ** behavior.  If this argument makes the device work again,
    [   22.050453] ** please email the output of "lspci" to bjorn.helgaas@hp.com
    [   22.057532] ** so I can fix the driver.
    [   22.067584]     ACPI-1138: *** Error: Method execution failed [\MCTH] (Node c7f2ec80), AE_AML_BUFFER_LIMIT
    [   22.077735]     ACPI-1138: *** Error: Method execution failed [\OSFL] (Node c7f2e480), AE_AML_BUFFER_LIMIT
    [   22.087880]     ACPI-1138: *** Error: Method execution failed [\_SB_.SYSM._CRS] (Node c7e27c80), AE_AML_BUFFER_LIMIT
    [   22.098960]     ACPI-0158: *** Error: Method execution failed [\_SB_.SYSM._CRS] (Node c7e27c80), AE_AML_BUFFER_LIMIT
    [   22.111472] Machine check exception polling timer started.
    [   22.118406] Initializing Cryptographic API
    [   22.122808] ACPI: Power Button (FF) [PWRF]
    [   22.127346] ACPI: Sleep Button (CM) [SLPB]
    [   22.131835] ACPI: Processor [CPU1] (supports 8 throttling states)
    [   22.141310] Real Time Clock Driver v1.12
    [   22.145573] Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing disabled
    [   22.154116] ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
    [   22.160399] ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 3
    [   22.166314] PCI: setting IRQ 3 as level-triggered
    [   22.171226] ACPI: PCI interrupt 0000:02:02.0[A] -> GSI 3 (level, low) -> IRQ 3
    [   22.178903] ttyS4 at I/O 0xbc00 (irq = 3) is a 16550A
    [   22.184382] ttyS5 at I/O 0xb400 (irq = 3) is a 16550A
    [   22.189854] ttyS6 at I/O 0xb000 (irq = 3) is a 16550A
    [   22.195324] ttyS7 at I/O 0xac00 (irq = 3) is a 16550A
    [   22.200782] ttyS1 at I/O 0xa800 (irq = 3) is a 16450
    [   22.206095] io scheduler noop registered
    [   22.210227] io scheduler anticipatory registered
    [   22.215057] io scheduler deadline registered
    [   22.219543] io scheduler cfq registered
    [   22.223848] loop: loaded (max 8 devices)
    [   22.227952] e100: Intel(R) PRO/100 Network Driver, 3.3.6-k2-NAPI
    [   22.234232] e100: Copyright(c) 1999-2004 Intel Corporation
    [   22.240517] ACPI: PCI Interrupt Link [LNKE] enabled at IRQ 5
    [   22.246431] PCI: setting IRQ 5 as level-triggered
    [   22.251337] ACPI: PCI interrupt 0000:02:08.0[A] -> GSI 5 (level, low) -> IRQ 5
    [   22.282220] e100: eth0: e100_probe: addr 0xfeafd000, irq 5, MAC addr 00:0C:F1:AA:CB:59
    [   22.290574] Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
    [   22.297210] ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
    [   22.305942] ICH5: IDE controller at PCI slot 0000:00:1f.1
    [   22.311578] PCI: Enabling device 0000:00:1f.1 (0005 -> 0007)
    [   22.317996] ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 11
    [   22.323994] PCI: setting IRQ 11 as level-triggered
    [   22.328997] ACPI: PCI interrupt 0000:00:1f.1[A] -> GSI 11 (level, low) -> IRQ 11
    [   22.336739] ICH5: chipset revision 2
    [   22.340463] ICH5: not 100% native mode: will probe irqs later
    [   22.346436]     ide0: BM-DMA at 0xffa0-0xffa7, BIOS settings: hda:DMA, hdb:pio
    [   22.353983]     ide1: BM-DMA at 0xffa8-0xffaf, BIOS settings: hdc:pio, hdd:DMA
    [   22.361719] Probing IDE interface ide0...
    [   22.624921] hda: Maxtor 94098U8, ATA DISK drive
    [   23.240581] ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
    [   23.245435] Probing IDE interface ide1...
    [   24.171831] hdd: CRD-8482B, ATAPI CD/DVD-ROM drive
    [   24.227653] hdd: Disabling (U)DMA for CRD-8482B (blacklisted)
    [   24.233696] ide1 at 0x170-0x177,0x376 on irq 15
    [   24.238664] Probing IDE interface ide2...
    [   24.751255] Probing IDE interface ide3...
    [   25.262895] Probing IDE interface ide4...
    [   25.774533] Probing IDE interface ide5...
    [   26.286196] hda: max request size: 128KiB
    [   26.292107] hda: 80041248 sectors (40981 MB) w/2048KiB Cache, CHS=65535/16/63, UDMA(33)
    [   26.300515] hda: cache flushes not supported
    [   26.300614]  hda: hda1 hda2 hda3 hda4
    [   26.312215] ide-scsi is deprecated for cd burning! Use ide-cd and give dev=/dev/hdX as device
    [   26.321406] scsi0 : SCSI host adapter emulation for IDE ATAPI devices
    [   26.328475]   Vendor: LG        Model: CD-ROM CRD-8482B  Rev: 1.05
    [   26.335183]   Type:   CD-ROM                             ANSI SCSI revision: 02
    [   26.343189] Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 5
    [   26.351585] ACPI: PCI Interrupt Link [LNKH] enabled at IRQ 10
    [   26.357591] PCI: setting IRQ 10 as level-triggered
    [   26.362593] ACPI: PCI interrupt 0000:00:1d.7[D] -> GSI 10 (level, low) -> IRQ 10
    [   26.370342] ehci_hcd 0000:00:1d.7: Intel Corp. 82801EB/ER (ICH5/ICH5R) USB2 EHCI Controller
    [   26.379066] PCI: Setting latency timer of device 0000:00:1d.7 to 64
    [   26.379077] ehci_hcd 0000:00:1d.7: irq 10, pci mem 0xfebffc00
    [   26.385174] ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 1
    [   26.396775] PCI: cache line size of 128 is not supported by device 0000:00:1d.7
    [   26.396786] ehci_hcd 0000:00:1d.7: USB 2.0 initialized, EHCI 1.00, driver 10 Dec 2004
    [   26.405128] hub 1-0:1.0: USB hub found
    [   26.409062] hub 1-0:1.0: 8 ports detected
    [   26.434143] USB Universal Host Controller Interface driver v2.2
    [   26.440883] ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 9
    [   26.446991] PCI: setting IRQ 9 as level-triggered
    [   26.452144] ACPI: PCI interrupt 0000:00:1d.0[A] -> GSI 9 (level, low) -> IRQ 9
    [   26.459708] uhci_hcd 0000:00:1d.0: Intel Corp. 82801EB/ER (ICH5/ICH5R) USB UHCI #1
    [   26.529004] PCI: Setting latency timer of device 0000:00:1d.0 to 64
    [   26.529016] uhci_hcd 0000:00:1d.0: irq 9, io base 0xcc00
    [   26.534631] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 2
    [   26.542544] hub 2-0:1.0: USB hub found
    [   26.546499] hub 2-0:1.0: 2 ports detected
    [   26.553479] ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 5
    [   26.559395] ACPI: PCI interrupt 0000:00:1d.1[B] -> GSI 5 (level, low) -> IRQ 5
    [   26.566942] uhci_hcd 0000:00:1d.1: Intel Corp. 82801EB/ER (ICH5/ICH5R) USB UHCI #2
    [   26.635929] PCI: Setting latency timer of device 0000:00:1d.1 to 64
    [   26.635941] uhci_hcd 0000:00:1d.1: irq 5, io base 0xd000
    [   26.641566] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 3
    [   26.649493] hub 3-0:1.0: USB hub found
    [   26.653428] hub 3-0:1.0: 2 ports detected
    [   26.659943] ACPI: PCI interrupt 0000:00:1d.2[C] -> GSI 11 (level, low) -> IRQ 11
    [   26.667660] uhci_hcd 0000:00:1d.2: Intel Corp. 82801EB/ER (ICH5/ICH5R) USB UHCI #3
    [   26.753844] PCI: Setting latency timer of device 0000:00:1d.2 to 64
    [   26.753856] uhci_hcd 0000:00:1d.2: irq 11, io base 0xd400
    [   26.759561] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 4
    [   26.767461] hub 4-0:1.0: USB hub found
    [   26.771397] hub 4-0:1.0: 2 ports detected
    [   26.784851] ACPI: PCI interrupt 0000:00:1d.3[A] -> GSI 9 (level, low) -> IRQ 9
    [   26.796358] uhci_hcd 0000:00:1d.3: Intel Corp. 82801EB/ER (ICH5/ICH5R) USB UHCI #4
    [   26.846785] usb 2-2: new full speed USB device using uhci_hcd and address 2
    [   26.865768] PCI: Setting latency timer of device 0000:00:1d.3 to 64
    [   26.865776] uhci_hcd 0000:00:1d.3: irq 9, io base 0xd800
    [   26.871412] uhci_hcd 0000:00:1d.3: new USB bus registered, assigned bus number 5
    [   26.879367] hub 5-0:1.0: USB hub found
    [   26.883329] hub 5-0:1.0: 2 ports detected
    [   26.946813] Initializing USB Mass Storage driver...
    [   27.015154] hub 2-2:1.0: USB hub found
    [   27.021080] hub 2-2:1.0: 3 ports detected
    [   27.050722] usbcore: registered new driver usb-storage
    [   27.056108] USB Mass Storage support registered.
    [   27.061011] mice: PS/2 mouse device common for all mice
    [   27.066644] NET: Registered protocol family 2
    [   27.079679] IP: routing cache hash table of 512 buckets, 4Kbytes
    [   27.086068] TCP established hash table entries: 8192 (order: 4, 65536 bytes)
    [   27.093455] TCP bind hash table entries: 8192 (order: 3, 32768 bytes)
    [   27.100169] TCP: Hash tables configured (established 8192 bind 8192)
    [   27.106851] NET: Registered protocol family 1
    [   27.111425] NET: Registered protocol family 17
    [   27.116191] PM: Reading swsusp image.
    [   27.116196] PM: Resume from disk failed.
    [   27.116220] ACPI wakeup devices:
    [   27.119702] TANA P0P3 AC97 USB0 USB1 USB2 USB3 USB7 UAR1 SLPB
    [   27.125967] ACPI: (supports S0 S1 S4 S5)
    [   27.220937] usb 2-2.3: new full speed USB device using uhci_hcd and address 3
    [   27.642320] e100: eth0: e100_watchdog: link up, 100Mbps, full-duplex
    [   28.641513] Sending DHCP requests ., OK
    [   28.649508] IP-Config: Got DHCP answer from 192.168.1.10, my address is 192.168.1.14
    [   28.657748] IP-Config: Complete:
    [   28.660943]       device=eth0, addr=192.168.1.14, mask=255.255.255.0, gw=192.168.1.1,
    [   28.669078]      host=nut, domain=, nis-domain=(none),
    [   28.674457]      bootserver=192.168.1.10, rootserver=192.168.1.10, rootpath=/target/nut
    [   28.683166] Looking up port of RPC 100003/2 on 192.168.1.10
    [   28.689865] Looking up port of RPC 100005/1 on 192.168.1.10
    [   28.699000] VFS: Mounted root (nfs filesystem) readonly.
    [   28.704709] Freeing unused kernel memory: 140k freed


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Printk](http://eLinux.org/Category:Printk "Category:Printk")

