> From: [eLinux.org](http://eLinux.org/Security "http://eLinux.org/Security")


# Security



## Contents

-   [2 Introduction](#introduction)
-   [3 Technology/Project pages](#technology-project-pages)
-   [4 Security Systems in Linux
    Kernel](#security-systems-in-linux-kernel)
    -   [4.1 SELinux](#selinux)
    -   [4.2 Tomoyo](#tomoyo)
    -   [4.3 SMACK](#smack)
-   [5 Older Information (From CELF investigations prior to
    2005)](#older-information-from-celf-investigations-prior-to-2005)
    -   [5.1 Documents](#documents)
    -   [5.2 Key Requirements and the Related
        Technologies](#key-requirements-and-the-related-technologies)
    -   [5.3 Resources](#resources)
        -   [5.3.1 Security Frameworks](#security-frameworks)
        -   [5.3.2 Security Components](#security-components)
        -   [5.3.3 Security features](#security-features)
        -   [5.3.4 Other Resources](#other-resources)
            -   [5.3.4.1 Security Activities](#security-activities)
            -   [5.3.4.2 Mailing lists](#mailing-lists)
            -   [5.3.4.3 Conferences](#conferences)
            -   [5.3.4.4 Security Articles](#security-articles)
            -   [5.3.4.5 Papers](#papers)
            -   [5.3.4.6 Sample and Opensource
                code](#sample-and-opensource-code)


## Introduction

This page has information about Security technologies for Embedded
Linux.

## Technology/Project pages

-   [Security Hardware
    Resources](../.././dev_portals/Security/Security_Hardware_Resources/Security_Hardware_Resources.md "Security Hardware Resources")
-   [Bootloader Security
    Resources](../.././dev_portals/Security/Bootloader_Security_Resources/Bootloader_Security_Resources.md "Bootloader Security Resources")
-   [Mandatory Access Control
    Comparison](../.././dev_portals/Security/Mandatory_Access_Control_Comparison/Mandatory_Access_Control_Comparison.md "Mandatory Access Control Comparison")

## Security Systems in Linux Kernel

### SELinux

-   [SELinux](../.././dev_portals/Security/SELinux/SELinux.md "SELinux") - This provides an implementation of
    the Flask Flux Advanced Security Kernel for Linux. SELinux started
    as a kernel patch which was presented by the NSA to kernel
    developers during the 2001 kernel summit. Feeback from this
    presentation started the LSM project, and the SELinux project helped
    define large parts of the LSM interface.
    -   OLS 2008 paper: [SELinux for Consumer Electronics
        Devices](http://eLinux.org/images/8/88/Nakamura-reprint.pdf "Nakamura-reprint.pdf")
        Nakamura & Sameshima, Hitachi Software Engineering.
    -   ELC 2008 presentation: [Embedded
        SELinux](http://eLinux.org/images/a/a3/ELC2008_nakamura.pdf "ELC2008 nakamura.pdf")

### Tomoyo

-   [TOMOYO Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") is a technology to
    improve Linux's security originally developed by [NTT DATA
    CORPORATION, Japan](http://www.nttdata.co.jp/en/index.html). [TOMOYO
    Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") was released on November, 11,
    2005 as an open source software under the GPL. [TOMOYO
    Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") is a mechanism called Secure OS,
    which can perform fine grained access control by breaking access
    permissions into parts like SELinux.
    -   [ELC2007
        presentation](http://eLinux.org/images/b/b5/Elc2007-presentation-20070418-for_linux.pdf "Elc2007-presentation-20070418-for linux.pdf")
    -   [OLS2007 BoF
        slides](http://eLinux.org/images/e/eb/Ols2007-tomoyo-20070629.pdf "Ols2007-tomoyo-20070629.pdf")

Tomoyo was incorporated into mainline Linux kernel as of version 2.6.28.

### SMACK

-   SMACK - Simple Mandatory Access Control Kernel. This is a
    lightweight implementation of MAC in the Linux kernel.
    -   Home Page (very simple):
        [http://schaufler-ca.com/](http://schaufler-ca.com/)
    -   LWN.net article:
        [http://lwn.net/Articles/244531/](http://lwn.net/Articles/244531/)
    -   CELF-commissioned white paper: [SMACK for Digital
        TV](http://www.embeddedalley.com/pdfs/Smack_for_DigitalTV.pdf)
        by Embedded Alley (now Mentor Graphics)

SMACK was incorporated into the mainline Linux kernel as of version
2.6.25

# Older Information (From CELF investigations prior to 2005)

## Documents

-   CELF 1.0 Security Specification: [Security
    Spec\_R2](http://www.celinuxforum.org/CelfPubWiki/SecuritySpec_R2)

## Key Requirements and the Related Technologies

Where the technologies are defined as follows:

1.  Umbrella
2.  Linux Security Module (LSM) framework
3.  PAX patch – (currently x86 only)
4.  LOMAC
5.  LIDS
6.  Netfilter
7.  digsig/bsign/elfsig
8.  Trusted Computing Group (TCG)
9.  TPE (included with LIDS)
10. PRAMFS
11. ACL file system extensions
12. Posix capabilities associated with files

<table>
<thead>
<tr class="header">
<th align="left">Requirements</th>
<th align="left">Technologies</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Reliability</td>
<td align="left">10</td>
</tr>
<tr class="even">
<td align="left">Secure/trusted boot</td>
<td align="left">8</td>
</tr>
<tr class="odd">
<td align="left">Access control</td>
<td align="left">1, 4, 5, 11, 12</td>
</tr>
<tr class="even">
<td align="left">Buffer/stack protection</td>
<td align="left">3</td>
</tr>
<tr class="odd">
<td align="left">Intrusion detection</td>
<td align="left">5, 8</td>
</tr>
<tr class="even">
<td align="left">Configurable security</td>
<td align="left">1, 2, 4, 5, 7, 9(?), 11, 12</td>
</tr>
<tr class="odd">
<td align="left">Authentication</td>
<td align="left">1, 7</td>
</tr>
<tr class="even">
<td align="left">Signed binaries</td>
<td align="left">1, 7</td>
</tr>
<tr class="odd">
<td align="left">Trusted connection</td>
<td align="left">IPSec, SSL already supported</td>
</tr>
<tr class="even">
<td align="left">Secure services</td>
<td align="left">1, 4, 5, 7, 8</td>
</tr>
<tr class="odd">
<td align="left">Firewall</td>
<td align="left">6</td>
</tr>
<tr class="even">
<td align="left">API support for security hardware</td>
<td align="left">8</td>
</tr>
<tr class="odd">
<td align="left">Secure field upgradeability</td>
<td align="left">9</td>
</tr>
<tr class="even">
<td align="left">Authentication</td>
<td align="left">8</td>
</tr>
</tbody>
</table>

Of the listed technologies the CELF Security Working Group is studying
or supporting the following:

-   Umbrella
-   PAX - only monitor for now
-   LIDS
-   Signed Binaries
    -   Dig Sig (part of DSI project at
        [http://disec.sourceforge.net/](http://disec.sourceforge.net/))
    -   Bsign (a Debian project at
        [http://packages.debian.org/squeeze/bsign](http://packages.debian.org/squeeze/bsign))
    -   [ELFSign](http://www.hick.org/code/skape/papers/elfsign.txt)
-   Linux API for TCG - pending CELF NPO status and liaison discussions
-   TPE - as a part of LIDS
-   ACL file system extensions - for those that CELF needs (PRAMFS,
    JFFS2). Also follow LKLM discussions and maybe do implementations
-   POSIX capabilities associated with files

## Resources

### Security Frameworks

-   [The Linux Security Modules (LSM)](http://lsm.immunix.org) project
    provides a lightweight, general-purpose framework for access
    control. Contemporary computing environments are increasingly
    hostile. Adding enhanced access control models to the kernel
    improves host security and can help a server survive malicious
    attacks. Security research has provided many types of enhanced
    access controls effective for different environments. The LSM
    framework allows access control models to be implemented as loadable
    kernel modules.

-   [Medusa DS9 Security Project](http://medusa.terminus.sk/) is a
    project to enhance the security of Linux kernel, which implements
    the ZP Security Framework. The main goal of a project is to
    implement a framework for implementation of any security model
    (unlike other secure Linux kernel projects).

Medusa DS9 is used to increase Linux's security. It consists of two
major parts, Linux kernel changes and the user-space daemon. Kernel
changes do the monitoring of syscalls, filesystem actions, and
processes, and they implement the communication protocol. The security
daemon communicates with the kernel using the character device to send
and receive packets. It contains the whole logic and implements the
concrete security policy. That means that Medusa can implement any model
of data protection; it depends only on configuration file, which is in
fact a program in the internal programming language, somewhat similar to
C.

-   [Rule Set Based Access Control (RSBAC)](http://www.rsbac.org) is a
    flexible, powerful and fast open source access control framework for
    current Linux kernels, which has been in stable production use since
    January 2000 (version 1.0.9a). All development is independent of
    governments and big companies, and no existing access control code
    has been reused.

The standard package includes a range of access control models like MAC,
RC, ACL (see below). Furthermore, the runtime registration facility
(REG) makes it easy to implement your own access control model as a
kernel module and get it registered at runtime.

The RSBAC framework is based on the Generalized Framework for Access
Control (GFAC) by Abrams and La Padula. All security relevant system
calls are extended by security enforcement code. This code calls the
central decision component, which in turn calls all active decision
modules and generates a combined decision. This decision is then
enforced by the system call extensions.

Decisions are based on the type of access (request type), the access
target and on the values of attributes attached to the subject calling
and to the target to be accessed. Additional independent attributes can
be used by individual modules, e.g. the privacy module (PM). All
attributes are stored in fully protected directories, one on each
mounted device. Thus changes to attributes require special system calls
provided.

-   [TrustedBSD MAC Framework](http://www.trustedbsd.org/mac.html) -
    Mandatory access controls extend discretionary access controls by
    allowing administrators to enforce additional security for all
    subjects (e.g. processes or sockets) and objects (e.g. sockets, file
    system objects, sysctl nodes) in the system. Development of those
    new access control models is facilitated by the development of a
    flexible kernel access control extension framework, the TrustedBSD
    MAC Framework. This permits new access control models to be
    introduced as kernel modules.

-   [Trusted Computing Group
    (TCG)](https://www.trustedcomputinggroup.org/) - TCG defines a
    security architecture based on the hardware-based root of trust.
    This is a cost effective solution to establish Trusted Computing on
    various platforms. For some introductory information see Seiji
    Munetoh and Nicholas Szeto's presentation, TCGOverviewPDF, on the
    [Tech Conference
    2005Docs](../.././dev_portals/Security/Tech_Conference_2005Docs/Tech_Conference_2005Docs.md "Tech Conference 2005Docs")
    page. The Trusted Platform Module ([TPM](../.././dev_portals/Security/TPM/TPM.md "TPM")) is a security
    chip bound to the platform and a key component of this architecture.
    TCG has a Mobile Phone WG which has released a use cases document
    that is applicable to many generic CE devices in addition to the
    mobile phone -- [MPWG User
    Cases](https://www.trustedcomputinggroup.org/groups/mobile/MPWG_Use_Cases.pdf)

### Security Components

-   [SELinux](../.././dev_portals/Security/SELinux/SELinux.md "SELinux") - This provides an implementation of
    the Flask Flux Advanced Security Kernel for Linux. SELinux started
    as a kernel patch which was presented by the NSA to kernel
    developers during the 2001 kernel summit. Feeback from this
    presentation started the LSM project, and the SELinux project helped
    define large parts of the LSM interface

-   [Apparmor](http://en.opensuse.org/Apparmor) - Apparmor is an
    application security tool designed to provide an easy-to-use
    security framework for your applications.

-   [The Linux Intrusion Defence System (LIDS)](http://www.lids.org/) is
    a kernel patch and admin tools which enhances the kernel's security
    by implementing Mandatory Access Control (MAC). When it is in
    effect, chosen file access, all system network administration
    operations, any capability use, raw device, memory, and I/O access
    can be made impossible even for root. You can define which programs
    can access specific files. It uses and extends the system
    capabilities bounding set to control the whole system and adds some
    network and filesystem security features to the kernel to enhance
    the security. You can finely tune the security protections online,
    hide sensitive processes, receive security alerts through the
    network, and more. LIDS has two version trees, 1.2 and 2.2. LIDS 2.2
    supports kernel 2.6. LIDS 1.2 supports kernel 2.4 and it provides
    new functions, Trusted Path Execution(TPE) and Trusted Domain
    Enforcement(TDE). These are useful to create a sandbox. LIDS is
    released under GPL.

-   [TOMOYO Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") is a technology to
    improve Linux's security originally developed by [NTT DATA
    CORPORATION, Japan](http://www.nttdata.co.jp/en/index.html). [TOMOYO
    Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") was released on November, 11,
    2005 as an open source software under the GPL. [TOMOYO
    Linux](../.././dev_portals/Security/TomoyoLinux/TomoyoLinux.md "TomoyoLinux") is a mechanism called Secure OS,
    which can perform fine grained access control by breaking access
    permissions into parts like SELinux.
    -   [ELC2007
        presentation](http://sourceforge.jp/projects/tomoyo/document/elc2007-presentation-20070418-for_linux.pdf/en/4/elc2007-presentation-20070418-for_linux.pdf)
    -   [OLS2007 BoF
        slides](http://sourceforge.jp/projects/tomoyo/document/ols2007-tomoyo-20070629.pdf/en/4/ols2007-tomoyo-20070629.pdf)
    -   [CELF
        Wiki](http://tree.celinuxforum.org/CelfPubWiki/TomoyoLinux)

Tomoyo was incorporated into mainline Linux kernel as of version 2.6.28.

-   SMACK - Simple Mandatory Access Control Kernel. This is a
    lightweight implementation of MAC in the Linux kernel.
    -   Home Page (very simple):
        [http://schaufler-ca.com/](http://schaufler-ca.com/)
    -   LWN.net article:
        [http://lwn.net/Articles/244531/](http://lwn.net/Articles/244531/)
    -   CELF-commissioned white paper: [SMACK for Digital
        TV](http://www.embeddedalley.com/pdfs/Smack_for_DigitalTV.pdf)
        by Embedded Alley (now Mentor Graphics)

SMACK was incorporated into the mainline Linux kernel as of version
2.6.25

-   [Umbrella](http://sourceforge.net/projects/umbrella) for handhelds
    implements a combination of process based mandatory access control
    (MAC) and authentication of files for Linux on top of the Linux
    Security Modules framework. The MAC scheme is enforced by a set of
    restrictions for each process.
    -   Restrictions of resources
    -   Restrictions of access to network interfaces
    -   Restrictions on process creation and signaling
    -   Signed files

-   [LOMAC](http://opensource.nailabs.com/lomac/) is a
    dynamically-loadable security module for Free UNIX kernels that uses
    Low Water-Mark Mandatory Access Control (MAC) to protect the
    integrity of processes and data from viruses, Trojan horses,
    malicious remote users, and compromised network server daemons.
    LOMAC is designed for compatibility and ease of use - to be a form
    of MAC typical users can live with.

LOMAC is an attempt to produce a form of MAC integrity protection that
typical users can live with. LOMAC implements a simple form of MAC
integrity protection based on Biba's Low Water-Mark model in a Loadable
Kernel Module (LKM). LOMAC provides useful integrity protection against
viruses, Trojan horses, malicious remote users, and compromised network
servers without any modifications to the kernel, applications, or their
existing configurations. LOMAC is designed to be easy to use. Its
default configuration is intended to provide useful protection without
being adjusted for the specific users, servers, or other software
present on the system. LOMAC may be used to harden currently-deployed
systems simply by loading the LKM into the kernel shortly after boot
time.

-   [The Enforcer](http://sourceforge.net/projects/enforcer/) is a Linux
    Security Module designed to improve integrity of a computer running
    Linux by ensuring no tampering of the filesystem. It can interact
    with TCPA hardware to provide higher levels of assurance for
    software and sensitive data.

-   [Janus](http://www.cs.berkeley.edu/~daw/janus) is a security tool
    for sandboxing untrusted applications within a restricted execution
    environment. This can be used to limit the harm that can be caused
    by any successful compromise of the application. We have
    successfully used Janus to jail Apache, bind, and other programs
    within a limited sandbox without disturbing application behavior,
    and we continue to seek experience with using this approach in
    production environments.

-   [Domain and Type Enforcement
    (DTE)](http://www.cs.wm.edu/~hallyn/dte/) is a mandatory access
    control system which assigns types to files and domains to
    processes. Access from domains to other domains and from domains to
    types is enforced according to the DTE policy. The first
    implementation of this project closely followed the description by
    TIS in the papers titled A Domain and Type Enforcement Prototype and
    Confining Root Programs with Domain and Type Enforcement.

-   [The Realtime Linux Security Module
    (LSM)](http://sourceforge.net/projects/realtime-lsm/) is a loadable
    extension for Linux 2.6 kernels. It selectively grants realtime
    permissions to specific user groups or applications.

-   [ACL support for Linux
    kernel](http://sourceforge.net/projects/linux-acl/) - This linux
    kernel patch / user code combination allows supporting full access
    control lists (ACLs) for the Linux kernel.

-   [http://www.hu.grsecurity.net/
    grsecurity](http://grsecurity.urc.bl.ac.yu/) (mirrors, original site
    was [here](http://www.grsecurity.net/)) - is an innovative approach
    to security utilizing a multi-layered detection, prevention, and
    containment model. It is licensed under the GPL.

It offers among many other features:

-   -   An intelligent and robust Role-Based Access Control (RBAC)
        system that can generate least privilege policies for your
        entire system with no configuration
    -   Change root (chroot) hardening
    -   /tmp race prevention
    -   Extensive auditing
    -   Prevention of entire classes of exploits related to address
        space bugs (from the PaX project)
    -   Additional randomness in the TCP/IP stack
    -   A restriction that allows a user to only view his/her processes
    -   Every security alert or audit contains the IP address of the
        person that caused the event

### Security features

-   NX patch - recent patch for kernel to prohibit execution of code on
    stack segment [LKML discussion about NX
    patch](http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&threadm=232Xj-3bC-13%40gated-at.bofh.it&rnum=1&prev=/groups%3Fq%3DNX%2Bsecurity%2Blkml%26hl%3Den%26lr%3D%26ie%3DUTF-8%26selm%3D232Xj-3bC-13%2540gated-at.bofh.it%26rnum%3D1)

### Other Resources

-   Trusted Boot
    -   Security Hardware Resources -- [Security Hardware
        Resources](../.././dev_portals/Security/Security_Hardware_Resources/Security_Hardware_Resources.md "Security Hardware Resources")
    -   Bootloader Security Resources -- [Bootloader Security
        Resources](../.././dev_portals/Security/Bootloader_Security_Resources/Bootloader_Security_Resources.md "Bootloader Security Resources")

#### Security Activities

-   [Trusted Computing Group](https://www.trustedcomputinggroup.org/)
-   [Linux Security Modules](http://lsm.immunix.org)

#### Mailing lists

-   [Linux Security Modules mailing
    list](http://vger.kernel.org/vger-lists.html#linux-security-module)

#### Conferences

-   Linux Conf Au [Linux Security 2009
    (miniconf)](http://linux.conf.au/schedule/32/view_miniconf?day=tuesday)
    - January 21, 2009
-   Usenix Security Symposium July 31 - August 4, 2006
    -   [proceedings](http://www.usenix.org/events/sec06/tech/)
-   Ottawa Linux Symposium (OLS) July 19 - 22, 2006
    [http://www.linuxsymposium.org/2006](http://www.linuxsymposium.org/2006)
    -   [OLS
        Proceedings](http://www.linuxsymposium.org/2006/proceedings.php)

#### Security Articles

-   [TOMOYO Linux and pathname-based
    security](http://lwn.net/Articles/277833/) [LWN.net] Apr 2008
-   [The Linux Journal Aug
    2003](http://www.linuxjournal.com/article.php?sid=6633)
-   [ARM's Trust Zone for
    Security](http://www.arm.com/miscPDFs/4136.pdf)
-   [TPM-based Linux Run-time
    Attestation](http://www.research.ibm.com/secure_systems_department/projects/tcglinux/)

Moved to:

-   [TPM-based Linux Run-time Attestation
    correct](http://domino.research.ibm.com/comm/research_projects.nsf/pages/ssd_ima.index.html)

#### Papers

-   [Experimenting with TCPA/TCG
    Hardware](http://www.cs.dartmouth.edu/~sws/pubs/TR2003-476.pdf)
-   [A Comparison of Publicly Available Tools for Dynamic Buffer
    Overflow
    Prevention](http://www.ida.liu.se/~johwi/research_publications/paper_ndss2003_john_wilander.pdf)
-   [SMACK for Digital
    TV](http://www.embeddedalley.com/pdfs/Smack_for_DigitalTV.pdf)

#### Sample and Opensource code

-   [A sample GPL TCPA Linux
    driver](http://www.research.ibm.com/gsal/tcpa/) for Red Hat 8
-   [Linux TPM Device Driver](http://sourceforge.net/projects/tpmdd)
-   [TCG Software Stack (TSS) for
    Linux](http://sourceforge.net/projects/trousers)
-   A NetBSD driver and some useful links can be found at Rick Wash's
    [Trusted
    Computing](http://www.citi.umich.edu/u/rwash/projects/trusted)page.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Security](http://eLinux.org/Category:Security "Category:Security")

