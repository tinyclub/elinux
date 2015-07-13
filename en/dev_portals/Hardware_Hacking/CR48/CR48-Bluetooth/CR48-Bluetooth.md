> From: [eLinux.org](http://eLinux.org/CR48-Bluetooth "http://eLinux.org/CR48-Bluetooth")


# CR48-Bluetooth



# Bluetooth on the CR48

Many people don’t realize that the CR-48 has Bluetooth built in. That’s
because it doesn’t exactly work right out of the box. The hardware is an
Atheros AR5BBU12 Bluetooth V2.1 EDR if you want to get technical by the
way. You can play around with it if you’re interested, and here are the
steps to do so.

-   Enter [developer](http://eLinux.org/CR48-rooting "CR48-rooting") mode.
-   Get to the terminal by hitting CTRL+ALT+T.
-   Open up a bash shell. Just type “shell” in the terminal.
-   You’ll need to put your Bluetooth device into discovery mode. If you
    don’t know how to do this with your device you’ll need to consult a
    manual or Google it.
-   Type “hcitool scan” to have the Cr-48 scan for Bluetooth devices.
    You should see device(s) with their addresses listed.
-   Type in the command “hcitool cc xx:xx:xx:xx:xx:xx” to connect the
    device, using its address.
-   Depending on your configuration, you may need a key. You can enter
    this by using ”hcitool auth xx:xx:xx:xx:xx:xx”.




[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

