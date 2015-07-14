> From: [eLinux.org](http://eLinux.org/InnoTab "http://eLinux.org/InnoTab")


# InnoTab



[![Vtech innotab
image.jpg](http://eLinux.org/images/thumb/e/e4/Vtech_innotab_image.jpg/220px-Vtech_innotab_image.jpg)](http://eLinux.org/File:Vtech_innotab_image.jpg)

## Contents

-   [1 Description](#description)
-   [2 Specifications](#specifications)
-   [3 CPU info](#cpu-info)
-   [4 Source Code](#source-code)
-   [5 Hacks](#hacks)
-   [6 Resources](#resources)

# Description

Take learning to the next level with the InnoTab Learning App Tablet by
VTech! This multi-media tablet combines interactive reading, learning
games, creative activities, and a rich collection of applications into a
sleek and durable educational toy that kids will want to play with.
Featuring a 5" color touch screen and tilt-sensor, kids can tap, flick,
drag, and pat their way to learning fun. The fun continues with many
on-board applications such as an MP3 Player, Video Player, Art Studio,
Friends List, Calculator, and Clock engaging kids for hours as they
develop their skills with this electronic learning toy. Additional
cartridges with favorite licensed characters are sold separately and
teach essential skills in reading, logic, and creativity. Additional
content such as e-books and learning games can easily be uploaded to the
InnoTab through VTech's Learning Lodge Navigator where parents can also
see their child's progress on a variety of educational milestones and
lessons. Additional content may require an SD memory card (not
included).

# Specifications

-   GPL32902 processor
    -   [ARM11](../../.././dev_portals/Development_Platforms/ARM_Processor/ARM_Processor.md "ARM Processor") @ 180MHz
    -   [Manufacturer GeneralPlus](http://www.generalplus.com)
    -   [GPL3900 Development
        Platform](http://translate.google.com/translate?sl=auto&tl=en&js=n&prev=_t&hl=en&ie=UTF-8&layout=2&eotf=1&u=http%3A%2F%2Fwww.threeway.cc%2Fsitecn%2FInfo.aspx%3Ftid%3D1413%26pid%3D1611&act=url)
-   64MB onboard memory
-   SD card slot for memory expansion (supports SD/SDHC memory cards
    between the sizes of 2GB and 16GB.)
-   5" Color LCD
-   Touchscreen
-   Tilt sensor
-   uses 4AA batteries

# CPU info

    Processor       : ARMv6-compatible processor rev 7 (v6l)
    BogoMIPS        : 359.62
    Features        : swp half thumb fastmult vfp edsp java
    CPU implementer : 0x41
    CPU architecture: 7
    CPU variant     : 0x0
    CPU part        : 0xb76
    CPU revision    : 7
    Hardware        : GPL32900
    Revision        : 0000
    Serial          : 0000000000000000

# Source Code

-   [git repo of the build system
    release](https://github.com/prpplague/VTech-InnoTab)
-   [tar ball of the build system
    release](https://github.com/prpplague/VTech-Release)

# Hacks

-   [Boot Log](http://eLinux.org/images/c/c2/Innotab-boot.txt "Innotab-boot.txt")
-   [add an external 3.5mm serial
    port](http://eLinux.org/InnoTab_3.5mm_Uart "InnoTab 3.5mm Uart")

[![Innotab case
outside-a.jpg](http://eLinux.org/images/thumb/a/ac/Innotab_case_outside-a.jpg/160px-Innotab_case_outside-a.jpg)](http://eLinux.org/File:Innotab_case_outside-a.jpg)

-   information from user "BT-Vision" aka "is0-mick" on [wizardmods.net
    forums](http://www.wizardmods.net/member.php?u=19207)

<!-- -->

    The innotab uses a Sqlite database to keep track of its installed applications (this is copied to the SD card when a blank one is inserted).

    Icons are also stored in the SQLite database as a binary blob.
    Game icons are 57 x 57, book icons are 88 x 88

    They are 16bit xRGB data, with the first 8 bytes being the width and height stored as 32bit integers in little endian format.

    If you just want to run your own code you can do the following.
    Download SQLite manager extension for firefox, use it to open innotab.db which is on the SD card.

    Go to the “games” section, and create a duplicate entry of one that already exists..

    Change the filename on the new entry to something like /vp_mnt/sd/LLN/APPS/myapp

    create a folder called on the as card /LLN/APPS/myapp

    in that folder create a file called _Run
    and put shell commands in there :) and the innotab will execute them.

    for instance try ls -aR / >/vp_mnt/sd/LLN/APPS/myapp/dir.txt



-   Initial porting scummvm to the Innotab can be seen here:

# Resources

-   [wizardmods.net forum on InnoTab
    hacking](http://www.wizardmods.net/f446/vtech-innotab-hack-hacking-130417/)
-   [Hackaday post on
    InnoTab](http://hackaday.com/2012/05/24/putting-linux-on-the-vtech-innotab/)
-   [VTech InnoTab Product
    Page](http://www.vtechkids.com/brands/brand_view/innotab)


