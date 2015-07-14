> From: [eLinux.org](http://eLinux.org/Bluetooth_Network "http://eLinux.org/Bluetooth_Network")


# Bluetooth Network



This page has information about setting up a Bluetooth Personal Area
Network (PAN) with BlueZ. Having a Bluetooth network is helpful for
providing network access to low power embedded devices.

## Contents

-   [1 Background](#background)
-   [2 Limitations](#limitations)
-   [3 Requirements](#requirements)
-   [4 BlueZ Configuration](#bluez-configuration)
    -   [4.1 Setup
        /etc/bluetooth/hcid.conf](#setup-etc-bluetooth-hcid-conf)
    -   [4.2 Daemon Configuration](#daemon-configuration)
    -   [4.3 End Result (When host is
        connected)](#end-result-when-host-is-connected)
-   [5 Bridge Configuration](#bridge-configuration)
    -   [5.1 Setup
        /etc/network/interfaces](#setup-etc-network-interfaces)
    -   [5.2 Setup
        /etc/bluetooth/pan/dev-{up|down}](#setup-etc-bluetooth-pan-dev-up-down)
    -   [5.3 End Result (When host is
        connected)](#end-result-when-host-is-connected-2)
-   [6 Setup DHCP](#setup-dhcp)
    -   [6.1 Setup /etc/dhcpd.conf](#setup-etc-dhcpd-conf)
    -   [6.2 Daemon Configuration](#daemon-configuration-2)
-   [7 Setup Network](#setup-network)
    -   [7.1 Shorewall](#shorewall)
        -   [7.1.1 params](#params)
        -   [7.1.2 interfaces](#interfaces)
        -   [7.1.3 zones](#zones)
        -   [7.1.4 policy](#policy)
        -   [7.1.5 masq](#masq)
        -   [7.1.6 rules](#rules)
    -   [7.2 Netfilter](#netfilter)
    -   [7.3 Network Manager 0.7](#network-manager-0-7)
-   [8 Client Device](#client-device)
    -   [8.1 /etc/network/interfaces
        file](#-etc-network-interfaces-file)
    -   [8.2 End result](#end-result)

## Background

Information on piconets can be found on
[Wikipedia](http://en.wikipedia.org/wiki/Piconet)
 Basic information on BlueZ PAN support can be found here:
[[1]](http://bluez.sourceforge.net/contrib/HOWTO-PAN)

## Limitations

A PAN network is limited to 7 clients and provides substantially less
bandwidth (\~700Kbit/s) than other WiFi networks.

## Requirements

To setup a home piconet, you'll need:

-   A Bluetooth device, such as a USB dongle, preferably Class 1 for
    range purposes.
-   A kernel that supports the Bluez stack including BNEP.
-   [bluez-utils](http://www.bluez.org/) (testing with 3.36).
-   Kernel ethernet bridging support.
-   [bridge-utils](http://www.linuxfoundation.org/en/Net:Bridge) (tested
    with 1.4).

These instructions are based on a Debian/Sid system, but the setup
should be similar for other distributions.

## BlueZ Configuration

### Setup /etc/bluetooth/hcid.conf

[hcid.conf(5)](http://linux.die.net/man/5/hcid.conf)
 Your piconet server should advertise itself appropriately. Modify the
class parameter within the device section so that the host presents
itself as a network access point device offering network service:

    # Local device class
    class 0x020300;

Change your piconet server to prefer master role on incoming
connections:

    lm master;

Make your piconet server permanently discoverable:

    discovto 0;

### Daemon Configuration

[pand(1)](http://linux.die.net/man/1/pand)
 Setup the command line options for the pand daemon. Within Debian, this
is done through the file /etc/default/bluetooth. The command lines for
the pand daemon should be:

    --listen --role NAP -u /etc/bluetooth/pan/dev-up -o /etc/bluetooth/pan/dev-down

### End Result (When host is connected)

ifconfig bnep0

    bnep0     Link encap:Ethernet  HWaddr 00:11:f6:05:79:95
              inet6 addr: fe80::211:f6ff:fe05:7995/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:23661 errors:0 dropped:0 overruns:0 frame:0
              TX packets:29381 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:2976646 (2.8 MiB)  TX bytes:27249215 (25.9 MiB)

hcitool con

    Connections:
        > ACL 00:1B:DC:0F:A8:AE handle 8 state 1 lm MASTER

## Bridge Configuration

The kernel only provides an Ethernet device when at least one PAN client
has connected. This means that there will be no associated device when
no devices are connected. This can be very inconvenient when providing
services such as DHCP. By utilizing Ethernet Bridging, a permanent pan0
device can be created.

### Setup /etc/network/interfaces

[interfaces(5)](http://web.iesrodeira.com/cgi-bin/man/man2html?5+interfaces)

[bridge-utils-interfaces(5)](http://web.iesrodeira.com/cgi-bin/man/man2html?bridge-utils-interfaces+5)
 On Debian systems, network interfaces are configured through this file.
An example configuration would be:

    auto pan0
    iface pan0 inet static
            address 10.1.0.1
            netmask 255.255.255.0
            broadcast 10.1.0.255
            bridge_ports none
            bridge_fd 0
            bridge_stp off

Alternatively, the pan0 interface can be configured manually:

    brctl addbr pan0
    brctl setfd pan0 0
    brctl stp pan0 off
    ifconfig pan0 10.1.0.1 netmask 255.255.255.0

### Setup /etc/bluetooth/pan/dev-{up|down}

The dev up/down files add and remove the bnep0 device from the pan0
bridge interface as the first device enters the network, and as the last
device leaves the network.

/etc/bluetooth/pan/dev-up

    #!/bin/sh
    ifconfig $1 up
    brctl addif pan0 $1

/etc/bluetooth/pan/dev-down

    #!/bin/sh
    brctl delif pan0 $1
    ifconfig $1 down

### End Result (When host is connected)

brctl show

    bridge name bridge id       STP enabled interfaces
    pan0        8000.0011f6057995   no      bnep0

ifconfig pan0

    pan0      Link encap:Ethernet  HWaddr 00:11:f6:05:79:95
              inet addr:10.1.0.1  Bcast:10.1.0.255  Mask:255.255.255.0
              inet6 addr: fe80::200:ff:fe00:0/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:30706 errors:0 dropped:0 overruns:0 frame:0
              TX packets:40037 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0
              RX bytes:3681538 (3.5 MiB)  TX bytes:34573855 (32.9 MiB)

## Setup DHCP

Unless avahi zeroconf will be used to assign address, a DHCP server will
be required.

### Setup /etc/dhcpd.conf

Basic configuration:

    option domain-name-servers <dns1>,<dns2>,<dns3>;

    default-lease-time 864000;
    max-lease-time 864000;

    subnet 10.1.0.0 netmask 255.255.255.0 {
      option domain-name "blue";
      range 10.1.0.100 10.1.0.200;
      option routers 10.1.0.1;
    }

### Daemon Configuration

Setup the command line options for the dhcpd daemon. Within Debian, this
is done through the file /etc/default/dhcp. Tho command lines for the
dhcpd daemon should be:

    pan0

## Setup Network

If your piconet server is not the machine you intend to access your
piconet devices from and/or your piconet devices need to access hosts
other than your piconet server, routing and/or NAT will need to be
configured

### Shorewall

Adding your piconet to an existing [Shorewall](http://www.shorewall.net)
configuration is by far the easiest method.

#### params

    BLUE_IF=pan0

#### interfaces

    #ZONE   INTERFACE       BROADCAST       OPTIONS
    blue    $BLUE_IF    detect      tcpflags,dhcp,detectnets,nosmurfs

#### zones

    #ZONE   TYPE        OPTIONS     IN          OUT
    #                   OPTIONS         OPTIONS
    blue    ipv4

#### policy

Allow piconet to access Internet:

    #SOURCE         DEST            POLICY          LOG             LIMIT:BURST
    #                                               LEVEL
    blue            net             ACCEPT

A rule like the following would allow the local network to access the
piconet:

    #SOURCE         DEST            POLICY          LOG             LIMIT:BURST
    #
    loc             all             ACCEPT

The last line of the policy file should of course contain an all/all
DROP rule.

#### masq

Allow local network to access piconet masquerading as piconet server:

    #INTERFACE              SUBNET          ADDRESS         PROTO   PORT(S) IPSEC
    $BLUE_IF        $LOC_IF

Masquerade piconet network access to Internet

    #INTERFACE              SUBNET          ADDRESS         PROTO   PORT(S) IPSEC
    $NET_IF         $BLUE_IF

#### rules

Not allowing your open piconet to do things like Spam and/or access your
Cable modem is probably a good thing.

    #ACTION         SOURCE  DEST            PROTO   DEST    SOURCE          ORIGINAL        RATE            USER/
    #                                               PORT    PORT(S)         DEST            LIMIT           GROUP
    SMTP/REJECT     blue    net
    DROP   blue    net:10.0.0.0/8,192.168.0.0/16,172.16.0.0/12

### Netfilter

A very basic [Netfilter
setup](http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-4.html),
assuming that eth1 connects to the Internet, and eth0 connects to the
local network.

    # Enable masquerading access to the Internet (rule may already exists)
    iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
    # Enable masquerading access to the piconet from the local net
    iptables -t nat -A POSTROUTING -i eth0 -o pan0 -j MASQUERADE
    # Enable routing (may already exist)
    echo 1 > /proc/sys/net/ipv4/ip_forward

### Network Manager 0.7

[Network Manager](http://projects.gnome.org/NetworkManager/) provides
connection sharing functionality. From the "Edit Connections" dialog,
select "Add". Name the connection bnep0 and enter the Bluetooth device's
MAC address into the Wired tab. Select "Shared to other computers" on
the "IPv4 Settings" tab.

## Client Device

Embedded devices should execute the command:

    pand --connect <bdaddr of piconet server> --persist -u ifup -o ifdown

Upon boot, alternatively, the following command can be used:

    pand --search --persist -u ifup -o ifdown

### /etc/network/interfaces file

This step applies to Debian and Debian like (Angstrom/OE) distributions.
Modification will be required for other distributions:

    # Bluetooth networking
    allow-hotplug bnep0
    iface bnep0 inet dhcp

### End result

ifconfig bnep0

    bnep0     Link encap:Ethernet  HWaddr 00:1B:DC:0F:A8:AE
              inet addr:10.1.0.100  Bcast:10.1.0.255  Mask:255.255.255.0
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:29272 errors:0 dropped:0 overruns:0 frame:0
              TX packets:23598 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:27242050 (25.9 MiB)  TX bytes:2964918 (2.8 MiB)

route -n

    Kernel IP routing table
    Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
    10.1.0.0        0.0.0.0         255.255.255.0   U     0      0        0 bnep0
    0.0.0.0         10.1.0.1        0.0.0.0         UG    0      0        0 bnep0

hcitool con

    Connections:
        < ACL 00:11:F6:05:79:95 handle 42 state 1 lm SLAVE


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Networking](http://eLinux.org/Category:Networking "Category:Networking")

