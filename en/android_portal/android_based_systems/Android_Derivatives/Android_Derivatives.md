> From: [eLinux.org](http://eLinux.org/Android_Derivatives "http://eLinux.org/Android_Derivatives")


# Android Derivatives



This page has information about systems that are derived from Android.

## Why non-Google Android

-   [http://www.reliableembeddedsystems.com/pdfs/2012-07-03-penguin-and-droid.pdf](http://www.reliableembeddedsystems.com/pdfs/2012-07-03-penguin-and-droid.pdf)
    - presentation by Robert Berger discussing non-Google Android
    markets

## Cyborgstack

This project aims to utilizes the Android system in other product
categories, including deeply embedded:

-   web site: [http://www.cyborgstack.org](http://www.cyborgstack.org)
-   wiki: [http://wiki.cyborgstack.org](http://wiki.cyborgstack.org)
-   github:
    [http://github.com/cyborgstack](http://github.com/cyborgstack)
-   twitter: @cyborgstack
-   list:
    [http://lists.cyborgstack.org/listinfo/dev](http://lists.cyborgstack.org/listinfo/dev)

### Headless Android

From:
[https://lkml.org/lkml/2012/2/15/443](https://lkml.org/lkml/2012/2/15/443)

As an FYI, I thought some of you might be interested in knowing that
Android's user-space can be modified to run on headless systems (i.e.
without a framebuffer.) IOW, you can configure the FB stuff completely
out or have a kernel port that doesn't have an FB (yet?) and still run
the Android use-space.

I've put this up as part of the Cyborgstack project:

    $ repo init -u git://github.com/cyborgstack/android.git -b headless
    $ repo sync
    $ ...

The relevant presentation from the Android Builders Summit is here:
[cyborgstack-120213.pdf](http://eLinux.org/images/6/6f/Cyborgstack-120213.pdf "Cyborgstack-120213.pdf")

Essentially, Headless Android is the AOSP but WITHOUT:

-   SurfaceFlinger
-   WindowManager
-   WallpaperService
-   InputMethodManager

It gives you is all the Android framework but for ui-less systems (no
FB.) What it means, is that, save for Activities, you can use the
standard Android development tools (Eclipse, SDK/NDK, etc.) to create
apps that use:

-   ContentProviders
-   Services
-   BroadcastReceivers

Why would you want this instead of using "Embedded Linux"? Honestly I
was very skeptical when some developers first mentioned to me that they
were interested in doing this. I was in fact very dismissive of it. But
I kept getting more and more inquiries about this. So I decided to bite
the bullet and give it a try.

Now that I have, I think there are 2 clear benefits to using this
instead of "embedded Linux": 1) you get one platform for all your device
development, whether it has a UI or not 2) your devices become
programmable by any developer that knows the Android API (and, as you
may know, there's growing number of those.)

That said, what I've done is very much a proof of concept. It's in fact
a dirty hack at this point. Please don't ship this just yet. It needs a
lot more eyeballs and certainly a lot more work. But, it's good enough
to give you a taste of what's possible and allow you play with it.

Cheers,

-- Karim Yaghmour


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

