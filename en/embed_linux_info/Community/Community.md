> From: [eLinux.org](http://eLinux.org/Community "http://eLinux.org/Community")


# Community



This page is for information about the embedded Linux and open source
community.

## Contents

-   [1 Netiquette](#netiquette)
-   [2 Community sites](#community-sites)
    -   [2.1 General Portals](#general-portals)
    -   [2.2 Hardware-Specific
        Communities](#hardware-specific-communities)
    -   [2.3 Software-Specific
        Communities](#software-specific-communities)
    -   [2.4 Communities for beginners](#communities-for-beginners)
-   [3 People](#people)
    -   [3.1 Linux kernel](#linux-kernel)
        -   [3.1.1 Important kernel figures](#important-kernel-figures)
        -   [3.1.2 Kernel arch maintainers](#kernel-arch-maintainers)
        -   [3.1.3 Feature
            developers/maintainers](#feature-developers-maintainers)
    -   [3.2 Other People](#other-people)
    -   [3.3 Interview candidates](#interview-candidates)
-   [4 Foundations and Forums](#foundations-and-forums)
-   [5 Linux User Groups](#linux-user-groups)
-   [6 Development Model](#development-model)
    -   [6.1 Reasons for contributing to open
        source](#reasons-for-contributing-to-open-source)
-   [7 Community-building ideas](#community-building-ideas)
-   [8 Quality Assurance](#quality-assurance)
    -   [8.1 Certificate of Origin](#certificate-of-origin)

## Netiquette

**Please read [Netiquette](http://eLinux.org/Netiquette "Netiquette") before interacting
with the Open Source Communities**

-   [Patch\_Submission\_HOWTO](http://eLinux.org/Patch_Submission_HOWTO "Patch Submission HOWTO")

## Community sites

### General Portals

-   [Linux.com](http://www.linux.com) - Linux community portal sponsored
    by the [Linux Foundation](http://www.linuxfoundation.org)
-   [LinuxGizmos.com](http://www.linuxgizmos.com) - the canonical (no
    pun intended) place for news about embedded Linux (and the successor
    to the now-inactive LinuxDevices.com, which is now available as a
    static, searchable 15,000 page
    [archive](http://archive.linuxgizmos.com))
-   [Linux.org](http://www.linux.org) - an excellent starting place for
    all things linux

### Hardware-Specific Communities

-   [ARM Linux](http://www.arm.linux.org.uk/) - the central place for
    Linux on ARM, this is where you find Russell Kings patch tracker for
    example
-   [Beagle Board community](http://www.beagleboard.org) - Portal for
    the Beagle Board community, sponsored by TI
-   [OpenSourceMID.org community](http://www.opensourcemid.org) - Portal
    for the K7 OMAP3530 MID community
-   [PandaBoard community](http://www.pandaboard.org) - Portal for the
    PandaBoard community, sponsored by TI
-   [Parallella community](http://www.parallella.org) - Portal for the
    Parallella community, a \$99 Linux supercomputer.
-   [Raspberry Pi community](http://www.raspberrypi.org) - Portal for
    the Raspberry Pi community, an ARM GNU/Linux box for \$25. Take a
    byte!
-   [Snowball community](http://www.igloocommunity.org) - Portal for the
    Snowball community
-   [UDOO community](http://www.udoo.org) - Portal for the UDOO
    community. Android, Linux and Arduino in a tiny single-board
    computer
-   [Improv community](http://www.makeplaylive.com) - Portal for the
    Improv community. A Modular ARM GNU/Linux and Android single-board
    computer system for everyone.
-   [ODROID community](http://forum.odroid.com) - Portal for the ODROID
    community
-   [NVidia Tegra
    community](https://devtalk.nvidia.com/default/board/139/) - Portal
    for the NVidia Tegra (e.g. Jetson TK1) community
-   [Sunxi Linux Community](http://linux-sunxi.org) - Wiki for Allwinner
    SoC based devices - eg. some Olimex boards, Cubieboard, Banana pi,
    ...
-   [Exynos Linux Wiki](http://linux-exynos.org) - Wiki for Samsung
    Exynos based devices - eg, Odroid, some Chromebooks, ...

### Software-Specific Communities

-   [Moblin community](http://www.moblin.org) - portal for the Moblin
    community (merged with Maemo to form Meego - see next item)
-   [Meego community](http://www.meego.com) - portal for the Meego
    community
-   [Yocto Project](http://www.yoctoproject.org) - portal for the Yocto
    project

### Communities for beginners

-   [Kernel newbies](http://kernelnewbies.org/) - General site for
    people getting started developing on the Linux kernel
-   [Japanese site for kernel
    newbies](http://jp.kernelnewbies.org/webresources)
-   [Embedded Systems Common Technical
    Baseline](http://www.embedded-systems-portal.com/CTB) - Although not
    directly related to Linux this site is an excellent overview of what
    embedded systems are seen from various angles (hardware, software,
    design methods, etc...)
-   [Community Participation
    Guides](http://eLinux.org/Community_Participation_Guides "Community Participation Guides")
    - Resources for how to participate in Open Source Communities.

## People

This section lists inviduals who are "movers and shakers" in embedded
Linux: For more Information be sure to checkout
[MAINTAINERS](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=MAINTAINERS;hb=master)

### Linux kernel

#### Important kernel figures

-   Linus Torvalds - Linux kernel initiator and head maintainer
-   Andrew Morton - Maintains an important secondary (staging) tree
-   David Woodhouse - Embedded Linux maintainer
-   Matt Mackall - Embedded Linux maintainer, originator of Linux-tiny
    patch set (author of SLOB allocator), author of kpagemap and smem
-   Greg Kroah-Hartman - Initiator and maintainer of the Linux Driver
    Project / Staging Tree and quite a handyman
-   Stephen Rothwell - Maintainer of the Linux-Next-Tree, most stuff
    goes in there before getting merged into Linus' tree
-   Paul Gortmaker - Embedded Linux maintainer
-   Ted Tso - EXT4 maintainer, Kernel Summit organizer
-   James Bottomley - SCSI maintainer, Linux Foundation technical
    advisory board chair

#### Kernel arch maintainers

-   Arnd Bergman, Russell King - ARM kernel maintainers
-   Ingo Molnar, Thomas Gleixner, Peter Anvin - x86 maintainers
-   Paul Mundt - SH kernel maintainer
-   Ralf Baechle - MIPS kernel maintainer
-   Greg Ungerer - uCLinux/Coldfire kernel maintainer
-   Haavard Skinnemoen - avr32 kernel Maintainer (Atmel)

#### Feature developers/maintainers

-   David Woodhouse - MTD/jffs2 author, embedded Linux kernel maintainer
-   Andi Kleen - Author of bloat-o-meter
-   Ingo Molnar - Author of RT-preempt patch set, kernel scheduler
    maintainer, x86 maintainer
-   Phillip Lougher - Author of [Squash FS](http://eLinux.org/Squash_FS "Squash FS")
-   Jason Wessel - KDB maintainer
-   John Stultz - Mainliner of many Android technologies
-   Thomas Gleixner - RT-preempt maintainer, x86 maintainer, IRQ
    subsystem maintainer
-   Colin Cross - Google Android developer

### Other People

-   Jason Wessel - Wind River Linux Architect
-   Sean Hudson - Mentor Graphics Embedded Linux Architect
-   David Rusling - CTO of Linaro
-   Richard Purdie - Poky originator, Yocto Project architect
-   David Stewart - Yocto Project leader
-   Bradley Kuhn - SFLC license enforcement agent
-   David Anders - TI contractor, elinux wiki contributor
-   Tim Bird - Sony Linux researcher, CE WG AG chair, ELC organizer
-   Paul Walmsley - OMAP kernel developer
-   Ben Dooks - ARM/Samsung arch kernel maintainer
-   Catalin Marinas - ARM kernel developer (developer of numerous ARM
    BSPs, as well as kmemleak author)
-   Thomas Petazzoni - Marvel SOC kernel developer
-   Michael Opdenaker - Free Electrons founder

### Interview candidates

The following page has a list of people we'd like to interview for an
eLinux.org feature:

-   [Interviews](http://eLinux.org/Interviews "Interviews")

## Foundations and Forums

-   [ARM Development Discussion
    Forum](http://www.embedinfo.com/cforum/arm_forum_find.asp?bid=6)
    launched by [Embest](http://armkits.com)
-   [Embest Product User
    Forum](http://www.embedinfo.com/cforum/arm_forum_find.asp?bID=7)
-   [CE Workgroup](http://eLinux.org/CE_Workgroup "CE Workgroup") of the Linux Foundation
    (formerly the [CE Linux Forum](http://eLinux.org/CE_Linux_Forum "CE Linux Forum"))
    -   [Embedded Linux Conference
        Presentations](http://eLinux.org/ELC_Presentations "ELC Presentations")
    -   [CE Workgroup page on the Linux Foundation
        site](http://www.linuxfoundation.org/collaborate/workgroups/celf)
    -   (deprecated: [old CELF home page](http://www.celinuxforum.org/))
-   [Linux Foundation](http://www.linuxfoundation.org/)

## Linux User Groups

One way to get involved with a bunch of like-minded Linux enthusiasts is
to participate in a local Linux users group. The following site has a
good database of Linux users groups:

-   [www.linux.org/groups](http://www.linux.org/groups/)
-   [CLUE LUG List](http://www.cluecan.ca/flexinode/table/1) - Canadian
    User Group listing.
-   [Bangalore Beagle User Group
    Meet](http://eLinux.org/BeagleBoard/bangalore_user_meet "BeagleBoard/bangalore user meet")

## Development Model

-   [The Cathedral and the
    Bazaar](http://www.catb.org/~esr/writings/cathedral-bazaar/cathedral-bazaar/)
-   FIXTHIS - add more links to papers and articles about the
    development model

### Reasons for contributing to open source

-   [Open Source ROI
    Model](http://eLinux.org/Open_Source_ROI_Model "Open Source ROI Model") - a page
    about return on investment from open source contributions

## Community-building ideas

See a discussion thread on this at:
[http://lists.celinuxforum.org/pipermail/celinux-dev/2012-September/000637.html](http://lists.celinuxforum.org/pipermail/celinux-dev/2012-September/000637.html)

In 2012, Tim Bird proposed 4 activities to encourage more embedded Linux
collaboration and community-building:

1. Resurrect the celinux-dev mailing list

-   Ideas:
    -   Use it more often for discussion
    -   Promote on other lists (linux-embedded...?)
    -   Introduce people who are using it to each other

2. more focused groups at upcoming conferences.

-   Ideas:
    -   have informal meeting places for specific topical areas

3. I'm looking for ways to invigorate the elinux.org wiki site.

-   Ideas:
    -   more contests?

4. more involvement in and use of the LTSI kernel

-   Ideas:
    -    ???

Other ideas:

-   a 'planet' feed or news feed for embedded linux users
    -   possibly: planet.elinux.org (Bill Traynor is working on it)
    -   Thomas Petazzoni made one here:
        [http://www.emlinews.net/](http://www.emlinews.net/)
        -   go to
            [http://www.emlinews.net/submit/](http://www.emlinews.net/submit/)
            to submit a news article

-   help bridge between embedded and non-embedded mainline developers
    (a'la Arnd Bergmann)
    -   see reference to Arnd here:
        [http://lists.celinuxforum.org/pipermail/celinux-dev/2012-September/000645.html](http://lists.celinuxforum.org/pipermail/celinux-dev/2012-September/000645.html)
-   Better/open discussion on funded projects for embedded Linux
    -   possible projects: mini-distro for software update
    -   create a Google hangout for a discussion on this

## Quality Assurance

This section has links to aspects of the development model designed to
provide quality assurance.

### Certificate of Origin

Developers who contribute code to the Linux kernel agree to the
[Developer Certificate Of
Origin](http://eLinux.org/Developer_Certificate_Of_Origin "Developer Certificate Of Origin")
by signing their code, with a "Signed Off By" line.



* * * * *


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [NeedsEditing](http://eLinux.org/Category:NeedsEditing "Category:NeedsEditing")
-   [Community](http://eLinux.org/Category:Community "Category:Community")

