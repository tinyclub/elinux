> From: [eLinux.org](http://eLinux.org/Bootloader_Security_Resources "http://eLinux.org/Bootloader_Security_Resources")


# Bootloader Security Resources



## Contents

-   [1 Overview](#overview)
-   [2 Technology/Project pages](#technology-project-pages)
-   [3 Security Enhancements](#security-enhancements)
    -   [3.1 Trusted Computing Group
        (TCG)](#trusted-computing-group-tcg)
-   [4 Open Source Projects/Mailing
    Lists](#open-source-projects-mailing-lists)
    -   [4.1 RedBoot/eCos](#redboot-ecos)
    -   [4.2 U-Boot](#u-boot)
    -   [4.3 GRUB](#grub)
    -   [4.4 EtherBoot](#etherboot)
-   [5 Other Resources](#other-resources)

## Overview

This page has security information about bootloaders.

## Technology/Project pages

-   [Security](http://eLinux.org/Security "Security")
-   [Security Hardware
    Resources](http://eLinux.org/Security_Hardware_Resources "Security Hardware Resources")

## Security Enhancements

There are two methods of booting

-   Trusted/Authenticated Boot: just reporting
-   Secure Boot: boot can be halted

### Trusted Computing Group (TCG)

TCG is a hardware-based security solution not only for the PC platform,
but also applicable for embedded devices. To understand the TCG, [TCG
Specification Architecture
Overview](https://www.trustedcomputinggroup.org/groups/TCG_1_0_Architecture_Overview.pdf)
is a good document.

Using the Trusted Platform Module(TPM) security chip and write-protected
boot-code, we will be able to implement the Trusted Boot efficiently.
Unfortunately, Many existing TPMs are designed for PC Platform, it
requires LPC bus. Thus you have to use glue logic to use such TPM with
your system. But, Atmel(R) has been released TPM chip, AT97SC3201S which
has I2C/SMBus interface.

## Open Source Projects/Mailing Lists

### RedBoot/eCos

-   [RedBoot](http://sources.redhat.com/redboot/) is a complete
    bootstrap environment for embedded systems. Based on the eCos.
    Following security enhancement was based on the RedBoot.
-   [High Robustness Bootloader for x86
    Platform](http://www.ece.uvic.ca/~ece499/2003a/group05/High%20Reliability%20Bootloader%20for%20x86%20-%20Final%20Report.htm)
    provide the capability of having signed program binary images.

### U-Boot

Project site: [u-boot](http://sourceforge.net/projects/u-boot/)

### GRUB

[GRUB](http://www.gnu.org/software/grub/) is a bootloader for PC
Platform. There are two patches to enable the TCG's Trusted Boot.

(In this case, the BIOS must support TCG Trusted Boot)

-   [University Bochum, Trusted
    Grub](http://www.prosec.rub.de/trusted_grub.html)
-   [TrouSerS, GRUB TCG
    patch](http://trousers.sourceforge.net/grub.html)

GRUB provides a password feature, only administrator can start the
interactive operations.

### EtherBoot

[EtherBoot](http://www.etherboot.org/) is a software package for
creating ROM images that can download code over an Ethernet network to
be executed on an x86 computer.
"[SafeBootMode](http://wiki.etherboot.org/pmwiki.php/Main/SafeBootMode)
means any NBI image that's downloaded is checked whether it contains a
valid digital signature and if not, the user is notified."

# Other Resources

-   W. A. Arbaugh , D. J. Farber , J. M. Smith, A secure and reliable
    bootstrap architecture, Proceedings of the 1997 IEEE Symposium on
    Security and Privacy, p.65, May 04-07, 1997
-   [Security Enhanced Bootloader for Operating
    Systems](http://www.missl.cs.umd.edu/sebos.html)
-   [Technical Overview of Windows Vista - Secure
    Startup](http://www.microsoft.com/whdc/system/platform/pcdesign/secure-start_tech.mspx)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Security](http://eLinux.org/Category:Security "Category:Security")
-   [Bootloader](http://eLinux.org/Category:Bootloader "Category:Bootloader")

