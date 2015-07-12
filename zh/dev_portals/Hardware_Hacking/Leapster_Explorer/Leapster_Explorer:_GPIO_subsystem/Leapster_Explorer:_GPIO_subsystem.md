> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_GPIO_subsystem "http://eLinux.org/Leapster_Explorer:_GPIO_subsystem")


# Leapster Explorer: GPIO subsystem



## Summary

This is a short article on using the lf1000-gpio subsystem. This is used
internally by /etc/init.d/rcS and other system scripts to start the
explorer in different states via Emerald-Boot. At least some the
'registers' in the gpio subsytem are loaded by reading a 'scratchpad'
area of nand, then converting that raw scratchpad data to a human
readable form via the values you will see below.

## GPIO Explained

All of the kernel based magic happens via
/sys/devices/platform/lf1000-gpio/ Using cat you can find out the values
of these registers, this is pretty much what Emerald-Boot does to tell
itself which button configs it should be using and how it should try and
boot. /etc/rcS also uses this technique, again to setup the system for
the different types of boot, mainly starting only the appropriate
modules/services that are needed.

I believe that we can use some of the registers to our advantage and
give ourselves extra boot modes where we only start a minimal set, which
should see us getting some kind of performance boost from the various
subsystems, this will also leave our recovery process alone.

Here is a list of the registers:

    /sys/devices/platform/lf1000-gpio/board_id
    /sys/devices/platform/lf1000-gpio/boot_image
    /sys/devices/platform/lf1000-gpio/boot_source
    /sys/devices/platform/lf1000-gpio/bus/
    /sys/devices/platform/lf1000-gpio/cart_id
    /sys/devices/platform/lf1000-gpio/cpu_freq_in_hz
    /sys/devices/platform/lf1000-gpio/driver/
    /sys/devices/platform/lf1000-gpio/memcfg
    /sys/devices/platform/lf1000-gpio/memclkdelay
    /sys/devices/platform/lf1000-gpio/memcontrol
    /sys/devices/platform/lf1000-gpio/memdqsindelay
    /sys/devices/platform/lf1000-gpio/memdqsoutdelay
    /sys/devices/platform/lf1000-gpio/memrefresh
    /sys/devices/platform/lf1000-gpio/memtime0
    /sys/devices/platform/lf1000-gpio/memtime1
    /sys/devices/platform/lf1000-gpio/modalias
    /sys/devices/platform/lf1000-gpio/pad_strength_bus
    /sys/devices/platform/lf1000-gpio/pad_strength_gpio_a_high
    /sys/devices/platform/lf1000-gpio/pad_strength_gpio_a_low
    /sys/devices/platform/lf1000-gpio/pad_strength_gpio_b_high
    /sys/devices/platform/lf1000-gpio/pad_strength_gpio_b_low
    /sys/devices/platform/lf1000-gpio/pad_strength_gpio_c_high
    /sys/devices/platform/lf1000-gpio/pad_strength_gpio_c_low
    /sys/devices/platform/lf1000-gpio/panic
    /sys/devices/platform/lf1000-gpio/power
    /sys/devices/platform/lf1000-gpio/pullup_enable_gpio_a
    /sys/devices/platform/lf1000-gpio/pullup_enable_gpio_b
    /sys/devices/platform/lf1000-gpio/pullup_enable_gpio_c
    /sys/devices/platform/lf1000-gpio/request
    /sys/devices/platform/lf1000-gpio/shutdown
    /sys/devices/platform/lf1000-gpio/subsystem/
    /sys/devices/platform/lf1000-gpio/touchscreen
    /sys/devices/platform/lf1000-gpio/uevent
    /sys/devices/platform/lf1000-gpio/user_0

