> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking_Applications "http://eLinux.org/LeapFrog_Pollux_Platform:_Networking_Applications")


# LeapFrog Pollux Platform: Networking Applications



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Hardware Needed](#hardware-needed)
-   [4 General Applications](#general-applications)
    -   [4.1 Set up telnetd](#set-up-telnetd)
    -   [4.2 Netcat](#netcat)
-   [5 Explorers Specific
    Applications](#explorers-specific-applications)
    -   [5.1 SSH](#ssh)

## Summary

Here you will find a list of applications, and their usages.

## Prerequisites

[Networking
Setup](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking "LeapFrog Pollux Platform: Networking")

For Didj only [Networking
Enabled](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking")

## Hardware Needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

## General Applications

#### Set up telnetd

Run Telnetd

as a background daemon

    # telnetd

or in the foreground

    # telnetd -F

At this point you should be able to telnet from the host to the device.

*On Host*

    $ telnet 10.0.0.2

This should leave you with a remote command line to your device.



#### Netcat

Note the IP address that you assigned to the Didj, for example 10.0.0.2.
To copy a file, for example "./myfile" from your PC to the Didj:

*On Didj*

     # nc -p 5600 -l -w 30 > myfile

*On Host*

     $ nc 10.0.0.2 5600 -w 2 < myfile

When nc exits, you should see the file on the device.

## Explorers Specific Applications

#### SSH

The LeapPad Explorer and Leapster Explorer both have sshd installed.
With a little configuring, it is an easy way to transfer files back and
forth.

First you'll need to access your device via a console, so you can edit
the /etc/ssh/sshd\_config file. There are two settings you'll want to
change.

*On Device*

    PermitRootLogin yes

    PermitEmptyPasswords yes


 Once you've saved the config file, you'll need to run.

     $ /etc/init.d/sshd start

This will take a while as it generates the proper keys. If you have
already configured your networking you can then run.

*On Host*

    $ ssh root@10.0.0.1

This should give you a remote command line over ssh to your device. You
can also use any number of programs that support the ssh protocol for a
graphic interface.

**Enable Permanently**

To enable SSH and SFTP permanently, you will have to modify the
/etc/init.d/rcS file.

*On Device*

Add the following line in the same location as the telnetd and vsftpd
startup (\~line 138), or optionally outside the check for
/flags/developer (\~line 136):

    /etc/init.d/sshd start; ### tim done "sshd"

This will run sshd during the start up process, making it available with
out the need for console access.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

