> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code "http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code")


# LeapFrog Pollux Platform: Source Code



## Contents

-   [1 Official LeapFrog Sources](#official-leapfrog-sources)
    -   [1.1 Didj](#didj)
    -   [1.2 Leapster Explorer](#leapster-explorer)
    -   [1.3 LeapPad1 Explorer](#leappad1-explorer)
-   [2 Homebrew](#homebrew)
    -   [2.1 Didj](#didj-2)
-   [3 Boot Loaders](#boot-loaders)
    -   [3.1 Didj](#didj-3)
    -   [3.2 Explorer and LeapPad1](#explorer-and-leappad1)
-   [4 Toolchains](#toolchains)

## Official LeapFrog Sources

### Didj

[LeapFrog Open Source Compliance
Document](http://www.leapfrog.com/etc/medialib/leapfrog/legal.Par.14642.File.dat/Additional%20Third%20Party%20Notices%20for%20LF%20Connect%20Application%20.pdf)

2008-04-29 Release

-   [2008
    version](http://medialib.leapfrog.com/didj_opensource_code/Didj-Linux-3197-20080429-1631.tar.gz)

2009-04-22 Release

-   [2009
    version](http://medialib.leapfrog.com/didj_opensource_code/Didj-Linux-4222-20090422-1236.tar.gz)



### Leapster Explorer

-   The LeapPad1 sources include the Leapster Explorer

2010-10-26 Release

-   [LF-Linux-8291-20101026-1425.tar.gz
    99MB](http://files.poxlib.org/LF-Linux-8291-20101026-1425.tar.gz)

-   [LF-OE-346-20101026-0945.tar.gz
    337MB](http://files.poxlib.org/LF-OE-346-20101026-0945.tar.gz)

-   [LF-ThirdParty-8291-20101025-1623.tar.gzz
    20MB](http://files.poxlib.org/LF-ThirdParty-8291-20101025-1623.tar.gz)


 2010-06-10 Release

-   [LF-Linux-6905-20100610-0915.tar.gz
    94MB](http://files.poxlib.org/LF-Linux-6905-20100610-0915.tar.gz)

-   [LF-OE-251-20100614-0852.tar.bz2
    320MB](http://files.poxlib.org/LF-OE-251-20100614-0852.tar.bz2)

-   [LF-ThirdParty-7299-20100609-1458.tar.gz
    20MB](http://files.poxlib.org/LF-ThirdParty-7299-20100609-1458.tar.gz)

### LeapPad1 Explorer

2011-06-02 Release

-   [LF-Linux-2503-20110602-1237.tar.gz
    132MB](http://files.poxlib.org/LeapFrog/LF-Linux-2503-20110602-1237.tar.gz)

-   [LF-OE-545-20110602-1237.tar.gz
    340MB](http://files.poxlib.org/LeapFrog/LF-OE-545-20110602-1237.tar.gz)

-   [LF-ThirdParty-7594-20110602-1237.tar.gz
    20MB](http://files.poxlib.org/LeapFrog/LF-ThirdParty-7594-20110602-1237.tar.gz)


 2011-12-15 Release

-   [LF-Linux-2826-20111215-1417.tar.gz
    132MB](http://files.poxlib.org/LeapFrog/LF-Linux-2826-20111215-1417.tar.gz)

-   [LF-OE-545-20111216-0926.tar.gz
    282MB](http://files.poxlib.org/LeapFrog/LF-OE-545-20111216-0926.tar.gz)

-   [LF-ThirdParty-9494-20111215-1818.tar.gz
    29MB](http://files.poxlib.org/LeapFrog/LF-ThirdParty-9494-20111215-1818.tar.gz)


 2013-02-13 Release

-   First to use Angstrom
-   [LF-Pollux\_Sources\_20130213.tar.gz
    465MB](http://files.poxlib.org/LeapFrog/LF-Pollux_Sources_20130213.tar.gz)

## Homebrew

### Didj

-   Jburk's OpenDidj Linux Kernel/Rootfs Tree [Git
    Repository](https://github.com/jburks/OpenDidj)

-   Corbin's OpenDidj Linux Kernel Tree [Git
    Repository](http://git.kernel.org/?p=linux/kernel/git/csimpson/linux-2.6.git;a=summary)

-   Claude's OpenDidj Linux Kernel Tree (LF 2008 Source) [Git
    Repository](http://git.berlios.de/cgi-bin/gitweb.cgi?p=opendidj;a=summary)

-   OpenLF
    -   2011-12-15 Sources adapted for Didj. With Emerald-Boot [Git
        Repository](https://github.com/jrspruitt/OpenLF-Kernel)
    -   Buildroot set up for above kernel. [Git
        Repository](https://github.com/jrspruitt/OpenLF-Buildroot)

## Boot Loaders

### Didj

-   [Lightning Boot](http://eLinux.org/Didj_Lightning_Boot "Didj Lightning Boot")

### Explorer and LeapPad1

-   [Emerald
    Boot](http://eLinux.org/Leapster_Explorer:_Emerald_Boot "Leapster Explorer: Emerald Boot")

## Toolchains

Should work on all sources codes listed.

Recommended

-   [RidgeRun
    Toolchain](http://files.poxlib.org/LeapFrog/RidgeRun-toolchain-369009.tar.bz2)

Alternates

-   [Devroot](http://code.jeffkent.net/trac/nc600/wiki/DevrootGuide)
    (Works on bootloaders/U-Boot only)
-   [Creating a Kernel Build
    Scratchbox](http://eLinux.org/Didj_Kernel_Build_Environment "Didj Kernel Build Environment")
-   [Setting up a Cross Compiler Build Environment and Basic
    Usage](http://eLinux.org/Didj_Build_Environment "Didj Build Environment")
-   [An alternate cross compiler, built with
    crosstool-NG](http://eLinux.org/Didj_crosstool-NG_Build_Environment "Didj crosstool-NG Build Environment")
-   [Buildroot Rootfs & Kernel for
    Didj](https://github.com/jrspruitt/OpenLF-Buildroot) (based on
    2011-12-15 Release)

OE/BitBake

-   [Install OE and
    BitBake](http://eLinux.org/LeapFrog_Explorers:_Install_OE_and_BitBake "LeapFrog Explorers: Install OE and BitBake")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad1
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad1_Explorer&action=edit&redlink=1 "Category:LeapPad1 Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

