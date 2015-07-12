> From: [eLinux.org](http://eLinux.org/Hammer_WiFi "http://eLinux.org/Hammer_WiFi")


# Hammer WiFi



## USB WiFi adapters we know work

1) [**Edimax
EW-7318Ug**](http://www.edimax.com/en/produce_detail.php?pd_id=3&pl1_id=1&pl2_id=44)

For this to work properly, you need at least kernel 2.6.24 with the
Hammer Patch. This adapter uses the [Ralink](http://www.ralinktech.com)
RT73 chipset, so the rt73usb driver must be enabled in your kernel.

## Configuring for WiFi

Here is a known working configuration for the [**Edimax
EW-7318Ug**](http://www.edimax.com/en/produce_detail.php?pd_id=3&pl1_id=1&pl2_id=44)
adapter, and probably others. These lines are added to your **inittab**
file. You might be able to use this configuration for other adapters
also. The WiFi module for your adapter might use names other than wlan0
for the interface, so be sure to make that substitution if necessary in
all of the following lines.

    null::sysinit:/sbin/modprobe mac80211
    null::sysinit:/sbin/modprobe cfg80211
    null::sysinit:/sbin/modprobe rt73usb (Replace this with the module for your WiFi adapter)
    null::sysinit:/bin/sleep 5
    null::sysinit:/sbin/ifconfig wlan0 <IP address> netmask 255.255.255.0 broadcast <Broadcast address> up
    null::sysinit:/sbin/iwconfig wlan0 essid <Your network's essid)
    null::sysinit:/sbin/iwconfig wlan0 channel 11
    null::sysinit:/sbin/iwconfig wlan0 mode managed
    null::sysinit:/sbin/iwconfig wlan0 enc on
    null::sysinit:/sbin/iwconfig wlan0 key <Your WEP key here>
    null::sysinit:/sbin/iwconfig wlan0 ap <Your wireless access point ID>


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [TCT-Hammer](http://eLinux.org/Category:TCT-Hammer "Category:TCT-Hammer")
-   [TinCanTools](http://eLinux.org/Category:TinCanTools "Category:TinCanTools")

