> From: [eLinux.org](http://eLinux.org/Avoid_Initramfs "http://eLinux.org/Avoid_Initramfs")


# Avoid Initramfs



If you wish to improve the boot time, avoid using initramfs. Rationale
is that intramfs requires copying the data twice.
 First the data needs to be loaded either by the boot loader or as part
of your kernel image, and next the data is copied from the initramfs
image to the buffer cache in the kernel.

Another disadvantage of initramfs is that the initramfs contains
complete files. So if you have e.g. glibc in your initramfs it will be
put into the buffer cache completely. However, only part of it will be
needed as no-one uses all functions in glibc. If only part of a library
or executable is used, the time to read, uncompress and copy the other
parts is wasted.

Better just use the files directly from disk or flash. If your buffer
cache is big enough they will stay in the buffer cache after the initial
load anyway (and if your buffer cache is small you probably cannot
afford to use initramfs at all).


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Boot Time](http://eLinux.org/Category:Boot_Time "Category:Boot Time")

