> From: [eLinux.org](http://eLinux.org/Open_Embedded "http://eLinux.org/Open_Embedded")


# Open Embedded



## Contents

-   [1 Description](#description)
    -   [1.1 Rationale](#rationale)
-   [2 Resources](#resources)
    -   [2.1 Specifications](#specifications)
-   [3 How To Use](#how-to-use)
-   [4 How to validate](#how-to-validate)
-   [5 Sample Results](#sample-results)
    -   [5.1 Case Study 1](#case-study-1)
    -   [5.2 Case Study 2](#case-study-2)
-   [6 Future Work/Action Items](#future-work-action-items)
-   [7 CELF sponsorship](#celf-sponsorship)

## Description

**Open Embedded** is the name of a project which seeks to provide
embedded Linux distributions, built from scratch. Open Embedded is not,
itself, an embedded Linux distribution. Rather it is a
meta-distribution.

(See also: [poky](http://eLinux.org/Poky "Poky")) The Project is now being carried
forward by the [linux foundation](http://www.linuxfoundation.org/) named
as Yocto Project. even with the new name most of the core components
remain same. Yocto project uses Poky as their default distribution
platform.

### Rationale

While the distribution used for most embedded systems has many custom
elements, there are significant portions of the software on consumer
electronics products which could be standardized and utilized from the
same source.

Open Embedded may represent a possible software base that could become a
de-facto standard embedded distribution of Linux.

## Resources

### Specifications

There are no CELF specifications related to Open Embedded.

## How To Use

See the Open Embedded wiki, at:
[http://wiki.openembedded.net](http://wiki.openembedded.net)

There is also an Eclipse plug-in available from buglabs which provides a
graphical view of an OE tree here:
[http://community.buglabs.net/kgilmer/posts/93-BitBake-Commander-6-5](http://community.buglabs.net/kgilmer/posts/93-BitBake-Commander-6-5)

## How to validate

[put references to test plans, scripts, methods, etc. here]

## Sample Results

### Case Study 1

Leon Woestenberg wrote (in Sep, 2007):

* * * * *

I became an OE user when I found that OE automated a lot more than
buildroot when I started adding packages. After that experience I
decided to use OE at work.

At work we create firmware, which is read-only embedded software which
the user cannot install to, or modify in any way (other than overwrite)
for 24/7 99.999% availability applications. Also, no build dependency on
target availability during build: No on-target post-install scripts, the
final image must be fully host-created. That means, having full control
of what happens, minimal cruft. Must build on a multiple of (modern)
Linux hosts distro's.

Bottom-line: paranoid control freak approach

I am the OE evangelist, that is, had to persuade to have my co-workers
see the benefits of using OE. That worked best when I showed them how I
could solve a problem more quickly than they could with buildroot, or
LFS. The problem often remains the steep learning curve, i.e. people do
often have some Makefile/autoconf experience but not necessarely
python/bitbake.

Bottom line: Show when OE works when the 'problem solving' leverage is
highest.

How do we use OpenEmbedded:

-   We cannot afford to follow the org.oe.dev. head developments. The
    head is where fixes get fixed. Takes too much time away from the
    developers.
-   We cannot afford to follow head, but fix package versions. The OE
    framework (bitbake, variables, behaviour) changes too much.
-   We pick a fixed OE revision and stick with it during a project
    (could be 2 years).
-   I try to track OE head on several targets, to stay up-to-date when I
    need to start a new project.
-   Some of the packages have too much build and/or run-time
    dependencies. Yes, both.
-   We create a private overlay of minimal-configured packages and
    discard redundant dependencies, we keep it in CVS (yes, I know...)
-   We add our custom packages to our private overlay.
-   I bring some new packages or fixes upstream, only for head.
-   We do not use task-base approach, because it builds dependencies we

did not have before (a dependency regression).

-   We have to keep good track of bitbake version, OE revision, private

overlay revision and host distro version, and know-good-combos'. We need
to be able fix a bug in the firmware in three years without any
regression. Virtual machines help.

Bottom line:

-   OpenEmbedded works perfectly for our use, if we take very much care
    in the way we use it. We might not do things the OE-way, simply we
    may lack in-depth knowledge, or exposure to it.

Issues:

-   Dependencies. The standard OE config seems targetted towards small
    (handheld) computing devices, not necessarely with embedded
    software. Everything with an installer is non-embedded software,
    IMHO.
    -   I would like to see a OE group focus on minimal dependency
        distro.

I would join such a group, but cannot do that alone.

-   Angstrom seems the de-facto distro OE is tested against, at least

upstream. Angstrom is excellent, but testing OE against Angstrom only
drives OE away from the embedded domain IMHO.

-   -   Unbitrot (Refresh) a distro other than Angstrom, preferably a
        more

minimal one.

-   Documentation.
    -   It's there, but you have to know what you are looking for. Most
        people don't know, or don't look.

-   I have yet to see a developer walk in with OE experience. Buildroot

knowledge is a big plus though.

The best thing I would envision (and I would propose as a OE vision), is
that OE would be funded by the semiconductor and board manufacturers to
support their silicon and boards, so that in 3 years, everyone of them
could mention "Enabled by OpenEmbedded".

### Case Study 2

## Future Work/Action Items

Tim Bird met with Phil Blundell and Tim Ansell at Linuxconf Australia in
2005 and discussed some possible ways the forum might sponsor Open
Embedded.

Here are some ideas:

-   create an installer, which automatically copes with weird distros (I
    had problems getting OE installed, but then I use Mandrake)
    -   it should validate that all required packages are installed, and
        if not present, install them
        -   OE has a somewhat long list of pre-requisites
-   sponsor a conference/retreat of the core OE developers
-   do nightly builds (and testing?) of various full-distro recipes
-   do improvements to bitbake to solve the memory/performance problems.
    -   need to identify if these are python issues (dependency graph
        memory consumption seems to be)
-   try to make bitbake less fragile
    -   have a way to freeze/sign a recipe collection for a known-good
        distro?
-   canonicalize workarounds to issues caused by autoconf badness
    (inability to support cross-building)

Tim and Phil both said that contract money might not influence their
contribution levels (they are maxed out now). Changing their focus with
money might be detrimental (it might just take the fun out of it.) So,
outside contractors seems like the better way to go for now.

## CELF sponsorship

The CE Linux Forum sponsored some work on open embedded. In 2006, CELF
hired a contractor (Marcin Juskiewicz) to work on a few items. Marcin
created an celinux-test distribution for the CE Linux Forum test lab.
Among other things, this distro included a package of the Linux Test
Project software. This distro should be available in the OE snapshot
from February 27, 2007. He also built a system to mirror OE sources onto
a machine in the CE Linux forum test lab.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")
-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")

