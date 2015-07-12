> From: [eLinux.org](http://eLinux.org/Glossary "http://eLinux.org/Glossary")


# Glossary



This is a glossary of terms used in embedded Linux, and links to
existing glossary pages:

## Topic-specific Glossaries

Here are pages that have list of terms for specific technology areas:

-   [Boot-up Time Definition Of
    Terms](../.././dev_portals/Boot_Time/Boot-up_Time_Definition_Of_Terms/Boot-up_Time_Definition_Of_Terms.md "Boot-up Time Definition Of Terms")
    - terms related to the Linux boot-up process
-   [Power Management Definition Of
    Terms](../.././dev_portals/Glossary/Power_Management_Definition_Of_Terms/Power_Management_Definition_Of_Terms.md "Power Management Definition Of Terms")
    - Definition of Terms for the CELF Power Management working group
-   [Real Time Terms](../.././dev_portals/Glossary/Real_Time_Terms/Real_Time_Terms.md "Real Time Terms") - terms
    related to systems with real-time performance
-   [Security Terms](../.././dev_portals/Glossary/Security_Terms/Security_Terms.md "Security Terms") - terms related
    to Linux security and security frameworks

<table>
<thead>
<tr class="header">
<th align="left">Contents</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><a href="#A">A</a> <a href="#B">B</a> <a href="#C">C</a> <a href="#D">D</a> <a href="#E">E</a> <a href="#F">F</a> <a href="#G">G</a> <a href="#H">H</a> <a href="#I">I</a> <a href="#J">J</a> <a href="#K">K</a> <a href="#L">L</a> <a href="#M">M</a> <a href="#N">N</a> <a href="#O">O</a> <a href="#P">P</a> <a href="#Q">Q</a> <a href="#R">R</a> <a href="#S">S</a> <a href="#T">T</a> <a href="#U">U</a> <a href="#V">V</a> <a href="#W">W</a> <a href="#X">X</a> <a href="#Y">Y</a> <a href="#Z">Z</a> <br /></td>
</tr>
</tbody>
</table>

## A

 Abatron 
[Abatron](http://www.abatron.ch/) is a Swiss company that makes a
popular Jtag debugger often used to debug embedded Linux. Their primary
products are the 'BDIx000' line of Jtag debuggers.

 Asynchronous I/O 
I/O where control is returned to the calling program after the I/O
process has started, but before the I/O is completed. The I/O transfer
runs in parallel with respect to the processor work. The user program
continues executing at the same time the I/O operation is executing.

## B

 Board 
A board is used to refer to the hardware upon which one develops
embedded Linux. Historically, it refers to the printed circuit board
that actually holds the hardware for the device. Often, this is a
development board, or evaluation board, as opposed to an actual product
device in final shipping form.

 Blocking I/O 
I/O where control is not returned to the calling program until all
requested data is transferred. The I/O transfer runs serially with
respect to the processor work.

 BSP 
Board Support Package. This is the code that is used to support a
particular hardware board. The term is used generically to refer to
code, and not a specific "package", as the name implies. It generally
refers to all special-case software relevant to a particular board,
whether it is kernel code, user code, etc.

## C

 Cross-compiler
A compiler that runs on one platform and has the ability (via
configuration) to generate code for a different platform or platforms.

 Cross-compilation
Compiling code with a
[cross-compiler](http://eLinux.org/index.php?title=Cross-compiler&action=edit&redlink=1 "Cross-compiler (page does not exist)")
in order to target a different platform than the one it's compiled on.

## D

## E

 ELC 
Embedded Linux Conference. This is one of the major technical
conferences each year for developers of embedded Linux. See the
[Events](../../dev_portals/Events/Events.md "Events") page for references to past events.

 Embedded 
An "embedded" device usually means one with fixed functionality,
independent of other additional hardware or software attributes. The
terms is somewhat vague. This is as opposed to general-purpose
functionality. Note that mobile phones are considered embedded, although
they now support general-purpose programs and functionality. Classic
embedded Linux products include things like digital cameras, routers,
television sets, and settop boxes, as well as non-consumer embedded
devices like sensors, industrial control devices, and pretty much
anything running Linux outside of the desktop and server markets. See
the [wikipedia entry for embedded
system](http://en.wikipedia.org/wiki/Embedded_system).

## F

 File system 
The methods and data structures that an operating system uses to keep
track of files on a disk or partition; the way the files are organized
on the disk. Also used about a partition or disk that is used to store
the files or the type of the file system.

## G

## H

 Host 
The host, or 'host machine' is the place where the software developer
actually writes and compiles the software for their product. In a
host-target environment, the host is used to develop software, and the
target is the device which will run the software.

## I

 IP block 
An IP block is a section of an integrated circuit which performs a
distinct function on the chip. The IP stands for "Intellectual
Property". IP blocks are developed or licensed, and integrated onto an
SOC or some other chip in the system. The block is licensed and
manipulated as a unit, with the actual definition of the circuity
expressed in some hardware description language like Verilog. Because
the same IP block may be used in multiple chips (and often in chips even
from different companies), a driver written for the IP block on one
system may also work (with small modifications) on the same IP block on
another system. Common IP blocks on current processors are video
controllers, UARTs (serial ports), bus controllers, and network
circuitry (both wired and wireless), to name just a few.

## J

 [JTAG](../.././dev_portals/Glossary/JTAG/JTAG.md "JTAG") 
Short for "Joint Test Action Group", JTAG refers to a debugging
interface used to validate hardware and debug software on an embedded
board. See [JTAG](../.././dev_portals/Glossary/JTAG/JTAG.md "JTAG")

## K

 Kernel 
The Linux kernel is the core software in a Linux system that interfaces
with the hardware, manages resources on behalf of processes, and
mediates interactions between processes and the hardware, and between
processes themselves.

## L

## M

## N

 Non-blocking I/O 
I/O where control is returned to the calling program after the I/O
process has started, but before the I/O is completed. The I/O transfer
runs in parallel with respect to the processor work. The user program
continues executing at the same time the I/O operation is executing.

 Non-volatile storage 
(NVS, persistent storage, memory) A term describing a storage device
whose contents are preserved when its power is off. Storage using
magnetic media (e.g. magnetic disks, magnetic tape or bubble memory) is
normally non-volatile by nature whereas semiconductor memories (static
RAM and especially dynamic RAM) are normally volatile but can be made
into non-volatile storage by having a (rechargeable) battery permanently
connected.

## O

## P

 PHY 
Short for Physical Layer, PHY usually refers to the hardware circuitry
which implements networking on a chip or board. Sometimes the PHY is a
separate chip on the board. Often it refers to the circuitry on an SOC
for a particular network device or interface. See
[http://en.wikipedia.org/wiki/PHY\_(chip)](http://en.wikipedia.org/wiki/PHY_(chip))

## Q

## R

 RAM-based file system 
A file system built on RAM as the storage medium.

## S

 SOC 
System On Chip. This is a chip which has a (more-or-less) complete
system on a single integrated circuit. It will likely have lots of IP
blocks, which implement different hardware functionalities, such as
serial ports, network interfaces, buses, and video controllers, in
addition to the main CPU for the system. It is pronounced as either
"ess-oh-see" or like "sock". See
[http://en.wikipedia.org/wiki/System\_on\_a\_chip](http://en.wikipedia.org/wiki/System_on_a_chip)



 Synchronous I/O 
I/O where control is not returned to the calling program until all
requested data is transferred. The I/O transfer runs serially with
respect to the processor work.

## T

 Target 
Target refers to the device or environment for which software is being
developed. This can be a development board, an actual product, or an
emulator. Often, software is developed on a 'host' and then transferred
to a target device for testing, debugging and deployment.

 Toolchain 
A toolchain is the set of programs used to build the software for an
embedded device. Specifically, it refers to the compiler and linker. But
it may also refer to other programs (such as debuggers, profilers, and
other tools for working with the target software) that are specific to a
particular process architecture or CPU.

## U

## V

## W

## X

## Y

## Z


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [NeedsEditing](http://eLinux.org/Category:NeedsEditing "Category:NeedsEditing")

