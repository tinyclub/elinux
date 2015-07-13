> From: [eLinux.org](http://eLinux.org/UPnP "http://eLinux.org/UPnP")


# UPnP



**Universal Plug and Play** (**UPnP**) is a set of computer network
Protocol (computing)|protocols promulgated by the UPnP Forum. The goals
of UPnP are to allow Peripheral device|devices to connect seamlessly and
to simplify the implementation of computer network|networks in the home
(data sharing, communications, and entertainment) and corporate
environments. UPnP achieves this by defining and publishing UPnP device
control protocols built upon open, Internet-based communication
standardization|standards.

The term UPnP is derived from plug-and-play, a technology for
dynamically attaching devices directly to a computer.

## Contents

-   [1 Overview](#overview)
-   [2 Protocol](#protocol)
    -   [2.1 Addressing](#addressing)
    -   [2.2 Discovery](#discovery)
    -   [2.3 Description](#description)
    -   [2.4 Control](#control)
    -   [2.5 Event notification](#event-notification)
    -   [2.6 Presentation](#presentation)
    -   [2.7 UPnP AV (Audio and Video)
        standards](#upnp-av-audio-and-video-standards)
        -   [2.7.1 UPnP AV components](#upnp-av-components)
    -   [2.8 NAT traversal](#nat-traversal)
-   [3 Problems with UPnP](#problems-with-upnp)
    -   [3.1 Lack of Authentication](#lack-of-authentication)
    -   [3.2 Other Issues](#other-issues)
-   [4 Future developments](#future-developments)
-   [5 Books](#books)
-   [6 External links](#external-links)
    -   [6.1 Documentation](#documentation)
    -   [6.2 News](#news)
    -   [6.3 Software](#software)

## Overview

The [UPnP architecture](http://www.upnp.org/resources/upnpresources.zip)
allows peer-to-peer networking of Personal Computer|PCs, networked
appliances, and wireless devices. It is a distributed, open architecture
based on established standards such as internet protocol suite|TCP/IP,
User Datagram Protocol|UDP, HTTP and XML.

The UPnP architecture supports zero-configuration Computer
network|networking. A UPnP compatible device from any vendor can
dynamically join a network, obtain an IP address, announce its name,
convey its capabilities upon request, and learn about the presence and
capabilities of other devices. Dynamic Host Configuration Protocol|DHCP
and Domain Name System|DNS servers are optional and are only used if
they are available on the network. Devices can leave the network
automatically without leaving any unwanted state (computer
science)|state information behind.

Other UPnP features include:

 Media and device independence
UPnP technology can run on many media that support IP including
Ethernet, FireWire, IR (IrDA), power lines (Power line
communication|PLC) and RF (Bluetooth, Wi-Fi). No special device driver
support is necessary; common protocols are used instead.

 User interface (UI) Control
UPnP architecture enables vendor control over device user interface and
interaction using the web browser.

 Operating system and programming language independence
Any operating system and any programming language can be used to build
UPnP products. UPnP does not specify or constrain the design of an API
for applications running on control points; OS vendors may create APIs
that suit their customer's needs. UPnP enables vendor control over
device UI and interaction using the browser as well as conventional
application programmatic control.

 Programmatic control
UPnP architecture also enables conventional application programmatic
control.

 Extensibility
Each UPnP product can have device-specific services layered on top of
the basic architecture.

The foundation for UPnP networking is IP addressing. Each device must
have a Dynamic Host Configuration Protocol (DHCP) client and search for
a DHCP server when the device is first connected to the network. If no
DHCP server is available, that is, the network is unmanaged, the device
must assign itself an address. If during the DHCP transaction, the
device obtains a domain name, for example, through a DNS server or via
DNS forwarding, the device should use that name in subsequent network
operations; otherwise, the device should use its IP address.

## Protocol

### Addressing

### Discovery

Given an IP address, the step 1 in UPnP networking is Discovery. When a
device is added to the network, the UPnP discovery protocol allows that
device to advertise its services to control points on the network.
Similarly, when a control point is added to the network, the UPnP
discovery protocol allows that control point to search for devices of
interest on the network. The fundamental exchange in both cases is a
discovery message containing a few, essential specifics about the device
or one of its services, for example, its type, identifier, and a pointer
to more detailed information. The UPnP discovery protocol is based on
the Simple Service Discovery Protocol (SSDP).

### Description

The next step in UPnP networking is description. After a control point
has discovered a device, the control point still knows very little about
the device. For the control point to learn more about the device and its
capabilities, or to interact with the device, the control point must
retrieve the device's description from the URL provided by the device in
the discovery message. The UPnP description for a device is expressed in
XML and includes vendor-specific, manufacturer information like the
model name and number, serial number, manufacturer name, URLs to
vendor-specific web sites, etc. The description also includes a list of
any embedded devices or services, as well as URLs for control, eventing,
and presentation. For each service, the description includes a list of
the commands, or actions, to which the service responds, and parameters,
or arguments, for each action; the description for a service also
includes a list of variables; these variables model the state of the
service at run time, and are described in terms of their data type,
range, and event characteristics.

### Control

The next step in UPnP networking is control. After a control point has
retrieved a description of the device, the control point can send
actions to a device's service. To do this, a control point sends a
suitable control message to the control URL for the service (provided in
the device description). Control messages are also expressed in XML
using the SOAP|Simple Object Access Protocol (SOAP). Like function
calls, in response to the control message, the service returns any
action-specific values. The effects of the action, if any, are modeled
by changes in the variables that describe the run-time state of the
service.

### Event notification

The next step in UPnP networking is event notification, or "eventing". A
UPnP description for a service includes a list of actions the service
responds to and a list of variables that model the state of the service
at run time. The service publishes updates when these variables change,
and a control point may subscribe to receive this information. The
service publishes updates by sending event messages. Event messages
contain the names of one or more state variables and the current value
of those variables. These messages are also expressed in XML and
formatted using the General Event Notification Architecture (GENA). A
special initial event message is sent when a control point first
subscribes; this event message contains the names and values for all
evented variables and allows the subscriber to initialize its model of
the state of the service. To support scenarios with multiple control
points, eventing is designed to keep all control points equally informed
about the effects of any action. Therefore, all subscribers are sent all
event messages, subscribers receive event messages for all "evented"
variables that have changed, and event messages are sent no matter why
the state variable changed (either in response to a requested action or
because the state the service is modeling changed).

### Presentation

The final step in UPnP networking is presentation. If a device has a
Uniform Resource Locator|URL for presentation, then the control point
can retrieve a page from this URL, load the page into a web browser, and
depending on the capabilities of the page, allow a user to control the
device and/or view device status. The degree to which each of these can
be accomplished depends on the specific capabilities of the presentation
page and device.

### UPnP AV (Audio and Video) standards

UPnP **AV** stands for UPnP **Audio** and **Video**, and is a grouping
within the UPnP standards supervised by the Digital Living Network
Alliance|DLNA (Digital Living Network Alliance), (formerly: Digital Home
Working Group), which is a forum of vendors and manufacturers who work
in the home entertainment industry, and offer a "DLNA CERTIFIED™"
branding for those products which follow their Networked Device
Interoperability Guidelines. The Digital Living Network Alliance|DLNA
forum members "*share a vision of a wired and wireless interoperable
network of Personal Computers (PC), Consumer Electronics (CE) and mobile
devices in the home enabling a seamless environment for sharing and
growing new digital media and content services,*" and "*DLNA is focused
on delivering an interoperability framework of design guidelines based
on open industry standards to complete the cross-industry digital
convergence*". On 12 July 2006 the UPnP Forum announced the release of
'Enhanced AV Specifications', this release was version 2 of the UPnP
Audio and Video specifications ([UPnP AV
v2](http://www.upnp.org/news/documents/AV2_PR20060712.pdf)), with new
MediaServer version 2.0 and MediaRenderer version 2.0 classes. These
enhancements are created by adding capabilities to the UPnP AV
MediaServers|UPnP AV MediaServer and MediaRenderer device classes that
allow a higher level of interoperability between MediaServers and
MediaRenderers from different manufacturers. Some of the early devices
complying with these standards were marketed by Philips under the
Streamium brand name. .

#### UPnP AV components

-   **UPnP MediaServer DCP** - which is the UPnP-server (a 'master'
    device) that shares/streams media-data (like
    audio/video/picture/files) to UPnP-clients on the network.
-   **UPnP MediaServer ControlPoint** - which is the UPnP-client (a
    'slave' device) that can auto-detect UPnP-servers on the network to
    browse and stream media/data-files from them.
-   **UPnP MediaRenderer DCP** - which is a 'slave' device that can
    render content.
-   **UPnP RenderingControl DCP** - control MediaRenderer settings;
    volume, brightness, RGB, sharpness, and more).
-   **UPnP Remote User Interface (RUI) client/server** - which
    sends/receives control-commands between the UPnP-client and
    UPnP-server over network, (like record, schedule, play, pause, stop,
    etc.).
    -   **Web4CE (CEA 2014) for UPnP Remote
        UI<sup>[[1]](#cite_note-1)</sup>** - CEA-2014 standard designed
        by **Consumer Electronics Association's R7 Home Network
        Committee**. Web page|Web-based Protocol (computing)|Protocol
        and Software framework|Framework for Remote User Interface on
        UPnP Computer networking|Networks and the Internet (Web4CE).
        This standard allows a UPnP-capable home network device to
        provide its User interface|interface (display and control
        options) as a web page to display on any other device connected
        to the home network. That means that you can control a Computer
        networking|home networking device through any Web
        browser|web-browser-based communications method for Consumer
        Electronics Association|CE devices on a UPnP home network using
        ethernet and a special version of HTML called CE-HTML.
-   **QoS (Quality of Service)** - is an important (but not mandatory)
    service function for use with UPnP AV (Audio and Video). Quality of
    Service|QoS (Quality of Service) refers to control mechanisms that
    can provide different priority to different users or data flows, or
    guarantee a certain level of performance to a data flow in
    accordance with requests from the application program. Since UPnP AV
    is mostly to deliver streaming media that is often near real-time or
    real-time audio/video data which it is critical to be delivered
    within a specific time or the stream is interrupted. Quality of
    Service|QoS (Quality of Service) guarantees are especially important
    if the network capacity is limited, for example public networks,
    like the internet.
    -   Quality of Service|QoS (Quality of Service) for UPnP consist of
        **Sink Device** (client-side/front-end) and **Source Device**
        (server-side/back-end) service functions. With Class (computer
        science)|classes such as; **Traffic Class** that indicates the
        kind of traffic in the traffic stream, (for example, audio or
        video). **Traffic Identifier (TID)** which identifies data
        packets as belonging to a unique traffic stream. **Traffic
        Specification (TSPEC)** which contains a set of parameters that
        define the characteristics of the traffic stream, (for example
        operating requirement and scheduling).**Traffic Stream (TS)**
        which is a unidirectional flow of data that originates at a
        source device and terminates at one or more sink device(s).

### NAT traversal

One solution for NAT traversal|NAT (Network Address Translation)
traversal, called the Internet Gateway Device Protocol|Internet Gateway
Device (IGD) Protocol, is implemented via UPnP. Many router|routers and
firewall|firewalls expose themselves as Internet Gateway Devices,
allowing any local UPnP controller to perform a variety of actions,
including retrieving the external IP address of the device, enumerate
existing port mappings, and adding and removing port mappings. By adding
a port mapping, a UPnP controller behind the IGD can enable traversal of
the IGD from an external address to an internal client.

## Problems with UPnP

### Lack of Authentication

The UPnP protocol does not implement any authentication, so UPnP device
implementations must implement their own authentication mechanisms, or
implement the Device Security Service.<sup>[[2]](#cite_note-2)</sup>
Unfortunately, many UPnP device implementations lack authentication
mechanisms, and by default assume local systems and their users are
completely
trustworthy.<sup>[[3]](#cite_note-3)</sup><sup>[[4]](#cite_note-4)</sup>
Most notably, Routers and firewalls running the UPnP IGD protocol are
vulnerable to attack since the framers of the IGD implementation omitted
to add any standard authentication method.

For example, Adobe Flash programs are capable of generating HTTPU (HTTP
over UDP) requests. This allows a router implementing the UPnP IGD
protocol to be controlled by a malicious web site when someone with a
UPnP-enabled router simply visits that web
site.<sup>[[5]](#cite_note-5)</sup> The following changes can be made
silently by code embedded in an Adobe Flash object hosted on a malicious
website:<sup>[[6]](#cite_note-6)</sup>

-   Port forwarding|Port forward internal services (ports) to the router
    external facing side (i.e. expose computers behind a firewall to the
    Internet).
-   Port forwarding|Port forward the router's web administration
    interface to the external facing side.
-   Port forwarding to any external server located on the Internet,
    effectively allowing an attacker to attack an Internet host via the
    router, while hiding their IP address.
-   Change Domain name system|DNS server settings so that when victims
    believe they are visiting a particular site (such as an on-line
    bank), they are redirected to a malicious website instead.
-   Change the Domain name system|DNS server settings so that when a
    victim receives any software updates (from a source that isn't
    properly verified via some other mechanism, such as a checking a
    Public key certificate|digital certificate has been signed by a
    trusted source), they download malware|malicious code instead.
-   Change administrative credentials to the router/firewall.
-   Change Point-to-Point Protocol|PPP settings.
-   Change IP address|IP settings for all interfaces.
-   Change WiFi settings.
-   Terminate connections.

This only applies to the \#NAT
traversal|"firewall-hole-punching"-feature of UPnP; it does not apply
when the IGD does not support UPnP or UPnP has been disabled on the
IGD.[Template:Fact](http://eLinux.org/index.php?title=Template:Fact&action=edit&redlink=1 "Template:Fact (page does not exist)")
Also, not all routers can have such things as DNS server settings
altered by UPnP because much of the specification (including LAN Host
Configuration) is optional for UPnP enabled
routers<sup>[[7]](#cite_note-7)</sup>.

### Other Issues

-   UPnP uses HTTP over User Datagram Protocol|UDP (known as HTTPU and
    HTTPMU for unicast and multicast), even though this is not
    standardized and is specified only in an Internet-Draft that expired
    in 2001.
    [[1]](http://www.upnp.org/download/draft-goland-http-udp-04.txt)
-   UPnP does not have a lightweight authentication protocol, while the
    available security protocols are complex. As a result, some UPnP
    devices ship with UPnP turned off by default as a security measure.

## Future developments

The standard Devices Profile for Web Services|DPWS is a candidate
successor for UPnP. It solves many of the problems of UPnP. A DPWS
client is included in Microsoft Windows Vista as part of the Windows
Rally technologies.

Another alternative, NAT Port Mapping Protocol|NAT-PMP, is an IETF draft
introduced by Apple Inc in 2005.

## Books

-   Golden G. Richard: Service and Device Discovery : Protocols and
    Programming, McGraw-Hill Professional, [ISBN
    0-07-137959-2](http://eLinux.org/Special:BookSources/0071379592)
-   Michael Jeronimo, Jack Weast: UPnP Design by Example: A Software
    Developer's Guide to Universal Plug and Play, Intel Press, [ISBN
    0-9717861-1-9](http://eLinux.org/Special:BookSources/0971786119)

## External links

-   [UPnP™ Forum Universal Plug and Play Device
    Standards](http://upnp.org/standardizeddcps/default.asp)

### Documentation

-   [UPnP™ Forum](http://www.upnp.org)
-   [DLNA (Digital Living Network Alliance)](http://www.dlna.org)
-   [The Jini,
    Vision](http://developer.java.sun.com/developer/technicalArticles/jini/JiniVision/jiniology.html)
-   [technique
    comparison](http://www.cswl.com/whitepapers/upnp-devices.html)
-   [Microsoft WHDC UPnP webpage &
    links](http://www.microsoft.com/whdc/device/netattach/upnp/default.mspx)
-   [Universal Plug and Play in Windows
    XP](http://www.microsoft.com/technet/prodtechnol/winxppro/evaluate/upnpxp.mspx)
-   [Programmatically Controlling a UPnP-Capable
    Firewall](http://www.knoxscape.com/Upnp/NAT.htm) is a document
    providing some basic information about coding UPnP software
    controllers (VBScript example source code included).
-   [Hacking with UPnP](http://www.upnp-hacks.org)
-   [DLNA certified: how your computer, cellphone, games console, media
    streamer and other devices can play nicely
    together](http://www.last100.com/2008/05/27/dlna-certified/)

### News

-   [Vulnerability Note VU\#347812 - UPnP enabled by default in multiple
    devices](http://www.kb.cert.org/vuls/id/347812) at United States
    Department of Homeland Security - Computer Emergency Readiness Team
    (Wednesday, 9 April 2008).

-   [Security firm predicts Microsoft Windows UPnP exploit by the end of
    the week](http://www.theinquirer.net/default.aspx?article=38860) at
    The Inquirer (Wednesday, 11 April 2007).

-   [Microsoft security updates for April
    2007](http://www.microsoft.com/athome/security/update/bulletins/200704.mspx)
    to fix the above Microsoft Windows UPnP security issue.

-   [How to use Flash and UPnP to punch holes in most home
    firewalls](http://www.gnucitizen.org/blog/hacking-the-interwebs) at
    GNUCITIZEN (Saturday, 12 January 2008).

### Software

[UPnP Port Works (alias UPnPW)](http://www.upnpworks.alcidelic.com/) is
a software implementation to configure UPnP devices via commandline.

[GUPnP](http://www.gupnp.org/) is an object-oriented open source
framework for creating UPnP devices and control points, written in C
using GObject and [libsoup](http://live.gnome.org/LibSoup).

[Portable SDK for UPnP Devices](http://pupnp.sourceforge.net/) provides
an API and open source code for building control points, devices, and
bridges compliant with UPnP Device Architecture Specification v1.0 and
support operating systems like Linux, \*BSD, Solaris and others.

[Barracuda UPnP](http://barracudaserver.com/UPnP.html) Device and
Control Point SDK for embedded devices.

[Unplug n' Pray](http://www.grc.com/unpnp/unpnp.htm) Utility to disable
unnecessary UPnP servers running on home Windows machines.

[Coherence](https://coherence.beebits.net/) Some free DLNA/UPnP tools
(MediaServer/MediaRender) with a python framework. Running on
Linux/BSD/Windows

[AdoubleU IntelligentShare](http://www.adoubleu.de/) UPnP SDK for J2SE /
J2ME / MIDP 2.0 Running on Linux/BSD/Windows/Mobile Devices

[BRisa](http://brisa.garage.maemo.org/) BRisa is written in Python for
Internet Tablet OS or other Unix platforms. It enables to create
MediaServer/MediaRenderer devices allowing users to share and search
content from UPnP A/V devices. It will offer a plugin architecture
enabling new services such as Flickr to be added as UPnP services.

[J. River Media Center](http://www.jrmediacenter.com) includes a UPnP
server (aka UPnP Device) for its library.

1.  [↑](#cite_ref-1) [Template:Cite
    web](http://eLinux.org/index.php?title=Template:Cite_web&action=edit&redlink=1 "Template:Cite web (page does not exist)")
2.  [↑](#cite_ref-2) [Template:Cite
    web](http://eLinux.org/index.php?title=Template:Cite_web&action=edit&redlink=1 "Template:Cite web (page does not exist)")
3.  [↑](#cite_ref-3) [Template:Cite
    web](http://eLinux.org/index.php?title=Template:Cite_web&action=edit&redlink=1 "Template:Cite web (page does not exist)")
4.  [↑](#cite_ref-4) [Template:Cite
    web](http://eLinux.org/index.php?title=Template:Cite_web&action=edit&redlink=1 "Template:Cite web (page does not exist)")
5.  [↑](#cite_ref-5) [Template:Cite
    web](http://eLinux.org/index.php?title=Template:Cite_web&action=edit&redlink=1 "Template:Cite web (page does not exist)")
6.  [↑](#cite_ref-6) [Template:Cite
    web](http://eLinux.org/index.php?title=Template:Cite_web&action=edit&redlink=1 "Template:Cite web (page does not exist)")
7.  [↑](#cite_ref-7) [Template:Cite
    web](http://eLinux.org/index.php?title=Template:Cite_web&action=edit&redlink=1 "Template:Cite web (page does not exist)")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Standardized
    APIs](http://eLinux.org/Category:Standardized_APIs "Category:Standardized APIs")

