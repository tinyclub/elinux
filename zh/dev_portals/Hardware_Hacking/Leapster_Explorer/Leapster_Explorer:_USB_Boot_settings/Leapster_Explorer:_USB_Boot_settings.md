> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_USB_Boot_settings "http://eLinux.org/Leapster_Explorer:_USB_Boot_settings")


# Leapster Explorer: USB Boot settings



## Contents

-   [1 Summary](#summary)
-   [2 Hardware Needed](#hardware-needed)
-   [3 Editing rcS](#editing-rcs)
-   [4 Notes](#notes)

## Summary

This is a short tutorial to explain how to setup the explorer so that
you can use the USB Boot method to test a kernel running a 'stock'
bootup rcS script. This shouldn't damage your explorer but should you
mess up your OS you won't be able to automatically start the recovery
process. as long as you have console access you should be able to
manually start the recovery process. You have been warned.

## Hardware Needed

[Console
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Console_Access "LeapFrog Pollux Platform: Console Access")

## Editing rcS

Usually when you boot the LeapFrog Explorer in USB Boot mode you are
setting off a chain of actions that are supposed to lead to updating a
new kernel and rootfs or recovering a broken OS, whatever the boot
method, the Explorer runs /etc/init.d/rcS and reads the boot image type
on line 32 of /etc/init.d/rcS :

    if [ `cat /sys/devices/platform/lf1000-gpio/boot_image` = "RECOVERY" ]; then
       # Recovery boot
       echo "Recovery Mode"
       # Launch in background; it will "poweroff" when done
       /usr/bin/recovery &
       exit 0
    elif


 The elif copes with the different types of boot mode that could be
expected, this is fine if you want to update or fix your Explorer but if
you want to use USB Boot to test a kernel with the normal file system
and boot settings then you're out of luck. This is where this tutorial
comes in. For the time being I have created a quick and dirty hack to
overcome this issue.

In rcS edit lines 32 and 38 and make them look like this:



    if [ `cat /sys/devices/platform/lf1000-gpio/boot_image` = "RECOVERY" ] && [ !-e /flags/usbdev ]; then
    elif [ `cat /sys/devices/platform/lf1000-gpio/request` = "TRAPDOOR" ] && [ !-e /flags/usbdev ]; then


 On the explorer when you want to boot 'normally' from USB boot run the
following command:

    touch /flags/usbdev


 And to reverse the process to allow an automatic recovery:

    rm /flags/usbdev

## Notes

whilst this method works and allows you to test a custom kernel booting
it from USB using the 'normal' boot options as if you were booting the
kernel from the explorer normally, its probably not the absolute best
way to do things. At the moment if you have usbdev set if something goes
wrong with the OS it won't kick start recovery mode, however, as long as
you've got serial access then you will be able to start dftpdevice
manually and start the recovery process via pager.sh or LFConnect or
simply remove /flags/usbdev and reboot. Using USB Boot will also set you
into a loop where after a reboot it will try and do another usb boot,
this can be desirable if you are testing kernels/software but if you
want it to stop simply power off the unit by holding down the power
button.

Files to note: /etc/init.d/rcS /usr/bin/recovery /usr/bin/trapdoor
/usr/bin/short-circuit

The latter 3 being scripts called via rcS depending on what type of boot
the system expects to perform.

I believe there is a better method using the LeapFrog's internal
flagging system, using the /sys/devices/platform/lf1000-gpio/ subsystem:

request

boot\_image

boot\_source

power

But this will require further investigation as some of this will be tied
to Emerald-Boot and messing with that could be dangerous.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")

