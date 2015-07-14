> From: [eLinux.org](http://eLinux.org/Session:kernel.org_development_and_the_embedded_world "http://eLinux.org/Session:kernel.org_development_and_the_embedded_world")


# Session:kernel.org development and the embedded world



## Contents

-   [1 Session Details](#session-details)
    -   [1.1 Abstract](#abstract)
    -   [1.2 Biography](#biography)
    -   [1.3 Notes](#notes)
-   [2 Transcript](#transcript)

## Session Details

 Event 
ELC 2008 (Mountain View)

 Date 
April 16 2008

 Presenter 
Andrew Morton

 Organization
Google

 Slides 
[Media:Morton-elc-08.ppt](http://eLinux.org/images/c/ce/Morton-elc-08.ppt "Morton-elc-08.ppt"),
[Media:Morton-elc-08.pdf](http://eLinux.org/images/b/bf/Morton-elc-08.pdf "Morton-elc-08.pdf")

 Video 
[http://free-electrons.com/pub/video/2008/elc/elc2008-andrew-morton-keynote.ogg](http://free-electrons.com/pub/video/2008/elc/elc2008-andrew-morton-keynote.ogg)

 Duration 
55 minutes

### Abstract

Andrew will summarize the kernel.org development and decision-making
processes. Special focus will be placed upon how they impact the
developers of Linux for embedded products, including the economics of
using a modern kernel versus staying on a frozen older kernel version,
and the economics of maintaining private patchsets versus merging work
back into the public kernel. For those who choose to work with the
kernel.org team, Andrew will look at how that can most effectively be
done. Andrew works with Linus Torvalds and other members of the Linux
development community (including open source developers and distribution
vendors and industry contributors) to shepherd new features and quality
improvements into the Linux kernel.

### Biography

Andrew has worked at Nortel Networks' R&D labs, and Digeo Interactive, a
maker of digital home entertainment products. He is currently employed
by Google, working fulltime on the Linux kernel. His long experience
with Linux development, and experience in the embedded realm, give
Andrew a unique and valuable perspective on the issues facing embedded
Liux developers.

### Notes

Reports on this talk are at:
[http://lwn.net/Articles/278647/](http://lwn.net/Articles/278647/) and
[http://www.linuxfordevices.com/c/a/News/Linux-kernel-maintainer-calls-for-embedded-specialist/](http://www.linuxfordevices.com/c/a/News/Linux-kernel-maintainer-calls-for-embedded-specialist/)

## Transcript

 Transcribed by
Tim Bird

 Verified by
1 -

0:00 - 1:00:

[Introduction by Tim Bird]

1:00 - 2:00:

[Introduction continues...]

2:00 - 3:00:

[Introduction continues...]

Thanks, Tim. Yeah I actually go back in embedded a long way. I started
my career as a hardware designer and I'm actually an electrical
engineer.

3:00 - 4:00:

I used to do a lot of board level design, and do the operating system,
the firmware, and the bringup, and device drivers, and all that sort of
stuff. And it was sort-of mid-career that I started actually seriously
programming these big machines.

Anybody here who was at the Monta Vista conference last year will find
what I have to say today eerily familiar. And I'm sorry about that, but
it bears repeating. I know my kids need to be told the same thing more
than once before they'll do it.

[Slide 1 Overview] So what I was going to talk about today - I'm going
to assume that the audience here are people who don't actually work on
Linux for Linux' sake, per se. You in fact use Linux as part of
developing some other product. It's just a tool which you use to deliver
something to your customers.

What I won't be addressing today is the ongoing day-to-day interaction
which contributors such as yourselves should make with the kernel.org
team.

4:00 - 5:00:

That's the subject of another presentation, that I won't be covering
that topic.

Certainly, we can get on with that during question and answer session.
How long do we have in here, is it a full 60 minutes? ... 50 minutes.
OK. There's probably about 35 or 40 minutes worth of material. I would
encourage people to think of, and save up questions at the end.
Generally I don't like these things to be a me-to-you. It's important
that they're also you-to-me, because I am here to serve you people. You
are my customers. You need to tell me how I'm going.

I'll do a bit of amateur economics about what I believe to be the
economics which is unique to embedded development, and how and why that
impacts the interaction that embedded developers have with the
kernel.org team;

5:00 - 6:00:

Discuss what we'd like to call "patch hoarding", sitting on a pile of
patches and why this can be a bad thing to do; Look at the reasons why
you might be ... to merge your features into the upstream kernel rather
than maintain them yourself; Look at which kernel version you might
choose to use in your product development; Discuss what level of support
the public kernel developers can give to you, and why they will support
you in your product development; and then I'll spend a bit of time
talking about how we, or more specifically I, make decisions about what
things should be merged into the upstream kernel, and what the criteria
are for making that decision.

[Slide 2 - The economics of Linux-for-embedded]

So looking at the economics of Linux on embedded systems, I think the
key difference with embedded is that usually there is no plan to upgrade
the version of the kernel running on the product.

6:00 - 7:00:

You develop the product, you build the software, the application stack,
the kernel. And you bundle it all together, and mostly push it out. You
may, maybe will update the kernel sometimes, but you don't expect your
customer to do it. It's an embedded product.

This is radically different from the desktop and server world where
upgrades are expected. In fact you don't even know what kernel your
customer will be running in the first place. He might be running a
RedHat Enterprise kernel, or an OpenSuse kernel, or Mandriva or
anything. And also the kernel will be upgraded across the lifetime of
the hardware. That's a critical difference because then you need to plan
for that upgrade.

Another difference between embedded and the server/desktop world is that
the software for embedded is delivered directly from the hardware
manufacturer.

7:00 - 8:00: It doesn't come from some other 3rd party.

Now one exceptional case in all of this thinking is the case of the
hardware manufacturer. ... that's the Intel, ARM, Atmel, Analog, people
like that, who make hardware which they then sell to other customers,
and those customers will then deliver embedded products using that
hardware.

Those companies are in a similar position to the desktop and server
hardware manufacturers, in that they are motivated to make Linux run as
well as possible on their particular hardware, so that they'll pick up
more customers.

So what we're seeing at present in the kernel world is a lot of
contributions coming from companies such as those, who sell hardware
into embedded developers, rather than actually developing embedded
products themselves.

8:00 - 9:00: So that is for similar logic as you would see with the
desktop and server world.

Another thing we see - and I don't really know why it is - the embedded
segment just doesn't seem to have as much money. They tend to be smaller
companies, with shorter time to market, and quicker turn-around times.
So they can't really afford the luxury of having people who are
dedicated to working on the open source software. They have to get
product out the door.

The net effect of all this is that, I believe, that the embedded segment
is under-represented in the development of the kernel.org kernel,
compared to the overall importance of embedded in the Linux world. It's
still the case that most of the people who are paid to work on Linux are
really keyed towards the server products.

9:00 - 10:00:

Things have improved, mainly from the contributions from the embedded
chip manufacturers. And sometimes that's indirect. For example, two of
our entire embedded architectures are in fact maintained by David
Howels, who's at RedHat. I expect that's on a contract basis with the
companies who actually make those chips.

[Slide 4 - Effects of embedded's under-representation]

Now if my theory is correct, and embedded is in fact under-represented
in kernel.org development, that will obviously have a few effects.

One is, that there will be a risk that it will tilt development to be
excessively focused on the server and desktop side, and not sufficiently
focused on the embedded side. And we regularly get accused of being
excessively focused on servers, and not focused enough on desktop.
Which, there's some truth to that, but not as much as one might think.

10:00 - 11:00:

The fact is that the people who work on kernel.org - particularly those
people who you might like to call the leaders of the project - we do
care a lot about Linux on the embedded system, even though we really
don't have a business case for doing so. We want Linux to run as well as
possible on embedded. We think it's cool. So we care about it a lot.

So a strong part of kernel development culture is any change which comes
into the kernel does need to be scrutinized for its impact on small
systems. That's laptops down to very small embedded devices. And if we
decide a feature is too heavily oriented towards multi-processor
systems, or uses too much memory, or whatever, it will need to be
re-worked.

Now, we generally do this by code inspection. We don't actually do it by
testing and measuring its memory footprint effects. Things can and do
slip through. We could always do with some help there, reviewing and
testing changes to make sure that their impact upon embedded is either
zero or beneficial.

11:00 - 12:00: But, as I say, we mainly - most of the work we do looking
after embedded is making sure that the work which is really geared
towards server doesn't damage embedded too much. We don't actually spend
much of our time overtly trying to improve embedded systems. It's just,
"Let's work on server stuff, and not damage embedded too much".

And that's unfortunate.

I can't really identify anybody who sits there and works on the Linux
kernel specifically to make it better for embedded systems. There're a
lot of people who work down in the architecture code, and devices
drivers, and all sorts of things, that are keyed towards embedded. But
there is no single person I can go to who is \*the\* embedded
maintainer.

12:00 - 13:00: Now a number of the embedded guys do work on embedded
peripherally. David Howells who looks after two of the embedded
architectures, for example, does a bit of work on the no-MMU port, and
on various executable file formats, and things. But there's no single
person sitting there on top of the Linux kernel who is the go-to person
to look after embedded, to add new embedded features to the core kernel,
etc.

Matt Mackall was doing it for a while, I believe under contract with
CELF. But that's certainly not a full-time effort.

So, I think if we did have one person who was the embedded top level
person, not oriented towards any particular architecture, that person
would be pretty effective. There's a lot of work they could do to make
significant benefit for the overall embedded users of the kernel.

13:00 - 14:00: [Slide 5 - How you can help kernel.org development]

Now if you are, for example, a person who is developing an embedded
product for a company, that's based on Linux; If you're generally
interested that Linux will run as well as possible on your product - We
need your help.

And generally people think help means sitting down until 2:00 o'clock in
the morning writing kernel patches and sending them to Andrew. But
that's not necessarily the case. There are a lot of things that people
can do which are [???] than sitting down and writing patches.

One is simply telling us what your pain points are - what the Linux
kernel is not doing for you as well as you would like it to do. Often we
just don't know. Some people know, for example, that boot-up time is a
problem.

14:00 - 15:00: But people don't really think about it a lot while
they're coding. Nobody actually sits there and tries to optimize bootup
time.

We know about memory footprint - always careful about that. But we're
not particularly sophisticated in addressing the needs of embedded. So
it would really help if we had some people - some more senior,
sophisticated people - who have experience in the embedded world, simply
to tell us when we're doing things wrong. To tell us what features are
important to them and what aren't. Simply so we can prioritize our work
in a way that optimizes the kernel for embedded platforms.

Tell us what we're missing - I mean, I don't think I've seen anybody
come up and say, "Look WindRiver, or PSOS or whatever does this, that
and that, and Linux doesn't. And it's a gap."

If you think there are things that Linux should do which competitive
operating systems do, well, let us know. We might not do anything about
it, but at least we'd know about it and over time, people will help
prioritize people's work.

15:00 - 16:00:

And, help people understand what things are beneficial to the most
number of users as they work on the Linux kernel.

I find there are a lot of people who are monitoring the mailing lists,
the websites, the release announcements and that sort of thing. And
often I come to conferences and people tell me things I didn't know.

That's bad.

I shouldn't not know anything. If you know something which is
potentially of use to the kernel team, to help guide in their
development, for heaven's sake tell us. And a way to tell us is by
sending an e-mail to you-know-which mailing list.

Tell us what you need.

Because there's no way that we can do it if we don't know that it's a
need.

Another way in which a person can contribute to kernel.org development
is to review the patches as they go past.

16:00 - 17:00:

You can help us to check that a change will not damaging to embedded in
any way. You may see a feature which is close to what you need, but it
needs a few tweaks to be more useful. Please tell us!

Reviewing the patches, checking them for correctness and suitability for
your application is direct contribution and it's not a lot of work.

"The Squeaky gate get the oil" is an old English phrase in that the
person who makes the most noise, is the one who gets the most attention.
And I'm afraid that's how kernel work happens.

There's historically been a group of people who were very good at making
a lot of fuss about, for example, latency on the desktop. And as a
consequence, quite a lot of developers and resources have been devoted
to improving latency on desktops for multimedia applications and gaming.

17:00 - 18:00:

And that wouldn't have happened if those people hadn't come on the
mailing list and made us look bad. So if you want something done, come
on the mailing list and make us look bad. Chances are, it will happen.

[Slide 7 - Patch hoarding]

What I see quite frequently is embedded groups and others mainly at
companies working on embedded products, will tend to sit - and probably
you all do this, you tend to sit on your own little pile of patches
which you think are only relevant to your product, and you will maintain
them out of tree. Consequently, those patches get larger and larger and
uglier and uglier and older and older and they become harder and harder
to merge up, and they basically never get merged into the mainline tree.

18:00 - 19:00:

It's quite a bit of work to merge a patch to into the mainline tree. I
hope the main reason why people sit on their work without sending it
upstream is because it's quite a lot of work to get it upstream. But
I've also heard of companies who like to keep the patches to themselves
because they believe they will be beneficial to their competitors.

Sorry, that's not a good reason.

This is an open source product. Yes, it will potentially be some small
damage if your software becomes available to your competitors. But I
think you have to see that as the price of admission to using Linux.
It's an open source product. Everybody else is contributing into it. You
have at the very least a moral, if not a legal obligation to contribute
to it yourself.

Another problem of course with patch hoarding is that it gets
increasingly expensive over time, particularly as you roll forward
through kernel versions.

19:00 - 20:00: And so I would encourage people to make a big effort to
get these patches merged up. And I'll be talking about that quite a bit,
later on.

[Slide 8 - Why merge upstream, The pros]

Now look at the logic for what might be your reasons for merging you
code up in the kernel.

We do have - it's variable, but normally we do have very strong review,
integration, testing, and releasing process. So your code will be gone
through with a tooth comb, and as a consequence of that, the code will
be better, by the time we merge it - unless it was already very good.

A big advantage, of course, is once your code is merged with the public
kernel your cost for maintaining that code falls close to zero. You no
longer have to maintain a patch set. You no longer have to re-merge it
and re-test it each time you have to roll forward to a new kernel
version.

20:00 - 21:00:

You will find that others will add new features to it, and they will
improve its performance. Other will fix bugs in it. Others will test it,
and it will generally improve as time goes by. And of course when people
make changes to the core kernel, rather than breaking your code, they
will fix it on the fly and you will never see a difference.

A major reason for merging, particularly if it's a significant feature -
another reason for merging with the mainline kernel, is that once you've
merged you have won. If there are any other competing implementations of
a similar feature out there, they will die. Because if you have, say,
it's a particular block-based filesystem, or something like that, if you
merge that, and it's a good enough block based file system, all the
other ones are eventually going to wither.

21:00 - 22:00:

Now if you happen to not merge your code upstream, and somebody else
merges their code, then it's your code that going to wither as well. So
you're then looking at either having to maintain your alternative
implementation for all time, or you'll need to migrate your existing
users and applications, from your own implementation over to the one
which is in the kernel, which can be quite expensive in terms of re-work
and migration costs, backporting, etc.

It's not a thing which people normally think about when considering
merging upstream - but being the first to merge a feature can make it
easier for yourself, and harder for your competitor.

[Slide 9 - Why merge upstream? The cons]

On the other hand.

22:00 - 23:00: Just going back to that. One thing I like to do when I
see somebody merging a feature is to sort of run around the industry and
find out who else is interested in this feature. Who are the other
stakeholders? You may find that if you and another company have a
feature which do pretty similar things, but in a different way, I will
try to identify that other guy. And get them to comment on your work,
and find out what their take on it is. Get their input. And as a result,
that feature may become more generalized, so it will address their
requirements as well. That way we can possibly get them working on it
also.

This has happened a number of times in the past.

Now, what might be the problems with merging your code upstream?

Obviously, it does require work. It requires a considerable body of
work. Often what we see is some company will sit there in cathedral
mode, and they'll develop their feature and it's all beautiful and it's
ready and they'll send it off to Andrew.

23:00 - 24:00: Then the world comes tumbling down, because all sorts of
things are found wrong with it. Large amounts of re-work need to be
done. That's because they made the mistake of not releasing it
sufficiently early - trying to get it too complete before they released
it.

You should solicit feedback at the earliest possible stage so that you
can get some estimate of how much work will need to be done - whether
it's just completely un-viable or unacceptable, find out if somebody
else has another implementation coming down the pike, etc. When looking
to merge upstream you should, even if the code is not ready, get it out
there for people to look at and comment on and provide you some
guidance.

What can happen, I think, is people have a certain time and dollar
amount set towards merging the code upstream. They budget it. They send
the code, and then suddenly find that they have a couple months more
work to do.

24:00 - 25:00: And they haven't budgeted for that, because it was
unexpected. But, code doesn't have to be complete before we'll look at
it. So get it out earlier please. It will help all parties.

Another problem with merging the code upstream can be that significant
changes might be asked, or you might be asked to make significant
changes to it. One thing we particularly look closely at is the
user-space to kernel interfaces. We really care about interfaces.
Because, the internals, you know, we can change them. We can do
absolutely anything we like with the internals of the implementation.
But once we've released it, one thing we cannot change is the
kernel/user-space interfaces. We have to get that right.

Consequently, you may find that when you submit a significant feature
into the public kernel, people will zoom in on the kernel/user interface
and request that it be changed.

25:00 - 26:00: Of course this is rather nasty if you're already running
that code with the particular user interface. Because you've already got
all sorts of migration added to all your other problems.

Sorry. There's no real fix for that. Except for getting your code out as
early as possible, so you're not too far committed to existing code
before you submit ...

Another downside is, of course, a feature becomes more easily available
to your competitors. I don't have a fix for that. Sorry. Except to say
that's just part of the cost of doing business with Linux. It is not
BSD. It's a GPL product. And, view that contribution as the price of
admission.

26:00 - 27:00: [Slide 10 -

27:00 - 28:00:

28:00 - 29:00:

29:00 - 30:00:

30:00 - 31:00:

31:00 - 32:00:

32:00 - 33:00:

33:00 - 34:00:

34:00 - 35:00:

35:00 - 36:00:

36:00 - 37:00:

37:00 - 38:00:

38:00 - 39:00:

39:00 - 40:00:

40:00 - 41:00:

41:00 - 42:00:

42:00 - 43:00:

43:00 - 44:00:

44:00 - 45:00:

45:00 - 46:00:

46:00 - 47:00:

47:00 - 48:00:

48:00 - 49:00:

49:00 - 50:00:

50:00 - 51:00:

51:00 - 52:00:

52:00 - 53:00:

53:00 - 54:00:

54:00 - 55:00:

55:00 - 56:00:

56:00 - 57:00:

57:00 - 58:00:

58:00 - 59:00:

59:00 - 60:00:


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Event
    Session](http://eLinux.org/index.php?title=Category:Event_Session&action=edit&redlink=1 "Category:Event Session (page does not exist)")

