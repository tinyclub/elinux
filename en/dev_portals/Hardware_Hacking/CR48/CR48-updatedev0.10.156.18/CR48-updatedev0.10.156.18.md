> From: [eLinux.org](http://eLinux.org/CR48-updatedev0.10.156.18 "http://eLinux.org/CR48-updatedev0.10.156.18")


# CR48-updatedev0.10.156.18



# 0.10.156.18

## Wednesday, February 9, 2011


Dev channel was updated to 010.156.18 tonight. The most significant
update appears to be Adobe Flash 10.2. Chrome browser is at version
10.0.648.49 which means it should include all the fixes noted in the
Chrome releases blog yesterday.


Note that if you go to about:plugins, Flash still reports 10.1, you have
to click Details at the top right to see the 10.2 version file, not sure
why this is. The big question is how does Flash perform? I was able to
play a 720p Youtube video with decent performance. I've yet to try other
flash content like Hulu and Netflix. Update: Commenter Dave pointed out
that Netflix doesn't use Flash, it uses Silverlight, silly me.


Update: No go on Netflix, they still list Chrome OS as incompatible.
There also seems to be a sound bug. It worked fine until I tried to turn
the volume up at which point the onscreen showed the volume as muted. No
pressing of the volume up down or mute keys would undo the mute :-(


2nd Update: Ouch! This one might get ugly. I logged out to see if the
sound might return with a new session. Instead of the login screen I was
greeted with the Out of box "Let's get started" screen! Looks like some
issues with detecting that I've already run through the setup. Luckily
once I ran through that and logged in, my user settings were untouched.
Well, when you live on the bleeding edge, sometimes you've got the edge
and sometimes you just stand there bleeding... Gonna try a reboot
now...


3rd Update: Volume control buttons are definitely borked. As a
workaround, open a shell and run "alsamixer" to use a non-GUI volume
control, it works and can unmute the sound or adjust volume when
needed.


4th Update: I toggled the Dev switch under the battery this morning in
order to wipe the stateful partition (wipe to factory defaults). That
appears to have gotten rid of the volume issue and the strange return to
OOBE on logout or reboot issue. 720p videos are jerky but I'd
characterize it by saying that flash support is definitely improving
with plenty of room for more improvement.


5th Update: It seems that although Flash 10.2 is included, 10.1 is also
still included and is the default. You can disable 10.1 by going to
about:plugins, clicking Details to the right and clicking Disable next
to 10.1.


-   From
    [http://chromeos-cr48.blogspot.com/2011/02/dev-channel-update-01015618.html](http://chromeos-cr48.blogspot.com/2011/02/dev-channel-update-01015618.html)




[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

