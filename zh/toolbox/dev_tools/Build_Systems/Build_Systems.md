> From: [eLinux.org](http://eLinux.org/Build_Systems "http://eLinux.org/Build_Systems")


# Build Systems



-   [Open Embedded](http://eLinux.org/Open_Embedded "Open Embedded") - System for
    building full embedded images from scratch. Note that this is used
    by the [Yocto Project](http://eLinux.org/Yocto_Project "Yocto Project") as it's build
    system (but see note below for more detail).
-   [Buildroot](http://eLinux.org/Buildroot "Buildroot") - Easy-to-use embedded Linux
    build system
-   [OpenADK](http://www.openadk.org) - Open Source Appliance
    Development Kit
-   [PTXdist](http://www.pengutronix.de/software/ptxdist/index_en.html)
    -   Kconfig based build system developed by
        [Pengutronix](http://www.pengutronix.de/index_en.html)
    -   GPL licensed
    -   [Video](http://free-electrons.com/pub/video/2009/fosdem/fosdem2009-schwebel-ptxdist.ogv)
        of a talk given by PTXdist maintainer Robert Schwebel at [FOSDEM
        2009](http://www.fosdem.org)
-   [Linux From Scratch](http://www.linuxfromscratch.org/)
-   [Nard SDK](http://www.arbetsmyra.dyndns.org/nard/) For industrial
    embedded systems
-   LTIB - Linux Target Image Builder (by Stuart Hughes of FreeScale) -
    see
    [http://savannah.nongnu.org/projects/ltib](http://savannah.nongnu.org/projects/ltib)
    -   [Slides](http://www.bitshrine.org/celf_ltib_bof_v1.2.pdf) and
        [video](http://free-electrons.com/pub/video/2008/ols/ols2008-stuart-hughes-ltib.ogg)
        of a talk on LTIB at the Ottawa Linux Symposium 2008
-   [OpenBricks](http://eLinux.org/index.php?title=OpenBricks&action=edit&redlink=1 "OpenBricks (page does not exist)")
    - Embedded Linux Framework
    -   OpenBricks provides a set of packages, patches and shell-based
        rules that creates a toolchain and a rootfs with customized
        packages and features selection.
    -   Currently supports x86\_32, x86\_64, PowerPC, PowerPC64 and ARM
        architectures with either uClibc, Glibc or eGlibc C library.
-   [Building Embedded
    Userlands](http://www.mvista.com/download/fetchdoc.php?docid=342) -
    Presentation by Ned Miljevic & Klaas van Gend at the ELC 2008 which
    compares different configuration and build systems.
    [Video](http://free-electrons.com/pub/video/2008/elce/elce2008-miljevic-van-gend-embedded-userlands.ogv)
    of the conference available.
-   [Scratchbox](http://eLinux.org/Scratchbox "Scratchbox") Cross-Compilation Toolkit,
    with support for x86 and arm.
-   [OpenWRT](http://eLinux.org/Open_Wrt "Open Wrt") Cross-Compilation Toolkit mainly
    geared towards wireless routers but can be extended to other
    platforms, with support for x86, MIPS and ARM.
-   [Yocto Project](http://eLinux.org/Yocto_Project "Yocto Project") - The Yocto Project
    is an umbrella project which uses [Open
    Embedded](http://eLinux.org/Open_Embedded "Open Embedded") as it's build system.
    -   I have heard it argued that the Poky meta-data for Open Embedded
        actually constitute the primary build system for the Yocto
        Project. Since Open Embedded somewhat conflates the package data
        and the build scripts in the recipe files, there is some truth
        to this.

See also [Toolchains](../../../toolbox/dev_tools/Toolchains/Toolchains.md "Toolchains")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

