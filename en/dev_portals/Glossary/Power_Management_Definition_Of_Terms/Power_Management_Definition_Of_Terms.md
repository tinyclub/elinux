> From: [eLinux.org](http://eLinux.org/Power_Management_Definition_Of_Terms "http://eLinux.org/Power_Management_Definition_Of_Terms")


# Power Management Definition Of Terms



Definition of Terms for Power Management working group

 Classes 
In the future, a Class will be a set of Operating Points. DPM will be
architected to choose the appropriate Operating Point for the current
Class, based on constraints. The current implementation of DPM restricts
each Class to contain only one Operating Point. Continuing the above
example of device constraints for a network adapter, if a Class
contained two Operating Points, "slow\_cpu\_fast\_io" which specified an
IO bus frequency of 25 [MHz](http://eLinux.org/MHz "MHz") and "slow\_cpu\_slow\_io" which
specified an IO bus frequency of 5 [MHz](http://eLinux.org/MHz "MHz"), then DPM would not
be able to set the Operating Point to "slow\_cpu\_slow\_io" while the
network adapter was active.

 Device constraints 
Constraints describe the required relationships between the hardware
operating parameters. For example, for a network adapter to function
properly, it might be required that the frequency of the IO bus to which
it is attached must be greater than 10 [MHz](http://eLinux.org/MHz "MHz").

 DPM 
The [Monta Vista](http://eLinux.org/Monta_Vista "Monta Vista") Dynamic Power Management
subsystem

 Operating Points 
An Operating Point is a specific set of values of power parameters. The
system designer chooses an Operating Point to reflect a certain level of
system performance together with an associated level of energy
consumption.

 Hibernate 
See Suspend-to-Disk

 Operating States 
The Operating State reflects the current state of the system: executing
a task, processing interrupts, or idle. Each process has an associated
Operating State, as does the system idle loop and the interrupt handling
code path. It is also an abstraction that software uses to request a
specific level of system performance, since there are multiple operating
states that can be associated with a task, and the various operating
states may be mapped to differing Operating Points, thus causing
differing levels of performance and power consumption for different
tasks. The current system Operating State is set to the Operating State
of the process currently executing (or the idle loop or interrupt
handlers). The board specific implementation portion of DPM may also
alter the system's current Operating State while kernel code is
executing. For example, the kernel idle loop code may explicitly set the
system's current Operating State to "idle" while there is no task that
is ready to execute.

 Policy Manager 
Software that dynamically sets the current policy from the set of
defined policies. The Policy Manager selects the current Policy based on
certain system conditions. For example, the Policy Manager can select
the Current Policy in one of the following ways: 1. If the user presses
the device's soft-power switch, the Policy Manager can choose an
ultra\_low\_power Class; 2. If remaining battery power reaches a
threshold, the Policy Manager may choose a
lower\_power\_and\_performance Class; 3. If the device is connected to
main power, the Policy Manager may choose a high\_performance Class.

 Power Control Layer 
Power control layer is the software layer on top of which power
management framework sits. This layer provides H/W specific power
control methods to power management framework with abstracted power
control interfaces.

 Power Management Framework 
Power management framework in kernel maintains system power management
policy and implements core functions for static power management and
dynamic power management technologies. PM framework plays the role of
coordinating energy resource among multiple tasks and adapting system
operating state according to task specific requirements.

 Power Parameters 
Power parameters are the hardware parameters that may be modified to
affect the power usage of the platform, such as clock frequencies or
dividers, voltage levels, and so forth.

 Power Policy 
A Policy is a mapping of which Class is invoked for each Operating
State. For example, a "power-off" policy may map all Operating States to
an extremely low power Class; a "power-off-fast-wakeup" may map all
Operating States to a low power and low wakeup latency Class; and a
"active" policy may map an Operating State used by interactive processes
to a high power Class, an Operating State used by background processes
to a medium power Class, and an Operating State used by the kernel idle
loop to a low power and low wake up latency Class. Whenever the
Operating State changes (due to an explicit request or implicitly due to
a change of which process is currently executing) DPM uses the current
Policy to determine which Class is associated with the new Operating
State. DPM selects the best Operating Point from the new Class, and then
sets the hardware parameters defined by the Operating Point.

 Suspend/Resume 
System suspend refers to placing the system in a low-power state with
many components powered off, or perhaps entirely powering off the system
after saving state to stable storage. This is a relatively lengthy
procedure undertaken when an extended period of product inactivity is
expected, as for example when the user presses a "standby" button on the
product or the product has not been in use for a long period of time.
This procedure can thus be distinguished from the power state changes
appropriate for a running system driven by technologies such as Dynamic
Power Management, which are executed more quickly during very brief idle
periods. System resume refers to the process of restoring the state of
the system to approximate pre-suspend conditions upon resume.

 Suspend-to-Disk/Hibernate 
A technique by which systems preserve state on disk during suspend and
restore system state from disk upon resume. This is typically done on
platforms where all of RAM may be saved to a disk device and then the
RAM (and perhaps the entire system) may be powered off during the
suspend period. This is commonly referred to as "hibernating" for
laptop/notebook computers.

 Suspend-to-RAM 
A technique by which systems preserve state in RAM during suspend and
restore system state from RAM upon resume. This is necessary on
platforms that remove power from some portions of the system, such as
the CPU core or I/O core, but maintain power to SDRAM during the suspend
period

 Suspend modes / Standby modes / Sleep modes 
A platform may support more than one suspend mode, that is, system
behavior during a suspend may differ depending on what suspend mode has
been requested. For example, one mode may stop certain clocks during
suspend but leave all components powered on, while another mode may
power off various components (such as the CPU core or I/O modules) but
leave others powered on (such as to leave SDRAM in self-refresh state),
and so forth.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Embedded
    Dictionary](http://eLinux.org/Category:Embedded_Dictionary "Category:Embedded Dictionary")

