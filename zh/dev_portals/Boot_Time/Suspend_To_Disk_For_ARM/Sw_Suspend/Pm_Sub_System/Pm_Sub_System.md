> From: [eLinux.org](http://eLinux.org/Pm_Sub_System "http://eLinux.org/Pm_Sub_System")


# Pm Sub System



## Contents

-   [1 Pm Sub System](#pm-sub-system)
    -   [1.1 OLD PM model](#old-pm-model)
        -   [1.1.1 Register handlers](#register-handlers)
        -   [1.1.2 Call handlers](#call-handlers)
        -   [1.1.3 API of handler](#api-of-handler)
    -   [1.2 NEW PM model](#new-pm-model)
        -   [1.2.1 Register handlers](#register-handlers-2)
        -   [1.2.2 Call handlers](#call-handlers-2)
            -   [1.2.2.1 Internal Sequence of Device
                PM](#internal-sequence-of-device-pm)
            -   [1.2.2.2 Internal Sequence of System
                PM](#internal-sequence-of-system-pm)
        -   [1.2.3 API of handlers](#api-of-handlers)
        -   [1.2.4 PM\-OPS](#pm-ops)
-   [2 Resources](#resources)
-   [3 Questions](#questions)

## **Pm Sub System**

This document describes OLD and NEW PM model in linux kernel 2.6.8.



### OLD PM model

This interface set cannot handle appropriately power dependencies
constrained by geometrical connections. For example, PCI devices have to
be turned off before the PCI bus turned off. So new interfaces which
work with LDM have been introduced in 2.6.x to replace the following OLD
PM interfaces (now) in "kernel/power/pm.c". (These routines were in the
file kernel/pm.c in 2.4.x)



    pm_register();
    pm_unregister();
    pm_unregister_all();
    pm_send();
    pm_send_all();
    pm_find();


 Also, device drivers were requested to make calls to `{pm_access()`
when they accessed their devices, and `pm_dev_idle()` when a device was
not being used, so the system could keep track of device and system
idleness.



    pm_access();
    pm_dev_idle();



#### Register handlers

Device drivers may register a callback handler for each device driver,
using pm\_register(). The callback handler is required to handle both
the suspend and resume operations. The handler is placed on the double
linked list "pm\_devs" with this function.

#### Call handlers

The PM subsystem sends PM messages to the registered handlers by calling
the routines pm\_send() and pm\_send\_all(). For example, the APM
routines under "arch/i386/kernel/apm.c" demonstrates the use of
pm\_send\_all().

The routine pm\_send\_all() calls all the handlers registered with
pm\_register(), in the order they were registered. Please refer
"kernel/power/pm.c" for details.

*Note that in 2.4, apm.c::suspend() only called pm\_send\_all(), but in
2.6 it* now calls pm\_send\_all(), followed by calls to
device\_suspend(3) and device\_power\_down(3).

    TRB

#### API of handler

    int suspend_resume_callback_handler(struct pm_dev *, pm_request_t, void *)


      1st arg: target device
      2nd arg: request type
        PM_SUSPEND
        PM_RESUME
      3rd arg: place holder for extra data

      return values:
        0 ... success
        otherwise ... fail



### NEW PM model

The PM model has been modified in 2.6 to work with LDM (Linux Device
Model) Most devices are connected to the system through a bus, and power
management operations on such devices need to work in conjunction with
code which manages the related.

#### Register handlers

LDM records a separate suspend and resume handler routine for each bus
type as parts of its own structure, of type "struct bus\_type", using
bus\_register(),

E.g drivers/pci/pci-driver.c

        struct bus_type pci_bus_type = {
                .name           = "pci",
                .match          = pci_bus_match,
                .hotplug        = pci_hotplug,
                .suspend        = pci_device_suspend,
                .resume         = pci_device_resume,
        };

        static int __init pci_driver_init(void)
        {
                return bus_register(&pci_bus_type);
        }


 Each bus driver has a device register function, like
platform\_device\_register() in drivers/base/platform.c (The
platform\_device\_register() registers devices under "Platform."
"Platform" abstracts unstructured device connections and legacy device
connections.)

Each device driver can register their own suspend and resume handlers
through the bus specific device register function, describe as above.
Each bus device driver could have bus-specific device-suspend,
device-resume handler and handler-register-function. That means the
interfaces for those function could be different for each bus type.

E.g. For PCI, drivers/pci/pci-driver.c:

        static int pci_device_suspend(struct device * dev, u32 state)
        {
                struct pci_dev * pci_dev = to_pci_dev(dev);
                struct pci_driver * drv = pci_dev->driver;

                if (drv && drv->suspend)
                        return drv->suspend(pci_dev,state);
                return 0;
        }


 For "Platform", drivers/base/platform.c:

        static int platform_suspend(struct device * dev, u32 state)
        {
                int ret = 0;

                if (dev->driver && dev->driver->suspend) {
                        ret = dev->driver->suspend(dev, state,
                        SUSPEND_DISABLE);
                        if (ret == 0)
                                ret = dev->driver->suspend(dev, state, SUSPEND_SAVE_STATE);
                        if (ret == 0)
                                ret = dev->driver->suspend(dev, state, SUSPEND_POWER_DOWN);
                }
                return ret;
        }



#### Call handlers

The PM code in the 2.6 kernel is based on Software Suspend/Resume Open
Source project, mentioned as "swsusp". The design of "swsusp" is deeply
influenced by ACPI. Most code assumes the power state value "0" means
power-on corresponding D0 state of ACPI and "3" means power-off
corresponding to D3 state of ACPI respectively.

There are two ways of controlling device power. One is a Device Power
Management, called as Device PM or DPM in short. Another is System Level
Power Management. We refer to this as System PM.



##### Internal Sequence of Device PM

With Device PM, user can now turn on and off individual devices through
the /sys interface.

For example,

    % echo 3 > /sys/bus/usb/devices/1-1/power/state

means turning off the specified device.



    % echo  n > /sys/bus/usb/devices/1-1/power/state

-   -   -   when n == 0

<!-- -->

        state_store()            [drivers/base/power/sysfs.c]
             ->
            dpm_runtime_suspend()    [drivers/base/power/runtime.c]
                 ->
                suspend_device()    // suspend specified device
                        [drivers/base/power/suspend.c]
                     ->
                    call suspend handler of the bus which the specified
                        device belongs to .
                 ->
                        call suspend handler for the specified device

-   -   when n = 0

<!-- -->

        state_store()            [drivers/base/power/sysfs.c]
         -> dpm_runtime_resume()    [drivers/base/power/runtime.c]
             -> runtime_resume()    [driver/base/power/runtime.c]
                 -> resume_device()    // resume specified device
                        [driver/base/power/resume.c]
                         -> call resume handler of the bus which the specified
                           device belongs to .
                -> call resume handler for the specified device



##### Internal Sequence of System PM

With System Level PM, user can turn off and on the entire system. This
interface is implemented as /sys/power/state and pm\_suspend(). There is
no mechanism for a System level resume, because there is no way for a
suspended system to initiate a resume from software.



    % echo "standby" > /sys/power/state



        state_store()            [kernel/power/main.c]
        -> enter_state()        [kernel/power/main.c]
               :
         go with the same route when pm_suspend() called



    pm_suspend()                [kernel/power/main.c]



        enter_state()            [kernel/power/main.c]
        ->suspend_prepare()        [kernel/power/main.c]
          ->
            pm_prepare_console()    [kernel/power/console.c]
            freeze_processes()        [kernel/power/process.c]
            pm_ops->prepare()
            device_suspend()        // called with "irq on"
                        [driver/base/power/suspend.c]
            ->
              suspend_device(), foreach device on the "dpm_active" list
                        [driver/base/power/suspend.c]
              move the entry from "dpm_active" to "dpm_off"
              or "dpm_off_irq" on suspend handler returns -EAGAIN

          suspend_enter()        [kernel/power/main.c]
          ->
            local_irq_save()
            device_power_down()     // called with "irq off"
                        [drivers/base/power/suspend.c]
            ->
              suspend_device(), foreach device on the "dpm_off_irq" list
                        [drivers/base/power/suspend.c]
              sysdev_suspend()        [drivers/base/sys.c]
            pm_ops->enter()        // System will down here
            device_power_up()          // called with "irq off"
                        [drivers/base/power/resume.c]
            ->
              sysdev_resume()        [drivers/base/sys.c]
              dpm_power_up()        [drivers/base/power/resume.c]
              ->
            resume_device(), foreach device on the "dpm_off_irq" list
                        [driver/base/power/suspend.c]
            move the entry from "dpm_irq_off" to "dpm_active"
            local_irq_restore()
          suspend_finish()        [kernel/power/main.c]
          ->
            device_resume()        // called with "irq on"
                        [drivers/base/power/resume.c]
            ->
              dpm_resume()        [drivers/base/power/resume.c]
              ->
            resume_device(), foreach device on the "dpm_off" list.
            move the entry to "dpm_active" from "dpm_off"
            pm_ops->finish()        // target PM specific
            thaw_processes()        [kernel/power/process.c]
            pm_restore_console()    [kernel/power/console.c]





    suspend_device()        [drivers/base/power/suspend.c]
        ->
          call suspend handler the bus which the specified
              device belongs to .
          ->
            call suspend handler for the specified device





    sysdev_suspend()          [drivers/base/sys.c]
          for each kernel susbsys and class
            call suspend handler for each driver on "global_drivers",
              registered with sysdev_register().
            call a suspend handler for each driver under the class.
            call a suspend handler for the class



    sysdev_resume()        [drivers/base/sys.c]
          for each kernel susbsys and class
            call a resume handler for the class
            call a resume handler for each driver under
            the class.
            call resume handler for each driver on "global_drivers",
            registered with sysdev_register().



    resume_device()        [drivers/base/power/resume.c]
        ->
          call resume handler of the bus which the specified
              device belongs to.
          ->
            call resume handler for the specified device



#### API of handlers

Following two methods are prepared in struct "bus\_types" in
include/linx/pm.h to hold bus specific suspend/resume handlers for
adapting device suspend/resume methods to bus specific ways.

First, the PM subsystem calls looks up the bus, which the specified
device belongs to. Then it calls bus specific suspend/resume handler to
suspend/resume the specified device. In most case, bus specific
suspend/resume handler calls the device specific suspend/resume handler.




    struct bus_types {
                                :
                                :
          int        (*suspend)(struct device * dev, u32 state);
          int        (*resume)(struct device * dev);
    };

          (*suspend)()
            1st arg: target device
            2nd arg: PM state to be entered
                PM_SUSPEND_STANDBY,
                PM_SUSPEND_MEM,
                PM_SUSPEND_DISK

            return values:
            0 ... success
            -EAGAIN ... try again later with "irq_off"
            otherwise ... fail

        (*resume)()
            1st arg: target device
            return values:
            0 ... success
            otherwise ... fail



#### PM\_OPS

Target PM subsystem stands for the instance of PM subsystem presented on
target system, adopting underlaying hardware and software requirements,
like ACPI or APM.

PM\_OPS provides target PM subsystem specific mthods to prepare, enter
and finish supsend.

For example, the ACPI PM subsystem uses the following method, in
drivers/acpi/sleep/main.c

    static struct pm_ops acpi_pm_ops = {
            .prepare        = acpi_pm_prepare,
            .enter          = acpi_pm_enter,
            .finish         = acpi_pm_finish,
    };



    - prepare()
     prepare() perform a target PM susbsystem specific prepareation before suspend.
     prepare() usually checks the state to be entered. prepare() has to return
     non-zero value, if operation was failed.

    - enter()
     enter() provide a target PM susbsystem specific method to suspend.
     For example, acpi_pm_enter() calls ACPI bios serivce.
     Platform will stop/sleep in enter().  enter() has to return non-zero value,
     if operation was failed.

    - finish()
     finish() perform a PM susbsystem specific post-processing after platform
     comes back or prepare() failed. finish() has to return non-zero value,
     if operation was failed.

## Resources

    - I found the following paper while I was researching this information, however
      it is a little old and seems to be out of date.
      - Linux Kernel Power Management - Patrick Mochel, Open Source Development Labs

## Questions

    - What are the function in pm_ops for?

-   PM\_OPS provides target PM subsystem specific mthods to prepare,
    enter and finish supsend.

<!-- -->

    - What is relationship between LDM and kobjects?

-   The "Kobject" is an abstruction of hierarchical structured instance
    in the kernel. Each object has own name and refrence count, may have
    children and a parent, can be put into hierarchical tree and removed
    from it. "Kset" represents a set of "Kobject". [Sys
    Fs](http://eLinux.org/index.php?title=Sys_Fs&action=edit&redlink=1 "Sys Fs (page does not exist)")
    is designed to provide methods to acccess "Kobject".In other word,
    from user space, program can communicate each object thorugh [Sys
    Fs](http://eLinux.org/index.php?title=Sys_Fs&action=edit&redlink=1 "Sys Fs (page does not exist)")
    name sapce. LDM utilizes ""Kobject"" to maintain appearance of
    devices.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Power
    Management](http://eLinux.org/Category:Power_Management "Category:Power Management")

