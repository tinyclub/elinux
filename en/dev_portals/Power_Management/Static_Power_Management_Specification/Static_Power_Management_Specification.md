> From: [eLinux.org](http://eLinux.org/Static_Power_Management_Specification "http://eLinux.org/Static_Power_Management_Specification")


# Static Power Management Specification



## Contents

-   [1 Background](#background)
    -   [1.1 Scope](#scope)
    -   [1.2 Terminology](#terminology)
    -   [1.3 System Suspend/Resume
        Discussion](#system-suspend-resume-discussion)
-   [2 Specifications](#specifications)
-   [3 Non-normative notes](#non-normative-notes)

## Background

Embedded platforms typically offer one or more low-power system states
in which power consumption is lowered through such means as stopping
clocks and/or powering off some or all system components. CE products
may take advantage of these states to save power during periods of
inactivity by entering these states. This is particularly important
crucial to CE products powered by batteries.

Generic Linux contains some support for these topics. However, the
community emphasis is currently on certain features, primarily
hibernate-to-disk, for laptop/notebook computers based on
desktop-compatible processors (and powered by batteries much larger than
are used in many CE products, such that aggressive power savings may not
be as critical). Basic platform suspend/resume support as defined here
is not a priority at present, and neither is support for embedded
platforms. One of the largest efforts is for hardware based on the ACPI
standard, which is not implemented on most embedded platforms.

This specification addresses the potential lack of static power
management features on a platform used for CE products by requiring that
a CELF-conforming Linux for that platform support its basic system
suspend/resume capabilities. This specification also requires a minimal
set of functionality closely associated with static power management.
The basic suspend/resume capabilities outlined here may be extended by
future CELF specifications that cover additional features useful for CE
products.

### Scope

This specification generally covers the basic functionality needed in an
embedded linux system to save power by suspending and resuming operation
of the system, utilizing suspend states implemented by the platform. The
ability to suspend and resume systems is often referred to as "static
power management" in the CELF Power Management Working Group.

System suspend is usually a relatively lengthy procedure, undertaken
when an extended period of product inactivity is expected. This
procedure can thus be distinguished from the power state changes
controlled by more dynamic mechanisms, such as the IBM-MontaVista
Dynamic Power Management subsystem (DPM), which may be executed more
frequently during very brief idle periods, and are covered in separate
CELF power management specifications. The system power state
modifications made by dynamic power management schemes during brief idle
periods typically result in less power savings than do the system
suspend states covered in this specification. Furthermore, the dynamic
power management state modifications normally have lower entry and exit
latencies than do system suspend states, and require few or no
interactions with device drivers. A system suspend, on the other hand,
may take a noticeable amount of time to suspend and resume, and in many
cases requires interactions with device drivers to save state and/or to
enter and exit device suspend states.

A related topic not explicitly covered in this specification is
"hibernate-to-disk", where system state is saved to a stable storage
device (such as a hard disk) during a system suspend and restored from
storage at system resume. The state saved usually includes most or all
of RAM. This type of system suspend/resume is commonly implemented for
laptop/notebook computers. Because the more specialized nature of
hibernate-to-disk (which is typically a software feature not tied to the
specifics of the base platform or devices), as well as the fact that
this functionality is only appropriate for certain hardware and product
configurations with large and fast storage devices available for saving
state, hibernate-to-disk is not covered in this specification. This
topic may be covered in future CELF power management specifications.

Platforms vary considerably in the kinds of support provided for static
power management, and any attempt to standardize these technologies for
a wide variety of platforms will necessarily be subject to a number of
grey areas. The intent of this specification is to ensure a developer
that, by choosing a CELF-conforming kernel source base for a particular
platform, a number of commonly useful mechanisms and interfaces are
available to take advantage of basic static power management features of
that platform. In many cases this basic support will need to be
augmented to obtain the exact behaviors desired for a particular
product.

### Terminology

The following terms are used in this portion of the specification:

 Active state 
A system or device that is not in a suspend state is said to be in an
"active state".



    SDRAM self-refresh mode::: A platform capability that typically saves additional power during times in which no SDRAM access may occur.

 System suspend 
The process of placing the system into a system suspend state. This may
be triggered, for example, in response to the consumer pressing a
"standby" button on the product. This process generally also performs a
device suspend sequence for most or all devices.



 System suspend state 
A reduced-power state supported by the platform. Modern embedded
platforms often offer a variety of modifiable parameters and execution
modes related to power consumption; this specification primarily targets
those system suspend states used to dramatically reduce power
consumption for extended periods of time (further clarification appears
in the discussion below).



 System resume 
The process of restoring the state of the system to approximate
pre-suspend conditions when resuming operation after a previous system
suspend. System resume may be triggered, for example, when the consumer
presses a "wakeup" button or when the product is automatically awoken by
an alarm or external event (such as incoming call on a phone). This
process generally also performs a device resume sequence for most or all
devices.



 Wakeup method 
A platform mechanism for exiting a system suspend state. Wakeup may be
triggered by such means as pressing a button, I/O activity (such as
sending characters to a serial console device), or asserting an
interrupt.

### System Suspend/Resume Discussion

System suspend may be triggered for such reasons as:

-   the consumer presses a "standby" button on the product
-   the product automatically suspends after the product has not been in
    use for a certain period of time
-   an application or kernel driver suspends the system due to such
    conditions as a low battery strength indication or temperature
    threshold exceeded

The documentation for the particular platform may refer to its system
suspend states using names such as "standby", "sleep", or "suspend"
states or modes. The precise characteristics of system suspend will vary
by platform and by the particular system suspend state. A system suspend
state might entail some or all of the following actions:

-   stopping or slowing various clocks
-   removing power from some or all devices, or placing devices into a
    low-power state
-   placing SDRAM into self-refresh mode
-   lowering core operating voltage and other platform power parameters
-   halting CPU execution

This specification places no requirements upon the exact behavior of
system or device suspend states, or upon the wakeup methods that resume
normal system operation. The intent is to ensure that a CELF-conforming
Linux supports the basic system and device suspend/resume features
offered by the platform to a minimal degree.

This specification does require that a system suspend first call drivers
for devices in an active state, in order to prepare for the system
suspend. Depending on the platform and system suspend state
characteristics, such preparation may be useful to further lower system
power consumption by placing all appropriate devices into a suspend
state, and/or may be necessary to save device state such that device
operation can be later resumed during system resume. If the platform
will remove power from the device during the system suspend state then
first placing the device into a low-power state is, of course, not
necessary, but it is commonly the case that device state will need to be
saved in order to reconfigure the device when later re-powered.

If multiple system suspend states are implemented by the platform and
supported by Linux, then a CE application may choose among the suspend
states based on product-specific criteria such as whether a particular
suspend state is compatible with proper functioning of required I/O
devices during the suspend, the latency involved when entering and
exiting the state, and so forth.



## Specifications

1.  If the platform supports at least one system-suspend state and at
    least one method to wake up from the system-suspend state, a
    configuration option for the Linux kernel SHALL be provided that
    controls whether the kernel has the ability to enter and wake up
    from at least one system suspend state.
2.  If the platform supports more than one system suspend state, the
    ability to enter and wake up from all platform-supported
    system-suspend states SHOULD be implemented.
3.  Both a kernel programmatic interface and a userspace interface to
    initiate system suspend SHOULD be provided.
4.  If the platform supports SDRAM self-refresh mode and supports at
    least one system-suspend state that leaves SDRAM powered, the Linux
    kernel system-suspend code SHOULD have the ability to place SDRAM in
    self-refresh state.
5.  The kernel SHOULD provide interfaces for delivering power management
    events, including power button, smart battery, and temperature
    sensor events, to user space.
6.  A configuration option for the kernel SHOULD be provided that
    controls whether the kernel supports a hibernation technique by
    which the system preserves state on disk or flash memory during
    suspend state and restores the state from disk or flash memory upon
    resume.

Specific interfaces to perform the above are not required by this
specification; see Non-Normative Notes for discussion.

## Non-normative notes

Among the choices for system suspend/resume interfaces are:

-   The Linux 2.5/2.6 PM subsystem implements a kernel API for system
    suspend and resume, with limited support for choosing a specific
    system suspend state.
-   The Linux 2.5/2.6 sysfs filesystem exports interfaces that
    applications may use to suspend the system; these interfaces call
    the PM subsystem kernel API.
-   The /proc/sys/pm interface for system suspend/resume. Note that
    these interfaces are generally being replaced with the PM subsystem
    in future Linux versions.
-   The Dynamic Power Management subsystem (DPM) offers an interface for
    system suspend that may be convenient to use in systems that employ
    DPM for other power management tasks.
    -   Hardware Platform Dependencies
        -   The ability to support a special register used by
            boot-loader to detect whether the type of booting is cold
            boot or system resume.
        -   Usually, platform is designed to support power supply gating
            which is to disconnect power from a part of PCB. The power
            supply gating can eliminate both leakage current and dynamic
            current while clock gating can eliminate dynamic current
            only. PCB has multiple power plane whose power can be gated
            independently.
        -   Boot-loader need to detect whether booting is cold boot or
            system resume.
        -   There are four types of power management events typically;
            button event, battery event, thermal event, and timer
            events. Those events are useful for predictable power
            control and prevent a system from being overheated.

A version of the Linux 2.5/2.6 technology described above has been
backported to Linux 2.4 for use in CELF-conforming systems based on the
2.4 Linux kernel.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Specification](http://eLinux.org/Category:Specification "Category:Specification")

