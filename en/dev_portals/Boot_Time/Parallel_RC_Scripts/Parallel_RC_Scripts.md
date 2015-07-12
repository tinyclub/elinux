> From: [eLinux.org](http://eLinux.org/Parallel_RC_Scripts "http://eLinux.org/Parallel_RC_Scripts")


# Parallel RC Scripts



## Contents

-   [1 Description](#description)
-   [2 How to implement or use](#how-to-implement-or-use)
-   [3 Expected Improvement](#expected-improvement)
-   [4 Resources](#resources)
    -   [4.1 Projects](#projects)
-   [5 Specifications](#specifications)
-   [6 Patches](#patches)
-   [7 Case Studies](#case-studies)
    -   [7.1 Case 1](#case-1)
    -   [7.2 Case 2](#case-2)
    -   [7.3 Case 3](#case-3)

## Description

One way to reduce bootup time is to run RC scripts in parallel. RC
scripts are normally run in sequence in a desktop configuration of
Linux. By running the scripts in parallel, it is possible to take
advantage of the multi-processing capabilities of the OS (such as
overlapping execution with I/O, etc.)

## How to implement or use

See the projects listed below for details on different methods of doing
this.

## Expected Improvement

[Not determined yet.]

## Resources

### Projects

-   InitNG: a new replacement for SysV init. Boots your system much
    faster by running as much as possible asynchronously. See
    [InitNG](http://www.initng.org/)
-   IBM article on on using Makefile techniques to express dependencies
    between services and support parallel service start. See
    [BootFaster](http://www-106.ibm.com/developerworks/linux/library/l-boot.html?ca=dgr-lnxw04BootFaster)
-   Richard Gooch project to rewrite boot script system from scratch.
    Eliminates lots of BSD and SYS V-isms, and introduces dependencies.
    See [boot
    scripts](http://www.atnf.csiro.au/people/rgooch/linux/boot-scripts/)
-   Serel project - for parallelizing service startup. Commands are
    inserted into RC scripts to cause needed services to start (based on
    XML database of dependencies). See
    [fastboot](http://www.fastboot.org/)

## Specifications

-   LSB specification for comments in RC Scripts which allow
    parallization. See
    [[1]](http://www.linuxbase.org/spec/refspecs/LSB_1.1.0/gLSB/initscrcomconv.html)

## Patches

None.

# Case Studies

[None yet.]

## Case 1

[put information about an actual use of this technique here. A case
study should include:]

Hardware:: [hardware description here] Kernel Version:: [kernel version
here] Configuration:: [information about the configuration used here]
Time without change:: [put that here] Time with change:: [put that here]

[Add any additional notes as you see fit.]

## Case 2

## Case 3


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [HOWTOs](http://eLinux.org/Category:HOWTOs "Category:HOWTOs")

