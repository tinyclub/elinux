> From: [eLinux.org](http://eLinux.org/Session:_Developer%27s_Diary:_It%27s_About_Time_ELCE_2011 "http://eLinux.org/Session:_Developer%27s_Diary:_It%27s_About_Time_ELCE_2011")


# Session: Developer's Diary: It's About Time ELCE 2011



## Contents

-   [1 Session Details](#session-details)
    -   [1.1 Abstract](#abstract)
    -   [1.2 Biography](#biography)
    -   [1.3 Notes](#notes)
-   [2 Transcript](#transcript)

## Session Details

 Event 
[ELCE 2011](http://eLinux.org/ELCE_2011 "ELCE 2011"), Prague

 Date 
28.10.2011

 Presenter 
Wolfram Sang

 Organization
Pengutronix

 Slides 
[PDF](http://eLinux.org/images/5/54/Elce11_sang.pdf "Elce11 sang.pdf")

 Video 
[|
HD](http://free-electrons.com/pub/video/2011/elce/elce-2011-sang-developer-diary.webm)
[|
SD](http://free-electrons.com/pub/video/2011/elce/elce-2011-sang-developer-diary-450p.webm)
thanks to [| Free
Electrons](http://free-electrons.com/blog/elce-2011-videos/)

 Duration 
00:49:00

### Abstract

    A Talk about timeouts and delays.

### Biography

### Notes

## Transcript

 Transcribed by
Peter Huewe

 Verified by
1 -

*Introduction of and by Wolfram Sang*

My talks which I usually entitle “Developers Diary” I want to share
experiences I made in my everyday work I want to [show you] problems I
encountered, things I've found out [and] try to give best practices. As
Linux in general is a very huge project and I pretty much want [...]

A lot of people think “oh my problem [fits here] as well” - so if you
have something to add, feel free to do so. I hope at the end of the talk
we're all a bit enlightened than before.

This time I want to talk about dealing with time in device drivers and I
chose to talk about two groups:

The first I will be talking about [are] delays, when you deal with
hardware and sometime you activate something and have to wait for a
certain amount of time until something happens.

And the second will be timeouts, you do something and if it not does
something in a certain time you'll have to deal with it.

Both are not very complicated matters [on their own] but let's have a
look:

- The basics of delays:

There are two kinds, usually, One [called] busy waiting: the cpu burns
cycles while waiting and the other one is blocking: you say “okay I’m
going to wait, let me go to sleep, and you’ll come back later so the cpu
can do something in between”.

[*Poll:*] Who knew this before? Okay that's what I kinda expected, so
I'm not telling you rocket science. I know that.


 [*Poll:*]Who is writing device drivers for the linux kernel here? [*few
hands rise*] Great! That's the audience I was hoping for. So let's get a
bit interactive - [*Q*] What kind of delay functions do you know
[*responses by the audience*] - schedule Does it delay? - udelay -
mdelay - sleep – which ones - usleep -msleep we're getting into
discussion already -usleep\_range -ndelay ? - nanosleep? -
msleep\_interruptible Not bad – was it all? [*Guy in the audience
joking*] a for cycle loop Is there an sdelay\`?

So let’start with the solution:

    - ndelay
    - udelay
    - mdelay
    luckily no sdelay
    no usleep
    - usleep_range  which you can give a time frame
    - msleep
    - msleep_interruptible
    - ssleep

But it's already interesting to see that here, as you just recognized
here are quite a bunch of people doing kernel code and there seems to be
some agreements and disagreements of what is available.

And now think about implicit things which might happen in the
back[ground] [...]

There can be things happening you're not expecting or whatever so it's
really pays off to have a look at this once in a while so you get the
foundations right so you're really knowing what you're doing when you're
using such functions.

Let’s have a short look at the delay headers. [*opens
include/linux/delay.h*]

I’ll call this talk a little bit ARM specific - I hope nobody will be
angry about being ARM specific, but it basically applies to all platform
- because one of the thing that’s interesting is that the delay
functions for ARM are architecture specific.

So this is a general Linux header file – and you can see here in those
lines that [...] for mdelay there is a fallback so if the architecture
does not define it basically falls back to udelay.

There’s also an ndelay, the general fall back if the architecture does
not define one is based on udelay – so that udelay seems to be a pretty
important function in all that.

We see msleep, msleep\_interruptible, usleep\_range and ssleep, they are
all defined here, so they are independent of the architecture. If we
look at the architecture specific implementation of udelay, which we
just found out is a very core function, you see that in the arm case
it’s not even a function but the first […] encounter with a define,
which tracks if it’s a constant value or not.

That’s the places where you have to look if you want to dive in deeper.

* * * * *

So how I got interested in the topic was we had a customer problem and
he said “yeah the system is working fine but when we press the touch the
system becomes unusable and further analysis have shown that 25% of the
cpu was busy doing something”.

I first expected an interrupt storm or whatever but that couldn’t be
found out so I started looking at code, especially at the touchscreen
driver and this was the thing I found. [*slide shows the function in
drivers/input/touchscreen/wm9712.c*]

This is a delay inside the driver, which takes a value from the
[lookup]table and [the] array offset is given to the function, which is
(as you can see on the next slide) more or less a module parameter. It
says “okay we need that to get the correct value. The delay can be set
by setting the delay to n where n is the array position of the delay in
the array table below.” This is not very transparent to the user; it is
said “long delays for 1ms are supported for completeness but are not
recommended” – that’s a very useful comment but it’s totally invisible
for the user using the module.

That’s what happened to our customer – I think it was also caused little
bit broken hardware – he didn’t get the touch[screen] working so here’s
the “mighty table” which is feeding the udelay. The standard is this one
[indicating 200us], so it will in general burn like 200 us, our customer
ended up being here [indicating 3ms] – so on a regular basis for every
poll this routine was nearly burning 3ms – and this was indeed the cause
for the total cpu loss, so it just lost all the cpu power doing nothing.
Sadly this is still in the kernel – because once the problem was found
out, the customer said “yeah we can fix that”, and took the hardware
away from me, so I think they did some nasty stuff to get it working –
so this is still present in the kernel, sadly.

So this gave me the idea – udelay is a pretty dangerous function.



0:00 - 1:00:

1:00 - 2:00:

2:00 - 3:00:

3:00 - 4:00:

4:00 - 5:00:

5:00 - 6:00:

6:00 - 7:00:

7:00 - 8:00:

8:00 - 9:00:

9:00 - 10:00:

10:00 - 11:00:

11:00 - 12:00:

12:00 - 13:00:

13:00 - 14:00:

14:00 - 15:00:

15:00 - 16:00:

16:00 - 17:00:

17:00 - 18:00:

18:00 - 19:00:

19:00 - 20:00:

20:00 - 21:00:

21:00 - 22:00:

22:00 - 23:00:

23:00 - 24:00:

24:00 - 25:00:

25:00 - 26:00:

26:00 - 27:00:

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

