> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking "http://eLinux.org/LeapFrog_Pollux_Platform:_Networking")


# LeapFrog Pollux Platform: Networking



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Hardware Needed](#hardware-needed)
-   [4 Configure Device](#configure-device)
    -   [4.1 Temporary Device Setup](#temporary-device-setup)
    -   [4.2 Static IP on Avahi Systems](#static-ip-on-avahi-systems)
-   [5 Configure Host](#configure-host)
    -   [5.1 Temporary Host Setup](#temporary-host-setup)
    -   [5.2 Using Local-link](#using-local-link)
    -   [5.3 Route or Bridging
        Configuration](#route-or-bridging-configuration)
    -   [5.4 On Windows](#on-windows)

## Summary

This tutorial shows the basics steps to configure a network connection
between a host PC and your LeapFrog Pollux Platform device. The
[LeapPad\_Explorer](http://eLinux.org/LeapPad_Explorer "LeapPad Explorer") and
[Leapster\_Explorer](http://eLinux.org/Leapster_Explorer "Leapster Explorer") both come
with everything you need for networking, minus a few host PC
configuration steps, while the [Didj](http://eLinux.org/Didj "Didj") requires a more
involved process [Enable Didj
Networking](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking").

## Prerequisites

For the Didj you'll need to [Enable
Networking](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking")



## Hardware Needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")



## Configure Device

#### Temporary Device Setup

This is the easiest way to get networking up and working quickly. But
all configuration will be lost once the device is rebooted or turned
off.

Set the devices IP address. *On Device*

    ifconfig usb0 10.0.0.2 netmask 255.255.255.0

Once the host is also configured you can test connectivity by running..

    ping 10.0.0.1

You should see ping return the packet times.



#### Static IP on Avahi Systems

For the Leapster Explorer and LeapPad Explorer you may want to disable
the random IP. They use a DHCP type system called Avahi. This will force
it to a static IP address, which will make it much easier if you use
networking on your device a lot.

You can start the explorer and have it default to a static IP address by
simply holding down the brightness button at boot time. Simply edit
/etc/init.d/networking, look for any place there is an IP address and
replace it with yours, you should also change the bit after the slash to
set your netmask), edit lines 32 and 41:

    ifconfig usb0 192.168.0.111/24


 and make them look like this:

    ifconfig usb0 10.0.0.2 netmask 255.255.255.0


 Now plug in a mini usb cable and Reboot and as soon as you see: Emerald
Base: Starting /etc/init.d/networking ... Emerald Base:
/etc/init.d/networking: Holding brightness: forcing static IP

on the console then it is safe to let go.

You can make this permanent so that you don't have to hold down
brightness by removing the avahi flag:

     rm /flags/avahi

now reboot and you will get your static IP address assigned



## Configure Host

For the host PC you'll need to know which interface it is using, after
connecting and turning on your device, you can run dmesg, it should be
something like usb0, eth1, eth2, etc. This will depend on your
particular host PC's netorking set up, in this example I use usb0.



#### Temporary Host Setup

Like the temporary device set up, once it is rebooted, turned off, or
unplugged, you will lose your settings.

**Linux** *On Host*

    ifconfig 10.0.0.1 netmask 255.255.255.0

Once the device is also configured you can test connectivity by running.

    ping 10.0.0.2

You should see ping return the packet times.

#### Using Local-link

I'm using ubuntu 10.04, it has a automatic configuration, I've set mine
so that auto usb0 has the ipv4, method setting of 'local-link only' and
in auto eth2 I have hardcoded the ip address to 10.0.0.1, netmask
255.255.255.0, gateway of 0.0.0.0



#### Route or Bridging Configuration

The [Internet
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Internet_Access "LeapFrog Pollux Platform: Internet Access")
tutorial also provides some methods of permanent host configuration. If
you don't need access to the internet, you can leave out configuring the
nameservers.

#### On Windows

For the Leapster Exporer and LeapPad Explorer on Windows, it is a bit
different. Unfortunately at this time, The networking in Didj does not
work with Windows. This requires LFConnect to be installed, as it uses
its USB Ether Gadget driver. But it does not need to be running.

*If you let LFConnect start up, it will handle assigning the IP
addresses, and you will only need to know the IP of the device itself.*

First we need to find the device's IP, which can change change from time
to time. Plug in the USB and turn on your device. You'll need to wait
for it to time out trying to connect, it should pop up a warning about
bad connectivity:

*On Device*

    # ifconfig
    ...
    ...
    usb0:avah Link encap:Ethernet  HWaddr 80:38:FD:03:16:0C
        inet addr:169.254.3.208  Bcast:169.254.255.255  Mask:255.255.0.0
        UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

You're looking for the bottom row of information, the inet
addr:169.254.3.208 part.

We also need to know the IP of the host PC's interface:

*On Host*

    C:\>ipconfig /all
    ...
    ...
    Description     Leapfrog USB LAN Adapter
    ...
    ...
    IP Address     169.254.216.66
    ...
    ...

That is the IP address you need to know, there will be a lot more info,
but just look for the Leapfrog entry, and the Autoconfiguration IP.

Now to create the route.

*On Host*

    C:\>route.exe ADD 169.254.3.208 169.254.216.66

You can then ping your device to check the connection.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

