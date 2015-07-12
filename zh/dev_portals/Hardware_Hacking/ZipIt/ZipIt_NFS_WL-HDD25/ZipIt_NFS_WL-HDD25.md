> From: [eLinux.org](http://eLinux.org/ZipIt_NFS_WL-HDD25 "http://eLinux.org/ZipIt_NFS_WL-HDD25")


# ZipIt NFS WL-HDD25



## WL-HDD 2.5 IEEE 802.11g 54 Mbps WLAN Hard Drive Box

[http://usa.asus.com/products/communication/wireless/wl-hdd25/wl-hdd25\_m.jpg](http://usa.asus.com/products/communication/wireless/wl-hdd25/wl-hdd25_m.jpg)

The ASUS WL-HDD25 is an external 2.5" hard drive enclosure with
Ethernet, 802.11g, and USB running a Linux firmware for which there is
an open source firmware that offers NFS. (Note: you have to supply your
own 2.5" notebook bare drive to put in this enclosure)

Manufacturer's spec page:
[http://usa.asus.com/products/communication/wireless/wl-hdd25/overview.htm](http://usa.asus.com/products/communication/wireless/wl-hdd25/overview.htm)

It's now selling for \$79 plus \$3.99 S&H from newegg for anyone who is
interested in external *wireless* storage for their Zipit:
[http://reviews.cnet.com/Asus\_WL\_HDD\_2\_5/4014-3033\_7-31080278.html](http://reviews.cnet.com/Asus_WL_HDD_2_5/4014-3033_7-31080278.html)

Tom's Networking Review:
[http://www.tomsnetworking.com/Reviews-179-ProdID-WLHDD25.php](http://www.tomsnetworking.com/Reviews-179-ProdID-WLHDD25.php)

### Custom Firmware supporting NFS

For all WL-HDD users here's a custom firmware which includes:

-   telnet daemon
-   nfsv3 daemon
-   vsftpd daemon (replaces stupid-ftpd)
-   samba 3.0.9 (supports CIFS)
-   doesn't poll for the harddisk each 5 seconds

Every feature of the original 1.1.2.8 firmware is in this custom
version, also NTFS R/W support

You find the 34MB file 1.1.2.8-custom.zip in:
[http://www.z600.nl/temp/firmware/1.1.2.8-custom/](http://www.z600.nl/temp/firmware/1.1.2.8-custom/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

