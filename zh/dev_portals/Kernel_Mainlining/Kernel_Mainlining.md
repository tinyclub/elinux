> From: [eLinux.org](http://eLinux.org/Kernel_Mainlining "http://eLinux.org/Kernel_Mainlining")


# Kernel Mainlining



This page has information for embedded developers about mainlining
patches to the Linux kernel.

## Contents

-   [1 General Resources](#general-resources)
    -   [1.1 Presentations](#presentations)
        -   [1.1.1 talk list](#talk-list)
    -   [1.2 Training, tutorials and
        challenges](#training-tutorials-and-challenges)
-   [2 Specific Projects](#specific-projects)
-   [3 Notes for Best Practices](#notes-for-best-practices)
    -   [3.1 from Andrew Morton](#from-andrew-morton)
    -   [3.2 from Deepak Saxena](#from-deepak-saxena)
    -   [3.3 from Jonathan Corbet](#from-jonathan-corbet)
    -   [3.4 from Arnd Bergmann](#from-arnd-bergmann)
    -   [3.5 From David Arlie](#from-david-arlie)
-   [4 Overcoming Obstacles to
    Mainlining](#overcoming-obstacles-to-mainlining)

## General Resources

-   [Documentation/HOWTO](https://www.kernel.org/doc/Documentation/HOWTO)
    - kernel document describing how to code for the kernel and
    contribute
-   [Documentation/development-process](https://www.kernel.org/doc/Documentation/development-process/)
    - kernel documents describing the kernel development process

### Presentations

Greg KH has a great presentation about how the community works, with
links to references for getting started:

-   [Linux Kernel Development
    (pdf)](https://github.com/gregkh/kernel-development/blob/master/kernel-development.pdf?raw=true)

An older talk (2008) by Andrew Morton discusses the reasons to
contribute, and best practices for contributing to the upstream kernel

-   [Session:kernel.org development and the embedded
    world](http://eLinux.org/Session:kernel.org_development_and_the_embedded_world "Session:kernel.org development and the embedded world")
    -   In this seminal talk from 2008, Andrew lays out the case for
        involvement of embedded companies in kernel development. He
        describes the overall process, but more importantly what to
        expect from kernel developers, what to do and not to do when
        approaching mainlining, and how to structure teams for effective
        work with the kernel community.

#### talk list

Here is a list of talks about mainlining and community involvement, from
previous Linux conferences:

-   [How to Participate in the Kernel Development Process
    (PDF)](http://eLinux.org/images/0/00/Corbet-dev-process.pdf "Corbet-dev-process.pdf")
    - ELC-2007, April 2007, Jonathan Corbet
    -   This talk is an attempt to identify the factors which lead to
        success or failure and present them in a way that will help
        others seeking to get code into the kernel.
-   ELC-2008 morton (noted above)
-   Appropriate Community Practices: Social and Technical Advice -
    ELC-2008, April 2008 Deepak Saxena
    -   Abstract: With the increasing popularity of Linux in the
        embedded world, HW vendors are jumping on the bandwagon to add
        kernel support for their devices/chipsets/SOCs. We in the
        community keep seeing the same mistakes made (both technical and
        social) repetitively. We will go over the benefits of being
        involved with the community and utilize examples of what not do
        when working within the Linux development ecosystem to
        illustrate appropriate practices to increase your probability of
        successful code adoption into the kernel.org tree.
    -   (presentation not available)
-   [Embedded maintainers: Community and Embedded
    Linux](http://eLinux.org/images/c/c5/Dwmw2-community_and_embedded_linux.pdf "Dwmw2-community and embedded linux.pdf")
    ELCE-2008, David Woodhouse
    -   This presentation introduces and discusses the new community
        rôle of 'embedded maintainer', present David's ideas and seek
        other opinions on what the job is actually supposed to mean.
    -   The community at large needs to be more coherent - it's not just
        about big companies playing nicely with us, but also about
        building a community around embedded Linux in a way that we
        haven't really done so far. Even the individual projects aren't
        working together as well as they should. The 'embedded
        maintainer' rôle isn't like other maintainers in the kernel - we
        don't own a certain section of the code and just act as
        gatekeeper and arbiter of taste for it. It's more about bringing
        people together and getting them to collaborate better.
-   [Embedded Linux and Mainline
    Kernel](http://eLinux.org/images/c/c5/Dwmw2-ELC-2009-04.pdf "Dwmw2-ELC-2009-04.pdf")
    - ELC-2009, April 2009, David Woodhouse
    -   Embedded Linux has more in common, technologically, with other
        Linux use areas than many embedded developers realize. In this
        talk, David will describe some of the important intersections
        between the features embedded developers care about and those
        needed for enterprise and desktop systems. The stereotype of
        embedded developers not needing to interact with the greater
        Linux community is wrong. David provides the technical rationale
        for increased interaction in the community as well as tips for
        better involvement by embedded developers.
    -   Notes: find other parties with same requirements - look outside
        embedded. Virtualized systems is a good place to look, as they
        often have resource constraints as well.
-   [Cooperative Development Inside
    Communities](http://eLinux.org/images/5/50/CommunityDevelopment.pdf "CommunityDevelopment.pdf")
    ELC-2009 Jeff Osier-Mixon
    -   This is the talk introducing MELD.
-   [Becoming Part of the Linux Kernel
    Community](http://eLinux.org/images/6/63/Elc2011_bergmann_keynote.pdf "Elc2011 bergmann keynote.pdf")
    ELC-2011, April, 2011, Arnd Bergmann
    -   This talk give the benefits of beign integrated with the
        community (it was the "hippy" talk)
-   [Developer's Diary: Helping the
    Process](http://eLinux.org/images/f/fe/Elc2011_sang.pdf "Elc2011 sang.pdf") ELC-2011,
    April 2011, Wolfram Sang
    -   include notes on best practices for contributing to mainline
-   Contributing to the Community? Does your manager support you? -
    ELCE-2011 Satoru Ueda
    -   This is a "how to convince your manager" talk.
-   ELC-2013 rose
-   ELC-2013 chalmers
-   ELC-2014 maupin
-   [Two years of ARM SoC support Mainlining: Lessons
    Learned](http://eLinux.org/images/d/dc/Petazzoni-soc-mainlining-lessons-learned.pdf "Petazzoni-soc-mainlining-lessons-learned.pdf")
    ELC-2014, April 2014, Thomas Petazzoni
    -   Give many good tips, including social ones

### Training, tutorials and challenges

-   The [KernelNewbies web site](http://kernelnewbies.org/) is
    specifically dedicated to helping developers learn how to make
    contributions to the Linux kernel
    -   There's a "To Do" list of small tasks that are ready for
        development, here
        [http://kernelnewbies.org/KernelJanitors/Todo](http://kernelnewbies.org/KernelJanitors/Todo)
    -   See their excellent [Guide to Upstream
        Merging](http://kernelnewbies.org/UpstreamMerge) for a lot of
        good technical and social tips.

-   The Outreach Program For Women has an excellent tutorial on the
    steps for contributing one's first patch to the kernel
    -   [OPFW First Patch
        tutorial](http://kernelnewbies.org/OPWfirstpatch)

-   [Eudyptula Challenge](http://eudyptula-challenge.org/)
    -   This is a series of 20 tasks, managed via e-mail, that help
        people learn how to work with the kernel and submit patches
    -   LWN.net article
        [http://lwn.net/Articles/599231/](http://lwn.net/Articles/599231/)

-   [http://www.tuxradar.com/content/newbies-guide-hacking-linux-kernel](http://www.tuxradar.com/content/newbies-guide-hacking-linux-kernel)

## Specific Projects

-   [CE Workgroup Device Mainlining
    Project](http://eLinux.org/CE_Workgroup_Device_Mainlining_Project "CE Workgroup Device Mainlining Project")
-   [Qualcomm SOC Mainlining
    Project](http://eLinux.org/Qualcomm_SOC_Mainlining_Project "Qualcomm SOC Mainlining Project")
-   [Allwinner mainlining
    effort](http://linux-sunxi.org/Linux_mainlining_effort)
    -   this is a really good page with a write-up of the status of
        mainlined items for each kernel, and what tasks remain

## Notes for Best Practices

### from Andrew Morton

-   Industry should have an embedded maintainer
-   Report problems and requirements upstream
-   Participate in community forums
-   Companies should dedicate a few developers separate from product
    teams
-   Develop product on latest mainline kernel, freeze it at end of
    product development
    -   My aside: Current nature of Android features and board support
        preclude this
-   Ask the community (Andrew) for help

### from Deepak Saxena

-   don't be arrogant - don't assume your experience in proprietary
    development methods translates into open source
    -   be humble and listen to others
-   release early and often
    -   not doing this wastes a lot of time on implementations that get
        discarded, rewritten
-   do your homework
    -   see what's already there in Linux, and whether it can be
        extended to support your case
    -   add to existing abstractions rather than add your uniqe solution
        (be willing to abandon your code, as long as you ultimately get
        support for your feature upstream)
-   don't add OS abstractions (or, HALS for other OSes)
    -   drivers must be Linux native - other layers and abstractions
        complicate the drivers - they can't be maintained by Linux
        kernel developers
-   do add abstractions - don't just solve your immediate problem
    -   write systems that suport multiple related hardware
    -   be willing to generalize
-   do your homework
    -   use mainlining resources
    -   ask informed questions
-   work with the community - treat them as equals on your team
    -   treat external developers input as you would your own team
        members
    -   be respectful

### from Jonathan Corbet

-   why - \<check out the presentation\>
-   difference between proprietary and open source software
    -   proprietary = product-driven, top-down requirements, short-term,
        internal QA, hierarchical decisions, private code base, complete
        control
    -   open source = process-drive, bottom-up requirements, long-term,
        external QA, consensus decisions, public code, little control
-   Understand the patch life-cycle
    -   post early, fix things with community
    -   get to staging
    -   acceptance into mainline
-   post early and often
-   submitting patches
    -   send changes - can influence direction even if not accepted
    -   no: multi-purpose patches - make each patch small and indpendent
    -   make patch serieses bisectable
    -   follow submission rules
        -   use diff -u, no MIME, correct format, Signed-off-by line,
            watch word-wrapping
    -   send to correct place: MAINTAINERS, get-maintainer.pl
    -   listen to reviewers, be polite, don't ignore feedback
-   let go
    -   your code may be re-written or replaced
-   Coding
    -   follow the style guides
        -   not too much (HAL layers, unused parameters, single-line
            functions)
            -   no multi-OS code
        -   not too little - should generalize if there's already
            existing code
    -   don't break APIs
        -   can break internal APIs (only with very good reason), but
            you must fix all in-tree code
        -   NEVER, NEVER break user-space API
    -   don't cause regressions

### from Arnd Bergmann

-   Friend, Fans and Freeloaders
-   don't annoy your kernel maintainer
    -   publish all your code, including device drivers
    -   would really like open source 3d embedded graphics drivers
-   Being part of the community
-   Give and Take
    -   Divide and Conquer
        -   Use public source code
        -   break up source code - make a git branch for each feature
        -   each branch should chance of getting upstream
    -   Riding the Wave
        -   all should be re-based as often as possible
    -   Separate product and development trees
        -   keep development in separate branches
    -   Review
        -   provides learning experience
        -   newcomers can review and learn in the process as well
    -   Respect
        -   reviewers - should acknowledge effort of people working
            hard, even if you have to reject their stuff
        -   submitters - should respect experience and knowledge of
            reviewers - follow their advice even if you don't agree with
            it
    -   Rejection
        -   maintainers - rejecting bad code is more important than
            accepting good code
    -   Responsibility
        -   don't duplicate infrastructure - extend it, generalize it

### From David Arlie

[http://airlied.livejournal.com/80112.html](http://airlied.livejournal.com/80112.html)

* * * * *

you have a long road to walk, but first you have to leave the house

or why publishing code is STEP ZERO.

If you've been developing code internally for a kernel contribution,
you've probably got a lot of reasons not to default to working in the
open from the start, you probably don't work for Red Hat or other
companies with default to open policies, or perhaps you are scared of
the scary kernel community, and want to present a polished gem.

If your company is a pain with legal reviews etc, you have probably
spent/wasted months of engineering time on internal reviews and stuff,
so think all of this matters later, because why wouldn't it, you just
spent (wasted) a lot of time on it, so it must matter.

So you have your polished codebase, why wouldn't those kernel
maintainers love to merge it.

Then you publish the source code.

Oh, look you just left your house. The merging of your code is many many
miles distant and you just started walking that road, just now, not when
you started writing it, not when you started legal review, not when you
rewrote it internally the 4th time. You just did it this moment.

You might have to rewrite it externally 6 times, you might never get it
merged, it might be something your competitors are also working on, and
the kernel maintainers would rather you cooperated with people your
management would lose their minds over, that is the kernel development
process.

step zero: publish the code. leave the house.

(lately I've been seeing this problem more and more, so I decided to
write it up, and it really isn't directed at anyone in particular, I
think a lot of vendors are guilty of this).

* * * * *

\< article is about why you should publish code immediately \>

-   This raises these issues:
    -   why publish early? - because not doing so is possibly twice as
        much work
    -   what barriers are there to publishing immediately:
        -   dependencies!!! (mostly version gap)

## Overcoming Obstacles to Mainlining

Tim Bird has prepared a talk about [Overcoming Obstacles to
Mainlining](http://eLinux.org/Overcoming_Obstacles_to_Mainlining "Overcoming Obstacles to Mainlining")
for ELCE 2014. See that page for information about this presentation and
a link to his slides.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Kernel](http://eLinux.org/Category:Kernel "Category:Kernel")

