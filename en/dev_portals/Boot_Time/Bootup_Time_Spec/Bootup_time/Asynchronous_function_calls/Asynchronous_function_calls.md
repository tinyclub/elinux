> From: [eLinux.org](http://eLinux.org/Asynchronous_function_calls "http://eLinux.org/Asynchronous_function_calls")


# Asynchronous function calls



In order to make the kernel boot faster, a set of patches was introduced
by Arjan van de Ven in January 2009 to create infrastructure to allow
doing some of the initialization steps asynchronously. The patches allow
overlapping significant portions of the hardware delays in practice.
Asynchronous function calls has been merged in mainline starting from
2.6.29. Starting from 2.6.30 the asynchronous function call
infrastructure is enabled by default.

In order to not change device order and other similar observables, the
patch does NOT do full parallel initialization.

Rather, it operates more in the way an out of order CPU does; the work
may be done out of order and asynchronous, but the observable effects
(instruction retiring for the CPU) are still done in the original
sequence.

## References

This work was described in the LWN.net article [An asynchronous function
call infrastructure](http://lwn.net/Articles/314808/)

See
[http://lkml.org/lkml/2009/1/4/155](http://lkml.org/lkml/2009/1/4/155)
for the first patch in the series.

Work similar in spirit to this was done previously, but with smaller
scope and apparently not mainlined.

See [Threaded Device
Probing](http://eLinux.org/Threaded_Device_Probing "Threaded Device Probing")

## Status

This work was mainlined in kernel version 2.6.30 and is now found in the
source file `kernel/async.c`


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")
-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

