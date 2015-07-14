> From: [eLinux.org](http://eLinux.org/Blob "http://eLinux.org/Blob")


# Blob



Boot Loader OBject

originally written for a Intel StrongArm SA-1100 based board as part of
the [LART Project](http://eLinux.org/LART_Project "LART Project"). It was ported to
several different platforms, but due to it's initial development being
targeted at a single platform, porting it to other devices not based on
the Intel StrongArm series proved difficult. the project has become
defunct in favor of more robust bootloaders such as [APEX](http://eLinux.org/APEX "APEX")
and [U-Boot](http://eLinux.org/U-Boot "U-Boot").

Blob can…

       * initialise the hardware (CPU speed, memory, interrupts, RS232)
       * boot a linux kernel and provide it with a ramdisk
       * download a kernel or a ramdisk to the LART
       * write a freshly downloaded kernel or ramdisk to flash memory
       * determine the memory layout (and tell the kernel about the results)
       * give a command line to the kernel

[BLOB Project Page](http://www.lartmaker.nl/lartware/blob/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Bootloaders](http://eLinux.org/Category:Bootloaders "Category:Bootloaders")

