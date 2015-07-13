> From: [eLinux.org](http://eLinux.org/Blackfin "http://eLinux.org/Blackfin")


# Blackfin



The Blackfin processor was designed by and is manufactured by Analog
Devices ([Board and Chip
Vendors\#A](http://eLinux.org/Board_and_Chip_Vendors#A "Board and Chip Vendors")).
Several boards that include a Blackfin processor are available
([Hardware
Hacking\#Blackfin](http://eLinux.org/Hardware_Hacking#Blackfin "Hardware Hacking")).

All Blackfin processors include Debug/[JTAG](http://eLinux.org/JTAG "JTAG") Interface for
in-system debugging.

Blackfin processors are fast enough to support real-time H.264 video
encoding.

The Blackfin processor documentation describes a Memory Management Unit
(MMU), but this is not a MMU in the sense that most people expect: it
has no Virtual Memory (VM) support. It does however provide all other
aspects associated with your typical MMU on a variable page sized basis
such as Memory Protection (read/write/execute) and caching. The
documentation refers to these mappings as the Cacheability Protection
Lookaside Buffer (CPLD) tables and are similar to TLBs in most other
processor architectures.

As such, all current Blackfin parts can only run Linux with MMU support
turned off (what people have historically thought of as "uClinux").

The processors also fully enforces privileged execution -- the classical
user / supervisor permission split. The Linux kernel runs in supervisor
mode where it has full access to the hardware while the Linux userspace
runs in user mode and prevents tampering with hardware resources.

## Further reading

-   the [Blackfin Linux wiki](http://docs.blackfin.uclinux.org/)
-   the [Blackfin Open Source Koop](http://blackfin.uclinux.org/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Processors](http://eLinux.org/Category:Processors "Category:Processors")

