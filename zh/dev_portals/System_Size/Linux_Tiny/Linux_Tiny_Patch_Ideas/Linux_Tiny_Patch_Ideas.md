> From: [eLinux.org](http://eLinux.org/Linux_Tiny_Patch_Ideas "http://eLinux.org/Linux_Tiny_Patch_Ideas")


# Linux Tiny Patch Ideas



This is an unorganized list of items that may be worth looking at:

## Contents

-   [1 stuff about printk messages](#stuff-about-printk-messages)
    -   [1.1 Mark Rustad patch to remove init printk
        messages](#mark-rustad-patch-to-remove-init-printk-messages)
    -   [1.2 proposals to compress printk
        messages](#proposals-to-compress-printk-messages)
    -   [1.3 compile-time selection of printk messages, by message
        level](#compile-time-selection-of-printk-messages-by-message-level)
-   [2 Other Areas of reduction](#other-areas-of-reduction)
    -   [2.1 make a PROC\-FS\-FULL](#make-a-proc-fs-full)

## stuff about printk messages

### Mark Rustad patch to remove init printk messages

[http://lkml.org/lkml/2004/12/9/146](http://lkml.org/lkml/2004/12/9/146)

This change allows format strings in printks to be directed to an object
section where they can be discarded at run time. By using "pkinit"
instead of "printk" inside of \_\_init functions, the format strings
associated with the \_\_init functions can be reclaimed.

### proposals to compress printk messages

[http://uwsg.indiana.edu/hypermail/linux/kernel/0306.0/1542.html](http://uwsg.indiana.edu/hypermail/linux/kernel/0306.0/1542.html)
- Timothy Miller actual results (using a compile time string replacer)

[http://selenic.com/pipermail/linux-tiny/2005-June/000207.html](http://selenic.com/pipermail/linux-tiny/2005-June/000207.html)

### compile-time selection of printk messages, by message level

There was a big discussion about this on LKML in September, 2007.

See
[http://lkml.org/lkml/2007/9/20/352](http://lkml.org/lkml/2007/9/20/352)
(by Rob Landley) for the start of the thread.

## Other Areas of reduction

### make a PROC\_FS\_FULL

There's a lot of junk in /proc file system. If you turn off
CONFIG\_PROC\_FS it saves about 130K, but it makes the system pretty
difficult to use (e.g. mount has problems on init that you have to work
around, there's no 'ps' is available, etc.)

Similar to how we have BASE\_FULL and BASE\_SMALL, maybe we can have a
PROC\_FS\_FULL and a PROC\_FS\_SMALL. Only the essential items would be
configured on with PROC\_FS\_SMALL, and everything would be on for
PROC\_FS\_FULL.

The research needed here is to find out the list of essential items that
'ps' and maybe 'free' need, and find a way to make the others
conditional on CONFIG\_PROC\_FS\_FULL in the least intrusive way.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux Tiny](http://eLinux.org/Category:Linux_Tiny "Category:Linux Tiny")

