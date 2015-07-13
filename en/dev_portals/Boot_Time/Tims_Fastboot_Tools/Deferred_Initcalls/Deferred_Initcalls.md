> From: [eLinux.org](http://eLinux.org/Deferred_Initcalls "http://eLinux.org/Deferred_Initcalls")


# Deferred Initcalls



## Contents

-   [1 Introduction](#introduction)
-   [2 Description](#description)
-   [3 How to use](#how-to-use)
    -   [3.1 deferred USB initcall
        example](#deferred-usb-initcall-example)
-   [4 Patch](#patch)

## Introduction

An "initcall" is the initialization function for a module which is
statically linked into the Linux kernel. Running of initcalls can
consume a large amount of time during bootup. However, some modules do
not need to be initialized so early, in order for the embedded device to
become usable for its primary purpose. These initcalls can be run later,
after first boot (and possibly first use) has completed.

For example, many digital cameras have USB buses, which need to be
initialized in order for the camera to be used as a mass storage device
(to download pictures to a desktop computer). However, the USB buses do
not need to be initialized for the primary use of the camera, which is
to take pictures. In order to be able to take a picture as soon as
possible after booting, initialization of the USB system in the kernel
can be deferred until after the primary boot sequence for the camera.

## Description

Using a short patch (available for kernel version 2.6.27) it is possible
to avoid running certain initcalls at bootup time. The way this patch
works is that the developer selects some initcalls that they want to
defer and modifies the declaration of those initcalls.

When the system is booted, those initcalls are not called in their
normal sequence. When the system is done with primary boot, an
application from user space triggers the calling of the deferred
initcalls, using a flag in the /proc filesystem.

When the flag is set, the deferred initcalls are run, and the kernel
memory for the "init" segment is finally freed.

## How to use

To use deferred initcalls, first you need to identify the modules that
are not required for the primary functionality of the product, and which
are taking too long to initialize. (See [Initcall
Debug](../../../.././dev_portals/Boot_Time/Tims_Fastboot_Tools/Deferred_Initcalls/Initcall_Debug/Initcall_Debug.md "Initcall Debug") for this.)

Using the example above of the digital camera and USB, you could
identify uhci\_hcd\_usb and ehci\_hcd\_init as two initcalls that could
be deferred.

Change the module init routine declaration for the initcalls you wish to
defer. This is done in the Linux kernel source code. For example,
change:

    module_init(foo_init)

    deferred_module_init(foo_init)

Modules marked like this are not initialized during kernel boot

After main init, do:

     cat /proc/deferred_initcalls

This will cause the kernel to run all deferred initcalls. Also the .init
section memory is freed by kernel. The contents of
/proc/deferred\_initcalls will return 0 if deferred initcalls were not
yet run, and 1 otherwise on subsequent reads.

### deferred USB initcall example

As a test, on an X86 desktop system, I deferred the initialization of
the USB subsystem on a 2.6.27 kernel, by using deferred\_module\_init on
the functions: ehci\_hcd\_init and uhci\_hcd\_init

This resulted in a total times savings of 530 milliseconds, during the
kernel boot phase. (Of course, this time was used subsequently when the
deferred initcalls were triggered later on.)

Specifially, I changed:

    module_init(ehci_hcd_init)

to

    deferred_modle_init(echi_hcd_init)

and

    module_init(uhci_hcd_init)

to

    deferred_module_init(uhci_hcd_init)

## Patch

Here is the main deferred initcalls patch for 2.6.26, 2.6.27:
[Media:Deferred\_initcalls.patch](http://eLinux.org/images/1/18/Deferred_initcalls.patch "Deferred initcalls.patch")

For 2.6.28 the forward-ported patch is here:
[Media:Deferred\_initcalls-2.6.28.patch](http://eLinux.org/images/b/b4/Deferred_initcalls-2.6.28.patch "Deferred initcalls-2.6.28.patch")

For 3.10 the patch is here:
[Media:0001-Port-deferred-initcalls-to-3.10.patch](http://eLinux.org/images/5/51/0001-Port-deferred-initcalls-to-3.10.patch "0001-Port-deferred-initcalls-to-3.10.patch")

Here (inline) is a patch showing modification of USB and IDE initcalls
to be be deferred initcalls:
 (This patch is also available downloadable as:
[Media:Defer-usb-and-ide-initcalls.patch](http://eLinux.org/images/9/94/Defer-usb-and-ide-initcalls.patch "Defer-usb-and-ide-initcalls.patch"))

    commit e7a5b8bb6a5d04054dec1e85d53bbe115059d0d0
    Author: Tim Bird <tim.bird@am.sony.com>
    Date:   Fri Sep 12 11:35:58 2008 -0700

        Use deferred_module_init on long-probing IDE and USB modules.
        These modules were taking about 700 ms and 400 ms, respectively
        to initialize.  On many embedded systems, these initializations
        can be done after major boot activity is completed, with no
        loss of functionality.

    diff --git a/drivers/ata/ata_piix.c b/drivers/ata/ata_piix.c
    index e9e32ed..cb2ebf3 100644
    --- a/drivers/ata/ata_piix.c
    +++ b/drivers/ata/ata_piix.c
    @@ -1494,5 +1494,5 @@ static void __exit piix_exit(void)
        pci_unregister_driver(&piix_pci_driver);
     }

    -module_init(piix_init);
    +deferred_module_init(piix_init);
     module_exit(piix_exit);
    diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
    index 8409e07..44a8340 100644
    --- a/drivers/usb/host/ehci-hcd.c
    +++ b/drivers/usb/host/ehci-hcd.c
    @@ -1107,7 +1107,7 @@ clean0:
     #endif
        return retval;
     }
    -module_init(ehci_hcd_init);
    +deferred_module_init(ehci_hcd_init);

     static void __exit ehci_hcd_cleanup(void)
     {
    diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
    index 3a7bfe7..9c27ef0 100644
    --- a/drivers/usb/host/uhci-hcd.c
    +++ b/drivers/usb/host/uhci-hcd.c
    @@ -999,7 +999,7 @@ static void __exit uhci_hcd_cleanup(void)
        kfree(errbuf);
     }

    -module_init(uhci_hcd_init);
    +deferred_module_init(uhci_hcd_init);
     module_exit(uhci_hcd_cleanup);

     MODULE_AUTHOR(DRIVER_AUTHOR);


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

