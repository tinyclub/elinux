> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment "http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment")


# LeapFrog Pollux Platform: Build Environment



## Contents

-   [1 Summary](#summary)
-   [2 Software Needed](#software-needed)
-   [3 How To](#how-to)
    -   [3.1 Installing Software](#installing-software)
    -   [3.2 Environment Variables](#environment-variables)

## Summary

A build environment allows you to compile a kernel, root file system, or
programs for use on your device. Commonly referred to as Cross
Compiling, this will set up your Linux host PC to build for a different
architecture, in this case the [Pollux](http://eLinux.org/Pollux "Pollux")(LF1000) SoC.



## Software Needed

-   These are meant to be run on the Linux OS
-   [RidgeRun
    Toolchain](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code#Toolchains "LeapFrog Pollux Platform: Source Code")
-   [Source
    Code](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code "LeapFrog Pollux Platform: Source Code")



## How To

### Installing Software

**RidgeRun toolchain**

This should be extracted to the /opt directory.

    sudo tar -xjvf RidgeRun-toolchain-369009.tar.bz2 -C /

**Source Code** The source code for your particular application can be
extracted pretty much anywhere. A project folder in your home directory
works well.

Depending on how you build the source code, you may need to create a few
directories for the build scripts to put the finished images and
binaries in. These directories will be TFTP\_PATH, ROOTFS\_PATH,
EROOTFS\_PATH, and RELEASE\_PATH as defined in the environment variables
script.

**Tip:** Set it up so you can have multiple source trees parallel to
each other. Keep an untouched tree in this directory, along with trees
for different major changes you are working on. This makes it easy to
create and roll back patches, and keeps modifications organized and
sensible.

### Environment Variables

Once you got your toolchain and source code in their respective
directories, you'll need to set up some environmental variables for the
cross compiling, and the build scripts. The following paths should be
copy and pasted into a text file, crosscompile\_env\_vars, and stored in
your source code parent directory.

    export PROJECT_PATH=$PWD

    export CROSS_COMPILER_ROOT=/opt/RidgeRun/arm-eabi-uclibc
    export PATH=$CROSS_COMPILER_ROOT/bin/:$PATH

    export CROSS_COMPILE=arm-linux-
    export UBOOT_CROSS_COMPILE=arm-linux-
    export TARGET_MACH=LF_LF1000

    export ROOTFS_PATH=$PROJECT_PATH/target/rootfs
    export EROOTFS_PATH=$PROJECT_PATH/target/erootfs
    export TFTP_PATH=$PROJECT_PATH/target/tftp
    export RELEASE_PATH=$PROJECT_PATH/target/release


 You need to use the command line to build the source code, so open up a
terminal and go to the source code you want to build. If you run ls you
should see linux-2.6/ packages/ and scripts/ from here you want to set
your environment variables, as they are set up based on what directory
you are in.

    source ../crosscompile_env_vars

This will set your current terminal shell with these variables, if you
close it, or use another one, you need to reset these variables by
running that command.

You are now set up to start compiling for the LeapFrog Pollux Platform.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

