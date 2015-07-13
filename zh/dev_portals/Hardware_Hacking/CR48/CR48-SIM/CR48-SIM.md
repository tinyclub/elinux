> From: [eLinux.org](http://eLinux.org/CR48-SIM "http://eLinux.org/CR48-SIM")


# CR48-SIM



# Accessing the CR48's SIM slot

Here's what has been found:
 The Gobi 2000 does support AT&T, and it's unlocked. To switch carriers,
you need to swap firmwares. Google was nice enough to provide most of
the common carrier firmwares.


-   The various firmwares live in /opt/Qualcomm/Images2k/Novatel
-   Google includes firmware for these carriers:
-   1 ("Verizon Wireless")
-   2 ("AT&T")
-   3 ("Sprint")
-   6 ("UMTS")
-   14 (???)
-   generic UMTS (not sure why it's different from 6.)

#### For reference, see [http://www.thinkwiki.org/wiki/Talk:Qualcomm\_Gobi\_2000](http://www.thinkwiki.org/wiki/Talk:Qualcomm_Gobi_2000)

Google made it easy to switch firmwares.
 Here are the relevant tools at your disposal:

-   /usr/bin/modem - Google's user-friendly Cr48 modem management tool
    (shell script)
-   /usr/bin/modem status your new best friend
-   /usr/bin/modem factory-reset /org/chromium/ModemManager/Gobi/\# spc
    000000 factory reset; replace \# with number from modem status
-   /usr/bin/modem activate-manual ... CDMA manual activation only
-   /usr/bin/modem\_set\_carrier - Google's undocumented firmware
    swapping tool (shell script)
-   /usr/bin/dbus-send - Direct access to D-Bus, allowing you to send
    custom commands
-   /usr/bin/mm-cromo-wrapper - Google's user-friendly wrapper for
    dbus-send
-   /usr/bin/dbusxx-introspect - Navigate an object's D-Bus interface
    for methods, properties, and signals
-   /opt/Qualcomm/bin/gobi-factory-reset spc 000000 - Resets your modem
    to its default settings. Does not clear activation data.
-   /usr/lib/mm.sh - Google's shell script library for interfacing with
    the modem. No UI, but worth looking at.
-   /usr/share/mobile-broadband-provider-info/serviceproviders.xml - The
    list of all service providers supported by Chromium OS, with their
    APN info. AT&T's is listed and correct (unless you're on the iPhone
    data plan).


So, how far did I get? So close.

-   modem status to get the path for the modem. replace \# below.
-   modem factory-reset /org/chromium/ModemManager/Gobi/\# 000000
-   modem\_set\_carrier "AT&T"
-   modem status


At this point, I see lots of good things. My AT&T SIM's cell phone
number is listed as my MDN. The modem is set up to use UMTS, and claims
to have signal.


The problem is activation. It looks like we need to use
org.freedesktop.ModemManager.Modem.Simple.Connect. The problem is, this
command takes a mixed array ({string,variant}) -- which can't be created
using any of the provided command line tools.
 In the method documentation for "ActivateManualDebug" in Google's spec
"mm-modem-cdma.xml", they make note of this bug. ("Workaround for the
fact that dbus-send cannot send dictionaries of variants. Calls
ActivateManual, with system\_id converted to int.")


So, given the limited information I have, it looks like we can't
activate an UMTS connection without writing our own (C++/Python) D-Bus
interface to facilitate activation. I'm a newb with all of this D-Bus
nonsense, so take my conclusion with a grain of salt. But this is where
I gave up.


Relevant docs:

-   ModemManager spec
    [http://projects.gnome.org/NetworkManager/developers/mm-spec-04.html](http://projects.gnome.org/NetworkManager/developers/mm-spec-04.html)
    (ancient)
-   Note that Google does not exclusively use the ModemManager spec.
    When adhering to the spec, they use org.freedesktop.ModemManager.\*.
    \* When doing their own thing, they use
    org.chromium.ModemManager.\*.
-   Full Chromium OS D-Bus tree
    [http://gitrw.chromium.org/gitweb/?p=modemmanager.git;a=tree;f=introspection](http://gitrw.chromium.org/gitweb/?p=modemmanager.git;a=tree;f=introspection)




[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

