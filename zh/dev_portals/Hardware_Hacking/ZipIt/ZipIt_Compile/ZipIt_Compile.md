> From: [eLinux.org](http://eLinux.org/ZipIt_Compile "http://eLinux.org/ZipIt_Compile")


# ZipIt Compile



So far there's only this pseudo-guide for linux. A Windows guide would
be welcome. (and probably wants to use the tools from gnuarm.org and use
the unxutils)

More info on one person's way of getting an ARM toolchain working:
[ZipIt Arm Toolchain](http://eLinux.org/ZipIt_Arm_Toolchain "ZipIt Arm Toolchain")


 So you want to compile programs for your zipit. Heres what you should
already have:

-   An nfs server that you can mount from your zipit.
-   at least 1.1 gigabytes free on your harddrive.

## So lets get started

Download a recent version of buildroot from
[http://buildroot.uclibc.org/downloads/snapshots/](http://buildroot.uclibc.org/downloads/snapshots/).

\<--A newer buildroot (circa July 2006) is available at:
[http://www.openzipit.org/download/index.php](http://www.openzipit.org/download/index.php)
this page 404s--\>

I'll be using the version dated 20050803 (buildroot-20050803.tar.bz2)
but whatever the most recent version is should be fine. Download it to a
directory thats avaliable over nfs. I'll be using /opt/zipit

Unpack the file with the following command, substituting in the correct
filename:



      bzip2 -dc buildroot-20050803.tar.bz2 | tar -xv



    A large list of files should scroll by, and a subdirectory called buildroot created.

After that finishes, download the files busybox.config and defconfig.sta
from
[http://groups.yahoo.com/group/zipitwireless/files/Development%20system%20tools/](http://groups.yahoo.com/group/zipitwireless/files/Development%20system%20tools/)
(If you try using defconfig.sha and it works, let me know, but I've only
used defconfig.sta) Place busybox.config in buildroot/package/busybox .

Now that we have all external files we need, lets start figuring out
what support files our system needs.

Inside the buildroot subdirectory, run the following command:



      make menuconfig


 If all goes well, you will be given a menu prompt. If it doesn't,
you'll need to install the required packages. Running the following
commands should get you most of them. (write some more about this) (is
this the full package list?)

       sudo apt-get install make gcc flex bison libncurses5-dev


 (These commands are distribution-specific, and all required packages
exist with Fedora Core 3)

Got the menu prompt? Super. It's the same menu format that you'd use to
compile a kernel from the command line so should be at least a little
bit familiar. Tab moves forwards a field, and the up/down arrow keys to
change selection, left and right change the bottom selection, and use
spacebar/enter to select.

Scroll all the way down to `Load an Alternate Configuration File` and
press enter. Type in `defconfig.sta` and press enter. Scroll up to
`Package Selection for the Target ->` and hit enter. Make sure busybox
is selected. For [BusyBox](http://eLinux.org/BusyBox "BusyBox") Configuration file to
use, type in `busybox.config`, being the file downloaded earlier.

Exit by pressing right once, and Exit again. When prompted to save the
config, select `< Yes >`. Okay Run

      make




 from the current directory. The compile process will now begin. Here
are the answers to the compile-time quiz.

-   Target Architecture Features and Options

`  4. Arm 720T (CONFIG_ARM720T) (NEW) `

-   Target Processor Endianness

`> 1. Little Endian (ARCH_LITTLE_ENDIAN) (NEW)`

-   `Target CPU has a memory management unit (MMU) (ARCH_HAS_MMU) [Y/n/?] (NEW)`
    Y

The default answers are fine for the rest of the questions. (add answers
to more questions as they come up)

After that finishes (it'll take a while), you should now have a new
subdirectory, called build\_arm. Run the following bunch of commands:

       cd build_arm
       mkdir hello
       cd hello
       cp ../busybox-1.00/Rules.mak ./


 Now open up your favorite text editor, and create the following two
files: (If theres a preferred/better way to do/use this)

Makefile

    include Rules.mak

    hello: hello.o
            $(CC) $(CFLAGS) -o hello hello.o

    hello.o: hello.c
            $(CC) $(CFLAGS) -c hello.c


 hello.c

    #include <stdio.h>

    int main() {
            printf("hello world\n");
            return 0;
    }


 Now that you have these two files, you should be able to run the
command

       make

inside the hello directory to produce a file called `hello`

If running this program creates a segmentation fault (the Zipit says
"Segementation fault" instead of "hello world" you are probably
dynamically linking uClibC, and getting the wrong version.

If you run with the current 'buildroot' you'll pull in a different
version of uClibC than in the [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt")
distributions. Thus, you'll want to be sure to compile in uClibC
statically. The above proceedure doesn't do that --- but the following
one will.



    (Assuming your buildroot is at ~/buildroot)

    export PATH=$PATH:~/buildroot/build_arm/staging_dir/bin/

    arm-linux-gcc -static -o hello hello.c


 My static version of hello.c is about 30K and the dynamic one is 5K.

---

The easiest way to run a program is to copy the new file into the NFS
directory you created to run the zburn software. Then simply execute:
./hello

--- This page needs help I have not been able to compile yet. Other
people have. Here's info I have found so far:

-   be sure you have an 'nfs' server setup and available for use. It
    should support version 3 protocol over TCP/IP (others didn't work
    for me) test with: "rpcinfo -t myhost nfs 3" (NOTE: nfs servers
    running on a Windows box may work as well) Protocol 3 support was
    added to 2.4, and is in all 2.6 distributions, so modern
    distributions should work fine.

-   setup your Linux box for ARM cross compilation. You don't need to
    rebuild the kernel (unless that's what you plan on doing). More
    info:
    [http://groups.yahoo.com/group/zipitwireless/message/68](http://groups.yahoo.com/group/zipitwireless/message/68)

-   For general app building/porting, the 3.2 version ARM tools work
    best for me (and any recent version of uClibc). I am using 3.3.6,
    the most recent 3.3 supported by 'buildroot', with no problem.

Any program can be made part of the rootfs image as long as it fits, is
compiled for uClibc and doesn't exceed the limitations of the platform.
The key here is to get the development environment, and a good set of
libs defined for the base config.

* * * * *

Here are some suggestions for setting up a development environment for
the Zipit:

1.  Get a recent linux distrubution set up on your desktop pc. I'm sure
    you could do this under Windows or Mac OSX, but don't ask me how. I
    use debian, others should work.
2.  download buildroot from:
    [http://buildroot.uclibc.org/](http://buildroot.uclibc.org/)
3.  read the doc's till you fall asleep.
4.  Decide how you want to build the applications you want to run on the
    Zipit, static, like the original Zipit app and the rootfs that Zipit
    Pet released, or shared libs.
5.  grab one of the 2 default configs from the files section at
    [http://groups.yahoo.com/group/zipitwireless](http://groups.yahoo.com/group/zipitwireless).
6.  the static config will build a gcc 3.3.3 arm toolchain that is
    suitable for compiling the km2 patched kernel, and lots of other
    apps.
7.  the shared config will build a gcc 3.4.2 arm toolchain that is
    suitable for apps that don't like 3.3.3. this toolchain is NOT
    suitable for compiling the 2.4.21 patched kernel at this time.
8.  both configs use stable (non-snapshot) busybox & uClibc, you may
    want to use the snapshots, but they have not been tested. Please
    test them with caution since without a serial port mod to recover
    anything flashed to the Zipit may "brick it". YOU HAVE BEEN WARNED.
9.  run make to build the toolchain and rootfs as the config describes.
    You may have to rename the defaultconfig.xxx files, and you may have
    to answer some questions during th buildroot process. You will have
    to learn how to use buildroot and it's associated sub build
    environments before building a rootfs or app that can be used with
    the Zipit.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

