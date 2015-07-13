> From: [eLinux.org](http://eLinux.org/Leapster_Explorer_Root_File_System "http://eLinux.org/Leapster_Explorer_Root_File_System")


# Leapster Explorer Root File System



## Contents

-   [1 This is a work in progress. Follow at your own
    risk!](#this-is-a-work-in-progress-follow-at-your-own-risk-21)
-   [2 File Prep](#file-prep)
-   [3 Fix the broken /packages
    files](#fix-the-broken-packages-files)
-   [4 Notes](#notes)

## This is a work in progress. Follow at your own risk!

On the didj if we wanted to build a working kernel and filesystem with
all necessary apps/libs and devices we could use a simple script called
make\_rootfs.sh located in the /scripts folder of the kernel source.
Unfortunately the LX kernel sources didn't ship with make\_rootfs.sh so
we have adapted the didj one to do the job for us.

I'd like to thank Nirvous, NullMoogleCable, PhillKll, Claude, JKent,
Jburks, GrizzlyAdams and anyone I may have forgotten for their help :)


 There are a few things to note.

1. When you run make\_rootfs.sh it builds the kernel, sets up all the
folders and device nodes, it also installs libs/apps from /packages, the
script knows what apps/libs to install via 2 files complete-package-list
and embedded-package-list, the LX only ships with the
embedded-package-list, so we will have to make our own
complete-package-list file. The embedded-package-list is sufficient for
building a kernel with everything that is needed for a stock kernel/fs
(without brio), you should leave the embedded-packge-list in its default
state. the complete-package-list will do the same job but will keep any
headers, I copied the contents of the embedded-package-list to a file
called complete-package-list and worked from there.

2. There are a couple of ways of running make\_rootfs.sh:

    CLEAN=1 ./make_rootfs.sh

this will do a clean install of the whole lot, it will re-download
libs/apps in the package library and when its all done you will have the
full rootfs + kernel + headers, all packages are installed via the
complete-package-list

    CLEAN=1 ./make_rootfs.sh -e

Almost the same as the last one, except this one will remove the headers
when its finished, this is building yourself a stock install, the -e is
for embedded, so this one uses the embedded-package-list

    ./make_rootfs.sh

This one doesn't re-download the package files but still keeps the
headers when done (complete-package-list)

    ./make_rootfs.sh -e

and this one doesn't re-download the package files and removes the
headers when done (embedded-package-list)

3. if you want to automatically build and install extra packages take a
look at the install.sh scripts in the /packages/sub-folders, they'll
give you an idea of what is required, once you've created your own
install.sh in its own folder in /packages you can add your extra package
folder name to either the embedded or complete-package-list and they
should install for you. bear in mind that if your package/app depends on
another lib/app then it will need to be lower in the list than the
libs/apps it depends on. If you want to remove any packages from either
list just put a \# at the beginning of the line, this will comment it
out and stop make\_rootfs.sh from building that app/lib, again you need
to consider whether the app/lib you are commenting out is needed by
anything else, for instance not installing busybox would be a big
mistake.

## File Prep

You will need the host)

Save the following to your /scripts folder.
[make\_RootFS.sh](http://db.tt/7f6U2qz)

-   ( Link to complete-package-list )

run

    chmod 777 Make_RootFS.sh
    chmod 777 functions



-   Copy host\_tools from the didj kernel sources and put it in the your
    project folder

-   Make the folders in your build environment /target/tftp



## Fix the broken /packages files

to do a make\_rootfs.sh you will need a working /packages set, these are
all installed by make\_rootfs.sh via an install.sh file in each folder
in /packages.

Unfortunately it will fail to build unless you comment out or fix the
broken packages in the complete/embedded-package-list files.

Here is a list of the broken packages and my quick attempts to fix them:

    uclibc  : I pull whatever its looking for from the explorer lib files on the machine itself.
    strace : needed a change to a more recent version of the sources
    e2fsprogs : --disable-tls in the ./configure line in its install.sh
    screens : can't rememeber where I pulled them from, give me a shout if you can't locate it
    dftp : probably pulled from the explorer and made my own install.sh file for it much the same as uclibc
    camera : edit the makefile and comment out the CC= line
    oe-bin : if it gives you any hassle, remove/comment out following line from install.sh:
    # ln -s $ROOTFS_PATH/usr/lib/libncurses.so $ROOTFS_PATH/usr/lib/libcurses.so
    iperf : Make sure that the CC/CXX/LD binaries are for your toolchain, change the CXX line so that its g++ at the end and not gcc
    kbtool : make the first line of the makefile read:
    CC:=$(CROSS_COMPILE)gcc

## Notes

complete-package-list - anything with a \# next to it won't be installed

There is stuff missing in /bin that needs addressing

To attempt a build run

    sudo ./Make_RootFS.sh

This will compile your kernel using the .config file you have set up.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")

