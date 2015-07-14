> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Kernel_Configuration "http://eLinux.org/LeapFrog_Pollux_Platform:_Kernel_Configuration")


# LeapFrog Pollux Platform: Kernel Configuration



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Software Needed](#software-needed)
-   [4 Using Preexisting Config](#using-preexisting-config)
-   [5 Make Menuconfig](#make-menuconfig)
-   [6 Manual Config Editing](#manual-config-editing)

## Summary

There are various options that can be set when compiling a Linux kernel
for the LeapFrog Pollux Platform. In the linux-2.6/ kernel directory you
will find a file called .config, you may need to turn on "View Hidden
Files" or ls -al in terminal to see it. This file is where your
configuration options are stored. There are also several default config
files listed in the SOURCE\_CODE/linux-2.6/arch/arm/configs directory.
The ones we are interested in are prefixed with lf1000\_. It is
recommended that you back up your .config file before making changes or
replacing it.

There is two ways to edit your configuration files, either with a text
editor, or the make menuconfig GUI. This tutorial will go over the
basics of editing your config file. Tutorials referencing this, should
supply you with the options you need to configure, which this guide will
help you apply.

## Prerequisites

[Setup Build
Environment](http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment "LeapFrog Pollux Platform: Build Environment")

## Software Needed

[Source
Code](http://eLinux.org/LeapFrog_Pollux_Platform:_Source_Code "LeapFrog Pollux Platform: Source Code")

## Using Preexisting Config

LeapFrog provides a couple different config files in their sources,
listed in the SOURCE\_CODE/linux-2.6/arch/arm/configs directory, with
names like lf1000\_\<options\>\_defconfig. If one of these files has all
the settings you need, you can easily make it your default config file
by running this command.

    make lf1000_<options>_defconfig

This copies the lf1000\_\<options\>\_defconfig file to the main
directory and renames it .config, you can then proceed to build your
kernel from here, or if you require some more options to be set,
continue on.

## Make Menuconfig

The GUI editor makes it rather easy to edit your config file, as
everything is categorized for you, making options easy to find. To start
the menuconfig program, in a terminal move to your LeapFrog Linux source
directory of choice, and into the main kernel directory, usually named
something like linux-2.6/

You'll need to import one of the preexisting config files located in
SOURCE\_CODE/linux-2.6/arch/arm/configs, if this is your first time
building this source tree, if not, you can omit this step.

     $ make lf1000_<options>_defconfig

Once you've got a .config file you can then change it by running make
menuconfig.

    $ make menuconfig

[![Make
menuconfig.png](http://eLinux.org/images/thumb/f/fb/Make_menuconfig.png/500px-Make_menuconfig.png)](http://eLinux.org/File:Make_menuconfig.png)


 This is the first screen you will see after the program loads. Up/Down
arrows move the selection and space enters or selects, while Right/Left
moves between Select/Exit/Help. You can use the space bar or Y, N, or M
to make your selections. Y=include, N=exclude, and M=Module. Include
makes it part of the kernel, while module requires loading it from user
space. To navigate out of a category highlight Exit, and hit Return,
repeat this until you get to the main screen (Linux Kernel
Configuration). Exiting at the main screen it will ask if you would like
to save, hit Yes if you're all done and want to keep the changes, or No
to close and discard all changes.


 Once you are done, and save your configuration, it will update the
.config file, and you are ready to compile your kernel with its new
options. Once you are happy that your configuration works it's a
sensible idea to backup your .config, give it a memorable name like
lf1000\_my\_special\_defconfig, keep a copy safe somewhere and put a
copy of it in linux-2.6/arch/arm/configs, you will then be able to make
whatever changes you like to your working .config and be able to call it
with:

    make lf1000_my_special_defconfig

## Manual Config Editing

If you would prefer to use a text editor, you can open one of the
lf1000\_\<options\>\_defconfig files in
SOURCE\_CODE/linux-2.6/arch/arm/configs with your editor of choice. Then
save it to your /linux-2.6 directory renaming it .config. You will see a
long list of options. Comment out with a \# to deselect the option, or
uncomment and change "\#OPTION is not set" to "OPTION=y" to enable it.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

