> From: [eLinux.org](http://eLinux.org/GDB_Tips "http://eLinux.org/GDB_Tips")


# GDB Tips



## get element size

Sometimes, with complex structures (arrays of structs containing nested
structs or arrays), it is hard to determine the actual size of a
particular element.

You can use gdb with a program image to get the size of structures, by
looking at the offset of an element of the structure relative to an
address of zero:

Here are some examples:

      ${CROSS_COMPILE}gdb vmlinux
    GNU gdb (GDB) 7.2
    Copyright (C) 2010 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "--host=i686-pc-linux-gnu --target=arm-sony-linux-gnueabi".
    For bug reporting instructions, please see:
    <http://www.gnu.org/software/gdb/bugs/>.
    (gdb) p &((struct poll_wqueues *)0)->polling_task
    $6 = (struct task_struct **) 0xc
    (gdb) p/d &((struct poll_wqueues *)0)->error
    $4 = 20

the second example could be read as: "print, in decimal, the address
(offset) of the element error using address 0 cast as a pointer to
struct poll\_wqueues"

'pt' is the first element of struct poll\_wqueues. Here is an example
using array offsets, showing that struct poll\_wqueues is 604 bytes
long.

    (gdb) p/d &((struct poll_wqueues *)0)[0]->pt
    $2 = 0
    (gdb) p/d &((struct poll_wqueues *)0)[1]->pt
    $3 = 604


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")

