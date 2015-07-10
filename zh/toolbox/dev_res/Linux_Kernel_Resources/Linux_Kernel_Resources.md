> From: [eLinux.org](http://eLinux.org/Linux_Kernel_Resources "http://eLinux.org/Linux_Kernel_Resources")


# Linux Kernel Resources



This page has references to various kernel resources (web sites and
mailing lists) for developers. Most of this information was gathered
over a year ago, and may not be accurate.

/\\ *Note: You should always look at the kernel MAINTAINERS file for
up-to-date information*

## Contents

-   [1 Vanilla Linux kernel](#vanilla-linux-kernel)
    -   [1.1 Mailing List (lkml)](#mailing-list-lkml)
    -   [1.2 LKML summaries](#lkml-summaries)
    -   [1.3 Repository access](#repository-access)
    -   [1.4 News](#news)
    -   [1.5 Changelog](#changelog)
-   [2 Architecture Sites](#architecture-sites)
    -   [2.1 MIPS](#mips)
    -   [2.2 ARM](#arm)
    -   [2.3 PowerPC](#powerpc)
    -   [2.4 SuperH (SH)](#superh-sh)
-   [3 Documentation](#documentation)
    -   [3.1 Online](#online)
    -   [3.2 Books](#books)
-   [4 Cross-reference / code online](#cross-reference-code-online)

## Vanilla Linux kernel

-   [www.kernel.org](http://www.kernel.org/)
-   [Linux Kernel Source Tarballs](http://kernel.org/pub/linux/kernel/)
-   [Linus' Git
    Repository](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=summary)

### Mailing List (lkml)

-   [The Big List of Linux Kernel mailing lists, and where to find their
    archives](http://vger.kernel.org/vger-lists.html)
    -   [LKML](http://vger.kernel.org/vger-lists.html#linux-kernel) -
        The Linux Kernel Mailing List (where the big boys hang out)
    -   [linux-embedded](http://vger.kernel.org/vger-lists.html#linux-embedded)
        - Embedded Linux Kernel List
-   [How to subscribe to these
    lists](http://vger.kernel.org/majordomo-info.html)

### LKML summaries

-   [LWN Kernel page](http://lwn.net/Kernel/) - Linux Weekly News kernel
    coverage

### Repository access

-   [Kernel Git repositories](http://git.kernel.org)
-   [Vanilla Linux Git
    Tree](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=summary)
    - This is "upstream". Get your code into here, please.
    -   But [this
        one](http://padator.org/linux/full-history-linux.git.tar) has
        all the going back to 0.0.1, and updates itself from Linus's
        tree when you do a "git pull". (This is really cool. You want
        this.)

### News

-   [Linux Weekly News, Kernel page](http://lwn.net/Kernel/)

### Changelog

-   Comprehensible changelog of the linux kernel
    -   [http://wiki.kernelnewbies.org/LinuxChanges](http://wiki.kernelnewbies.org/LinuxChanges)

-   LWN atricles for spcific releases
    -   2.6.3
        [http://lwn.net/Articles/71669/](http://lwn.net/Articles/71669/)
    -   2.6.10
        [http://lwn.net/Articles/117187/](http://lwn.net/Articles/117187/)
    -   2.6.12
        [http://lwn.net/Articles/140165/](http://lwn.net/Articles/140165/)
    -   2.6.15
        [http://lwn.net/Articles/166130/](http://lwn.net/Articles/166130/)

-   LWN aricles on 2.6 API changes
    -   2.6 API changes
        [http://lwn.net/Articles/2.6-kernel-api/](http://lwn.net/Articles/2.6-kernel-api/)
    -   2.6.12 API changes
        [http://lwn.net/Articles/140164/](http://lwn.net/Articles/140164/)

## Architecture Sites

### MIPS

-   web site =
    [http://www.linux-mips.org/wiki/Main\_Page](http://www.linux-mips.org/wiki/Main_Page)
-   mailing list =
    [http://www.linux-mips.org/wiki/Net\_Resources\#Mailing\_lists](http://www.linux-mips.org/wiki/Net_Resources#Mailing_lists)
-   Maintainer = Ralph Baechle

-   there's an alternate site on [Source
    Forge](http://eLinux.org/Source_Forge "Source Forge")
-   the site is:
    [http://sourceforge.net/projects/linux-mips](http://sourceforge.net/projects/linux-mips)
-   Note that this is used for experimental stuff that hasn't been
    merged into the official mips tree by Ralph Baechle

### ARM

-   web site =
    [http://www.arm.linux.org.uk/](http://www.arm.linux.org.uk/)
-   cvs access =
    [http://cvs.arm.linux.org.uk/](http://cvs.arm.linux.org.uk/)
-   mailing list =
    [http://www.arm.linux.org.uk/armlinux/mailinglists.php](http://www.arm.linux.org.uk/armlinux/mailinglists.php)
-   wiki = [http://www.linux-arm.org/](http://www.linux-arm.org/)
-   Maintainer = Russell King

### [PowerPC](http://eLinux.org/PowerPC "PowerPC")

-   web site = [http://penguinppc.org/](http://penguinppc.org/)
-   mailing lists =
    [http://penguinppc.org/about/community.php\#lists](http://penguinppc.org/about/community.php#lists)
-   Git repository =
    kernel.org:/pub/scm/linux/kernel/git/paulus/powerpc.git
-   Maintainer = Paul Mackerras
-   Power Macintosh Maintainer = Benjamin Herrenschmidt

-   cross-compiler mini-howto:
    [http://penguinppc.org/embedded/cross-compiling/](http://penguinppc.org/embedded/cross-compiling/)

See the following for information on different linuxppc source trees
available:
[http://www.penguinppc.org/dev/kernel.shtml](http://www.penguinppc.org/dev/kernel.shtml)

### SuperH (SH)

-   [www.linux-sh.org](http://www.linux-sh.org/)
-   [oss.renesas.com/](http://oss.renesas.com/)
-   Git repository =
    kernel.org:/pub/scm/linux/kernel/git/lethal/sh-2.6.git
-   mailing list address = linux-sh@vger.kernel.org
-   mailing list page =
    [http://vger.kernel.org/vger-lists.html\#linux-sh](http://vger.kernel.org/vger-lists.html#linux-sh)
-   mailing list archives =
    [http://news.gmane.org/gmane.linux.ports.sh.devel](http://news.gmane.org/gmane.linux.ports.sh.devel)
-   wiki =
    [http://linux-sh.org/shwiki/FrontPage](http://linux-sh.org/shwiki/FrontPage)
-   Maintainer = Paul Mundt

## Documentation

### Online

-   Rusty Russell's [Unreliable Guide to
    Locking](http://kernelbook.sourceforge.net/kernel-locking.html)
-   Embedded Linux kernel and driver development - [Free Tutorials at
    Free Electrons](http://free-electrons.com/training/drivers)
-   Linux USB drivers - [USB Driver Tutorial at Free
    Electrons](http://free-electrons.com/articles/linux-usb)

### Books

-   *Linux Kernel Developmen*t by Robert Love
    -   Good introduction to Linux kernel development
-   *Linux Device Drivers* by Jonathan Corbet, Alessandro Rubini, and
    Greg Kroah-Hartman
    -   Great book for getting started with Linux device drivers
    -   Free online pdf edition:
        [http://lwn.net/images/pdf/LDD3/](http://lwn.net/images/pdf/LDD3/)
    -   online html
        [http://www.makelinux.net/ldd3/](http://www.makelinux.net/ldd3/)
-   *Essential Linux Device Drivers* by Sreekrishnan Venkateswaran
    -   Introduction to driver development for major subsystems
-   *Professional Linux Kernel Architecture* by Wolfgang Mauerer
    -   Introduction to the architecture, concepts and algorithms of the
        Linux kernel
-   *Understanding the Linux Kernel* by Daniel Bovet and Marco Cesati
    -   Guided tour of the code that forms the core of all Linux
        operating systems
-   *Linux Kernel in a Nutshell* by Greg Kroah-Hartman
    -   Overview of kernel configuration and building
    -   Free online edition:
        [http://www.kroah.com/lkn/](http://www.kroah.com/lkn/)

## Cross-reference / code online

-   [http://www.makelinux.net/kernel\_map](http://www.makelinux.net/kernel_map)
-   [http://lxr.free-electrons.com/](http://lxr.free-electrons.com/)
-   [http://sosdg.org/\~coywolf/lxr/source/](http://sosdg.org/~coywolf/lxr/source/)
-   [http://lxr.linux.no/source/](http://lxr.linux.no/source/)
-   [http://lxr.devzen.net/source/](http://lxr.devzen.net/source/)
-   [Find a kernel function
    line](http://eLinux.org/Find_a_kernel_function_line "Find a kernel function line")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

