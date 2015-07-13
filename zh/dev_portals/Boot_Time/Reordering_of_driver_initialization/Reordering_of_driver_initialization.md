> From: [eLinux.org](http://eLinux.org/Reordering_of_driver_initialization "http://eLinux.org/Reordering_of_driver_initialization")


# Reordering of driver initialization



## Contents

-   [1 Description](#description)
-   [2 How to implement or use](#how-to-implement-or-use)
-   [3 Expected Improvement](#expected-improvement)
-   [4 Resources](#resources)
    -   [4.1 Projects](#projects)
    -   [4.2 Specifications](#specifications)
    -   [4.3 Patches](#patches)
-   [5 Case Studies](#case-studies)

## Description

Some products need to have some type of storage available as soon as
possible after kernel initialization. Think of SD card type removable
media that could contain possible upgrades or other versions of a
software product. In order to mount these media right away, they should
be probed and recognized by the time your favorite startup script (or
'init') is started. Sometimes bus/media probing can take a long time,
especially if you have slow buses, or when one bus can support several
types of media. In the latter case, an SD card attached to a bus (host)
that can support SD 2.0, SD 1.0 and MMC protocols, they have to be
probed from super to lesser interface specification (SD cards understand
basic MMC protocol as well). Worst case, the media is probed and
detected after your favorite startup scrupt (or 'init') has finished its
work already!

## How to implement or use

By simply identifying which driver(s) is (are) associated with the
medium, move them upward in the driver makefile(s) to put them more in
front of the to-be-initialized kernel modules list.

## Expected Improvement

Media are probed and disks are added before kernel initialization
finishes, no 'hotplugging' interface necessary. Startup scripts (or
'init') can decide what to do before it is 'too late'.

## Resources

None.

### Projects

None.

### Specifications

None.

### Patches

None.

## Case Studies


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

