> From: [eLinux.org](http://eLinux.org/Include_modules_in_kernel_image "http://eLinux.org/Include_modules_in_kernel_image")


# Include modules in kernel image



For best performance do not load modules at init time. Instead include
those modules in the kernel image.

This will give a bigger kernel (as the modules are in it) so loading and
starting the kernel will be slower. However this time is recovered
because there are no modules to be loaded (which is slightly more
expensive than having them into the kernel).

TODO: perform measurements to quantify the gain


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

