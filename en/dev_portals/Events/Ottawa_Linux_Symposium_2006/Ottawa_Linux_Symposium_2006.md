> From: [eLinux.org](http://eLinux.org/Ottawa_Linux_Symposium_2006 "http://eLinux.org/Ottawa_Linux_Symposium_2006")


# Ottawa Linux Symposium 2006



Here is information about CE Linux Forum's involvement and participation
in [Ottawa Linux Symposium 2006](http://www.linuxsymposium.org/).

Table Of Contents:


 CELF had big involvement in OLS 2006. CELF was a [sponsor of
OLS](http://www.linuxsymposium.org/2006/sponsors.php) and we had a
number of meetings at and around the event. There were presentations and
[BOFs](http://eLinux.org/BOFs "BOFs") by many CELF members. Also, we continued our
tradition of handing out prizes at the closing keynote address.

Here are some of notes and presentations from the event.

## Contents

-   [1 Embedded Linux BOF](#embedded-linux-bof)
-   [2 CELF Project BOF](#celf-project-bof)
    -   [2.1 Quickie CELF Initiatives
        Overview](#quickie-celf-initiatives-overview)
    -   [2.2 CELF Test Lab Introduction and
        Demonstration](#celf-test-lab-introduction-and-demonstration)
    -   [2.3 Config Weight Size Test](#config-weight-size-test)
    -   [2.4 CABI (CPU Resource
        Management)](#cabi-cpu-resource-management)
    -   [2.5 Annual CELF "Challenge"
        Item](#-annual-celf-challenge-item)
    -   [2.6 Hi-definition camera demonstration by
        Lumenera](#hi-definition-camera-demonstration-by-lumenera)
    -   [2.7 Jamboree Report](#jamboree-report)
-   [3 Architecture Group meeting](#architecture-group-meeting)
-   [4 OLS Sessions by (or including) CELF
    members](#ols-sessions-by-or-including-celf-members)
    -   [4.1 Categorized Session List](#categorized-session-list)
-   [5 Demos](#demos)
-   [6 Prizes](#prizes)

## Embedded Linux BOF

-   -   Wednesday, July 19, 5:00 pm to 5:45 pm, Congress Centre, Room C

In this BOF, Tim gave his "State of Embedded Linux" talk. He described
some what's happened with Linux in the last year, related to its use in
embedded devices. This includes an overview of things recently mainlined
(like Linux-tiny patches), as well as ongoing work and research in areas
like power management for embedded devices, system memory size, bootup
time improvements, realtime, measurement tools, etc.

Here is Tim's presentation:
[Media:OLS2006-Embedded-BOF-2.ppt](http://eLinux.org/images/6/68/OLS2006-Embedded-BOF-2.ppt "OLS2006-Embedded-BOF-2.ppt")

Here are **PORTIONS** of Tim's presentation, with links to relevant
articles (mostly on [lwn.net](http://www.lwn.net/)) /\\ - please see the
file for the full presentation.

* * * * *

-   -   Realtime
        -   -   hrtimers (2.6.18?)
            -   clock sources (2.6.18)
            -   HR timer API
                -   -   -   [http://lwn.net/Articles/167315/](http://lwn.net/Articles/167315/)

            -   ktimers explanation:
                -   -   -   [http://lwn.net/Articles/152436/](http://lwn.net/Articles/152436/)

            -   Generic IRQ (2.6.18)
            -   Tickless Idle coming

    -   Rt-Preempt
        -   -   Mainline status
                -   -   -   Most stuff in, only need:
                            -   -   sleeping spinlocks
                                -   threaded IRQs

            -   Priority Inheritance (2.6.18)
                -   -   -   [http://lwn.net/Articles/177838/](http://lwn.net/Articles/177838/)

            -   Latency tracer

    -   Unit-at-a-time Compilation
        -   -   Ingo Molnar patch to utilize gcc 4 unit-at-a-time
                compilation
                -   -   -   [http://lkml.org/lkml/2005/12/28/68](http://lkml.org/lkml/2005/12/28/68)
                        -   [http://lwn.net/Articles/165354/](http://lwn.net/Articles/165354/)

    -   inline reduction
        -   -   New \_always\_inline\_ attribute:
                -   -   -   [http://lwn.net/Articles/167315/](http://lwn.net/Articles/167315/)
                        -   [http://lwn.net/Articles/165354/](http://lwn.net/Articles/165354/)

    -   Size Testing
        -   -   Bloatwatch -
                [http://testlab.celinuxforum.org/bloatwatch/](http://testlab.celinuxforum.org/bloatwatch/)
            -   Config size testing - Presentation at CELF Project BOF

    -   Security
        -   -   App'***Armour***
                -   -   -   Lighter than [SELinux](../../.././dev_portals/Security/SELinux/SELinux.md "SELinux")
                        -   Good enough for embedded work??

            -   LSM in peril?

    -   Bootup Time
        -   -   XIP - Execute in Place
                -   -   -   Old info:
                            [http://lwn.net/Articles/135472/](http://lwn.net/Articles/135472/)

            -   XAFS - new file system specifically for XIP
                -   -   -   Jared Hulbert (Intel) posted for comments:
                            [http://lwn.net/Articles/182337/](http://lwn.net/Articles/182337/)

    -   Power Management
        -   -   User-space software suspend
                -   -   Latest kerfluffle over suspend phases
                    -   Linus has posted a new patch, showing his
                        method.
                    -   See lwn.net:
                        [http://lwn.net/Articles/189467](http://lwn.net/Articles/189467)

            -   Linux PM summit -
                [http://lwn.net/Articles/181687](http://lwn.net/Articles/181687)

    -   Audio/Video/Graphics
        -   -   Big direct rendering update -
                [http://lwn.net/Articles/167315/](http://lwn.net/Articles/167315/)
            -   New CELF AVG Spec. (2.0)
                -   -   [DirectFB](../../.././dev_portals/Multimedia/DirectFB/DirectFB.md "DirectFB"), ALSA,
                        [OpenGL](http://eLinux.org/OpenGL "OpenGL")/ES, UHAPI

    -   Mobile phone stuff
        -   -   CELF specification still in-progress
            -   Many orgs: CELF MPPWG, OSDL MLI, [LiPS](http://eLinux.org/LiPS "LiPS")
                Forum, the new foundation

    -   Tools
        -   -   Tracing - [LTTng](../../../dbg_portal/kernel_trace_and_profile/LTTng/LTTng.md "LTTng") just recently re-added
                lots of architecture support
            -   Memory Leak Tracker
            -   Function re-ordering -
                [http://lwn.net/Articles/173657/](http://lwn.net/Articles/173657/)

* * * * *

Some of the major discussion items were:

-   -   standardization of GUI
        -   -   Why can't CELF standardize on a single embedded GUI? The
                answer is that the space is already fragmented, and
                getting product vendors to switch UIs will be very
                difficult. Different capabilities of the existing
                solutions in this area (Qt, GTK, and X), as well as
                different capabilities for related software (such as
                apps) led to this fragmentation.
            -   There's not an easy answer, but maybe if the field tilts
                towards one platform, it will then begin to dominate.

    -   mobile phone forum fragmentation
        -   -   CELF is working with the [LiPS](http://eLinux.org/LiPS "LiPS") Forum and
                OSDL/MLI, don't know much about the new organization. So
                far, organizations are cooperating and avoiding
                conflicts.

    -   size issue
        -   -   Tim took an informal survey of the audience, asking what
                was the number one problem using Linux: About 90%
                answered "size". Power management and bootup time were
                also considerations.
            -   Many linux-tiny patches have been merged over the last
                year.
            -   There's a new system called
                "[bloatwatch](http://testlab.celinuxforum.org/bloatwatch/index.cgi)",
                where kernel size is automatically tested each new
                release. Developers can examine the results to see the
                size of subsystems and symbols. Sizes can be compared
                between versions, and are graphed over time. See

    -   corporate developer participation in community
        -   -   Developers from corporations often don't participate
                effectively in the open source community Several issues
                contribute to this: 1) product treadmill, 2) getting
                stuck on old versions, 3) not enough time budgeted by
                company for this activity, and 4) product deadlines
                leading to (ahem) less-than-mainlineable code. There are
                no clear answers, but CELF will continue encouraging
                direct participation in open source by its members.
            -   Tim took an informal (show of hands) survey, and very
                few respondents have yet to ship a 2.6-based product.
                Some companies are still working on 2.4 or previous
                kernels.

## CELF Project BOF

-   -   Friday, July 21, 7:00 pm to 9:00 pm, Les Suites Hotel

At this meeting we discussed some of CELF's initiatives and member
company projects.

The following presentation introduced the topics, and had information
about the CELF Test Lab:
[Media:CELF-Projects-BOF.ppt](http://eLinux.org/images/9/99/CELF-Projects-BOF.ppt "CELF-Projects-BOF.ppt")

### Quickie CELF Initiatives Overview

-   -   Tim described some of the initiatives and projects that CELF is
        directly managing and funding:
        -   -   Linux-tiny mainlining, and
                [bloatwatch](http://testlab.celinuxforum.org/bloatwatch/index.cgi)
                (via Selenic Consulting - Matt Mackall)
            -   UHAPI/[DirectFB](../../.././dev_portals/Multimedia/DirectFB/DirectFB.md "DirectFB") integration (via
                Dennis Kropp)
            -   CELF Open Test Lab (via Nomad Global Solutions)
            -   Embedded Linux Conference - to be held April 17,18,19,
                2007 in San Jose, California, USA

### CELF Test Lab Introduction and Demonstration

By Tim Bird, Sony Electronics
[![DSC00405.jpg](http://eLinux.org/images/a/a8/DSC00405.jpg)](http://eLinux.org/File:DSC00405.jpg)

-   -   -   -   Basic lab infrastructure is now set up, and tests can be
                run remotely on multiple boards.
            -   Tim demonstrated running a test in the lab using the web
                interface, as well as showed interactive use of the lab
                via ssh to a host and target in the lab.

See more about the lab in the BOF slides (see above).

### Config Weight Size Test

By Munehiro Ikeda, NEC
[![DSC00412.jpg](http://eLinux.org/images/6/6d/DSC00412.jpg)](http://eLinux.org/File:DSC00412.jpg)

-   -   -   -   Ikeda described his examination to make clear the size
                impact (image size and memory effect) of different
                kernel config options.
                -   -   Examination tool named "Kconfig Size"
                    -   Current examination result summary
                    -   New
                    -   Further works plan

            -   Presentation material :
                [Media:size\_exam\_celf\_2006-07-21.pdf](http://eLinux.org/images/e/ee/Size_exam_celf_2006-07-21.pdf "Size exam celf 2006-07-21.pdf")

### CABI (CPU Resource Management)

By Midori Sugaya, Waseda University
[![DSC00418.jpg](http://eLinux.org/images/7/73/DSC00418.jpg)](http://eLinux.org/File:DSC00418.jpg)

-   -   Sugaya described the requirements of embedded system especially
        about resource managements in Linux, then proposed CABI and
        showed its function, architecture and enhancements (CPU
        Reservation). The contents of the presentation are following.
        -   Resource management requirements of embedded system
        -   Limitations of Linux scheduler
        -   Proposed system : CABI (CPU Accounting and Blocking
            Interfaces)
        -   The accounting model and architecture
        -   CPU Reservation (priority boost approach)
-   Presentation material :
    [Media:2006\_0721\_LinuxSympoisum\_clinux\_bof\_CABI\_pdf.pdf](http://eLinux.org/images/6/60/2006_0721_LinuxSympoisum_clinux_bof_CABI_pdf.pdf "2006 0721 LinuxSympoisum clinux bof CABI pdf.pdf")



### Annual CELF "Challenge" Item

Discussion led by Tim.

-   -   We discussed CELF's proposal for creating a list of technology
        projects to focus on for the year
        -   -   How can CELF push the projects forward?
                -   -   -   Incentives - support, hardware, prizes,
                            funding, labor?

    -   What projects deserve focused CELF attention??
    -   Does anyone need hardware that CELF or it's members can provide?
    -   Should we do a "hackfest"?

### Hi-definition camera demonstration by Lumenera

<table>
<tbody>
<tr class="odd">
<td align="left"><a href="http://elinux.org/File:DSC00430.jpg"><img src="http://elinux.org/images/9/98/DSC00430.jpg" alt="DSC00430.jpg" /></a> Demonstration scene.</td>
<td align="left"><a href="http://elinux.org/File:DSC00432.jpg"><img src="http://elinux.org/images/0/03/DSC00432.jpg" alt="DSC00432.jpg" /></a> &quot;Picture of bird by Tim Bird.&quot; Actual shoot of the camera.</td>
</tr>
</tbody>
</table>

[need to put info here]

### Jamboree Report

By Satoru Ueda,

-   -   -   -   Ueda-san talked about CELF's regional Jamborees being
                held in Asia (primarily Japan).
                -   -   see [Japan Technical Jamboree
                        Guidance](http://eLinux.org/Japan_Technical_Jamboree_Guidance "Japan Technical Jamboree Guidance"),
                        [Japan Technical Jamboree
                        8](http://eLinux.org/Japan_Technical_Jamboree_8 "Japan Technical Jamboree 8")
                        and [Japan Technical Jamboree
                        9](http://eLinux.org/Japan_Technical_Jamboree_9 "Japan Technical Jamboree 9")
                    -   **The next Japan Jamboree**
                        -   -   August 25, in Tokyo
                            -   Detail is described in [Japan Technical
                                Jamboree
                                10](http://eLinux.org/Japan_Technical_Jamboree_10 "Japan Technical Jamboree 10")

Presentation material:

-   -   -   -   [Media:JapanJam\_OLS2006.pdf](http://eLinux.org/images/1/1e/JapanJam_OLS2006.pdf "JapanJam OLS2006.pdf")

## Architecture Group meeting

-   -   Tuesday, July 18, 3:00 pm to 8:00 pm at the Les Suites Hotel

This meeting was open to CELF Architecture Group members and invited
guests.

FIX ME! WHERE ARE THESE LINKS: See Celf Wiki:Ag July 2006Meeting for the
presentation and meeting notes for this meeting.

## OLS Sessions by (or including) CELF members

Employees of CELF member companies made a number of presentations this
year at OLS. Also, we led or participated in a number of BOFS. Here is a
list of presentations and BOFS where CELF members presented or discussed
topics important for embedded developers:

-   -   A Reliable and Portable Multimedia File System - Jaekyoung Bae,
        Samsung, Wed. July 19 12:00, Room B
    -   Power Management BOF - Mark Gross, Intel, CELF PMWG Chair, Wed.
        July 19, 7:00 pm, Room A
    -   Tracing BOF - William Cohen, RedHat, (Tim Bird, Sony will also
        present), Wed. July 19 7:00 pm, Room D
        -   -   Tim's presentation for this is here:
                [Media:OLS2006-Tracing-BOF.ppt](http://eLinux.org/images/8/8f/OLS2006-Tracing-BOF.ppt "OLS2006-Tracing-BOF.ppt")

    -   The effects of filesystem fragmentation - Ard Biesheuvel,
        Philips, Thur. July 20, 10:00 am, Room A
    -   Tutorial: Porting a 2.4.20 character driver for legacy hardware
        to 2.6.15 - Mark Gross, Intel, Thur. July 20, 10:00 am, Room A
    -   Improving Linux Startup Time Using Software Resume (and other
        techniques) - Hiroki Kaminaga, Sony, Fri. July 21, 10:00 am,
        Room A
        -   -   Presentation material is here:
                [Media:snapshot-boot-final.pdf](http://eLinux.org/images/3/37/Snapshot-boot-final.pdf "Snapshot-boot-final.pdf")
            -   Demonstration Video: /\\ *Large size files (AVI). MP4
                files are iPod(TM) compatible.*
                -   startup using Resume From Disk: Media:SWSUSP.AVI
                    (14.5MB) / Media:SWSUSP.MP4 - to obtain these
                    videos, please email the administrator of this site.
                -   Proposed Snapshoot Boot: Media:SSBOOT.AVI]] (8.0MB)
                    / Media:SSBOOT.MP4 - to obtain these videos, please
                    email the administrator of this site.

    -   Linux Bootup Time Reduction for Digital Still Camera - ChanJu
        Park, Samsung, Sat. July 22, 12:00 pm, Room A

The full conference schedule is available at:
[http://www.linuxsymposium.org/2006/schedule.php](http://www.linuxsymposium.org/2006/schedule.php)
[Should change this to link to proceedings, when they are online]

/\\ *Please note that several other sessions at OLS reflect work that is
sponsored or* funded (in whole or in part) by CELF member companies.

### Categorized Session List

CELF produced a [guide to OLS sessions for embedded
developers](http://eLinux.org/CELF_Embedded_Guide_To_OLS_2006 "CELF Embedded Guide To OLS 2006")].
This might help you look through the OLS 2006 proceedings for
presentations of interest. The Proceedings are available at:
[http://www.linuxsymposium.org/2006/proceedings.php](http://www.linuxsymposium.org/2006/proceedings.php)

## Demos

-   -   July 19, 10:45 am to 6:00 pm, Congress Centre, 1st floor

CELF members showed a number of demos of their current open source
projects. Come see live demonstrations of technology developed for using
and customizing Linux in Consumer Electronics products.

-   -   See [OLS2006Demos](http://eLinux.org/OLS2006Demos "OLS2006Demos") for details.
    -    ;)) Photos uploaded

## Prizes

CELF had several prizes to hand out again, as a way of saying "Thank
You" to the open source community.

-   -   Philips settop box development platform
    -   Nokia 770 Internet Tablet

The prizes were handed out by Tim Bird at the final keynote:

-   -   Date: Saturday, July 22
    -   Time: \~5:00 pm (Keynote starts at 4:00)
    -   Place: Congress Centre, Room A


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Events](http://eLinux.org/Category:Events "Category:Events")
-   [2006](http://eLinux.org/Category:2006 "Category:2006")

