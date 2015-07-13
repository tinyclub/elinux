> From: [eLinux.org](http://eLinux.org/EDM "http://eLinux.org/EDM")


# Embedded Open Modular Architecture


(Redirected from [EDM](http://eLinux.org/index.php?title=EDM&redirect=no "EDM"))


## Contents

-   [1 Introduction](#introduction)
-   [2 Interface Types](#interface-types)
    -   [2.1 Mini PCI](#mini-pci)
    -   [2.2 SO-DIMM form-factor](#so-dimm-form-factor)
    -   [2.3 PCMCIA form-factor](#pcmcia-form-factor)
    -   [2.4 ExpressCard form-factor](#expresscard-form-factor)
    -   [2.5 Compact Flash form-factor](#compact-flash-form-factor)
    -   [2.6 Custom 200-pin B2B Module](#custom-200-pin-b2b-module)
-   [3 Alternative Standards](#alternative-standards)
    -   [3.1 Q-Seven](#q-seven)
    -   [3.2 PC-104](#pc-104)
    -   [3.3 EDM](#edm)
    -   [3.4 ULP-COM](#ulp-com)
    -   [3.5 96boards](#96boards)
-   [4 Contact and Discussion](#contact-and-discussion)

# Introduction

With recent embedded processors becoming mainstream and powerful enough
for general-purpose computing, the Embedded Open Modular Architecture is
an initiative to create robust, reliable and interoperable hardware
standards for mass-volume systems based around embedded processors,
where average users can interchange system modules (containing
processor, RAM and storage), even several times a day, without risk of
damage, needing any technical knowledge or requiring a technician to
assist them.

Products based on EOMA standards should, when sold, be so simple that
any salesman can honestly say "Just plug it in: it will work", and where
anyone from a small child to an elderly person may be confident in the
day-to-day installation, removal and use of EOMA modules in the
Electronic Appliances that they own. By complete contrast to existing
Industry Standards, there *does not exist* even a single published open
standard which can claim that it is easy for the general public to work
with. To explain this puzzling statement further: all other standards
require either special technical knowledge, special technical skills,
special handling of the device so as not to damage it, and often tools
are required. **EOMA Standards are designed to require none of these
things.**

The first initiative is to re-use the old PCMCIA form-factor, in a
similar way to [Conditional Access
Modules](http://en.wikipedia.org/wiki/Conditional_Access_Module). Below,
various alternative interfaces are analysed, and thus explain, given the
requirements, why PCMCIA was chosen as the first preferred modular
format, despite the greatly-reduced pin-count (only 68 pins).

# Interface Types

The re-use of industry-standard connectors and sockets is a very common
practice, but usually it is for embedded or factory-installation
purposes only. Typically in the Embedded world, SO-DIMM is the
form-factor of choice to re-purpose, because CPU, RAM, NAND Flash and
even some micro-connectors can fit onto the 35mm x 68mm size. Other
suitable form-factors include MXM and PCMCIA (CardBus) and potentially
ExpressCard, although the limited pincount of ExpressCard makes it much
less attractive. [Cogcomp](http://cogcomp.com/) have defined their own
standard, and have achieved significant backwards-interoperability over
a very wide range of CPU types - however this is not re-use of a
de-facto standard, but is included for completeness.

### Mini PCI

Mini PCI (not to be confused with Mini PCIe) has 3 variants, one of
which is a 124-pin standard. Pictures have been seen of removable Mini
PCI cards and ejector assemblies (similar to PCMCIA but wider). Tracking
down the supplier proved impossible: Mini PCI never really took off into
a mass-produced standard. If it still existed, the removable Mini PCI
card form-factor would be perfect, because of the extra pins available
(124) and the rugged nature of the socket and housing that was seen
(once).

### SO-DIMM form-factor

This form-factor is suitable for factory-only installation. The 35mm x
68mm size also makes it very tight to fit more than the CPU (up to 25mm
sq), NAND Flash (up to 20mm) and more than two RAM ICs (appx 20mmsq
each), as well as PMICs. However, some companies such as Gumstix have
created a de-facto modular standard for their own products such as the
[Overo](http://www.gumstix.com/store/product_info.php?products_id=227)
range, using the more expensive POP RAM to make space even for on-board
WIFI SIP modules. The majority of SO-DIMM form-factor modules, such as
Magniel's [OMAPMOD](http://magniel.com/omapmod.html), are double-sided.

All of these options are fantastic for prototyping and for the
low-to-mid-range volumes, especially for Hardware enthusiasts and for
Industrial purposes, where such modules form-factors are quite common.
However, when it comes to placing designs based around SO-DIMM and other
similar form-factors of this size into mass-volume production, the
space-saving decisions that had to be made immediately become a problem.
Many Chinese Factories are simply not equipped to handle the higher
number of layers required, nor the smaller PCB track sizes, and simply
do not have access to the plasma-based equipment needed to solder
Package-on-Package ICs.

### PCMCIA form-factor

Use of the PCMCIA 85mm x 55mm form-factor for purposes other than the
CardBus standard is not without precedent: [[Conditional Access
Modules](http://en.wikipedia.org/wiki/Conditional_Access_Module)] do not
comply with the CardBus electrical and electronic specification. The
size and design however is highly suited to hot-swapping and provides
convenient carrying and storage. It therefore makes sense to put the
entire embedded computer onto the card. The size is large enough to fit
CPU (up to 25mm), up to 4 RAM ICs (typically 20mm sq), a NAND Flash IC
(up to 20mm) as well as PMICs and other components - even single-sided,
thus reducing the cost.

The specification is at
[Embedded\_Open\_Modular\_Architecture/EOMA-68](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-68 "Embedded Open Modular Architecture/EOMA-68").

### ExpressCard form-factor

The idea to re-use ExpressCard is based on creating something with a
smaller form-factor than PCMCIA that resembles the popular "USB-TV"
dongles, making it possible to use the exact same processors and board
layout in USB-TV dongles, and providing the option (through a little
more space) to have a few more outputs or peripherals.

The specification is at
[Embedded\_Open\_Modular\_Architecture/EOMA-26](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-26 "Embedded Open Modular Architecture/EOMA-26").

### Compact Flash form-factor

Compact Flash Type II Cards are 43mm x 36mm x 5mm, and the connector is
50 pins. There is therefore just enough space to fit a CPU, RAM and NAND
ICs. There exists precedent for such tiny processor boards, in the form
of the [[Enyxos4210 CPU
Board](http://hardkernel.com/renewal_2011/products/prdt_info.php?g_code=G129705564426)]
from hardkernel.com. In the case of the Enyxos4210, a Samsung Dual-Core
1ghz ARM Cortex A9 is used, with POP DDR RAM. Unlike the hardkernel CPU
board, however, the Compact Flash form-factor would allow the use of the
bottom of the board for ICs instead of B2B connectors, because the
Compact Flash connector is on the edge. A typical layout would therefore
involve CPU, PMIC and one other (small!) IC on the TOP side, and NAND
Flash and possibly 2 low-cost DDR RAM ICs on the BOTTOM side.

The only distinct disadvantage of the reuse of Compact Flash is that it
is sufficiently small that re-use of existing casework for CF is not
really possible. With PCMCIA, existing cases can be purchased
off-the-shelf, leaving just the moulding at the end as the only
customised casework required. Additionally, the smaller size may require
high-density parts for high-specification devices, increasing the price.
However for ultra-low-cost cards, the lower part count would not be a
problem.

The specification is being developed at
[Embedded\_Open\_Modular\_Architecture/CompactFlash](http://eLinux.org/Embedded_Open_Modular_Architecture/CompactFlash "Embedded Open Modular Architecture/CompactFlash").

### Custom 200-pin B2B Module

A custom module form-factor is being designed with a housing of 103mm x
68mm x 15mm in size. At each of the 4 corners is a 0.4mm pitch 50-pin
B2B connector. On the front fascia plate is the option to put any number
of connectors that will fit along the long side. Power is provided in
the form of multiple 5V and 3.3V pins, providing a total of up to 32.4
Watts.

This standard is being targetted at end-users for Desktop, SoHo and
other mass-volume retail purposes, with the ultimate goal being to
reduce the hardware cost for the mid-end Server markets as well as for
Industrial, Embedded, Research and Educational purposes by providing
these market sectors with access to low-cost off-the-shelf mass-volume
high-end PCs as an Open Standardised Modular component with plenty of
expansion capability both on and off the module.

The advantages of EOMA-200 over alternatives such as Q-Seven and
COM-Express is that there are *no optional sizes* and *no optional
interfaces*. End-users and Industrial customers can purchase EOMA-200
modules knowing that whatever the price, the only real considerations
are whether it has enough on-board interfaces, whether the CPU speed is
fast enough and how much memory it can take. Both Q-Seven and
COM-Express are fraught with additional technical considerations such as
whether the module is the right size and whether the module has the
right interface compatibility with the base-board (many of Q-Seven's
interfaces are entirely optional and can be entirely missing). As such,
Q-Seven and COM-Express are effectively limited to costly Industrial,
Embedded and Military purposes; by contrast, EOMA-200 is targetted
primarily at the mass-volume sector, to the ultimate financial benefit
of other markets as well.

*Like all EOMA Standards there are **no optional interfaces** on
EOMA-200.*

The specification is being developed at
[Embedded\_Open\_Modular\_Architecture/EOMA-200](http://eLinux.org/Embedded_Open_Modular_Architecture/EOMA-200 "Embedded Open Modular Architecture/EOMA-200").

# Alternative Standards

This section covers alternative standards for modular computing.

### Q-Seven

Q7
[http://www.qseven-standard.org/index.php?id=43](http://www.qseven-standard.org/index.php?id=43)
is an embedded 70mm x 70mm standard (also expanded to uQseven which is a
40mm x 70mm size with the same connector format). The Qseven standard is
large enough and powerful enough to house x86 CPUs as well as embedded
ARM SoCs. However, like the other edge-connector-based standards, it is
not suitable for mass-volume user-installable usage, being only suitable
for factory-installation due to the risk of ESD damage. Also, as it is a
larger form-factor, it rules out usage for smaller devices (it is almost
400% bigger than Compact Flash, for example). Also, the Q7 standard sets
quite a high bar for the required interfaces, including PCI-e, MIPI and
others, all of which must be placed on the edge-connector, thus
requiring some 200+ pins.

Also, due to interfaces being optional (see "Feature Overview" of
specification PDF document), fragmentation will occur on both sides of
the standard. Special care and attention will be needed by ODMs to
ensure that they pick the right module before proceeding to the design
stage.

The standard is here:
[http://www.qseven-standard.org/index.php?id=43](http://www.qseven-standard.org/index.php?id=43).
It is mentioned here for completeness.

### PC-104

PC104 and other such small-form-factor embedded boards are based around
the assumption that the architecture is based around the x86 PC. In
fact, PC104 is a [compact form of the legacy PC/AT
bus](http://pinouts.ru/Slots/Pc104_pinout.shtml) (even PCMCIA is based
around the ISA bus). PC-104 is mentioned here for completeness, because
due to its age it can be considered as a legacy interface, where the
pins, connectors, headers and PCB sizes could potentially be re-used for
alternative purposes. The problem with that is that PC104 was designed
for Industrial and other embedded purposes, and was never a
mass-produced interface in the first place, but is mentioned here merely
for contrast and for completeness.

### EDM

[EDM](http://www.technexion.com/index.php/products/edm) is a new
small-form-factor embedded board standard, with sizes of 82 x 60 mm, 82
x 95 mm and 82 x 145 mm. The standard, which is released under a
Creative Commons License, uses a 314 pin connector which carries all
signals ranging from HDMI to gigabit ethernet to control pins such as
GPIO's, I2C, SPI and serial interfaces.

EDM is very similar to the Q-Seven Standard, and as such has the same
limitations, including being restricted to factory-installation only
(unsuitable for installation by the average non-technical end-user).
Additionally, the fact that many of its interfaces are optional means
that the marketplace will automatically become fragmented on both sides
of the standard.

### ULP-COM

[ULP-COM](http://blogs.arm.com/embedded/702-i-like-pc-like-arm-reaches-into-computer-on-module/)
is a new small-form-factor embedded board standard, with sizes of 82 x
80mm and 82 x 50mm, and a maximum height limit of 4mm. It re-uses the
x86-based MXM form-factor and sockets, just as EDM does.

ULP-COM includes many industrial interfaces (SPI, 4x CAN, 12x Serial) as
well as requiring 3 PCIe x1 ports, and offering Single-channel LVDS,
24-pin RGB/TTL, and HDMI (with an option for DisplayPort), 2 CSI Camera
Interfaces (one 2-lane, one 4-lane). This basically raises the bar to an
extremely high level, eliminating many low-cost ARM SoCs from
participating with the standard, whilst still leaving it highly suitable
for many Industrial and other Factory-install purposes. It should become
more suitable as a general-purpose computing standard once more SoCs
have PCIe, CSI and so on.

However, like EDM, the inclusion of optional (multiplexed) functionality
leaves some concern over the viability of the standard: should
motherboards support both alternative options? What if one module does
not support the alternative function that is required by a motherboard?
In the cases where the Module is to be effectively permanently installed
in its motherboard, this question is not of such concern, but then why
use that standard at all; why not just make a Single Board computer (for
large volumes, at least). This issue applies equally across all of the
edge-connector-style Modules.

By contrast - and also learning from the lesson of ULP-COM, the
multiplexing on EOMA standards is restricted firstly to Digital I/O
pins, secondly to I/O that is the same TTL voltage level (so that there
is no issue over voltage-level conversion) and thirdly to being two
functions only: General-purpose bi-directional I/O and one other
function. The reason for this is quite simple: even if a designer
creates a module based around a CPU which does not support GPIO /
function multiplexing (as is common within the embedded SoC industry), a
two-way multiplexing IC could conceivably be used as a last resort to
perform simple multiplexing externally. Contrast this with a situation
where pins are used for example for high-speed LVDS or MIPI and other
different functions with different speeds and voltages, and the
complexity (and cost) of external multiplexing goes up often to the
extent where the total BOM makes the use of that particular SoC
cost-ineffective and thus completely pointless.

### 96boards

[96boards](http://96boards.org) is another small-form-factor standard,
which has released its [first
standard](https://www.96boards.org/wp-content/uploads/2015/02/96BoardsCESpecificationv1.0-EA1.pdf)
as a consumer-grade board. Variants are either 85 x 54 x 12mm high or 85
x 100mm x 12mm. The specification is unusual when compared to other
hardware standards in that it also sets minimum software support
requirements.

Just like virtually every single one of the alternative standards
reviewed on this page, the 96boards consumer standard contains
"optional" features that make it extremely hard for average end-users to
pick a board, when there is no guarantee in the future that alternative
upgraded boards will have the same availble functionality. Additionally,
the choice of a mandatory 1.8v GPIO voltage level makes for additional
cost on both the board design side as well as mezzanine connector side,
unless by pure chance the parts available on either side of the standard
happen to be available at exactly 1.8v voltage levels.

Additionally, at the time of release (January 2015), despite the
standard being a 1.0 release, it is an extremely unclear document where
many significant and important factors are left undocumented and
unspecified.

# Contact and Discussion

For questions, comments and general discussion, please use [arm-netbook
mailing list](http://lists.phcomp.co.uk/mailman/listinfo/arm-netbook).
Further information is available at
[http://rhombus-tech.net](http://rhombus-tech.net).


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Embedded Open Modular
    Architecture](http://eLinux.org/Category:Embedded_Open_Modular_Architecture "Category:Embedded Open Modular Architecture")
-   [ARM processors](http://eLinux.org/Category:ARM_processors "Category:ARM processors")

