> From: [eLinux.org](http://eLinux.org/Xv_Fat_Discussion "http://eLinux.org/Xv_Fat_Discussion")


# Xv Fat Discussion



## Contents

-   [1 xvFat Discussion](#xvfat-discussion)
    -   [1.1 General Introduction](#general-introduction)
-   [2 Mailing List](#mailing-list)
-   [3 Sony Hosted Technical Meeting in Yokohama (20 May
    2005)](#sony-hosted-technical-meeting-in-yokohama-20-may-2005)
    -   [3.1 Why FAT?](#why-fat-3f)
    -   [3.2 Problem of the FAT for Removable
        Media](#problem-of-the-fat-for-removable-media)
    -   [3.3 Presentation Material](#presentation-material)
    -   [3.4 To do items](#to-do-items)
-   [4 The Fire Leaped to ...](#the-fire-leaped-to)
    -   [4.1 Please pay attention to](#please-pay-attention-to)
-   [5 Patch for 2.4.20 for your
    reference](#patch-for-2-4-20-for-your-reference)

## xvFat Discussion

### General Introduction

This is a memorandum page for the discussion about the xvFAT File System
which enables the stable operation of the removable mass media on USB.
Because of the interoperability with the PC, FAT will be an useful file
system. However the Linux implementation of the file system is not
taking account of the stable operation of the system when it is used for
the removable media. In the worst case, Linux system would be panicked
when it is removed inadequately.

On 25th May 2005, Sony have called for the private technical discussion
on this technology. Sony showed their improvement of the FAT file system
to make it "Panic Free" in most case of the user operation of removing
media.

**Notice to non Japanese speakers :** We sincerely apologize to whom may
not to be convenient in making conversation in Japanese. This session
may include many discussion in Japanese.

Here, you may find the introduction of the XvFat.

-   English :
    [Media:20050325-xvfat-intro-en.pdf](http://eLinux.org/images/f/f4/20050325-xvfat-intro-en.pdf "20050325-xvfat-intro-en.pdf")
    -   Thanks to Mr. Asai's (IBM) cooperation in translating it into
        English.
-   Japanese :
    [Media:20050325-xvfat-intro-jpn.pdf](http://eLinux.org/images/5/5a/20050325-xvfat-intro-jpn.pdf "20050325-xvfat-intro-jpn.pdf")

## Mailing List

-   A mailing list is prepared for this discussion.
    -   **Note:** Messages in Japanese is allowed however for the
        convenience of non Japanese speakers, please add slight summary
        of the message in English.
-   Please register **sig\_xvfat@tree.celinuxforum.org** ;)
    -   Registration Site
        [http://tree.celinuxforum.org/mailman/listinfo/sig\_xvfat](http://tree.celinuxforum.org/mailman/listinfo/sig_xvfat)
    -   **Non CE Linux Forum Members are also welcomed**

## Sony Hosted Technical Meeting in Yokohama (20 May 2005)

### Why FAT?

-   FAT can be used for both CE products and PC commonly, which may
    prevent the user confusion.

### Problem of the FAT for Removable Media

-   We knew that in such condition that when the user plug off the
    device while OS is writing the data to the media, in the worst case
    the OS fall to "Panic". It will never be allowed by the users.
-   Our users may allow the data is not saved when the media is removed
    while data writing.
    -   But we have to be careful that those requirements may be vary to
        the products.

### Presentation Material

-   By Machida san of Sony is here.
    -   The material is here :
        -   [Media:20050520-xvfat-discussion-1.pdf](http://eLinux.org/images/4/4e/20050520-xvfat-discussion-1.pdf "20050520-xvfat-discussion-1.pdf")
            (Japanese)
        -   [Media:20050520-xvfat-discussion-en.pdf](http://eLinux.org/images/a/a7/20050520-xvfat-discussion-en.pdf "20050520-xvfat-discussion-en.pdf")
            (English)
    -   At the [International Technical
        Jamboree](http://eLinux.org/International_Technical_Jamboree "International Technical Jamboree")
        on 14th June, 2005
        -   [Media:20050614-celf-xvfs.pdf](http://eLinux.org/images/1/19/20050614-celf-xvfs.pdf "20050614-celf-xvfs.pdf")

### To do items

-   Sony is going to isolate the improvement and split it into the
    elements for the acceptation to the master kernel.

## The Fire Leaped to ...

### Please pay attention to

-   [http://www.linuxdevices.com/news/NS9955450995.html](http://www.linuxdevices.com/news/NS9955450995.html)
-   [http://hardware.slashdot.org/article.pl?sid=05/06/07/0314221&from=rss](http://hardware.slashdot.org/article.pl?sid=05/06/07/0314221&from=rss)
    -   Slash Dot...

## Patch for 2.4.20 for your reference

[Media:20050715-xvfat-2.4.20.patch](http://eLinux.org/images/d/d9/20050715-xvfat-2.4.20.patch "20050715-xvfat-2.4.20.patch")


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [File Systems](http://eLinux.org/Category:File_Systems "Category:File Systems")
-   [XvFAT](http://eLinux.org/index.php?title=Category:XvFAT&action=edit&redlink=1 "Category:XvFAT (page does not exist)")

