> From: [eLinux.org](http://eLinux.org/Uncompressed_kernel "http://eLinux.org/Uncompressed_kernel")


# Uncompressed kernel



Booting from an uncompressed kernel might improve the boot time.

It will take longer to read an uncompressed kernel image from background
storage, but there is time saved since no decompression is needed.

So whether or not an uncompressed kernel is a win with respect to boot
time depends on the speed with which you can read from the background
memory and the speed of your processor (as a faster CPU will require
less time to decompress). So with a fast processor and slow background
memory, compression might be a win, whereas with a slow processor and
fast background memory, compression might be a lose.

Best strategy here is to empirically determine whether or not it is
better for your system to have an uncompressed kernel or a compressed
one.

Note: the ideal situation of course is if you can use DMA to load the
compressed kernel in chunks and decompress the previous chunk while the
next chunk is loaded.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

