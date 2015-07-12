> From: [eLinux.org](http://eLinux.org/LogFS "http://eLinux.org/LogFS")


# LogFS



LogFS is a raw flash filesystem, intended to replace JFFS2, with a focus
on scalability.

In July of 2007, Matt Mackall wrote:

    LogFS is a filesystem designed to support large volumes on FLASH. It
    uses a simple copy-on-write update process to ensure consistency (the
    "log" in the name is a historical artifact). It's easily the most
    modern and scalable open-source FLASH filesystem available for Linux
    and it's well on its way to being accepted in the mainline tree.

It was originally written by Joern Engel, but has recently (up to
October, 2012) been maintained by Prasad Joshi.

LogFS was mainlined in kernel version 2.6.34 (in November 2009).

It appears to be less-used than other flash filesystems, and in some
testing was not robust enough to complete testing.

## Resources

-   Home page: [http://logfs.org/logfs/](http://logfs.org/logfs/)
    -   Mailing list:
        [http://logfs.org/cgi-bin/mailman/listinfo/logfs](http://logfs.org/cgi-bin/mailman/listinfo/logfs)
    -   NOTE: this site appears down as of October 2012
-   Articles:
    -   [LogFS article](http://lwn.net/Articles/234441), LWN.net, May
        2007
    -   [LogFS: A new way of thinking about flash
        filesystems](http://www.linux.com/articles/114295) Linux.com,
        May 2007

Scott Preece wrote:

    The big win for LogFS (in my limited knowledge of it) is that it stores
    its tree structure in the media, rather than building it in memory at
    mount time. This significantly reduces both startup time and memory
    consumption. This becomes more important as the size of the flash device
    increases.

Some newer flash memory, like MLC (multi-level cell), are not well
supported.


