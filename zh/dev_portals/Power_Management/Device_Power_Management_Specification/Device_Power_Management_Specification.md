> From: [eLinux.org](http://eLinux.org/Device_Power_Management_Specification "http://eLinux.org/Device_Power_Management_Specification")


# Device Power Management Specification



## Contents

-   [1 Background](#background)
    -   [1.1 Terminology](#terminology)
    -   [1.2 Device Suspend/Resume
        Discussion](#device-suspend-resume-discussion)
-   [2 Specification](#specification)
-   [3 Non-normative notes](#non-normative-notes)

## Background

Various devices on embedded platforms upport low-power states that can
be employed by CE products at times when full operation of the device is
not required. The ability to manage device power usage may be crucial to
many CE products, especially those powered by batteries.

Generic Linux contains some support for these topics. However, device
suspend/resume support is not a priority at present, and neither is
support for embedded platforms. This specification addresses the
potential lack of device power management features on a platform used
for CE products by requiring that a CELF-conforming Linux for that
platform support its basic device power management capabilities. This
specification also requires a minimal set of functionality closely
associated with device power management. The basic capabilities outlined
here may be extended by future CELF specifications that cover additional
features useful for CE products.

### Terminology

 CE platform device 
 : A device that is closely associated with the platform, that is
supported by a Linux driver under an open-source license, and that may
reasonably be expected to appear in an actual consumer electronics
product based on the platform. See further discussion below.



 Device resume 
 : The process of restoring the state of a device that was previously
suspended to normal operation.



 Device suspend 
 : The process of placing a device into a device suspend state, and/or
of preparing the device for a system suspend. This may occur for such
reasons as explicit instructions to power down an unneeded device by an
application, or as part of a system suspend. Depending on the platform
and device, device suspend may include saving state to allow later
restoration of state at device resume time.



 Device suspend state 
 : A reduced-power state supported by a device. Many, but not all,
devices support at least one device suspend state, which may prevent
operation of the device until a device resume is performed. The various
device suspend states may be activated by device-specific interfaces
and/or automatic criteria, or may follow standards such as ACPI. This
specification primarily targets reduced-power states that are activated
by the device driver when needed (rather than automatic hardware
mechanisms, such as inactivity timers).



### Device Suspend/Resume Discussion

Device suspend may occur for reasons that include:

-   -   an application explicitly manipulates device state, such as to
        power down a device no longer required by the application
    -   a system suspend occurs, which suspends all devices prior to
        suspending the system
    -   a power policy management subsystem, such as DPM, places the
        system in a state that is incompatible with operation of the
        device
    -   a hardware or software mechanism triggers a low-power state
        after a period of inactivity
    -   the driver powers down the device because applications no longer
        hold an open reference to the device

In many cases, CELF specifies support for evaluation or reference
boards, based on which CE products may be derived using a custom
hardware design that incorporates the processor and various devices.
This specification targets only devices and drivers termed "CE platform
devices" here, which meet these criteria:

-   The device is closely associated with the platform. A CE platform
    device may be physically located on a single-board computer or in
    some other way be tightly coupled to the platform supported by
    CELF-conforming kernel source, such that its presence is likely in
    many products that may be based on the platform. Devices not
    included in this definition include arbitrary cards that plug into
    buses provided on the platform, such as PCI or PCMCIA, or that may
    be attached in custom hardware designs.
-   The device is supported by a Linux driver under an open-source
    license.
-   The device may reasonably be expected to appear in an actual
    consumer electronics product based on the platform. A CE platform
    device may be distinguished from devices that are present on
    evaluation or reference boards for development or debugging
    purposes, such as an ethernet interface that is unlikely to appear
    in an actual CE product.

This specification targets CE platform devices exclusively, in order to
give product designers the necessary tools to save power in actual
product configurations. This distinction is made in order to avoid
mandating power management capabilities for:

-   devices not present in the CELF-supported evaluation/reference
    boards
-   devices for which no open source driver has been made available
-   devices that serve only a development or diagnostic function

Device state may need to be be saved during the device suspend
operation, such that device operation can later be restored to
approximately the same condition at device resume. If so, device state
is typically saved in SDRAM since SDRAM is usually powered (perhaps in
self-refresh state) during the suspend interval -- a platform that does
not preserve SDRAM during suspend generally must reboot at resume time,
whereupon device state can be restored from stable storage if needed.

System suspend may remove power from some or all devices, depending on
the platform and the particular system suspend state entered, leaving
the devices unpowered during the suspend interval and restoring power at
system resume. This may affect the manner in which device resume occurs
during system resume, since recovering from a power cycle may require
different procedures than are needed for individual device
suspend/resume. This may also affect the actions to be taken to
accomplish a device suspend during system suspend; for example, entering
a low-power suspend state may not be useful if the platform is about to
remove power from the device.

## Specification

1.  If a CE platform device that supports device suspend/resume actions,
    then both kernel programmatic interfaces and userspace interfaces
    MUST be provided to individually perform device suspend and device
    resume for only that device. These interfaces SHOULD suspend other
    devices that depend upon the selected device for correct operation.
    Other devices that do not depend upon the selected device for
    correct operation MUST NOT be suspended or resumed by these
    interfaces.

1.  If a CE platform device supports a device suspend state, or if any
    actions are needed in order to correctly resume device operation
    after a system resume from at least one system suspend state
    supported by the Linux kernel, then the driver for the device SHOULD
    implement the support necessary for the device suspend and resume
    interfaces.

1.  If a CE platform device supports one device suspend state, then the
    device suspend processing performed by the driver for the device
    MUST be capable of causing the device to enter the supported device
    suspend state. Where multiple device suspend states are available,
    the driver SHOULD be capable of entering each of these states.

1.  The device resume processing performed by the driver for a CE
    platform device SHOULD restore device operation to approximate pre-
    suspend conditions.

1.  A mechanism for requesting device suspend for all active CE platform
    devices at system suspend time MUST be provided. A mechanism for
    system resume to restore to an active state all CE platform devices
    that were in an active state prior to system suspend MUST be
    provided.

1.  It is RECOMMENDED that drivers place devices into low-power states
    when not in use or after a period of inactivity.

1.  It is RECOMMENDED that drivers and platform support code make use of
    hardware features to automatically place devices into lower-power
    states, such as to stop clocks (sometimes referred to as "automatic
    clock gating"), after a period of inactivity or when the hardware is
    in some manner able to detect that the device is not in use.

## Non-normative notes

Among the choices for device suspend/resume interfaces are:

-   -   -   The Linux 2.5/2.6 Linux Driver Model (LDM) implements a
            kernel API for driver suspend and resume functions. LDM also
            provides a kernel API for calling drivers to suspend all
            devices at system suspend, and to restore normal operation
            of the devices at system resume.
        -   The Linux 2.5/2.6 sysfs filesystem exports interfaces that
            applications may use to suspend and resume devices
            (individually); these interfaces call the LDM driver suspend
            and resume kernel [APIs](http://eLinux.org/APIs "APIs").
        -   APM function calls (such as pm\_register) for device
            suspend/resume. Note that these interfaces are generally
            being replaced with Linux Driver Model interfaces in future
            Linux versions.

A version of the Linux 2.5/2.6 technology described above has been
backported to Linux 2.4 for use in CELF-conforming systems based on the
2.4 Linux kernel.

Comments on the 4.5.2 specification section are the following:

-   4.5.2.4 and 4.5.2.6 does not make specific requirements upon devices
    that may change state in significant ways between device suspend and
    device resume, for example, a controller for a hotpluggable bus such
    as PCMCIA or MMC, where the consumer may insert or eject cards
    during the suspend interval.

-   4.5.2.5: In 2.6 kernel,Linux Driver Model (LDM) has this mechanism.
    CE platform devices that are already suspended via a previous
    individual device suspend should be skipped, if it is not necessary
    to perform any further device suspend processing prior to a system
    suspend (such as to save state in RAM in preparation for power-off).
    Devices that were already individually suspended prior to system
    suspend should be left in a suspended state after system resume.

-   4.5.2.6: For example, when the last open file descriptor for a
    device is closed, the driver may suspend the device.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Specification](http://eLinux.org/Category:Specification "Category:Specification")

