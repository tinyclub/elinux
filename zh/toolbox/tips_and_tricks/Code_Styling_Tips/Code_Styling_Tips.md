> From: [eLinux.org](http://eLinux.org/Code_Styling_Tips "http://eLinux.org/Code_Styling_Tips")


# Code Styling Tips



Here are some miscellaneous tips for good code styling:

## Proper Linux Kernel Coding Style

See the kernel coding style guide in any kernel source tree at:
Documentation/CodingStyle (Online
[here](http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;f=Documentation/CodingStyle;hb=HEAD))

Greg Kroah-Hartman wrote some additional tips in his article: [Proper
Linux Kernel Coding Style](http://www.linuxjournal.com/article/5780)

Michael S. Tsirkin made a [kernel guide to
space](http://www.openfabrics.org/~mst/boring.txt) (*a boring list of
rules*) which got polished on a worth reading
[thread](http://thread.gmane.org/gmane.linux.kernel/317744) in LKML in
2005.

### use of \#ifdefs

Rob Landley writes:

Read:
[http://doc.cat-v.org/henry\_spencer/ifdef\_considered\_harmful.pdf](http://doc.cat-v.org/henry_spencer/ifdef_considered_harmful.pdf)

Personally, I tend to have symbols \#defined to a constant 0 or 1
depending on whether or not a function is enabled, and then just use
if(SYMBOL) as a guard and let the compiler's dead code eliminator take
it out for me at compile time (because if(0) {blah;} shouldn't put any
code in the resulting .o file with any optimizer worth its salt. Borland
C for DOS managed simple dead code elimination 20 years ago...)

## See also

[Sparse](http://eLinux.org/Sparse "Sparse")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

