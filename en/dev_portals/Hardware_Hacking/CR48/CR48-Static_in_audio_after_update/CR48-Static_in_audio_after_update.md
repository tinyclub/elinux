> From: [eLinux.org](http://eLinux.org/CR48-Static_in_audio_after_update "http://eLinux.org/CR48-Static_in_audio_after_update")


# CR48-Static in audio after update



## Fix for static audio noise on latest dev and beta update

If you've been updated to the latest beta or dev release of Chrome OS on
your Cr-48, you may have encountered issues with audio. After a few
minutes of playback, all you'll hear is an irritating garbled noise.
Google's aware of the issue and working on an official fix. But I've
come up with a quick workaround solution. As always, you should be aware
that making changes to your Cr-48 could go bad, be ready to run a USB
Recovery if necessary.

-   Your Cr-48 must be [rooted](http://eLinux.org/CR48-rooting "CR48-rooting").
-   From root, run the command:

` wget -O - http://cr-48-ubuntu.googlecode.com/files/fix-sound.sh | sh -`

-   That's wget, space, dash, capital o, space, dash, space, etc. The
    command is case sensitive!
-   Reboot. Audio problems should be fixed!

The fix works by removing the nmi\_watchdog=1 argument from the kernel
boot command line arguments. It was added in the recent updates and
seems to be causing the audio issues. I've tried disabling the watchdog
temporarily with "cat 0 \> /proc/sys/kernel/nmi\_watchdog" but that
doesn't seem to work, nmi\_watchdog needs to be off from boot to fix the
issue.


[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

