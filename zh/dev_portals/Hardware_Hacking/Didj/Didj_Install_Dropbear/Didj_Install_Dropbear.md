> From: [eLinux.org](http://eLinux.org/Didj_Install_Dropbear "http://eLinux.org/Didj_Install_Dropbear")


# Didj Install Dropbear



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Software Needed](#software-needed)
-   [4 Compiling](#compiling)
-   [5 Installing](#installing)
-   [6 Running](#running)

## Summary

Dropbear is a relatively small SSH 2 server and client. This can be used
for accessing the Didj with out a UART connection. You will have to
disable the USB Mass Storage driver, but you can still access that
directory from with in the Didj itself.



## Prerequisites

[Enable Networking](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking").
This tutorial uses the IP addresses and user name from that tutorial,
change accordingly if you've used different values.



## Software Needed

[Dropbear](http://matt.ucc.asn.au/dropbear/releases/dropbear-0.52.tar.gz%7C)



## Compiling

Untar the file and go into the resulting directory.

*On Host:*

    $ tar -xvzf dropbear-0.52.tar.gz
    $ cd dropbear-0.52


 *Optional* Edit options.h in the dropbear source directory.

[Set up the Build
Environment](http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment#Environment_Variables "LeapFrog Pollux Platform: Build Environment")
Variables if they haven't already been set.

Set up the CC variable and then configure the compilation. (In this
example we add directives to disable zlib, syslog, and lastlog)

*On Host*

    $ export CC=arm-linux-uclibcgnueabi-gcc
    $ ./configure --host=arm-linux-uclibcgnueabi --disable-zlib --disable-syslog --disable-lastlog

Compile Dropbear (In this example, we create a single statically-linked
executable that, like Busybox, encompases a number of programs.)

*On Host*

    $ make PROGRAMS="dropbear dbclient dropbearkey dropbearconvert scp" STATIC=1 MULTI=1

To reduce the size of the resulting binary file, strip the symbols:

*On Host*

    $ arm-linux-uclibcgnueabi-strip dropbearmulti

## Installing

Mount the Didj drive on your host PC. Make sure the USB cable is
connected between your PC and Didj.

*On the Didj*

    # usbctl -d mass_storage -a enable
    # usbctl -d mass_storage -a unlock

The Didj should then automount allow you access to copy files over.

Copy dropbearmulti to the mounted Didj directory (this is the /Didj
directory on the device), and then unmount the Didj.

*On Host*

    $ cp dropbearmulti /mnt/Didj
    $ umount /mnt/Didj

Then, on the Didj console, disable mass\_storage (which results in /Didj
mounting on the device)

*On Didj*

    # usbctl -d mass_storage -a disable

Move dropbearmulti to its final home, and create symlinks for the
dropbear programs.

*On Didj*

    # mount -o remount, rw /
    # cp /Didj/dropbearmulti /bin
    # cd /bin
    # ln -s dropbearmulti dropbear
    # ln -s dropbearmulti dbclient
    # ln -s dropbearmulti dropbearkey
    # ln -s dropbearmulti dropbearconvert
    # ln -s dropbearmulti scp

Lastly, create the default directory for the encryption keys, and then
generate the keys:

*On Didj*

    # mkdir /etc/dropbear
    # dropbearkey -t rsa -s 1024 -f /etc/dropbear/dropbear_rsa_host_key
    # dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key

## Running

Now launch dropbear...

*On Didj*

    # dropbear -a

And SSH in from your host! (assumes you have created a user named
'didj')

*On Host*

    $ ssh didj@10.0.0.2

You should now be logged in to your home directory.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

