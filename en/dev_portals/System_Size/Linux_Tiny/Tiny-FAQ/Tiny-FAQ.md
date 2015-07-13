> From: [eLinux.org](http://eLinux.org/Tiny-FAQ "http://eLinux.org/Tiny-FAQ")


# Linux Tiny-FAQ


(Redirected from
[Tiny-FAQ](http://eLinux.org/index.php?title=Tiny-FAQ&redirect=no "Tiny-FAQ"))


## Contents

-   [1 FAQ: The Linux-Tiny Tree](#faq-the-linux-tiny-tree)
-   [2 Credits](#credits)
-   [3 What is this all about?](#what-is-this-all-about-3f)
-   [4 How do I use it?](#how-do-i-use-it-3f)
-   [5 What Difference does it make?](#what-difference-does-it-make-3f)
    -   [5.1 Config Size Test](#config-size-test)
    -   [5.2 Bloat Watch](#bloat-watch)
-   [6 What is the difference between the broken-out and the patch
    files?](#what-is-the-difference-between-the-broken-out-and-the-patch-files-3f)
-   [7 Will it work on any kernel?](#will-it-work-on-any-kernel-3f)
-   [8 How do I get access to this
    information?](#how-do-i-get-access-to-this-information-3f)
-   [9 Is there more that I can
    read?](#is-there-more-that-i-can-read-3f)

## FAQ: The Linux-Tiny Tree

This FAQ was originally written as a contribution to the Linux-Tiny
effort which aims to make it possible to create a lean-and-mean Linux
kernel. This document is a copy of the original [linux-tiny
FAQ](http://itmaze.com.au/articles/linux-tiny/). It is intended to
evolve into a more generic Embedded Linux FAQ over time.

A special note should be made here about Matt Mackall \<mpm at
selenic.com\> who originally put linux-tiny together and made it into
something that others could download.



## Credits

Contributors:

       * Mahendra <Mahendra_M at infosys.com>
       * Matt Mackall <mpm at selenic.com>
       * Rob Landley <rob at landley.net>
       * Tim Bird <tim.bird at am.sony.com>

Author:

    * Onno Benschop <onno at itmaze.com.au>

## What is this all about?

This project is a collection of patches to the Linux kernel to remove
different aspects of the kernel in order to save space. For example,
removing all the error messages from the kernel removes about 300k from
it.

A kernel uses space in all manner of different ways, the space it takes
up on disk, the space it takes to load the code into memory and the
space it takes to store information while it is running. Linux-Tiny is a
set of patches to the mainline kernel (at kernel.org) that addresses the
way the kernel uses space. The patches you'll find here are intended to
be included into the main kernel-tree and some have already been
submitted for such use.

This is useful in places where space is limited, or in the case of error
messages, there is no-one to see them - like in embedded systems.
Linux-Tiny is also for users of small or legacy machines such as 386's
and handhelds.

A description on the how and why is available here: [Linux
Tiny](http://eLinux.org/Linux_Tiny "Linux Tiny")

and here is a really detailed description:

[http://www.selenic.com/tiny-about/Reprint-Mackall-OLS2004.pdf](http://www.selenic.com/tiny-about/Reprint-Mackall-OLS2004.pdf)

## How do I use it?

This project will not supply you with an actual kernel, it gives you a
set of patches that you need to apply to a kernel source tree, after
which you can configure and compile your new trimmed kernel.

The Linux-Tiny patches default to the standard kernel configuration, so
you'll need to turn on or off those settings you want to change.

The process to apply Linux-Tiny is pretty straightforward if you've
patched a kernel before, but if you haven't there are a few steps you'll
need to take: (and you should read the question "Will it work on any
kernel?")

      1. Download kernel sources
      2. Download the appropriate patch set for that kernel
      3. cd /path/to/my/linux/sources/
      4. patch -p1 </path/to/patch/Linux-Tiny.patch
      5. Check for reject files and fix where appropriate
      6. Configure the kernel
      7. Compile the kernel



## What Difference does it make?

Well, that depends entirely on what you're trying to achieve. Different
patches and different ideas in size reduction are suited to different
purposes. The various size reductions have varying impacts on different
aspects of the kernel. Efforts are being made to document and compare
sizes.



### Config Size Test

Tim Bird has written an program to automatically test the kernel size
under different configurations. As an example, this table was produced
for a test run conducted on Oct 1st, 2007, on an i386 target (called
'nut'):
[http://testlab.celinuxforum.org/otlwiki/ConfigSizeTestResultsNutOct1](http://testlab.celinuxforum.org/otlwiki/ConfigSizeTestResultsNutOct1)

One of the main purposes of this program is to find problems with the
Linux-tiny patches. Also, this data could be used to help identify the
options having the largest effect on the kernel size.



### Bloat Watch

Matt Maccall wrote bloatwatch at CELF 2006, and the data that was
gathered then is still available, at:
[http://testlab.celinuxforum.org/bloatwatch/index.cgi](http://testlab.celinuxforum.org/bloatwatch/index.cgi)

It provides a great amount of detail, and the ability to compare
versions over time. As such, it really was intended to be a kernel size
regression analysis tool.



## What is the difference between the broken-out and the patch files?

The broken out patches contain all the patches as individual patches, so
you can choose to apply one or all of them, where the patch file
contains all the patches as one big patch, applied mostly in the
intended merge order from simple to complex.

For example, one set of patches turns off all error messages. Another
set of patches changes the way memory is allocated. The broken out set
contains the two different patches as separate entities, the complete
patch contains both of the changes together.

The reason it is like that, is because not everyone will want to apply
all patches, or will be able to apply all patches - see below.



## Will it work on any kernel?

Yes.

Seriously, the answer is in typical computing fashion: "That depends"

If you're new to patching, maybe a brief explanation is needed. Pardon
me if this is too remedial, but I wanted to write low level since I
don't know your experience. Sorry in advance for the length.

Patches are created by diff'ing two source bases against each other. A
patch is like a set of instructions for converting one source base into
the other. Inside the patch are both the changes themselves, and context
information which helps patch to identify the correct place to make each
change.

If you try to apply a patch to a different version of software than it
was originally created from, you may encounter problems. Patch may not
find the correct place to make a change. When this happens, it leaves a
reject file, showing the change that it could not make.

The Linux-Tiny patches were created based on a kernel.org version of
Linux. Almost all kernels shipped by the major Linux distribution
vendors are significantly different from the kernel.org version of
Linux. Distribution vendors add many (often hundreds) of patches to
their kernels, in order to provide extra features to their products.
This includes drivers, protocols, file systems, and other enhancements.

Since Linux-Tiny is a fairly big patch-set, it is very likely that there
will be overlap between some of the changes it makes and some of the
changes made by your Linux distribution.

If you get rejects while patching, it means that not all of the patch
could apply. It is possible that the rejects don't matter, but you can't
know that without looking at them. Basically, any time you get rejects
you need to examine them and either 1) fix them or 2) decide they can be
ignored, before proceeding.

Many times, rejects can be fixed pretty easily. A common cause of
rejects is multiple additions to the beginning or end of something.
Often, in these cases, the changes themselves don't really interfere
with each other. But the change in text from one patch causes the patch
program to be unable to match the context for a change from another
patch.

For example, take the following text and patches. Starting with a simple
text file describing a fish, there are two patches, one of which adds
stuff about a dog and one adds stuff about a cat. Semantically, these
patches don't interfere with each other, and there is no harm in
applying both changes to the file. However, patch has problems with
them.

file 'A':

    I have a fish, named Charlie.
    He swims in a fishbowl.
    He doesn't eat much.

file '1.patch':

    --- A   2004-10-21 10:49:53.547578239 -0700
    +++ B   2004-10-21 10:50:40.395525796 -0700
    @@ -1,3 +1,5 @@
     I have a fish, named Charlie.
     He swims in a fishbowl.
     He doesn't eat much.
    +My dog is named Spot.
    +Spot is friendly and wags his tail.

file '2.patch':

    --- A   2004-10-21 10:49:53.547578239 -0700
    +++ C   2004-10-21 10:51:05.435687319 -0700
    @@ -1,3 +1,5 @@
     I have a fish, named Charlie.
     He swims in a fishbowl.
     He doesn't eat much.
    +My cat is named cleo.
    +Cleo scratches the couch.

Each of these patches could be applied successfully to file A,
individually. However, if you try to apply these patches in sequence,
like so:

    cp A D
    patch D <1.patch
    patch D <2.patch

You'll get a reject on the second patch. The place where the description
of the cat is supposed to be is now different, and patch gives up.

To fix this, you need to add the rejected changes manually, taking into
account the differences caused by the other changes. (Think of 1.patch
as your Linux distribution changes and 2.patch as the Linux-Tiny patch
set.)

Doing this is usually pretty easy. You look at the rejected hunks, and
compare the lines they intended to patch from the original file with the
lines in your source base. Compare a kernel.org version of Linux, with
your distribution version of Linux, for the file and lines mentioned in
the reject file. In the example above, I would have to decide if I
wanted the description of the dog to come before or after the
description of the cat. I would make the change manually. (If this were
source, I would then recompile and test extensively... :-)

For extra credit, once you have made your changes, you can create a new
Linux-Tiny patch set by diff'ing your distribution-tiny with your
original distribution (which you should have saved off earlier). Your
distribution users may appreciate having such a "personal-tiny" patch
set to work with.



## How do I get access to this information?

Access has been created to a repository of the Linux-tiny patches using
the Mercurial SCM:

       * http://selenic.com/repo/tiny

This has all of the old -tiny releases nicely tagged and new changes
will show up here first.

Assuming you have Mercurial and quilt installed, grabbing the latest
-tiny work is as simple as:

    cd linux
    hg clone http://selenic.com/repo/tiny patches
    quilt push -a


 This will hopefully also make it easier for people to keep in sync with
Matt Mackall's changes and send him fixes, and make it easier for him to
track changes in the upstream kernel.

More information about Mercurial here:

       * http://selenic.com/mercurial/wiki/



## Is there more that I can read?

Tim Bird has done some work with Linux-Tiny on an ARM OSK board. He has
written some raw notes on the subject.

Thomas Lundquist has done some work using lzma rather than bzip to do
further compression and a diff for a 2.4 Kernel is available.

Ming-Ching Tiew has completed some 2.4 and 2.6 patches for lzma. Both
vmlinuz and init are available. Patches for busybox are included as well
as a utility called lzmacat. (Note, this requires the LZMA SDK.)

Some work is being done with [coreboot](http://eLinux.org/Coreboot "Coreboot") and [Linux
Tiny](http://eLinux.org/Linux_Tiny "Linux Tiny").


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")
-   [Linux Tiny](http://eLinux.org/Category:Linux_Tiny "Category:Linux Tiny")

