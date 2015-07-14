> From: [eLinux.org](http://eLinux.org/Device_tree_history "http://eLinux.org/Device_tree_history")


# Device tree history





## Mailing list discussion

"Recent" (2009) discussion of "Flattened Device Tree" work on
linux-embedded mailing list:

[http://www.mail-archive.com/linux-embedded@vger.kernel.org/msg01721.html](http://www.mail-archive.com/linux-embedded@vger.kernel.org/msg01721.html)

Russell King is against adding support for FDT to the ARM platform (see
whole thread for interesting discussion):

[http://lkml.indiana.edu/hypermail/linux/kernel/0905.3/01942.html](http://lkml.indiana.edu/hypermail/linux/kernel/0905.3/01942.html)

But maybe Russell can be convinced:

[http://lkml.indiana.edu/hypermail/linux/kernel/0905.3/03618.html](http://lkml.indiana.edu/hypermail/linux/kernel/0905.3/03618.html)

David Gibson defends FDT:

[http://lkml.indiana.edu/hypermail/linux/kernel/0905.3/02304.html](http://lkml.indiana.edu/hypermail/linux/kernel/0905.3/02304.html)

## The bindings review fire hose is clogged

The device tree bindings maintainership was broken apart from device
tree maintainership on July 19, 2013, by commit
f882820556af33b5aee5b9f0ba459620a9ab1c22 that created the "OPEN FIRMWARE
AND FLATTENED DEVICE TREE BINDINGS" entry in the MAINTAINERS file.

        MAINTAINERS: Refactor device tree maintainership

        Device tree bindings require a lot more attention than they used to.
        We've got a group of volunteers willing to take over maintaining
        bindings. This patch adds them to the MAINTAINERS file.

Discussion at the October 2013 Kernel Summit in Edinburgh led to the
creation of the kernel file
Documentation/devicetree/bindings/submitting-patches.txt, including the
following note:

       II. For kernel maintainers

         1) If you aren't comfortable reviewing a given binding, reply to it and ask
            the devicetree maintainers for guidance.  This will help them prioritize
            which ones to review and which ones are ok to let go.

         2) For driver (not subsystem) bindings: If you are comfortable with the
            binding, and it hasn't received an Acked-by from the devicetree
            maintainers after a few weeks, go ahead and take it.

          Subsystem bindings (anything affecting more than a single device)
          then getting a devicetree maintainer to review it is required.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Device
    tree](http://eLinux.org/index.php?title=Category:Device_tree&action=edit&redlink=1 "Category:Device tree (page does not exist)")

