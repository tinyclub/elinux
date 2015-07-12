> From: [eLinux.org](http://eLinux.org/Variable_Scheduling_Timeouts "http://eLinux.org/Variable_Scheduling_Timeouts")


# Variable Scheduling Timeouts



## Rationale

The Linux kernel relies on periodic timer interrupts to allow the
kernel:

-   to keep the current time and date up to date,
-   to do accounting,
-   to check if a different task should be dispatched, and
-   to see if software timer service routines should be called.

Even when the processor is otherwise idle, these interrupts occur and
cause the processor to be brought out of a power savings mode even
though there may not be anything for it to do other than update the time
and go back to sleep. The Variable Scheduling Timeouts (VST) feature
modifies the kernel to avoid unnecessary timer interrupts, allowing the
processor to stay in a power saving mode for longer periods.

## Specification

A kernel SHOULD disable periodic timer interrupt while CPU is idle and
there is no scheduled timer. The length of the time interval during
which periodic timer interrupt is disabled SHOULD not be more than a
value which SHOULD be configurable.

## Notes

More information on VST is available at the community site
[http://sourceforge.net/projects/high-res-timers/](http://sourceforge.net/projects/high-res-timers/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [ObsoleteInfo](http://eLinux.org/Category:ObsoleteInfo "Category:ObsoleteInfo")

