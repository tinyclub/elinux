> From: [eLinux.org](http://eLinux.org/Pre_Linking "http://eLinux.org/Pre_Linking")


# Pre Linking



## Contents

-   [1 Description](#description)
-   [2 Overview of linking](#overview-of-linking)
-   [3 Expected Improvement](#expected-improvement)
-   [4 Resources](#resources)
    -   [4.1 RedHat prelinking system](#redhat-prelinking-system)
    -   [4.2 Instructions for using prelinking with
        Gentoo](#instructions-for-using-prelinking-with-gentoo)
    -   [4.3 Related Projects](#related-projects)
-   [5 Specifications](#specifications)
-   [6 Patches](#patches)
-   [7 Case Studies](#case-studies)
    -   [7.1 Case 1 - Panasonic mobile phone
        prelink](#case-1-panasonic-mobile-phone-prelink)
    -   [7.2 Case 2](#case-2)
    -   [7.3 Case 3](#case-3)
-   [8 Future Work](#future-work)
-   [9 Material from CELF
    presentations](#material-from-celf-presentations)
    -   [9.1 ARM Prelink](#arm-prelink)
    -   [9.2 MIPS Prelink](#mips-prelink)

## Description

Pre-Linking is a mechanism for linking programs to shared libraries
ahead of time. In general, every time an application is run it must have
its external symbols resolved - looked up in the shared library symbol
table, and fixed up in the program binary to refer to the correct
offsets in the library. To use prelinking, a special utility is run
which does this resolution and fixup once for the program. This saves
the cost of linking at runtime.

There is an existing package from RedHat which provides this feature.

A drawback of this is that if the shared library is changed, the fixups
are no longer correct, and the program must be fixed-up again. This is
much less of an issue in an embedded situation, where the programs and
libraries are less likely to change than in a desktop or server Linux
system.

## Overview of linking

There is an excellent paper with an overview of dynamic linking issues
at: [Pre Linking
Overview](http://web.archive.org/web/*/http://www.cis.upenn.edu/~mwh/papers_DB/ieee_computer97.pdf)
This paper describes not only pre-linking, but lazy linking and more
exotic systems, like compile-on-load.

## Expected Improvement

[This is not measured yet.]

We expect that with use of prelinking, there will be a slight reduction
in boot time for Linux system, in the area of initial application
loading.

We need to use this system and measure the effect of prelinking for a
determined set of applications.

## Resources

### RedHat prelinking system

-   The prelink package is at:
    [http://people.redhat.com/jakub/prelink/](http://people.redhat.com/jakub/prelink/)
-   A white paper is at:
    [prelink](http://people.redhat.com/jakub/prelink/prelink.pdf)

prelink currently supports the following architectures: alpha, arm,
cris, i386, ia64, ppc32, ppc64, s390, sh, sparc32, sparc64, x86\_64. At
present the glibc dynamic linker is required to prelink executables and
load prelinked code, uClibc does not support it.

### Instructions for using prelinking with Gentoo

The following page has information on how to use prelinking with a
Gentoo system:

[http://www.gentoo.org/doc/en/prelink-howto.xml](http://www.gentoo.org/doc/en/prelink-howto.xml)

### Related Projects

-   Prebinding (RelCache) - RelCache (aka ELF prebinding) news
    [http://mail-index.netbsd.org/tech-userlevel/2002/12/04/0017.html](http://mail-index.netbsd.org/tech-userlevel/2002/12/04/0017.html)
-   RelCache vs. Red Hat prelink

[http://mail-index.netbsd.org/tech-userlevel/2002/12/01/0000.html](http://mail-index.netbsd.org/tech-userlevel/2002/12/01/0000.html)

-   Resident - Resident Good (comparisons with prebind)

[http://www.shiningsilence.com/dbsdlog/2004/01/20/215.html](http://www.shiningsilence.com/dbsdlog/2004/01/20/215.html)



## Specifications

None so far.

## Patches

No kernel patches required for kernels 2.4.10 and later.

## Case Studies

### Case 1 - Panasonic mobile phone prelink

Panasonic used pre-linking on their Linux-based mobile phones. These
used a 2.4.x Linux kernel, for an ARM processor. Measuring the time to
load a single multimedia application with regular dynamic linking and
pre-linking, showed that pre-linking could save a lot of time.

<dl><dt> Hardware&#160;</dt>
<dd> ARM9 (unspecified CPU frequency)</dd>
<dt> Kernel Version&#160;</dt>
<dd> 2.4.20 (based on Monta Vista Linux CEE 3.1), glibc 2.3</dd>
<dt> Time without change&#160;</dt>
<dd> 2479 ms</dd>
<dt> Time with change&#160;</dt>
<dd> 125 ms</dd>
<dt> Source&#160;</dt>
<dd> page 19 of <a rel="nofollow" class="external text" href="http://tree.celinuxforum.org/CelfPubWiki/ITJ2005Detail1-2?action=AttachFile&amp;do=get&amp;target=CELF_Technical_Jamboree_June13.pdf">Making Mobile Phone with CE Linux</a></dd></dl>

### Case 2

### Case 3

## Future Work

This item is a work-in-progress, and we are just getting started.

## Material from CELF presentations

### ARM Prelink

-   Japan Jamboree \#3
    -   [http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree3\#head-1515fb2d64cd91370e9cb2f6ad4847483e729cf3](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree3#head-1515fb2d64cd91370e9cb2f6ad4847483e729cf3)
        In the presentation of "Making Mobile Phone with CE Linux", the
        evaluation of Prelink on ARM architecture was mentioned.
        -   by Mr. Mizuyama (Panasonic Mobile)

### MIPS Prelink

-   Japan Jamboree \#13
    -   [http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree13\#head-ab59e6354d343ec0a804b5f440d35b5dcc27304c](http://tree.celinuxforum.org/CelfPubWiki/JapanTechnicalJamboree13#head-ab59e6354d343ec0a804b5f440d35b5dcc27304c)
        -   Evaluation report by Mr. Yagi (Mitsubishi)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [HOWTOs](http://eLinux.org/Category:HOWTOs "Category:HOWTOs")
-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")

