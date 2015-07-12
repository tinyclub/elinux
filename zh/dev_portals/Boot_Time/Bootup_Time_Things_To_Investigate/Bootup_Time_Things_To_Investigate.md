> From: [eLinux.org](http://eLinux.org/Bootup_Time_Things_To_Investigate "http://eLinux.org/Bootup_Time_Things_To_Investigate")


# Bootup Time Things To Investigate



This page has a list of items which may be worth investigating in the
future.

If you see something that creates a long delay (e.g. over 250ms) then
add it here and maybe some day we will try to investigate it.



## netconsole extra delay for bogus network carrier detect

Tim Bird saw this on the linux-tiny list: (see
[http://www.selenic.com/pipermail/linux-tiny/2004-August/000015.html](http://www.selenic.com/pipermail/linux-tiny/2004-August/000015.html))

Network devices that say they've got carrier detect instantly at boot
are assumed to have bogus carrier detect and netconsole waits a bit to
assure the line is up and ready to go before proceeding. The timeout
mentioned below could probably be shrunk.



    >eth0: NE2000 found at 0x300, using IRQ 5.
    >> Universal TUN/TAP device driver 1.5 (C)1999-2002 Maxim Krasnyansky
    >> netconsole: device eth0 not up yet, forcing it
    >> eth0: driver changed get_stats after register
    >> netconsole: carrier detect appears flaky, waiting 10 seconds
    >>                                            ^^^^^^^^---------this delay seems long


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")

