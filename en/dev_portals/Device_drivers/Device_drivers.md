> From: [eLinux.org](http://eLinux.org/Device_drivers "http://eLinux.org/Device_drivers")


# Device drivers



## Manuals

-   [Linux kernel internals reference,
    wikibook](http://en.wikibooks.org/wiki/The_Linux_Kernel) - under
    construction
-   [Linux Device Drivers, 3rd Edition](http://www.makelinux.net/ldd3/)
-   [Tutorial for writing parallel port
    driver](http://www.makelinux.net/reference.d/drivers_linux)

## Sample drivers

-   [LDT - Linux Driver Template](https://github.com/makelinux/ldt/) -
    sample template of Linux device driver for learning and starting
    source for a custom driver. Implements UART char device driver for
    example. Uses following Linux facilities: module, platform driver,
    file operations (read/write, mmap, ioctl, blocking and nonblocking
    mode, polling), kfifo, completion, interrupt, tasklet, work,
    kthread, timer, misc device, proc fs, UART 0x3f8, HW loopback, SW
    loopback, ftracer. The code is in working condition and runs with
    test script.
-   [LDD3 - Samples for boot Linux Device Driver, 3rd edition,
    updated](https://github.com/martinezjavier/ldd3/), compiled with
    kernel 3.2.0
    -   [pci\_skel.c](https://github.com/martinezjavier/ldd3/blob/master/pci/pci_skel.c)
        - PCI skeleton
    -   [sbull.c](https://github.com/martinezjavier/ldd3/blob/master/sbull/sbull.c)
        - simple block device
    -   [scull](https://github.com/martinezjavier/ldd3/tree/master/scull)
        - simple char device
    -   [snull.c](https://github.com/martinezjavier/ldd3/blob/master/snull/snull.c)
        - simple network device
-   [vivi.c - Virtual Video driver, uses
    V4L2](http://lxr.free-electrons.com/source/drivers/media/video/vivi.c)
    - works
-   [mem2mem\_testdev.c - virtual v4l2-mem2mem example device
    driver](http://lxr.free-electrons.com/source/drivers/media/video/mem2mem_testdev.c)
-   [usb-skeleton.c - USB driver
    skeleton](http://lxr.free-electrons.com/source/drivers/usb/usb-skeleton.c)
    (can be compiled with trivial fix)
-   [skeletonfb.c - Frame Buffer device
    skeleton](http://lxr.free-electrons.com/source/drivers/video/skeletonfb.c)
    (can't be compiled)
-   [pcihp\_skeleton.c - PCI Hot Plug Controller Skeleton
    Driver](http://lxr.free-electrons.com/source/drivers/pci/hotplug/pcihp_skeleton.c)
-   [loopback.c - simple net\_device implementing ifconfig
    lo](http://lxr.free-electrons.com/source/drivers/net/loopback.c)
-   [gpio\_driver - simple GPIO driver for Raspberry Pi model
    B+](https://github.com/23ars/linux_gpio_driver) ( not fully tested
    yet)

## Resources

-   [Device Tree](../../dev_portals/Device_Tree/Device_Tree.md "Device Tree") - information about device
    tree (increasingly required for new embedded drivers)


