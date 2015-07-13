> From: [eLinux.org](http://eLinux.org/Device_tree_future "http://eLinux.org/Device_tree_future")


# Device tree future





## Contents

-   [1 Where Device Tree is Headed](#where-device-tree-is-headed)
    -   [1.1 Resources for the Linux Plumbers 2015 Device Tree
        Track](#resources-for-the-linux-plumbers-2015-device-tree-track)
        -   [1.1.1 Material to review **before** the
            event](#material-to-review-before-the-event)
            -   [1.1.1.1 Device Tree 101](#device-tree-101)
            -   [1.1.1.2 Overlays](#overlays)
            -   [1.1.1.3 documentation](#documentation)
            -   [1.1.1.4 dtc](#dtc)
            -   [1.1.1.5 Probe Ordering](#probe-ordering)
            -   [1.1.1.6 device tree debugging
                tools](#device-tree-debugging-tools)
        -   [1.1.2 Current **draft** of the
            schedule](#current-draft-of-the-schedule)

## Where Device Tree is Headed

### Resources for the Linux Plumbers 2015 Device Tree Track

**THIS SECTION IS UNDER CONSTRUCTION**

#### Material to review **before** the event

The purpose of the Linux Plumbers conference is to **discuss** things.
The conference is not a good place to go if you want to look at slides
and listen to canned presentations.

The discussions will work better if the attendees have prepared in
advance, and have a basic understanding of the technology and issues to
be discussed. The goal of this section is to provide the resources
needed to be prepared to discuss.

##### Device Tree 101

If you are new to Device Tree, these resources will start you on the
path to a basic understanding.

-   **An introduction**
    -   [Device trees I: Are we having fun
        yet?](https://lwn.net/Articles/572692/) - Neil Brown, LWN.net
        November 2013
    -   [Device trees II: The harder
        parts](https://lwn.net/Articles/573409/) - Neil Brown, LWN.net
        November 2013
    -   "Device Tree for Dummies", ELC 2014 by Thomas Petazzoni
        -   [PDF](http://eLinux.org/images/f/f9/Petazzoni-device-tree-dummies_0.pdf "Petazzoni-device-tree-dummies 0.pdf")
        -   [YouTube video](https://www.youtube.com/watch?v=uzBwHFjJ0vU)
-   **More advanced material**
    -   "The Device Tree as a Stable ABI: A Fairy Tale?", ELC 2015 by
        Thomas Petazzoni
        -   [http://elinux.org/images/0/0a/The\_Device\_Tree\_as\_a\_Stable\_ABI-\_A\_Fairy\_Tale%3F.pdf](http://elinux.org/images/0/0a/The_Device_Tree_as_a_Stable_ABI-_A_Fairy_Tale%3F.pdf)
    -   "Device Tree, the Disaster so Far", ELC Europe 2013 by Mark
        Rutland
        -   [Media:Rutland-presentation\_3.pdf](http://eLinux.org/images/8/8e/Rutland-presentation_3.pdf "Rutland-presentation 3.pdf")
        -   [YouTube video](https://www.youtube.com/watch?v=xamjHjjyeBI)



##### Overlays

-   "Transactional Device Tree & Overlays: Making Reconfigurable
    Hardware Work", ELC 2015 by Pantelis Antoniou
    -   [PDF](http://eLinux.org/images/1/19/Dynamic-dt-keynote-v3.pdf "Dynamic-dt-keynote-v3.pdf")
    -   [YouTube video](http://www.youtube.com/watch?v=3Ag7ZBC_Nts)
-   Problem statements
    -   IO boards, eg beaglebone capes
    -   PPC sub-tree beneath hot-plug PCI
        -   [http://www.spinics.net/lists/linux-pci/msg40740.html](http://www.spinics.net/lists/linux-pci/msg40740.html)
        -   It might be possible to use existing dynamic add and remove
            functions (CONFIG\_OF\_DYNAMIC) for this purpose
    -   Quirks - TODO
        -   [[PATCH
            0/4](http://www.spinics.net/lists/devicetree/msg69490.html)
            Device Tree Quirks & the Beaglebone]
        -   [cpu card plugged into multiple carrier card variants, post
            manufacturing](http://www.spinics.net/lists/devicetree/msg69565.html)
    -   devices present only during manufacturing
        -   [Dealing with optional i2c devices in a
            devicetree](http://www.spinics.net/lists/devicetree/msg82817.html)

##### documentation

##### dtc

##### Probe Ordering

-   Tomeu Vizoso
    -   First approach: [[PATCH
        00/21](http://thread.gmane.org/gmane.linux.kernel.gpio/8465)
        On-demand device registration]
    -   Second approach: [[PATCH
        00/13](http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/351061.html)
        Discover and probe dependencies]
-   Other....

##### device tree debugging tools

#### Current **draft** of the schedule

Expect this to evolve.


    01 -- Device Tree Overlays - Pantelis
          Devicetree overlay use in Juniper products - Guenter
    02 -- folded into 01
    03 -- Overlays, some times a good idea sometimes not. - Pantelis
    04 -- Device Tree Documentation - Frank, Matt
    05 -- Chat With The dtc Maintainers - Frank, the maintainers
    06 -- Overlays and tools for sanity. - Pantelis
    07 -- Device Tree Tools - Frank
    08 -- Device Tree and parallel device probing - Pantelis
    09 -- Device tree round up - Frank


         session  start
         length   offset
         ------   ------

      01    30       0
      02                 (folded into 01)
      03    15     :30
      04    15     :45

    break   10    1:00

      05    30    1:10
      06    10    1:40
      07    15    1:55
      08    15    2:10
      09    10    2:20

          -----
           2:30


    01 -- Device Tree Overlays - Pantelis
       Device Tree Overlays are now in the mainline kernel. This session
       will cover what they are, how they are used.

       As part of this session I will examine device tree overlays, device
       tree changeset, the phandle resolution mechanism, overlay overlap
       removal checks and finally device tree variants (or quirks).

       Devicetree overlay use in Juniper products - Guenter

       The Juniper use case will be discussed:

       At Juniper, we use devicetree overlays to manage a variety of cards
       which can be inserted and removed at runtime.

       In this session, I will describe the basic system architecture, our
       requirements, and why we decided to use devicetree overlays to meet
       those requirements. I will also dive into the actual implementation
       of our card management framework in the Linux kernel, and explore
       some of the limitations of the current devicetree overlay code.

    02 -- was folded into 01

    03 -- Overlays, some times a good idea sometimes not. - Pantelis
       This session will cover supported and not supported overlay cases.

    04 -- Device Tree Documentation - Frank
       What device tree documentation and tutorials exist and where to find
       them. What is needed?

       What new documentation is expected this year?

       Can we bring consistency to the documentation style/syntax?

    05 -- Chat With The dtc Maintainers - Frank
       This session is an opportunity to ask questions of the dtc maintainers
       or listen to their thoughts on dtc related topics.

    06 -- Overlays and tools for sanity. - Pantelis
       Device Tree overlays represent a big change for the device tree in
       the kernel. Where as of old the device tree was something static,
       now it's something that can change at runtime.

       We could use some new tools to help us when creating them (compile
       time) and some kernel tooling to help when applying them (run time).

    07 -- Device Tree Tools - Frank
       What tools exist to support device tree development and
       debugging? Where are they? What new tools have been proposed or
       requested?

    08 -- Device Tree probe order and parallel device probing - Pantelis
       The new dynamic device tree capabilities entails marking not only
       the location of phandles but the references made to them. We can use
       that information to construct a device probe order schedule that can
       be used to support parallel device probing which is an obvious win
       for kernel boot time.

       If earlier sessions run long, this one may be shortened or deleted.

    09 -- Device tree round up - Frank
       Review previous sessions, round up loose ends


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Device
    tree](http://eLinux.org/index.php?title=Category:Device_tree&action=edit&redlink=1 "Category:Device tree (page does not exist)")

