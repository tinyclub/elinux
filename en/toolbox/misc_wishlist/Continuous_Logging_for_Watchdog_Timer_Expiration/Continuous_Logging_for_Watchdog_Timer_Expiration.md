> From: [eLinux.org](http://eLinux.org/Continuous_Logging_for_Watchdog_Timer_Expiration "http://eLinux.org/Continuous_Logging_for_Watchdog_Timer_Expiration")


# Continuous Logging for Watchdog Timer Expiration



Implementation Idea

I think this can be achieved by modifying the driver that services the
hardware watchdog. This driver is aware of the hardware timeout (say
this is N) and the application can make it a rule to always service the
hardware watchdog device (http://eLinux.org/dev/wtd) every N/2 seconds. The driver can
now warn when it has not been serviced during the first N/2 and has N/2
left to dump this event somehow.

--Leon Woestenberg


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

