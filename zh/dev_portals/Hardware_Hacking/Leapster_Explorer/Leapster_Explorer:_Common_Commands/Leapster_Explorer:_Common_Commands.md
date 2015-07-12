> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_Common_Commands "http://eLinux.org/Leapster_Explorer:_Common_Commands")


# Leapster Explorer: Common Commands



Here are some changes to the LX's default setup that will make your life
more easy.



## Contents

-   [1 AppManager](#appmanager)
    -   [1.1 Disable](#disable)
    -   [1.2 Start Different Application](#start-different-application)
-   [2 Developer Mode](#developer-mode)
    -   [2.1 Removing USB-boot-mode
        auto-shutdown](#removing-usb-boot-mode-auto-shutdown)
-   [3 Debranding](#debranding)
-   [4 New Kernel Copy](#new-kernel-copy)

## AppManager

#### Disable

This will prevent the auto shutoff from kicking in, but you also lose a
lot of normal LeapFrog specific functionality.

**Temporarily**

*On Device*

    killall AppManager app CartManager

**Permanently**

    touch /flags/main_app



#### Start Different Application

This will allow you to start a different application other than the
default LeapFrog application:

    echo /path/to/your/app > /flags/main_app

**Caution** /LF/Bulk isn't guaranteed to be mounted when the start up
script is run. If your app isn't found, rcS will remove /flags/main\_app
to restore the default on the next boot.

## Developer Mode

This turns on telnet and ftp by default, and switches to a static IP
address.

    touch /flags/developer

If you still want to have the automatic private ip:

    touch /flags/avahi

And if you want a speedy boot (this eliminates a 6 second wait timer):

    touch /flags/no8sec

#### Removing USB-boot-mode auto-shutdown

When USB booting, the script /usr/bin/recovery runs. On line 8 of that
script is an instruction to do a forced shutdown after 600 seconds.

To remove that annoyance, simply comment-out that line:

    #( sleep 600; poweroff -f ) &

## Debranding

To remove the 2nd boot logo, comment out line 76 of /etc/init.d/rcS:

    #imager /dev/layer0 /var/screens/LEGAL.png

To remove the startup sound, comment out line 91 of /etc/init.d/rcS:

    #oss -w /var/sounds/startup.wav & # & tim end "sounds/startup.wav" &

## New Kernel Copy

This may brick your Explorer and make it require a usb boot so only do
this if your brave.

    nandscrub -e /dev/mtd2
    nandscrub /dev/mtd2
    nandwrite /dev/mtd2 /usr/kernel.cbf

mtd2 is where the kernel is stored


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")

