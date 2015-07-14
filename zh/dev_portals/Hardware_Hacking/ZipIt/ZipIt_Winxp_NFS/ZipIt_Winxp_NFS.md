> From: [eLinux.org](http://eLinux.org/ZipIt_Winxp_NFS "http://eLinux.org/ZipIt_Winxp_NFS")


# ZipIt WinXP NFS


(Redirected from [ZipIt Winxp
NFS](http://eLinux.org/index.php?title=ZipIt_Winxp_NFS&redirect=no "ZipIt Winxp NFS"))


## Contents

-   [1 Things to get done first](#things-to-get-done-first)
-   [2 Router setup](#router-setup)
-   [3 Windows setup](#windows-setup)
-   [4 Zipit Wireless setup](#zipit-wireless-setup)

## Things to get done first

Do you have a wireless router? If not, go and spend \$15 and buy one,
this document assumes you have a wireless router and have performed the
[BURN3](http://eLinux.org/BURN3 "BURN3") update. If you have let your zipit update to the
version 2.01 OS from www.zipitwireless.com this writing will not help
you. You must use the serial mod to update the software on your zipit
sorry.

## Router setup

In your router you are going to need to find out what your SSID is or if
it is not set you will need to set an SSID. I have a DLINK wireless
router, your router setup details may vary. In my router setup, the SSID
is part of the "wireless network service". So under Wireless Options
(router model depending) you’ll be looking for a setting to enter an
SSID (a name). I set mine to **zipnet** (all lower case just to be on
the safe side.) Set "Network authentication" to disabled, set WEP to
disabled. Then apply or save changes. PLEASE BE AWARE THIS LEAVES YOUR
WIRELESS ROUTER WIDE OPEN If you even care about your unprotected router
and want to protect it: There should be an option for filtering
connections. I’d recommend filtering MAC addresses. The first address
you need to add to the filter will be the one for the computer you are
using to edit the changes on the router. (Find your Windows XP Mac
address by right-clicking the icon for your network connection, select
Status from the pop-up menu. The dialog: "Local Area Connection Status"
appears, select the Support tab, click Details: the MAC address is the
value labelled "Physical Address") Then add your MAC address for your
zipit wireless. It is printed on a label on the bottom of the zipit.
After that, add every other MAC address (for other computers) you need
for your networks setup if needed. OK, your router is now setup.

## Windows setup

Workings with your Windows setup, don’t do anything until you have taken
these steps to ensure your computer is set up correctly. That will help
make this process go a little easier over the next 15 minutes. First
things first: ensure you have a network connection icon in the tray at
the bottom right of your screen. This should look like two computer
screens one behind the other. If you do not have this, you do not have
an active network connection wired or wireless. Don’t confuse the
network connection icon with a dial-up icon though. Go to Start, Control
Panel, Network Connections. Next you should see your local-area
connection with the name of the type of network card you are using
listed as well. Right-click on your network connection icon and go to
Properties. The first screen that pops up under the tab "General", at
the bottom you should see a check-box called “Show icon in notification
area when connected” check that, hit OK and close your network
connections window, done. You now have a network notification icon on
your Start menu which is also basically a short-cut to where you just
were. Now I need you to double-click on that icon. A window should
pop-up displaying local-area connection status. This gives you all kinds
of information, now click on the Support tab. The second line is your IP
address. You will need this later, write this down if you want but you
know where to find it. Go back to the General tab, note at the bottom
there is a button called Properties. Click it -- this will take you back
to the same window you had open before enabling you to have the network
status icon.

Check your network settings, you should have listed by default “client
for MS network” “File and print sharing” “Qos packet scheduler”
“internet protocol TCP/IP”. Click on “internet protocol TCP/IP” then
click on Properties, check that all options in all tabs in this pop-up
menu say "obtain automatically". If that’s correct, click OK. Next go to
the tab labelled "Advanced". This is where you will disable your Windows
firewall. Depending on what Windows version your using it may be
different, but in the end you must disable, turn off … your Windows
firewall. Once done, click OK.

Should Windows ask you to reboot then do so, otherwise go to the next
step below. If you’re using a wireless card that’s fine, but there is a
lesser chance for data corruption using a hard-wired network, when
transferring an OS to your zipit.

The Windows NFS server program file to download is:
[http://www.javvin.com/product/diskshare.zip](http://www.javvin.com/product/diskshare.zip)
(3MB)

Install this on a Windows computer, I recommend XP. It will work with
2000 or later versions of Windows. Follow the on screen instructions
then reboot the computer.

To get started, [Disk
Share](http://eLinux.org/index.php?title=Disk_Share&action=edit&redlink=1 "Disk Share (page does not exist)")
is a Windows program about 3 Megs in size made to create a working NFS
server on a Windows system. Now that you’re back into Windows, before
you do anything go to Windows Explorer to make a folder, this will be
used as the source for your files hosted on the NFS server. At your C:
hard drive make a folder called **zipit**. Once the folder has been made
put in it the four files for openzipit: zflash, loader.bin, zimage.dat,
and ramdisk.gz. You will find those files on the zipit yahoogroups
website -- just follow the links. So you should have a folder looking
like “C:\\zipit\\” next right-click on the folder you just made, go to
Properties. Then you should see a tab at the top right labelled "NFS
sharing". That’s a good thing; click on “Share as” and the folder name
should be listed under "folder". Next, click on “Access configuration”.
The window that pops up is your access level settings. For access type,
you want "read" or "read write", I used "read write" just to make life
easier.

Next step: click on Configure, the window that follows will have a
number of options and tabs to configure. Under Share Options “Allow
Anonymous UID" and "Symbolic..” should both be checked. [Web
NFS](http://eLinux.org/index.php?title=Web_NFS&action=edit&redlink=1 "Web NFS (page does not exist)")
should not be checked. Next click on "Advanced options". All but
“Restrict chown/chgrp" and "Truncate Long names” should be checked,
click on OK. Next, click on the tab “Server Options” TCP support and NFS
Version 3 support check options should both be checked. Below click on
“Advanced Server Options” set all options to "ignore", and uncheck the
"Case Sensitive" option, Click ok. Next tab, “Security Permissions” all
check marks but "full control world and group" should be unchecked. Next
tab, “NFS File locking” change the choice option to minutes from
seconds. Change the pull down to a least 15; all check mark boxes below
should be unchecked. You want no locking of files or you may have
problems. That’s it. Click OK OK and you’re done.

## Zipit Wireless setup

Understanding what and how different linux commands work, then commands
to run on the zipit wireless to update the software:

*mkdir /mnt/net1* The folders name will be net1 made in folder mnt

*mount -t nfs -o nolock,tcp,intr nfs-server-ip-address:/drive-*
letter/folder /mnt/net1* ;**net1** is the name of the folder you just
made on the zipit, inside the folder called MNT which is generaly used
as a mounting point area. A common location to mount a folder or drive
what ever that is external to the device.* On the NFS server the
Drive-letter/folder is the folder that is being hosted. Remember you
just made a folder called zipit on the NFS server.

-   The following zipit commands will be to make a folder and mount the
    nfs folder you just made on your windows computer

These commands should be done in this order on the zipit or remote:

**clear** ;this will just clear the screen of the image giving a larger
viewing area on the screen

**cd ..** ;do this command a few times to get back to the base directory

**mkdir /mnt/net1** ;enter key, This makes a folder in /mnt called net1

**iwlist eth0 scan** ;this will spit back info about local wireless
networks the zipit is picking up on

**iwconfig eth0 essid zipnet** ;these are settings for how to connect to
the router with the set SSID of zipnet on the router

**udhcpc** ;this is the command to make the zipit connect to your router
and acquire an ip address. It will read the iwconfig settings first then
try to connect to the router with an SSID of zipnet. The zipit's ip
address will be listed with in the first few lines after you run the
command. At this point if you really wanted you can run the commands
from a remote computer to make life easyer when typing in commands.
Typing them in on the zipit works but its faster with a keyboard, as
well as less error pron. The method for this is to use your NFS computer
its self go to the **START MENU** then **RUN** and type **CMD** or
**COMMAND** followed with the enter key. This will give you a dos box
like command window. Next you have but to type the following command
**telnet zipit-ip-address** which should look something like this for
example:

**telnet 192.168.0.100** ;If all goes well then you should have a
question responce asking for a login for console control over your zipit
like as if you where typing on it directly. If you have gotten this far
with your zipit you already know the aswer to the question that it will
ask you. You have an option now, you may follow the rest of the commands
via remote control or directly on the zipit your choice.


 **mount -t nfs -o nolock,tcp,intr 192.168.x.x:/c/zipit
/mnt/net1** ;enter key

If all goes well the zipit should take a moment then go right back to
the command line. If so go to the NFS folder you just mounted which is
under /mnt/net1. The commands are "cd folder" or "cd .." to go back and
forth in the folders. Yes there is a space between the cd and the two
periods. Type ls to view what’s in the folder, it stands for list. With
luck you'll see zflash and all the other flashing files you need.

If you are successful up to this point, this is the point where you can
break your zipit and a serial update will be the only method for fixing
your zipit wireless. If you mess up your serial port you then have an
expensive paper weight.

At this point I want you to make sure you have a few things.

1.  **zipit has its battery plugged in and charged**
2.  **zipit has its power supply plugged into the back and the wall wart
    plugged into the wall**
3.  ensure your not going to turn off your NFS computer in any way
    (accidentally) for reasons like weather
4.  *A Strong Strong shot of some kind of spirit, this is for success or
    failure.*

There is now one final command you need to run but you also have an
option. If you want you can make an other folder on the zipit and copy
the files off of the nfs server. Or you can run the files directly off
of the server as I did. To copy the files:

    mkdir /mnt/folder-name

then

    copy *.* /mnt/folder-name

Here it is, oh you did download the openzipit files from the yahoo
groups and place them in your nfs folder didn’t you?

    ./zflash loader.bin zimage.dat ramdisk.gz


 Yes, start it with a period and a slash ./ then follow the on screen
questions and answer *“Yes”* if you want to flash your device. It will
take about 30 seconds at most then ask to be restarted. Hold the power
button for a few seconds, let go the zipit should turn off after a
moment. Hold the power button again till the green light comes on strong
let go and the zipit will boot up. If all goes well you are now fully
hacked with an open zipit. The sky is the limit, but remember if you
make changes and screw up your boot loader you will have to re-flash the
zipit with a serial cable.

If you want to use adams software which I use due to the boot sector
protection, you must flash back to burn3. This is because adams software
version is based on burn3. It is NOT COMPATABLE WITH OPENZIPIT RIGHT OUT
OF THE BOX Now going back is not hard task at all. All you have to do is
download the burn3 which is in gz,bin,dat format from here
[http://www.aibohack.com/zipit/zipit\_parts\_burn3.zip](http://www.aibohack.com/zipit/zipit_parts_burn3.zip)
place the files in a folder with zflash zz on your nfs server. Then run
basicly the same command as you just did above "./zflash loader.bin..."
etc... but make sure you do not mix and match or you will have problems
do not mix and match the files.

HAPPY HACKING


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

