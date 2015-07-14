> From: [eLinux.org](http://eLinux.org/Linux_Kernel_State_Tracer "http://eLinux.org/Linux_Kernel_State_Tracer")


# Linux Kernel State Tracer



Table Of Contents:



## Contents

-   [1 Description](#description)
    -   [1.1 Rationale](#rationale)
-   [2 Resources](#resources)
    -   [2.1 Projects](#projects)
    -   [2.2 Documents and presentations](#documents-and-presentations)
    -   [2.3 Specifications](#specifications)
-   [3 Downloads](#downloads)
    -   [3.1 Patch](#patch)
    -   [3.2 Utility programs](#utility-programs)
-   [4 How To Use](#how-to-use)
-   [5 How to validate](#how-to-validate)
-   [6 Sample Results](#sample-results)
    -   [6.1 Case Study 1](#case-study-1)
    -   [6.2 Case Study 2](#case-study-2)
-   [7 Status](#status)
-   [8 Future Work/Action Items](#future-work-action-items)

## Description

[This section describes the technology ....]

LKST is Kernel State Tracer for Linux in order to keep track of Kernel
Event such as:

     - Process Management
     - Interrupt
     - Exceptions
     - System Calls
     - Memory Managements
     - Networking: sending packets, receiving packets
     - Sys V IPC
     - Locks
     - Timer
     - Oops

Originally LKST is developed for Linux Enterprise Systems and now we
have port it to Reference Boards for Embedded Systems and currently SH4
port(RTS7751R2D), MIPS/TX49 port (RBHMA4400CE) and ARM/OMAP port (TI
OMAP INNOVATOR/OSK) are available.

### Rationale

LKST is one of a number of tracing systems available for the Linux
kernel. Such event tracing systems are very useful for analyzing kernel
behaviour, and learning how interrupts, kernel threads and user-space
applications interact on the system.

## Resources

### Projects

Here is some information about LKST:

-   project home page:
    [http://lkst.sourceforge.net/](http://lkst.sourceforge.net/)

### Documents and presentations

-   [Media:CELF\_LKST\_SH\_Presen-2005-1.pdf](http://eLinux.org/images/a/a4/CELF_LKST_SH_Presen-2005-1.pdf "CELF LKST SH Presen-2005-1.pdf")
    - presentation given by Hitachi at CELF Jan 2005 technical
    conference.
-   [Media:CELF\_LKST\_SH\_Lineo-2005-2.pdf](http://eLinux.org/images/b/b2/CELF_LKST_SH_Lineo-2005-2.pdf "CELF LKST SH Lineo-2005-2.pdf")
    - presentation given by Lineo at CELF Jan 2005 technical conference.
-   [Media:HITACHI-LKST-CELF-200601.pdf](http://eLinux.org/images/4/46/HITACHI-LKST-CELF-200601.pdf "HITACHI-LKST-CELF-200601.pdf")
    - presentation given at International Technical Conference, June
    2006
-   [Media:CELFTokyoJam6\_LkstUpdate\_Lineo.pdf](http://eLinux.org/images/1/13/CELFTokyoJam6_LkstUpdate_Lineo.pdf "CELFTokyoJam6 LkstUpdate Lineo.pdf")
    - presentation 'Features of lkslogtools' given at CELF Jan 2006
    technical jamboree (6)

### Specifications

## Downloads

### Patch

-   You can acquire patches at:
    [http://sourceforge.net/projects/lkst/](http://sourceforge.net/projects/lkst/)
-   and click the link of |Patches|:
    [http://sourceforge.net/tracker/?group\_id=41854&atid=431465](http://sourceforge.net/tracker/?group_id=41854&atid=431465)

### Utility programs

[other programs, user-space, test, etc. related to this technology]

## How To Use

## How to validate

[put references to test plans, scripts, methods, etc. here]

## Sample Results

[Examples of use with measurement of the effects.]

### Case Study 1

### Case Study 2

## Status

-   Status: [implemented]

<!-- -->

     (one of: not started, researched, implemented, measured, documented, accepted)

-   Architecture Support:

<!-- -->

      (for each arch, one of: unknown, patches apply, compiles, runs, works, accepted)

-   -   i386: works
    -   x86\_64: works
    -   ia64: works
    -   ARM: runs
    -   PPC: unknown
    -   MIPS: runs
    -   SH: runs

## Future Work/Action Items

Here is a list of things that could be worked on for this feature:


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

