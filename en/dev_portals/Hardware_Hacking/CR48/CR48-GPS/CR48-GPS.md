> From: [eLinux.org](http://eLinux.org/CR48-GPS "http://eLinux.org/CR48-GPS")


# CR48-GPS



# GPS Support for the Cr-48

Not only does Google's new wonder known as the Cr-48 have Bluetooth, it
has GPS also. The GPS hardware comes courtesy of the Gobi 2000 3G Modem.
Like Bluetooth, Google just hasn't built the interface into Chrome OS
for making use of the GPS just yet. With the emphasis that Google places
on location these days though, I fully expect that one of those silent
updates the Cr-48 receives every few weeks (days?) will bring the GPS to
life. Unfortunately, at this point, it doesn't look like the low level
GPS interfaces are finished in Chrome OS just yet.
 If we get to our root shell there's just a few things we can find out:

-   A gpsd command exists, <s>but it seems to just be a wrapper script
    for the real GPS daemon which isn't yet included in Chrome OS
    builds</s>
-   Running "dmesg | grep -i "gobi\\|novatel\\|qualcomm" will search
    through the kernel messages and display those that reference the
    Gobi/Qualcomm/Novatel device (no idea why there's 3 companies
    involved in 1 3G modem). <s>Unfortunately, it looks like Google has
    yet to include the kernel patch that enables the Gobi 2000's GPS
    device.</s>





### Update!

As of ChromeOS version 0.10.156.1, you can begin to play with the GPS
hardware!
 You will need to be [rooted](http://eLinux.org/CR48-rooting "CR48-rooting")


Enabling GPS in it's primitive form (there's no GUI just yet!) requires
two simple commands to be run from a root shell:

-   Turn the GPS on.


` initctl start gpsd`

-   This is a basic command line driven GPS display


` cgps` Once it's up and running, find yourself an open area and wait
for a lock. You'll soon see the information start to show up in the GPS
display!


[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

