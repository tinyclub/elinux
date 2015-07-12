> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_Over_Clock "http://eLinux.org/Leapster_Explorer:_Over_Clock")


# Leapster Explorer: Over Clock



## Contents

-   [1 Summary](#summary)
-   [2 Hardware Needed](#hardware-needed)
-   [3 Temporarily](#temporarily)
-   [4 Permanent](#permanent)
-   [5 Test Results](#test-results)

## Summary

This tutorial shows you how to overclock or underclock your Leapster
Explorer.

## Hardware Needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

## Temporarily

To set the CPU Frequency run this command, example is 532.5mhz:

    # echo 532500000 > /usr/speed
    # cat /usr/speed > /sys/devices/platform/lf1000-gpio/cpu_freq_in_hz

## Permanent

Once you have tested your overclock, and are sure that it is stable, and
you haven't made any typos. You can make the change permanent.

There is a line in /etc/init.d/rcS that checks for
/flags/cpu\_freq\_in\_hz, and automatically copies the contents to
/sys/devices/platform/lf1000-gpio/cpu\_freq\_in\_hz

It is important that you test your chosen cpu frequency first using the
procedure in section 1, or you might be left with an unbootable device.

    # echo 532500000 > /flags/cpu_freq_in_hz

Now just reboot, and your Leapster Explorer will automatically boot at
the faster speed. Again, **this is dangerous**, so test it first with
the above method. I cannot stress this enough.

## Test Results

GrizzlyAdams was able to get his to run at any arbitrary speed between
180MHz and 580Mhz. At 164MHz the display went blank, and serial port
stopped responding. At 600MHz a kernel panic occurred.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

