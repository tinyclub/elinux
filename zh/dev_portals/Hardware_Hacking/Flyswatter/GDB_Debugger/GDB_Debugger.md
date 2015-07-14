> From: [eLinux.org](http://eLinux.org/GDB_Debugger "http://eLinux.org/GDB_Debugger")


# GDB Debugger




 GDB, the GNU Project Debugger is a debugging tool provided with the GNU
Compiler Collection (GCC). GDB allows you to stop and start a running
program, examine its functioning, and make changes.



## Contents

-   [1 GDB Support in OpenOCD](#gdb-support-in-openocd)
-   [2 Installing the CodeSourcery ARM
    Toolchain](#installing-the-codesourcery-arm-toolchain)
-   [3 Starting GDB](#starting-gdb)
-   [4 Connecting to OpenOCD](#connecting-to-openocd)
    -   [4.1 Sending Commands to OpenOCD](#sending-commands-to-openocd)
    -   [4.2 .gdbinit](#-gdbinit)
-   [5 Debugging a Program on the
    Beagleboard](#debugging-a-program-on-the-beagleboard)
    -   [5.1 Installing Packages](#installing-packages)
    -   [5.2 Compiling LEDblink](#compiling-ledblink)
    -   [5.3 Loading LEDblink](#loading-ledblink)
    -   [5.4 Breakpoints](#breakpoints)
    -   [5.5 Reading Memory](#reading-memory)
    -   [5.6 External Links](#external-links)

# GDB Support in OpenOCD

The **configure** script provided with [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD")
0.5.0 already compiles OpenOCD to support the GDB debugger. The [OpenOCD
Ubuntu Package](http://eLinux.org/OpenOCD_Ubuntu_Package "OpenOCD Ubuntu Package") also
includes GDB Support. If you have installed OpenOCD according to the
guides on the [Compiling
OpenOCD](http://eLinux.org/Compiling_OpenOCD "Compiling OpenOCD") page, your version of
OpenOCD already supports GDB.

The *-g* flag tells the gcc compiler to build with GDB support.
OpenOCD's **configure** script already includes the *-g* flag.

GDB Debugger is provided by default on Ubuntu 10.04. However, this
version of GDB is only built to debug programs running on a Linux PC.
You will need to download or compile a version of GDB that supports
embedded devices. One such GDB build is provided with the CodeSourcery
ARM toolchain.



# Installing the CodeSourcery ARM Toolchain

[CodeSourcery](http://www.codesourcery.com/) provides development tools
for use with embedded devices, including a GCC cross-compiler and a GDB
build for ARM targets. Download the latest version of the **.bin**
installer from
[http://www.codesourcery.com/sgpp/lite/arm/portal/release1592](http://www.codesourcery.com/sgpp/lite/arm/portal/release1592).
Direct link is
[here](http://www.codesourcery.com/sgpp/lite/arm/portal/package7815/public/arm-none-eabi/arm-2010.09-51-arm-none-eabi.bin).
Save this file anywhere on your computer, then navigate to it in a
terminal window.

Run the installer like this:

    sh arm-2010.09-51-arm-none-eabi.bin

You should see a loading bar followed by an installer GUI. However, you
may see an error stating that the installer doesn't support the DASH
shell.

[![Arm-none-eabi dash
err.png](http://eLinux.org/images/4/41/Arm-none-eabi_dash_err.png)](http://eLinux.org/File:Arm-none-eabi_dash_err.png)

If you see this error, disable DASH by typing

    sudo dpkg-reconfigure -plow dash

This will give you the option to enable DASH by choosing *\<YES\>* or
disable it by choosing *\<NO\>*. Choose no and run the installer again.

     sh arm-2010.09-51-arm-none-eabi.bin

You should see the installer GUI now. The installer is fairly
straightforward. This guide will assume that you choose the default
option on each page.

[![Sourcery-install.png](http://eLinux.org/images/4/4d/Sourcery-install.png)](http://eLinux.org/File:Sourcery-install.png)

The installer installs the CodeSourcery toolchain to your home
directory. Add it to your PATH by editing your environment variables:

    sudo cp /etc/environment /etc/backup_environment
    sudo gedit /etc/environment

This backs up your environment file and then opens it a text editor.
(The backup is just in case something goes wrong; unless you make a
mistake, you can delete **backup\_environment** later.) Find the line
"Path=..." (probably the only line). Add the following to the end of
that line, inside the quotes:

    :~/CodeSourcery/Sourcery_G++_Lite/bin

That line should now read something like this:

    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/CodeSourcery/Sourcery_G++_Lite/bin"

**Restart your computer.**

Make sure everything installed correctly by running
**arm-none-eabi-gcc** from anyhere, with no arguments. If everything
installed correctly, you will see:

    arm-none-eabi-gcc: no input files



# Starting GDB

In the terminal window, run **arm-none-eabi-gdb** from any directory.

    arm-none-eabi-gdb

Your terminal window should look like the image below, with a prompt
reading *(gdb)* in place of the normal *\>* command prompt.

[![Eabi-gdb
startup.png](http://eLinux.org/images/6/68/Eabi-gdb_startup.png)](http://eLinux.org/File:Eabi-gdb_startup.png)



# Connecting to OpenOCD

Run OpenOCD as normal, as described in [Running OpenOCD on
Linux](http://eLinux.org/Running_OpenOCD_on_Linux "Running OpenOCD on Linux"). To connect
to OpenOCD, start GDB as above:

    arm-none-eabi-gdb

OpenOCD listens for GDB connections on port 3333. In GDB, connect to
OpenOCD by typing *target remote localhost:3333*. (In this guide if you
see *(gdb)* at the beginning of a command, that means enter that line
into the GDB command prompt. Don't actually type the characters
*(gdb)*.)

    (gdb) target remote localhost:3333

Before doing anything else, run *reset init* on the target. Use the
*monitor* command to tell GDB to send the command to OpenOCD, like this:

    (gdb) monitor reset init

[![Monitor reset
init.png](http://eLinux.org/images/1/18/Monitor_reset_init.png)](http://eLinux.org/File:Monitor_reset_init.png)

This is important. You need to do this while GDB is connected to the
OpenOCD, or you won't be able to halt or reset the target. If you don't
run *monitor reset init*, you will encounter errors like this:

[![Gdb packet
err.png](http://eLinux.org/images/5/5c/Gdb_packet_err.png)](http://eLinux.org/File:Gdb_packet_err.png)



## Sending Commands to OpenOCD

You can send commands to OpenOCD through GDB just like you can through a
telnet connection. Type *monitor*, then the command, then enter. You can
see a list of common OpenOCD commands
[here](http://eLinux.org/Flyswatter_How_To#Common_OpenOCD_Commands "Flyswatter How To").

[![Gdb openocd
commands.png](http://eLinux.org/images/c/c7/Gdb_openocd_commands.png)](http://eLinux.org/File:Gdb_openocd_commands.png)

You can use the Linux command *cd* to change the current working
directory in GDB. This changes the current directory only for GDB, not
for Linux; when you exit GDB, you will be back in the directory where
you started.

To quit GDB, type *quit.*



## .gdbinit

Instead of typing commands yourself every time you start GDB, you can
create a script to always start GDB with the same series of commands.
This script file is named **.gdbinit**. GDB looks for it in the current
working directory.

You can use the script below to have GDB automatically connect to
OpenOCD and run *reset init* on the target. Create a new folder in your
home directory called **GDB\_OpenOCD\_init**, and a new text file in
that folder. Copy the code below into the file:

    echo Executing GDB with .gdbinit to connect to OpenOCD.\n
    echo .gdbinit is a hidden file. Press Ctrl-H in the current working directory to see it.\n
    # Connect to OpenOCD
    target remote localhost:3333
    # Reset the target and call its init script
    monitor reset init
    # Halt the target. The init script should halt the target, but just in case
    monitor halt

Save the file as **.gdbinit** and close it. Like any file whose name
begins with a period, **.gdbinit** is a hidden file. To see it, open the
folder and press *CTRL-H.*

To test the init script, start OpenOCD as normal. Then navigate to
**GDB\_OpenOCD\_init/** and run CodeSourcery GDB.

    cd ~/GDB_OpenOCD_init
    arm-none-eabi-gdb

You should see something like the image below. (In this image the target
device is the Beagleboard. With different hardware the output of *reset
init* will be different.)

[![Gdbinit.png](http://eLinux.org/images/4/40/Gdbinit.png)](http://eLinux.org/File:Gdbinit.png)



# Debugging a Program on the Beagleboard

This part of the guide will demonstrate how to run and debug a simple
program on the Beagleboard. The program will only work on the
Beagleboard, but the commands are the same on other target devices.



## Installing Packages

For this section you will need the Ubuntu packages *git* and *make*.
Install the following packages by opening a new terminal window and
typing:

    sudo apt-get install git make

You may see a message stating that these pachages are already installed.
That's fine.



## Compiling LEDblink

Navigate to your home directory and use git to clone into
[https://github.com/mlu/cortal\_dendrites.git](https://github.com/mlu/cortal_dendrites.git).

    cd ~
    git clone https://github.com/mlu/cortal_dendrites.git

You should now have a folder in your home directory called
**cortal\_dendrites/**. Navigate to
**/home/USERNAME/cortal\_dendrites/cortex\_a8/standalone/LEDblink**.
This directory contains the source for LEDblink. Run make to compile it.

    cd ~/cortal_dendrites/cortex_a8/standalone/LEDblink
    make

The folder should now contain a binary file called **LEDblink**. It also
contains a hidden file called **.gdbinit**. This script should start GDB
and load **LEDblink**, but the file is outdated and no longer works.
Delete it so that you can't accidentally run it later.

    rm .gdbinit



## Loading LEDblink

Start [OpenOCD](http://eLinux.org/OpenOCD "OpenOCD") as normal, then open a new terminal
window. Run GDB, connect it to OpenOCD, and reset the Beagleboard. You
can do this manually:

    arm-none-eabi-gdb
    (gdb) target remote localhost:3333
    (gdb) monitor reset init

...or using the **.gdbinit** script you created above:

    cd ~/GDB_OpenOCD_init
    arm-none-eabi-gdb

[![Beagle
usrleds.png](http://eLinux.org/images/9/92/Beagle_usrleds.png)](http://eLinux.org/File:Beagle_usrleds.png)

The USR0 and USR1 LEDs on the Beagleboard should now be off. The
Beagleboard has just been reset and is halted. Tell the Beagleboard to
resume to let it boot. You should see USR0 and USR1 come on.

    (gdb) monitor resume

Wait for the lights to come on, and then halt the Beagleboard again.

    (gdb) monitor halt

Navigate to the directory containing LEDblink and load it:

    (gdb) cd ~/cortal_dendrites/cortex_a8/standalone/LEDblink
    (gdb) load LEDblink
    (gdb) symbol-file LEDblink

[![Ledblink
load.png](http://eLinux.org/images/3/36/Ledblink_load.png)](http://eLinux.org/File:Ledblink_load.png)

Now run the program by typing:

    (gdb) cont

You should see the USR0 and USR1 LEDs pulse on and off in sequence.
LEDblink will run forever if you let it. When you're ready to stop it,
press *CTRL-C* in the GDB terminal. To start it again, type *cont*
again.



## Breakpoints

When debugging a program it's often useful to stop it in the middle to
see what it's doing. You can do that with GDB using breakpoints. When
you ran the command *symbol-file LEDblink* above, you loaded a file that
allows GDB to map lines and functions in the source code to instructions
in the executable. You can now instruct GDB to stop the program when it
reaches a particular line or function.

Add a breakpoint associated with line 22 of LEDblink.c, then let
LEDblink continue, like this:

    (gdb) break 22
    (gdb) cont

GDB will run until it hits line 22, then return you to the command
prompt. Line 22 is inside a loop that never terminates, so GDB will hit
this breakpoint over and over. Each time GDB hits the breakpoint, you
can tell it to proceed by typing *cont* again.

You can have multiple breakpoints at a time. Type:

    (gdb) break 30

...to create a second breakpoint at line 30. You can get a list of all
breakpoints by typing:

    (gdb) info breakpoints

*info breakpoints* lists your breakpoints by number. You can delete a
breakpoint by entering *delete* followed by a number.

    (gdb) delete 1

...deletes Breakpoint 1.

[![Ledblink
breakpoints.png](http://eLinux.org/images/9/95/Ledblink_breakpoints.png)](http://eLinux.org/File:Ledblink_breakpoints.png)



## Reading Memory

You can use GDB to read the value stored in a memory address with the
*x* command. Type *x* followed by a memory address to output the value
at that address. GDB assumes that the address is in decimal format
unless you preface it with *0x* to indicate hexadecimal. Memory
addresses are usually expressed in hexadecimal, so remember to type
*0x.*

    (gdb) x 0x49056090

[![Gdb x.png](http://eLinux.org/images/6/64/Gdb_x.png)](http://eLinux.org/File:Gdb_x.png)

The values at **0x49056090** and **0x49056094** control the USR0 and
USR1 LEDs. The 22nd bit of each (0x00400000, in hex) controls USR0, and
the 21st bit (0x00200000) controls USR1. Writing to 0x49056090 turns a
light off, and writing to 0x49056094 turns a light on.


 **address 0x49056090 = 0x00400000:** turn USR0 off

**address 0x49056090 = 0x00200000:** turn USR1 off

**address 0x49056090 = 0x00600000:** turn both LEDs off


 **address 0x49056094 = 0x00400000:** turn USR0 on

**address 0x49056094 = 0x00200000:** turn USR1 on

**address 0x49056094 = 0x00600000:** turn both LEDs on


 You can type *x 0x49056090* and *x 0x49056094* when LEDblink reaches a
breakpoint to see what the program is doing.



## External Links

[GDB man page](http://linuxmanpages.com/man1/gdb.1.php)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")
-   [OpenOCD](http://eLinux.org/Category:OpenOCD "Category:OpenOCD")
-   [GDB](http://eLinux.org/index.php?title=Category:GDB&action=edit&redlink=1 "Category:GDB (page does not exist)")

