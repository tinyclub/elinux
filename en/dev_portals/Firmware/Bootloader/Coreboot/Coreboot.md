> From: [eLinux.org](http://eLinux.org/Coreboot "http://eLinux.org/Coreboot")


# Coreboot



Coreboot (formerly known as LinuxBIOS) is a free and open source
BIOS/Firmware implementation intended to replace common proprietary BIOS
firmwares.

In contrast to conventional BIOS it tries to initialize only the minimum
required hardware (like RAM, PCI, serial) and leave the rest to a
payload (which usually re-configures these parts anyway)

This payload can either be a conventional bootloader (like
[Grub2](http://eLinux.org/index.php?title=Grub2&action=edit&redlink=1 "Grub2 (page does not exist)"),
[FILO](http://eLinux.org/index.php?title=FILO&action=edit&redlink=1 "FILO (page does not exist)")),
a Kernel/ELF executable (like e.g. the [Linux
Kernel](http://eLinux.org/index.php?title=Linux_Kernel&action=edit&redlink=1 "Linux Kernel (page does not exist)"),
[memtest86](http://eLinux.org/index.php?title=Memtest86&action=edit&redlink=1 "Memtest86 (page does not exist)"),
[plan9](http://eLinux.org/index.php?title=Plan9&action=edit&redlink=1 "Plan9 (page does not exist)")
or
[etherboot](http://eLinux.org/index.php?title=Etherboot&action=edit&redlink=1 "Etherboot (page does not exist)"))
or some other Firmwares like
[UEFI](http://eLinux.org/index.php?title=UEFI&action=edit&redlink=1 "UEFI (page does not exist)"),
[Open
Firmware](http://eLinux.org/index.php?title=Open_Firmware&action=edit&redlink=1 "Open Firmware (page does not exist)"),
[OpenBios](http://eLinux.org/index.php?title=OpenBios&action=edit&redlink=1 "OpenBios (page does not exist)")
and
[SeaBios](http://eLinux.org/index.php?title=SeaBios&action=edit&redlink=1 "SeaBios (page does not exist)").

With this two-stage approach minimal boot times (\<= \~1 sec on x86) and
a small memory footprint can be achieved.

Currently over 230 Mainboards are supported and since a port from
[U-Boot](http://eLinux.org/U-Boot "U-Boot") coreboot know also supports the ARM
architecture.


 One pretty famous subproject is the
[flashrom](http://eLinux.org/index.php?title=Flashrom&action=edit&redlink=1 "Flashrom (page does not exist)")
tool that is often used to upgrade conventional BIOS on Linux.

## Ressources

-   [coreboot homepage](http://www.coreboot.org)
-   [Really Fast x86 boot talk
    (video)](http://free-electrons.com/pub/video/2011/fosdem/fosdem2011-marek-fast-x86-boot.webm)
    from Rudolf Marek at [Fosdem
    2011](http://archive.fosdem.org/2011/schedule/event/fast_x86_boot)
-   [Conference talk by Peter Stuge at Embedded Linux Conference Europe
    2008
    (video)](http://free-electrons.com/pub/video/2008/elce/nluug-fall2008-stuge-coreboot.ogv)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Bootloaders](http://eLinux.org/Category:Bootloaders "Category:Bootloaders")
-   [Firmware](http://eLinux.org/index.php?title=Category:Firmware&action=edit&redlink=1 "Category:Firmware (page does not exist)")

