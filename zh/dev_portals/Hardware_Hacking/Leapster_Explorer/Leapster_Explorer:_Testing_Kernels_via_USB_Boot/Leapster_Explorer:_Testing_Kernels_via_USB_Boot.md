> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_Testing_Kernels_via_USB_Boot "http://eLinux.org/Leapster_Explorer:_Testing_Kernels_via_USB_Boot")


# Leapster Explorer: Testing Kernels via USB Boot



## Summary

The Leapster Explorer includes a USB recovery function, designed to be
used in conjunction with LFConnect to recover the Leapster Explorer to a
known-working state. We can leverage this USB recovery function to
transfer kernels we want to test to the Leapster Explorer without having
to do a destructive write of the new kernel to the LX nand (which can be
dangerous). The result is an ability to test kernels on Leapster
Explorer using USB booting, just like we test kernels using UART or SD
kernel booting on the Didj.

## Prerequisites

[USB
Booting](http://eLinux.org/Leapster_Explorer:_USB_Boot "Leapster Explorer: USB Boot")

[CBF File
Format](http://eLinux.org/LeapFrog_Pollux_Platform:_File_Format_CBF "LeapFrog Pollux Platform: File Format CBF")

## Kernel Configuration

Modify lines 999-1008 of linux2.6/drivers/mtd/nand/lf1000.c as follows
to enable mounting of the onboard partitions:

    //if (gpio_get_boot_source_config() == SCRATCH_BOOT_SOURCE_USB)
    //{
    //  base_parts = partition_info_recovery;
    //  base_parts_nb = ARRAY_SIZE(partition_info_recovery);
    //}
    //else
    //{
        base_parts = partition_info;
        base_parts_nb = ARRAY_SIZE(partition_info);
    //}

You can then build your kernel as you normally would.

The bootloader expects the kernel to be in the Common Boot Format (cbf)
LeapFrog included a script in their sources. To create the 'cbf' in the
scripts directory, type:

    $ make_cbf.py

You now have a kernel ready for USB Booting.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

