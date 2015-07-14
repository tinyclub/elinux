> From: [eLinux.org](http://eLinux.org/Kernel_Summit_2011_ARM_Subarch_Maintainership_Workshop "http://eLinux.org/Kernel_Summit_2011_ARM_Subarch_Maintainership_Workshop")


# Events/Kernel Summit 2011 ARM Subarch Maintainership Workshop


\< [Events](http://eLinux.org/Events "Events")


We're currently planning an ARM Subarchitecture Maintainership Workshop
for the first day of Kernel Summit in Prague, October 23, 2011. Watch
this page for details, or contact Grant Likely, Nicolas Pitre, or Arnd
Bergmann.

There is limited space available for this meeting. Seats were provided
on a first-come, first-served basis and we have now surpassed our
self-imposed limit of 24 people. However, if you still would like to
attend, or would like to nominate someone who you think is an important
participant, then email Grant Likely \<grant.likely@secretlab.ca\>. We
may be able to open up additional seats as needed.

We're also extending an open invite to all kernel summit invitees. If
you've been invited to kernel summit and you'd like to attend the ARM
workshop, then email Grant so that we know you are coming. Otherwise
we'll make you sit on the floor.

## Contents

-   [1 Proposed agenda topics](#proposed-agenda-topics)
-   [2 Minutes](#minutes)
-   [3 Photo](#photo)
-   [4 Schedule](#schedule)
-   [5 Hacking Sprint](#hacking-sprint)
-   [6 Delegates](#delegates)
-   [7 Volunteers](#volunteers)

# Proposed agenda topics

Here is the current list of proposed discussion topics. Feel free to add
items to this list.

-   arm-soc tree: 6 month retrospective
-   DT bindings for GPIO and pin mux
-   the pin mux subsystem from linusw (especially if it is still RFC by
    then)
-   progress with the single zImage work
-   presentation/status of the DMA and memory management work wrt CMA
    (some SOC specific hacks should go away once this is available)
-   DT porting progress
-   boot architecture status
-   [Board-specific code
    maintainer](http://www.spinics.net/lists/arm-kernel/msg142240.html)
    (proposed by Igor Grinberg)
-   [Common method for registering errata (CPU, cache controller
    etc.)](http://www.spinics.net/lists/arm-kernel/msg144334.html)
    (Proposed by Catalin Marinas)
-   [CPU Topology DT
    binding](http://www.spinics.net/lists/arm-kernel/msg144334.html)
    (Proposed by Catalin Marinas)
-   [Fine grained DMA
    Coherency](http://www.spinics.net/lists/arm-kernel/msg144334.html)
    (Proposed by Catalin Marinas)
-   [Handling off-the-tree dependencies of
    devices](http://thread.gmane.org/gmane.linux.acpi.devel/50945/focus=50978)
    (Proposed by Rafael J. Wysocki)
-   [Per-device PM QoS - user space
    interaction](http://thread.gmane.org/gmane.linux.acpi.devel/50945/focus=50978)
    (Proposed by Rafael J. Wysocki)
-   [Universal platform drivers (for ACPI, PNP,
    etc.)](http://thread.gmane.org/gmane.linux.acpi.devel/50945/focus=50978)
    (Proposed by Rafael J. Wysocki)
-   [Suspend vs wakeup
    events](http://thread.gmane.org/gmane.linux.acpi.devel/50945/focus=50978)
    (Proposed by Rafael J. Wysocki)

# Minutes

Etherpad notes
[[1]](http://etherpad.osuosl.org/ksummit-2011-arm-workshop)

# Photo

[![Summit
Attendees](http://eLinux.org/images/c/ca/Arm-subarch-maintainers-summit-2011-photo.jpg)](http://eLinux.org/File:Arm-subarch-maintainers-summit-2011-photo.jpg "Summit Attendees")

# Schedule

The ARM maintainership workshop runs from October 23-25, 2001 in Prague.
Sunday October 23rd is dedicated to discussion topics of interest to the
ARM subarchitecture maintainers, and October 24 and 25 are organized as
a hacking sprint. The workshop is co-located with Kernel Summit and
there will be some joint events. You can also refer to the [Kernel
Summit Schedule](http://ksummit2011.kernel.org/agenda). Workshop
attendees are welcome to attend any of the Kernel Summit presentations
on Tuesday, October 25.

**DRAFT SCHEDULE - SUBJECT TO CHANGE**

Sunday, October 23

Monday, October 24

Tuesday, October 25

9:00am

Introductions and announcements (Grant Likely)

Hacking Sprint

(ksummit) Report from Monday's session

9:30am

Common Infrastructure Reports

-   Pinmux subsystem (Stephen Warren)
-   Common Clock (Sascha Hauer)
-   CMA (Marek Szyprowski)

(ksummit) Minisummit/workshop reports

10:00am

10:30am

Break

Break

11:00am

Common Infrastructure Reports

-   Complex Driver Model Dependencies
-   ARM Cortex-A15 Architecture Issues (Catalin Marinas)

Hacking Sprint & Ksummit presentations

11:30am

12:00pm

Lunch

12:30pm

1:00pm

Single zImage (Nicolas Pitre, Deepak Saxena)

Hacking Sprint

Hacking Sprint & Ksummit presentations

1:30pm

2:00pm

Device Tree Migration progess (Grant Likely)

2:30pm

Break

3:00pm

Break

Hacking Spring & Ksummit presentations

3:30pm

ARM SoC Tree; 6 month review (Arnd Bergmann, Nicolas Pitre)

4:00pm

4:30pm

TBD

(ksummit) GPG identity verification

5:00pm

Summary, Action Item review and Hacking Sprint planning

Break

5:30pm

Break

Break

6:00pm

6:30pm

Evening Reception at Hotel

Dinner

Joint Kernel Summit, ELC-E, LinuxCon Europe reception

# Hacking Sprint

-   *list target goals here*

# Delegates

Registration for the ARM Workshop is now closed. Here is the list of
registered participants. If you are registered for this event, feel free
to fill in your arrival information below if you want to organize ride
sharing from the airport.



Confirmed

Name

Roles

Arrival information

Departure

Chris Ball

MMC maintainer and OLPC developer

Ohad Ben-Cohen

OMAP engineer

Arnd Bergmann

arm-soc tree maintainer

DB-Bus-1061 OCT 22 16:18

David Brown

MSM maintainer

BA856 OCT 22 6:50pm

BA855 Oct 29 12:15pm

Mark Brown

ASoC maintainer

LH1402 OCT 22 23:15

LH1393 OCT 29 09:50

Lennert Buijtenhek

Marvell SoC maintainer

KL3125 OCT 22 16:05

KL1358 OCT 28 19:20

Benoît Cousson

OMAP engineer

AF2482 OCT 22 7:50pm (sharing taxi w/Kevin Hilman)

AF1083 OCT 26 7:25

Magnus Damm

shmobile maintainer

Will Deacon

ARM engineer

Nicolas Ferre

Atmel maintainer

AF4314 OCT 22 8:10pm

Thomas Gleixner

random Linux dude

Igor Grinberg

OMAP engineer

OK287 OCT 22 9:15am

OK286 OCT 29 11:55pm

Sascha Hauer

imx maintainer

Kevin Hilman

OMAP power management maintainer

AF2482 OCT 22 7:50pm (sharing taxi w/Benoit Cousson)

AF1083 OCT 29 7:25am

Olof Johansson

Tegra maintainer

BA856 OCT 22 6:50pm

BA855 Oct 29 12:15pm

Kukjin Kim

Samsung SoC maintainer

KE935 OCT 22 17:50

KE936 OCT 29 19:25

Russell King

ARM architecture maintainer

BA856 OCT 22 18:50

BA855 OCT 26 12:15pm (probably share taxi with swarren)

Grant Likely

Device Tree, GPIO and SPI maintainer

AC9294 OCT 22 11:45am

Tony Lindgren

OMAP maintainer

Pavel Machek

Freezer/hibernation maintainer

Catalin Marinas

ARM engineer

Kyungmin Park

Samsung mobile boards & drivers maintainer

Nicolas Pitre

arm-soc tree maintainer

Jean-Christophe Plagniol-Villard

Atmel maintainer

Wolfram Sang

Deepak Saxena

Linaro Kernel WG manager

Marek Vasut

Various pxa boards maintainer

Paul Walmsley

OMAP clock framework maintainer

Stephen Warren

Tegra maintainer

BA856 OCT 22 6:50pm (1 open taxi space)

BA855 OCT 26 12:15pm (probably share taxi with RMK)

Marc Zyngier

ARM engineer

Sitting in from Kernel Summit

Name

Roles

Mike Frysinger

Ben Herrenschmidt

Greg Kroah-Hartman

Nominated, but have not yet responded.

Name

Roles

Barry Song

CSR maintainer

Declined - will not attend

Name

Roles

Eric Miao

pxa/mmp maintainer

Marek Szyprowski

attending V4L2 workshop at same time

Paul Mundt

shmobile maintainer

Linus Walleij

ST-Ericsson SoC maintainer

Haojian Zhuang

pxa/mmp maintainer

# Volunteers

-   Planning Committee: Arnd Bergmann, Grant Likely, and Nicolas Pitre
-   AV:
-   Logistics:
-   Ride sharing:


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Events](http://eLinux.org/Category:Events "Category:Events")
-   [2011](http://eLinux.org/Category:2011 "Category:2011")
-   [KS](http://eLinux.org/Category:KS "Category:KS")