As you can see there are a lot of them, we are only really interested in
a few at this moment:

    # This is how the system works out whether its booting a Didj, Explorer or LF Dev board(s)
    /sys/devices/platform/lf1000-gpio/board_id
    # This is how rcS/EB knows which boot type it should use and which set of scripts to run once the kernel is loaded
    /sys/devices/platform/lf1000-gpio/boot_image
    # This is how it knows where it booted from (NOR,NAND,USB,or UART)
    /sys/devices/platform/lf1000-gpio/boot_source
    # This is how the system differentiates between cart types (Game,MFG cart)
    /sys/devices/platform/lf1000-gpio/cart_id
    # This is how the system determines what speed the cpu should run at
    /sys/devices/platform/lf1000-gpio/cpu_freq_in_hz
    # I think this tells the system whether the kernel panic'd or not
    /sys/devices/platform/lf1000-gpio/panic
    # Whether it was a warm or cold boot?
    /sys/devices/platform/lf1000-gpio/power
    # The type boot requested from the kernel
    /sys/devices/platform/lf1000-gpio/request
    # How the system shutdown the last time
    /sys/devices/platform/lf1000-gpio/shutdown
    # Tracks the power state of the machine
    /sys/devices/platform/lf1000-gpio/power
    # Used to get/set the boot partition
    /sys/devices/platform/lf1000-gpio/user


 Lets break that down a bit further into scratchpad:

**board\_id**

The system uses board ID at compile time as well as boot, this is
crucial to the system as it tells it which board type and consequently
which types of boot it can perform, for the Didj this will be NAND or
UART, for the Explorer it will be NOR,USB, NAND or UART. At compile time
CONFIG\_BOARD\_ID is crucial for the system to know how the gpio pins
are configured for the buttons.

**boot\_image**

This is how the system partly determines which set of scripts it should
run at boot up via rcS, valid values are:

    PLAY, RECOVERY, IMAGE_2, IMAGE_3

I believe this also tells Emerald-Boot whether to boot normally or from
USB for recovery purposes, discussions on the \#didj irc channel have
suggested the use of the unused (needs confirmation) IMAGE\_2, IMAGE\_3
options for our own purposes such as USB kernel boot using an NFS rootfs
or SD rootfs.

**boot\_source**

This is how the system knows which boot source should be or was used to
boot, as mentioned in board\_id, valid values for the Explorer are:

    Valid values are: NOR,NAND,USB,UART,UNKNOWN
    Valid for the Explorer:
    NOR,USB,UART, UNKNOWN
    Valid for the didj:
    NAND,USB?,UART, UNKNOWN

**cart\_id**

The Explorer and Didj systems use at least 2 types of cartridge, a
normal game cart or a MFG cart, with the latter being able to perform
system recovery, cart\_id is how the system can tell the difference
between cart types.

**request**

The Explorer has various types of kernel boot modes, that it can set on
exit or during the course of a session, on next startup these 'requests'
tell it which scripts /etc/init.d/rcS should run, with valid values
being:

    TRAPDOOR, SHORT, FAILED, UNCLEAN, BATTERY, UPDATE, RETURN, PLAY

For an explanation of what they do see /usr/bin/show-scr and
linux2.6/arch/arm/mach-lf1000/include/mach/gpio.h

*PLAY* in general does a clean boot, as will RETURN. BATTERY and UNCLEAN
should start normally but might trigger an update/recovery via LFConnect
as they check the system at kernel boot time.

*UPDATE* boots the system in recovery mode, waits for LFConnect or
pager.sh to send a .cbf file containing either a kernel or a kernel +
rootfs, it then presents you with a different partition table to a
normal boot (needs confirmation),

-   please note\* setting these registers may have adverse effects on
    your Explorer/Didj, be careful and use valid values.

As mentioned you can 'cat' the various registers to find out their
current state but equally important (if not more so) you can set the
registers using the following method:

    echo PLAY > /sys/devices/platform/lf1000-gpio/request
    reboot

This will reboot the system normally.

**If you want to kick start USB boot** on the next boot without holding
any buttons try the following:

    echo UPDATE > /sys/devices/platform/lf1000-gpio/request
    reboot

Just as the system starts you will see something similar to the
following:

    EB1.0.8
    0003E252
    Request=UPDATE: USB boot

This is the Emerald-Boot version, the raw scratchpad data and the
requested boot type, at this point the system is waiting for at least a
kernel to be sent in a .cbf file.

The system is expecting to do a recovery at this point, so dftpdevice is
started, if dftpdevice isn't used then the system is flagged and it will
reboot into usb mode on the next reboot. This can be a pain but is
relatively simple to clear, you can either power off the system by
holding the pwoer button down until it shuts off, or you can do the
following:

    touch /tmp/incision

This will fool the shutdown system into thinking that we have completed
the update and will allow you ro boot from the normal kernel by simply
issuing the **reboot** command.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")

