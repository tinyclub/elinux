> From: [eLinux.org](http://eLinux.org/Boot-up_Time_Definition_Of_Terms "http://eLinux.org/Boot-up_Time_Definition_Of_Terms")


# Boot-up Time Definition Of Terms



## Definition of Terms for Bootup Times working group

Boot up
The time from power on to user start (the start of user init).

Busy wait
Using a timed loop to create a delay. This is often used with probing.
Because the device is executing instructions in the loop, no other work
can be done until the loop ends.

Cold start
The time from power on to first available use.

Deferred
An operation, which would occur at a specific point in the unmodified
Linux boot up processing, is changed so that it can occur later in the
processing.

De-serialized
A set of operations, which would be serialized in an unmodified Linux
environment, is changed so that the operations can be done concurrently.

Disk spinup
The time required for a hard disk to reach operational speed after
application of power.

Firmware
The first set of machine instructions to run on the hardware after the
application of power. The firmware may consist of several stages that
bootstrap from one stage to the next. On an x86 machine, for example,
the firmware is the BIOS. It is the responsibility of the firmware to do
initial preparation of the hardware, and to load and execute the OS.
This typically includes probing the hardware to discover attached
devices and setting up configuration information that the OS will read
during boot up.

First available use
The first opportunity for actual use of the product, after a boot up,
resume, or unhibernate operation.

First user experience
The first visual or audio indication of activity to the user of the
product, after a boot up, resume or unhibernate operation. (same as
"splash")

Flash
Flash memory

Hibernate
The action of transitioning the machine into a no power state, in a way
such that the current operating state can be restored in the future
without a full initialization sequence.

Kernel decompression
The action of decompressing a compressed kernel image. This stage
usually includes simultaneously transferring the kernel image from
persistent storage to RAM.

Kernel init
The kernel initialization sequence, consisting of the period of time
from kernel start to start of user init.

Kernel start
The point in the boot up when the product executes the first instruction
of start\_kernel() routine in the kernel.

Power lost
The moment that the product can no longer function because there is no
more power applied to it.

Power off
The moment that the machine transitions to a "losing power" state (this
is not the same as the time when no more power is being applied to the
CPU).

Power on
The moment of application of power to the device.

Probing
The act of discovering the configuration or attributes of the machine or
its operating state. A probe typically consists of sending a hardware
signal and waiting, for a given time, for a response from an attached
bus or device.

Resume
The action of transitioning the machine into a usable state from a low
power state (suspend).

ROM
Read-only-memory

Shutdown
The action of turning the product off. The time from user power off to
power lost.

Suspend
The action of transitioning the product into a low power state, wherein
the device cannot be used, but can be resumed quickly.

Serialized
A set of operations is serialized if the operations are performed in
order, without overlap or concurrency.

Splash
The first visual or audio indication of activity to the user of the
product, after a boot up, resume or unhibernate operation. (same as
"first user experience")

Time-to-splash
The time from power on to splash (or first user experience).

Unhibernate
The action of transitioning the machine from hibernation into a usable
state. Specifically, the usable state is the same or as close as
possible to the state when hibernation was entered (eg., the same
applications are running, the same files are open, etc.)

User init
The time from the first instruction of the first user space program
(usually /sbin/init) until the product is ready for first available use.

User power off
The action or moment that the user initiates terminating the power to
the device. Some devices do not use "user power off" as the primary
means of "turning off" the device. Instead, a press of the "off" button
may result in a suspend operation.

Warm start
The time from start of resume to first available use.

XIP
Execute-in-place - a method of executing code directly from ROM or
Flash, without first loading it into RAM. This affects startup time, RAM
and ROM footprint (size), and execution performance.

The terms used to describe boot up can refer to **events** (things that
occur or start at a specific moment in time) or **time periods** (the
time interval from one event to another).

Here is a list showing the sequence of main **events** during cold
start: *Note: \* means this event is optional.*

     1.    power on
     2.    firmware starts
     2.1 * firmware splash
     3.  * kernel decompression starts
     4.    kernel start
     4.1 * kernel splash
     5.    user start
     5.1 * user splash
     6.  * RC script start
     7.    application start
     8.    first available use

Note that there may be multiple "splash" events in the system, but that
the terminology here refers only to the first splash. This is also
referred to in the terminology definitions as "first user experience".
Splash events are highly important to diminish the *apparent* time to
boot of the product. Note that the first splash event might occur at
different locations in this sequence, depending on how the system is
configured and what software performs the first user output. Also, even
though user splash presentation is listed as event 5.1, it could occur
anywhere between events 5 and 8, depending on the user-space software
which performs the splash.

Here are bootup **time periods** (intervals), defined according to the
above sequence of events:

-   cold start: time from 1 to 8
-   bootup: time from 1 to 5
-   kernel init: time from 4 to 5
-   user init: time from 5 to 8
-   time-to-splash: time from 1 to either 2.1, 3.1, or 5.1 (depending on
    which is used)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")

