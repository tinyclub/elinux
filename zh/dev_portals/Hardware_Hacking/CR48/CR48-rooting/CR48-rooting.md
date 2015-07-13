> From: [eLinux.org](http://eLinux.org/CR48-rooting "http://eLinux.org/CR48-rooting")


# CR48-rooting



# Rooting the CR48

-   You need to be somewhat versed in Linux for any of these mods.

1.  Turn off the Cr-48. Make sure you have a pen nearby or this is going
    to be difficult.
2.  Flip the Cr-48 over.
3.  Remove the battery.
4.  Right beside the battery contacts there is a small bit of black
    tape. Take the tape off.
5.  There is a white switch under the tape. For user mode, the switch is
    away from the battery contacts. Use your pen to switch it towards
    the contacts.
6.  Put the battery back in and start the machine. There’s an ominous
    message but you can hit CTRL+D to get past it. If you do nothing the
    device will eventually beep and start the process into developer
    mode.
7.  The C-48 will wipe itself and replace the image with a developer
    copy. This takes 5-6 minutes.
8.  You’ll need to go though the initial setup process again.
9.  Once you get logged in, you can hit CTRL+ALT+T to get to the
    terminal.
10. While you can get to this shell in user mode, this terminal offers
    an extra command to use. To see all commands type “help”.
11. Type “shell” to drop to a full bash shell. You’ll be the special
    user named chronos.
12. Type “sudo su”

Rooted!

-   Now that you've rooted, you also need to make the root partition
    writable, and turn off boot verification.

-   Open a shell (CTRL-ALT-T, then type shell)

` sudo su /usr/share/vboot/bin/make_dev_ssd --remove_rootfs_verification reboot`

-   Then:
-   Open a shell again (CTRL-ALT-T, then type shell)

` sudo su mount -o remount,rw / mount -o remount,exec /mnt/stateful_partition`

-   If you don't want to remount the stateful partition after each boot,
    you can follow [Make the /mnt/stateful partition exec
    friendly](http://eLinux.org/CR48-stateful-exec "CR48-stateful-exec")




[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

