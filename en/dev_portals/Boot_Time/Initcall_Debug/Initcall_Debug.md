> From: [eLinux.org](http://eLinux.org/Initcall_Debug "http://eLinux.org/Initcall_Debug")


# Initcall Debug



## Introduction

Passing the option "initcall\_debug" on the kernel command line will
cause timing information to be printed to the console for each initcall.
initcalls are used to initialize statically linked kernel drivers and
subsystems and contribute a significant amount of time to the Linux boot
process. The output looks like this:

    calling ipc_init+0x0/0x28 @ 1
    msgmni has been set to 42
    initcall ipc_init+0x0/0x28 returned 0 after 1872 usecs

You can use 'dmesg' to see the messages after the kernel has booted.
With a short 'sed' script, you can reorder the final 'timing' line, and
sort the initcalls numerically by duration. Here is a command to do
this:

    dmesg -s 128000 | grep "initcall" | sed "s/\(.*\)after\(.*\)/\2 \1/g" | sort -n

## Sample output

Here is some sample output from the above command sequence. This was on
an old X86-based desktop system. [Printk
Times](http://eLinux.org/Printk_Times "Printk Times") was turned on (hence the extra
timestamp on each line.)

    24 msecs [ 2.237177] initcall acpi_button_init+0x0/0x51 returned 0
    28 msecs [ 0.763503] initcall init_acpi_pm_clocksource+0x0/0x16c
    returned 0
    32 msecs [ 0.348241] initcall acpi_pci_link_init+0x0/0x43 returned 0
    
    33 msecs [ 0.919004] initcall inet_init+0x0/0x1c7 returned 0
    33 msecs [ 5.282722] initcall psmouse_init+0x0/0x5e returned 0
    54 msecs [ 2.979825] initcall e100_init_module+0x0/0x4d returned 0
    71 msecs [ 0.650325] initcall pnp_system_init+0x0/0xf returned 0
    91 msecs [ 0.872402] initcall pcibios_assign_resources+0x0/0x85
    returned 0
    187 msecs [ 4.369187] initcall ehci_hcd_init+0x0/0x70 returned 0
    245 msecs [ 2.777161] initcall serial8250_init+0x0/0x100 returned 0
    673 msecs [ 5.098052] initcall uhci_hcd_init+0x0/0xc1 returned 0
    830 msecs [ 4.067279] initcall piix_init+0x0/0x27 returned 0
    1490 msecs [ 8.290606] initcall ip_auto_config+0x0/0xd70 returned 0

## Notes

Using initcall\_debug increases the amount of messages produced by the
kernel during system boot. It's a good idea to increase the printk log
buffer size to avoid overflowing the log buffer. To do this, increase
the value of CONFIG\_LOG\_BUF\_SHIFT from 14 to 18. This increases the
log buffer from the default size of 16k to 256K.

You will need to enable CONFIG\_PRINTK\_TIME and CONFIG\_KALLSYMS in
your kernel configuration for this to work correctly. The first option
displays printk timings and the second option ensures that function
names are printed rather than memory addresses.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

