> From: [eLinux.org](http://eLinux.org/Test_Systems "http://eLinux.org/Test_Systems")


# Test Systems



Here is a quick list of different test systems (and test projects) for
Linux:

## Contents

-   [1 Test Projects](#test-projects)
    -   [1.1 Test Automation Tools](#test-automation-tools)
    -   [1.2 Papers on testing](#papers-on-testing)
    -   [1.3 Test Suites](#test-suites)
    -   [1.4 Static Analysis](#static-analysis)
-   [2 Automated kernel compilation
    results](#automated-kernel-compilation-results)
    -   [2.1 L4X](#l4x)
    -   [2.2 Kautobuild](#kautobuild)
    -   [2.3 ABAT](#abat)
-   [3 Bug tracking system](#bug-tracking-system)
    -   [3.1 Components](#components)
    -   [3.2 Usage](#usage)
    -   [3.3 External links](#external-links)

## Test Projects

Clearly, a number of open source projects in this realm exist. This page
intends to collect descriptions and links to these projects

### Test Automation Tools

-   [Autotest](http://test.kernel.org/autotest)
-   [LAVA](https://launchpad.net/lava) - Linaro's test framework
-   [Opentest](http://arago-project.org/wiki/index.php/Opentest)
-   [Red Hat Test Project](https://testing.108.redhat.com/)
-   [Ktest](http://eLinux.org/Ktest "Ktest") Automate kernel testing
-   [Jenkins-based Test
    Automation](http://eLinux.org/index.php?title=Jenkins-based_Test_Automation&action=edit&redlink=1 "Jenkins-based Test Automation (page does not exist)")
    - the official test framework for the LTSI project

### Papers on testing

-   Paper on finding bugs in Unix programs using random input:
    [http://ftp.cs.wisc.edu/paradyn/technical\_papers/fuzz.pdf](http://ftp.cs.wisc.edu/paradyn/technical_papers/fuzz.pdf)

### Test Suites

-   [Linux Test Project](http://ltp.sourceforge.net/)
-   [LTP-DDT](http://processors.wiki.ti.com/index.php/LTP-DDT)

### Static Analysis

-   [Sparse](http://tree.celinuxforum.org/CelfPubWiki/Sparse)
-   [Smatch](http://smatch.sourceforge.net/)
-   [clang](http://clang.llvm.org/StaticAnalysis.html)

## Automated kernel compilation results

Here are some locations where automated tests of kernel compilation can
be viewed:

### L4X

-   [http://l4x.org/k/](http://l4x.org/k/) - Jan Dittmer's page showing
    the build status and kernel size of the defconfigs of many
    architectures. Running since 2004 or 2005

### Kautobuild

Kautobuild is Simtec's automated system to build and store results for
ARM and MIPS platforms, for every kernel version. It uses defconfigs for
multiple boards, and reports compile errors/warnings, module size,
kernel size etc.

-   Kautobuild for ARM -
    [http://armlinux.simtec.co.uk/kautobuild/](http://armlinux.simtec.co.uk/kautobuild/)
-   mail archive version of results is at:
    [http://lists.simtec.co.uk/pipermail/kautobuild/](http://lists.simtec.co.uk/pipermail/kautobuild/)
-   Article about the Simtel site is at:
    [http://www.linuxdevices.com/news/NS4646877354.html](http://www.linuxdevices.com/news/NS4646877354.html)
    (2006)

### ABAT

ABAT -
[https://sourceforge.net/projects/abat/](https://sourceforge.net/projects/abat/)

    - does a download/build/boot regression test for several mainline kernel trees, as soon as new versions are available
    - test results matrix is available here:
       - http://ftp.kernel.org/pub/linux/kernel/people/mbligh/abat/regression_matrix.html

## Bug tracking system

A **bug tracking system** is a software application that is designed to
help quality assurance and computer programmers keep track of reported
software bugs in their work.

Many bug-tracking systems, such as those used by most open source
software projects, allow users to enter bug reports directly. Other
systems are used only internally in a company or organization doing
software development. Typically bug tracking systems are integrated with
other software project management applications.

Having a bug tracking system is extremely valuable in software
development, and they are used extensively by companies developing
software products.

### Components

A major component of a bug tracking system is a database that records
facts about known bugs. Facts may include the time a bug was reported,
its severity, the erroneous program behavior, and details on how to
reproduce the bug; as well as the identity of the person who reported it
and any programmers who may be working on fixing it.

Typical bug tracking systems support the concept of the life cycle for a
bug which is tracked through status assigned to the bug. A bug tracking
system should allow administrators to configure permissions based on
status, move the bug to another status, or delete the bug. The system
should also allow administrators to configure the bug statuses and to
what status a bug in a particular status can be moved to.

### Usage

In a corporate environment, a bug-tracking system may be used to
generate reports on the productivity of programmers at fixing bugs.
However, this may sometimes yield inaccurate results because different
bugs may have different levels of severity and complexity. The severity
of a bug may not be directly related to the complexity of fixing the
bug. There may be different opinions among the managers and architects.

A *local bug tracker (LBT)* is usually a computer program used by a team
of application support professionals to keep track of issues
communicated to software developers. Using an LBT allows support
professionals to track bugs in their "own language" and not the
"language of the developers." In addition, LBT use allows a team of
support professionals to track specific information about users who have
called to complain that may not always be needed in the actual
development queue (thus, there are two tracking systems when an LBT is
in place.)

### External links

-   [Trac](http://trac.edgewall.org/) - Web-based software project
    management and bug/issue tracking system.
-   [Bugzilla](http://www.bugzilla.org/) - Bug tracking used by the
    Mozilla projects. Inherently web-based, written in Perl , and uses
    MySQL as its database back-end. Open-Source.
-   [Bugreport is a place to publish the security
    advisories](http://www.bugreport.ir/?)
-   [How to Report Bugs
    Effectively](http://www.chiark.greenend.org.uk/~sgtatham/bugs.html)


