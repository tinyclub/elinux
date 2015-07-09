> From: [eLinux.org](http://eLinux.org/MagicSysRq "http://eLinux.org/MagicSysRq")


# MagicSysRq



* * * * *

**Note**: This article is currently only a draft and is a part of a
series of articles I'm going to publish the next few months - if you
want to contribute to it, please feel free to. However it would be nice
if you could coordinate your efforts with
[me](http://eLinux.org/User:Peter_Huewe "User:Peter Huewe")

This article is still work in progress and still needs a lot of effort.

* * * * *

## Contents

-   [1 Introduction](#introduction)
-   [2 Example](#example)
-   [3 Troubleshooting](#troubleshooting)
-   [4 Important Files](#important-files)
-   [5 External links](#external-links)

## Introduction

MagicSysRq is a special key combination which lets the user perform
certain low level tasks of the kernel and is especially useful when the
whole system seems to be hung. MagicSysRq e.g. makes it possible to,
more or less, cleanly shutdown a system, which doesn't even respond to
CTRL+ALT+DEL any more.

The MagicSysRq functions are invoked by pressing ALT+SysRq+Function Key
where function key describes one of the following.

TODO:Insert table here



## Example

The probably most used combination of MagicSysRq functions is the one
RSEIUB, which can be easyly remebered by the mnemonic trick \`\`Raising
Elephants is so utterly boring*\\footnote{\`\`You can still find several
references the* mnemonic *Raising Skinny Elephants is utterly boring* on
the internet - however it is probably better to do the sync after the
tasks exited/were killed} - although we're dealing with penguins here ;)
According to the table above this performs, in order: R Put Keyboard in
Raw Mode E terminate all tasks I kill all tasks S Sync U remount all
filesystems read-only B Reboot

## Troubleshooting

You can easily and safely check whether MagicSysRq works on your System
by pressing Alt+SysRq+H - on a console you should now see a short help
text of the MagicSysRq Feature or at least print this to \`dmesg\`.

If you don't see the help text, check whether CONFIG\\\_MAGIC\\\_SYSRQ=y
is set in your Kernel Config. If it is set, please check the output of
'cat /proc/sys/kernel/sysrq' which should report 1 if MagicSysRq is
enabled. To enable it just do a simple echo 1 \> /proc/sys/kernel/sysrq



## Important Files

/proc/sys/kernel/sysrq - enable/disable MagicSysRq at runtime
/proc/sysrq-trigger - trigger MagicSysRq from the console (e.g. useful
over ssh)






 TODO Content:

-   Explanation of remaining keys
-   using it over serial line -\> BREAK+key, in kermit ctrl-\\ b KEY
-   Interaction with KDB
-   Interaction with kexec / crashkernel



## External links

-   [Wikipedia Article about
    Magic\_SysRq\_key](http://en.wikipedia.org/wiki/Magic_SysRq_key)
-   [Kernel
    Documentation/sysrq.txt](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=Documentation/sysrq.txt;hb=HEAD)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")
-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")

