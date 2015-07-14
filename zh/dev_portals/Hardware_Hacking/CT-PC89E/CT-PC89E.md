> From: [eLinux.org](http://eLinux.org/CT-PC89E "http://eLinux.org/CT-PC89E")


# CT-PC89E



## Contents

-   [1 Chitech CT-PC89E](#chitech-ct-pc89e)
    -   [1.1 Hardware Summary](#hardware-summary)
    -   [1.2 Info Pages](#info-pages)
    -   [1.3 Technical Info](#technical-info)
        -   [1.3.1 LCD Data](#lcd-data)
        -   [1.3.2 /proc/iomem](#-proc-iomem)
    -   [1.4 Kernel Hacking Progress](#kernel-hacking-progress)
        -   [1.4.1 kernel](#kernel)
            -   [1.4.1.1
                \-\-apm\-get\-power\-status](#apm-get-power-status)
            -   [1.4.1.2 s3cfb\-set\-brightness](#s3cfb-set-brightness)
            -   [1.4.1.3 arch\-reset](#arch-reset)
        -   [1.4.2 initrd](#initrd)
-   [2 Other Brand Names](#other-brand-names)
-   [3 See also](#see-also)
-   [4 External links](#external-links)

# Chitech CT-PC89E

-   Current status: GPL Violation by Chitech. Communication has ceased
    by Chitech. Chitech have not responded to or acknowledged
    communications since 20th March 2010.
-   Current kernel reverse-engineering status: partial (useable).
    Screen, USB, Keyboard, Mouse, Ethernet are all working (proviso:
    with the DS2431 EEPROM storing the MAC code and no driver for
    reading it yet, a random MAC is currently created on each boot)
-   Current Debian-Installer status: success! completed!
-   Current u-boot reverse-engineering status: not started yet. hardware
    "switch" discovered which makes booting from external SDcard
    possible. u-boot reverse-engineering can now begin (without risk of
    bricking)

The CT-PC89E is a low-cost netbook with an 8.9in 1024x600 screen,
weighing only 720 grammes (0.72kg). In size it's *approximately* 23.5 x
16.5 x 2.5 cm (9.25 x 6.5 x 1 in). Its 667mhz Samsung S3C6410 embedded
ARM CPU is on a factory-upgradeable SO-DIMM which also has, in the
standard low-cost option, 256mb of RAM and 2gb of NAND Flash. The rest
of the features are pretty much "standard" fare for a low-cost netbook:
2x USB2, stereo speakers, microphone, SD-Card slot, headphone and
microphone sockets, and 802.11 WIFI. A low-cost (0.3mp) built-in Webcam
is available as an option (\$USD 2 for a 20,000 units order). To further
save on cost, there is a micro VGA output, but by default the IC to
enable it is again optional (again, \$USD 2 for a 20,000 order). Also,
the design has two internal USB2-capable (only) PCI-express slots, which
can take 50x30mm PCI-e cards. One is occupied with the RALink RT2070
WIFI, whilst the other is designed to take a 3G or an EDGE modem: there
is even a slot for a SIM card (next to the SD card slot).

As this machine is very new, only a few brave Debian-ARM souls have
bought it so far, direct from the factory in China, in order to evaluate
it and help re-engineer it. We're aware that one other U.S. customer has
ordered a batch of them, thus guaranteeing its production over the next
few months (as of Feb 2010). The nice surprise is that far from being
truly dreadful, the embedded OS on the device, from
[http://mid-fun.com](http://mid-fun.com) is actually pretty good: it's
called MOS and the web site is here:
[http://mid-linux.org](http://mid-linux.org). As of yet, we've been
unable to reach Mid-Fun to get them to provide the root password and the
GPL source code of the OS, but that's okay because we've discovered
three security flaws in two days, each of which gives full root access
to the machine. (24feb2010: by running "john" on the DES64/64 root
passwd entry, we've established that the root password is mos2010)

So, at this early stage, for more information please contact
[mailto:lkcl@lkcl.net](mailto:lkcl@lkcl.net),
[mailto:luke.leighton@gmail.com](mailto:luke.leighton@gmail.com) or Asia
Sourcing [http://www.asiasourcing.net/](http://www.asiasourcing.net/)
and as soon as we find or hear from a retail outlet or a distributor
brave enough to sell these systems we'll let you know.

Also worth noting: we're currently asking the factory for a price on
engineering an SO-DIMM with 512mb of DDR2 RAM and an 833mhz Samsung ARM
Cortex A8: the S5PC100, which is the same CPU as used in the iPhone 3G.
This would ironically not only reduce the price of the system, because
DDR1 RAM is actually more expensive than DDR2, but also give it a huge
performance jump, without increasing power consumption (the S5PC100 is a
45nm part and the S3C6410 is 65nm).

The mailing list is presently being kindly hosted by Alain Williams, at
[http://lists.phcomp.co.uk/mailman/listinfo/arm-netbook](http://lists.phcomp.co.uk/mailman/listinfo/arm-netbook)

There is a description of the system, and photos (internal and
external), here:
[http://lkcl.net/arm\_systems/CT-PC89E](http://lkcl.net/arm_systems/CT-PC89E)

## Hardware Summary

<table style="border:1px solid; border-spacing:0px;">
<caption> Netbook Specifications
</caption>
<tr>
<th style="background:#cccccc;"> Display
</th>
<td> 8.9" 1024x600 LCD
</td></tr>
<tr>
<th style="background:#cccccc;"> Weight
</th>
<td> 720g (0.72kg)
</td></tr>
<tr>
<th style="background:#cccccc; vertical-align: top;"> Dimensions
</th>
<td> 23.5 x 16.5 x 2.5 cm<br />(9.25 x 6.5 x 1 in) <i>(aprox.)</i>
</td></tr>
<tr>
<th style="background:#cccccc;"> Battery
</th>
<td> 7.4V 15.5wh 2100mAh
</td></tr>
<tr>
<th style="background:#cccccc;"> AC Adapter
</th>
<td> 9V 2A
</td></tr></table>
<p><br />
</p>
<table style="border:1px solid; border-spacing:0px;">
<caption> Main board
</caption>
<tr>
<th style="background:#cccccc;vertical-align: top;"> Audio Controller
</th>
<td> AC97 (<i>Wolfson WM9715G</i>)
</td></tr>
<tr>
<th style="background:#cccccc;vertical-align: top;"> Ethernet Controller
</th>
<td> Davicom DM9000DEP<br />dongle required
</td></tr>
<tr>
<th style="background:#cccccc;vertical-align: top;"> VGA Controller
</th>
<td> Chrontel 7026B-TF <i>(optional)</i><br />dongle required
</td></tr></table>
<p><br />
</p>
<table style="border:1px solid; border-spacing:0px;">
<caption> <a href="http://eLinux.org/CT-PC89E_SO-DIMM" title="CT-PC89E SO-DIMM">200-pin SO-DIMM</a> <br /> (<i>seatron-cpu-v1.1</i>)
</caption>
<tr>
<th style="background:#cccccc;"> SoC
</th>
<td> <a rel="nofollow" class="external text" href="http://www.samsung.com/global/business/semiconductor/productInfo.do?fmly_id=229&amp;partnum=S3C6410">Samsung ARM11 S3C6410</a> 667mhz  (<i>s3c6410XH-66</i>)
</td></tr>
<tr>
<th style="background:#cccccc;"> NAND
</th>
<td> SanDisk 2GB (<i>SDIN2C2-2G</i>)
</td></tr>
<tr>
<th style="background:#cccccc;"> RAM
</th>
<td> 256M DDR1 (2 x <a rel="nofollow" class="external text" href="http://www.hynix.co.kr/datasheet/eng/mobile/details/mobile_17_H5MS1G62MFP.jsp">Hynix H5MS1G62MFP</a>)
</td></tr>
<tr>
<th style="background:#cccccc; vertical-align: top"> Boot Switch
</th>
<td> boot from NAND or SD <i>(optional)</i><br /> <i>(outer means NAND, inner means SD)</i>
</td></tr></table>

## Info Pages

-   [CT-PC89E\_Debian\_Installer](http://eLinux.org/CT-PC89E_Debian_Installer "CT-PC89E Debian Installer")
    - how to install debian on the CT-PC89E using Debian-Installer.
-   [CT-PC89E\_Debian](http://eLinux.org/CT-PC89E_Debian "CT-PC89E Debian") - how to
    install debian "hack-style" by dropping a pre-build root filesystem
    onto the CT-PC89E.
-   [CT-PC89E\_Debian\_Installer\_Building](http://eLinux.org/CT-PC89E_Debian_Installer_Building "CT-PC89E Debian Installer Building")
    - how to build debian-installer for the CT-PC89E (only needed by
    developers)
-   [CT-PC89E\_Bugs](http://eLinux.org/CT-PC89E_Bugs "CT-PC89E Bugs")

## Technical Info

This section contains technical info needed to configure a linux kernel.
Taken from kern.log

-   LCD Type is: N10116 (innolux?) this is a lie, it's actually a
    B089AW01 V.1
-   DM9000 is at f7600300,f7600304 IRQ74
-   fb0 map video memory: ff200000:0012c000 dma=5e200000
-   fb1 map video memory: ff32d000:0012c000 dma=5e400000
-   fb0 map video memory: ff45a000:0012c000 dma=5e600000
-   mmc0 (NAND flash) address 9535
-   mmc1 (SDcard) address a95c
-   audio: WM9713/WM9714

From this it's been possible to establish that the kernel version is
similar to the SmartQ5 MID device, version 2.6.24.7. current status as
of 12mar2010 is that boot has been achieved, using the above
information, with DM9000 and USB host still not yet correctly
initialised.

### LCD Data

-   B089AW01 V.1
    [http://www.asdatech.com/modules/classifieds/datasheet/B089AW01%20V.1.pdf](http://www.asdatech.com/modules/classifieds/datasheet/B089AW01%20V.1.pdf)

### /proc/iomem

    debianarmel:~# cat /proc/iomem
    50000000-5e9fffff : System RAM
      50025000-503d1fff : Kernel text
      503d2000-5041daa5 : Kernel data
    70200000-702fffff : s3c2410-nand
    74300000-743fffff : s3c2410-ohci
      74300000-743fffff : ohci_hcd
    76100000-761fffff : s3c-g2d
    77000000-770fffff : s3c-vpp
    77100000-771fffff : s3c2410-lcd
      77100000-771fffff : s3c-lcd
    78800000-78bfffff : s3c-jpeg
    7c200000-7c2fffff : s3c-hsmmc0.0
      7c200000-7c2fffff : s3c-hsmmc0
    7c300000-7c3fffff : s3c-hsmmc1.1
      7c300000-7c3fffff : s3c-hsmmc1
    7e002000-7e002fff : s3c-mfc
    7e005000-7e0050ff : s3c2410-rtc
      7e005000-7e0050ff : s3c2410-rtc
    7e00b000-7e00bfff : s3c-adc
    7f001000-7f001fff : s3c-ac97
    7f004000-7f004fff : s3c2410-i2c
      7f004000-7f004fff : s3c2410-i2c
    7f005000-7f0053ff : s3c-uart.0
      7f005000-7f0050ff : s3c-uart
    7f005400-7f0057ff : s3c-uart.1
      7f005400-7f0054ff : s3c-uart
    7f005800-7f005bff : s3c-uart.2
      7f005800-7f0058ff : s3c-uart
    7f005c00-7f005fff : s3c-uart.3
      7f005c00-7f005cff : s3c-uart
    7f008000-7f008fff : s3c-ds2431
    f7600300-f76fffff : dm9000.0
      f7600300-f7600303 : eth0

## Kernel Hacking Progress

We're presently negotiating with Chitech, who have officially declined
to release kernel source code, and all other source code, on the usual
basis that they want their money back from the investment so far, in
blatant disregard of the GPL and LGPL licenses. Thus it is necessary to
reconsider Chitech until such time as they comply, and thus it is
necessary to reverse-engineer the linux kernel and the boot process.

### kernel

fjp and lkcl have been working to adapt the mer-smartq 2.6.24.7 kernel,
which is an amalgam of 2.6.24, samsung's patch and various modifications
hard-coded to support the smartq 4in and 7in LCD screens. lkcl has a
legally-licensed copy of IDApro and has been using that to
reverse-engineer the kernel functions, taking the addresses from
/proc/kallsyms on a running machine and matching them to an uncompressed
kernel.

So far we have been able to get the 1024x600 LCD panel up and running,
and have hacked kernel/printk.c to modify the console line to "tty1" in
order to bypass the inability to use ttySAC0 serial console, for debug
purposes.

The key hardware that is missing which would make a useful kernel is the
GL850G USB hubs. It has not yet been possible to establish how those are
fired up. Close examination of the PCB shows that there is nothing
connected to Pin 13 (RESET); the next best guess is that there are some
GPIOs which are required to be pulled HIGH or LOW, in order to power the
GL850Gs.

The Ethernet DM9000 appears to be identical to the standard samsung
developer kit: the default parameters worked immediately. However, the
MAC address is stored in a DM2431. We have found a patch to the w1
driver which adds support for DM2431, however have not yet used it.
Further investigation shows that the SO-DIMM, designed by Seatron, has
the DM2431 connected to GPIO Bank N pins, and thus the driver performs
bit-level reads and writes using GPIO pullups followed by sleep commands
of specific length. There are signs of some extremely weird functions in
the disassembly listing, with SHA-1 being used and functions with the
word "Secret" in them are not a particularly good sign. It looks like
the DM2431 is being used to store keys which are believed to somehow
magically be secure.

#### \_\_apm\_get\_power\_status

this function has been hacked to read from the S3C ADC. GPIO bank N pin
2 is set to cfgpin of 0 and pullup of 0, following which a function
GetAdcValue is called. it is therefore quite likely that the ADC input
is multiplexed for multiple purposes. there appears to be no sign of
mutex locking or configuration around the GPIO bank N pin setting, thus
making it entirely likely that corrupted values will be read due to race
conditions.

#### s3cfb\_set\_brightness

the s3cfb\_set\_brightness function uses a PWM timer,
s3c6410\_timer\_setup channel 0, which uses GPIO Bank F, Pin 14, as a
PWM. this timer is botch-reset in the arch\_reset() function, which has
been hacked about and \_should\_ be using the watchdog timer, but is
not.

#### arch\_reset

arch\_reset, in include/asm-arm/arch-s3c2410/system.h, should be used to
do a watchdog reset. instead, it has been hacked about to reset GPIO
Bank H Pin 8 and GPIO Bank F Pin 14 (the PWM for the backlight).

### initrd

So far we have been able to establish that the standard bootpImage boot
process works absolutely fine. This has been established by

-   unpacking the zImage\_dt\_update with dd if=zImage\_dt\_update
    of=vmlinuz\_zimage\_update bs=1 skip=13428 followed by zcat
-   extracting the initrd by searching for a 2nd zcat signature, which
    is at offset 78848
-   noting that the initrd is a compressed CPIO filesystem
-   adding initrd\_phys-\$(CONFIG\_MACH\_CTPC89E)  := 0x50800000 to
    arch/arm/mach-s3c2410/Makefile.boot
-   compiling with make bootpImage with INITRD=\<file.gz\>

This last step recreates the exact same process used by Chitech to
create the zImage\_gt\_update. The next step is to create an alternative
initrd, such that e.g. Debian-Installer can be packed into it.

# Other Brand Names

The CT-PC89E is beginning to appear under different brand names.

-   HJ-8901
    [[1]](http://www.alibaba.com/product-gs/277571430/8_9_TFT_LED_2GB_NAND.html)
    - this page states that the machine is suitable for WINCE, which is
    not supplied (the page used to state that the OSes Linux and Lunix
    were preinstalled).

# See also

-   [CT-PC89E/Emdebian](http://eLinux.org/CT-PC89E/Emdebian "CT-PC89E/Emdebian")

# External links

-   [http://www.youtube.com/watch?v=3\_SlGTNj4vY](http://www.youtube.com/watch?v=3_SlGTNj4vY)
-   [http://www.youtube.com/watch?v=RzzUj8VM1nE](http://www.youtube.com/watch?v=RzzUj8VM1nE)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CT-PC89E](http://eLinux.org/index.php?title=Category:CT-PC89E&action=edit&redlink=1 "Category:CT-PC89E (page does not exist)")

