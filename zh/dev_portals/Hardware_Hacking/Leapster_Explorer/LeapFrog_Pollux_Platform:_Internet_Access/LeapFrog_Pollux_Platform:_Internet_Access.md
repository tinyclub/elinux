> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Internet_Access "http://eLinux.org/LeapFrog_Pollux_Platform:_Internet_Access")


# LeapFrog Pollux Platform: Internet Access



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Hardware Needed](#hardware-needed)
-   [4 Routing Method](#routing-method)
-   [5 Bridging/Routing Method](#bridging-routing-method)
-   [6 Configuring the Device](#configuring-the-device)

## Summary

There are two methods of accessing the internet from your [LeapFrog
Pollux Platform](http://eLinux.org/LeapFrog_Pollux_Platform "LeapFrog Pollux Platform")
device. While both require hooking up to a host PC, you can either using
routing, or bridging to make the connection. Either way nets you the
same goal. Some differences are Bridging deals with Layer 2 of the [OSI
model](http://en.wikipedia.org/wiki/OSI_model%7C) and and allow DHCP
broadcasts, while Routing involves Layer 3.

## Prerequisites

A Linux host PC

For the Didj, it requires you [Enable
Networking](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking")

Interface Name

-   The label you're host PC gave your device's interface, ex, usb0 (as
    used in this tutorial) run dmesg after plugging in to find what your
    interface name is, ex. eth1, eth2, usb1, usb2, etc, and replace
    references to usb0, with that.

## Hardware Needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

## Routing Method

**Configuring the Host**

For this tutorial we'll use these IP address.

-   Host 10.0.0.1

-   Device 10.0.0.2

Configure the host machine's /etc/network/interfaces file as follows as
root.

` `

    auto lo
    iface lo inet loopback
    auto eth0
    iface eth0 inet dhcp
    auto usb0
    iface usb0 inet static
           address 10.0.0.1
           netmask 255.255.255.0
           up route add -net 10.0.0.0 netmask 255.255.255.0 dev usb0
           up echo 1 > /proc/sys/net/ipv4/ip_forward
           up iptables -P FORWARD ACCEPT
           up iptables -A POSTROUTING -t nat -j MASQUERADE -s 10.0.0.2
           down route del -net 10.0.0.0 netmask 255.255.255.0
           down echo 0 > /proc/sys/net/ipv4/ip_forward
           down iptables -t nat -F POSTROUTING

To apply these new settings:

*On Host*

    $ sudo /etc/init.d/networking restart

Now you can proceed to configuring your device

## Bridging/Routing Method

This is a hybrid method using Bridging and Routing. **Configuring the
Host**

This will require you have bridge-utils installed

*On Host*

    $ sudo apt-get install bridge-utils

You will need to edit a couple configuration files, be sure to make a
back up copy first.

Edit /etc/network/interfaces by pasting this in at the end of the file.

` auto br0 `

       iface br0 inet static
       address 10.0.0.1
       netmask 255.255.255.0
       pre-up brctl addbr br0
       post-down brctl delbr br0

allow-hotplug usb0

       iface usb0 inet manual
       pre-up ifconfig usb0 down
       pre-up brctl addif br0 usb0
       pre-up ifconfig usb0 up
       post-down ifconfig usb0 down
       post-down brctl delif br0 usb0

Edit /etc/rc.local and paste this in just before "exit 0"

    echo 1 > /proc/sys/net/ipv4/ip_forward
    /sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    /sbin/iptables -A FORWARD -i eth0 -o br0 -m state --state RELATED,ESTABLISHED -j ACCEPT
    /sbin/iptables -A FORWARD -i br0 -o eth0 -j ACCEPT


 *On Host*

    $ sudo ifup br0
    $ sudo /etc/rc.local

You can now proceed to configuring the device.

## Configuring the Device

If you're using a Didj make you have [Enabled
Networking](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking")

With the USB cable connected to your host, configure an IP address on a
different subnet from the rest of your LAN

*On Device*

    # ifconfig usb0 10.0.0.2 netmask 255.255.255.0

Next, add a route from your Didj to the host (making it the gateway)
using the ip address of the host's usb0 device.

*On Device*

    # route add default gw 10.0.0.1 usb0

Finally, add nameservers to your Didj's /etc/resolv.conf file (you can
add the lines from this example which uses the OpenDNS servers)

    nameserver 208.67.222.222
    nameserver 208.61.220.220

At this point, your Didj is connected to the outside world - and a ping
or a wget to yahoo or google should work.


 **Todo**

Routing packets from the gateway to the Didj.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

