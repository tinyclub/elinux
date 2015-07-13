> From: [eLinux.org](http://eLinux.org/ZipIt_Developer_Tutorial "http://eLinux.org/ZipIt_Developer_Tutorial")


# ZipIt Developer Tutorial



Let's collaborate on creating this tutorial here.

What I'd like to see is a really basic tutorial on how to develop a C
program for the [ZipIt](http://eLinux.org/ZipIt "ZipIt").

Assume the developer is a newbie to Linux embedded development.

## Contents

-   [1 Lesson One: Setup development PC with
    Linux](#lesson-one-setup-development-pc-with-linux)
-   [2 Lesson Two: Setup NFS server](#lesson-two-setup-nfs-server)
-   [3 Lesson Three: Configure development
    environment.](#lesson-three-configure-development-environment)
-   [4 Lesson Four: Build your first
    program](#lesson-four-build-your-first-program)
-   [5 Lesson Five: Test your program on the
    ZipIt.](#lesson-five-test-your-program-on-the-zipit)
-   [6 Lesson Six: Flash your program on to your
    zipit.](#lesson-six-flash-your-program-on-to-your-zipit)

## Lesson One: Setup development PC with Linux

    Start with pointers or instructions on installing a basic Linux system suitable for developing C programs for the ZipIt on a spare PC. (one suggestion is to install Ubuntu Linux. http://www.ubuntu.com is The official Ubuntu website)

## Lesson Two: Setup NFS server

    It seems like an NFS server should be configured so the ZipIt can access disk here. How do you do that on this Linux spare PC?   -See Steps 2 & 3 on OpenZipIt Linux Install

See Also: how to setup NFS on a [Windows
XP](http://eLinux.org/OpenZipIt_WinXP_Install "OpenZipIt WinXP Install") machine, also
see [ZipIt WinXP NFS](http://eLinux.org/ZipIt_WinXP_NFS "ZipIt WinXP NFS")

## Lesson Three: Configure development environment.

    How do you set up the development environment? Step by step.

Everything you need to know is out there on the Internet. ...it's just
finding it that's the issue The DULG is a wonderful resource for
learning all about embedded Linux, U-Boot, how to set up a development
host and lots more.

The author even hosts a pre-compiled tool chain for ARM, MIPS and
[PowerPC](http://eLinux.org/PowerPC "PowerPC"). See:

     http://www.denx.de/twiki/bin/view/DULG/Manual

## Lesson Four: Build your first program

    Step-by Step instructions on compiling a "Hello World" program for the Zipit. How to cross-compile a program for Zipit on a PC Linux system: ZipIt Compile

## Lesson Five: Test your program on the [ZipIt](http://eLinux.org/ZipIt "ZipIt").

Instructions on how to get it onto the [ZipIt](http://eLinux.org/ZipIt "ZipIt") so that
it can be run. Here are the commands you enter on your Zipit to mount an
NFS disk and run an executable off that disk:

    mkdir /mnt/net1
    mount -t nfs -o nolock -o tcp -o intr server_ip_address:/mnt/zipit /mnt/net1

**cd** to directory housing your executable. Run you executable by
typing this:

    ./your_executable_here

## Lesson Six: Flash your program on to your zipit.

How do you burn your new program onto the [ZipIt](http://eLinux.org/ZipIt "ZipIt")'s
flash?

          -See "Modifying The OpenZipIt Ramdisk Image" section at OpenZipIt.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

