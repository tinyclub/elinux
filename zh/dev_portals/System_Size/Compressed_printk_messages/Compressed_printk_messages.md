> From: [eLinux.org](http://eLinux.org/Compressed_printk_messages "http://eLinux.org/Compressed_printk_messages")


# Compressed printk messages



 Summary
Compressed printk messages

 Proposer
Tim Bird - Sony Mobile Communications

 Status
Selected to be sponsored by the CE Workgroup

## Contents

-   [1 Description](#description)
    -   [1.1 Miscelaneous issues](#miscelaneous-issues)
-   [2 Related work](#related-work)
-   [3 Scope](#scope)
-   [4 Contractor Candidates](#contractor-candidates)
-   [5 Comments](#comments)

## Description

Attempts have been made in the past to compress printk messages to save
kernel runtime footprint. There is an option to disable all printks, but
many embedded developers do not use it, even when they find the space
savings attractive, because they still would like to see kernel debug
messages.

This project would consist of researching mechanisms that could be used
to automatically (at compile-time) compress the kernel's printk
messages, and transparently expand them at runtime.

The goal would be to no have user-visible change in behaviour for the
kernel, as well as no required developer-visible changes in the source
code. Probably, a new kernel option would be used to control this
feature.

The work would involve parsing the kernel source code, extracting the
messages (and possibly replacing them in source, during the
compilation), compressing them, and replacing the original strings with
references to the compressed messages (in a way that the messages can be
uncompressed transparently at runtime.)

### Miscelaneous issues

There may be an issue with finding all kernel messages, due to the
number of macros (probably in the hundreds) that are used to wrap
printks. This feature might still be useful, even if not all kernel
messages could be converted, as long as significant size savings were
made available by using the feature. Significant size savings would be
on the order of 50K to 100K.

There might also be some benefit from message consolidation. (I don't
know if the compiler already coalesces identical strings, but this
system should be able to.)

## Related work

-   Timothy Miller did some work on this in 2003
    -   See
        [http://lwn.net/Articles/28935/](http://lwn.net/Articles/28935/)
    -   See
        [https://lkml.org/lkml/2003/6/6/207](https://lkml.org/lkml/2003/6/6/207)
-   See also some ideas here:
    -   [http://selenic.com/pipermail/linux-tiny/2005-June/000208.html](http://selenic.com/pipermail/linux-tiny/2005-June/000208.html)

## Scope

Unknown - 4 to 8 weeks?

## Contractor Candidates

None yet.

## Comments

This project was proposed in 2012, but not sponsored that year.

Jean-Christophe PLAGNIOL-VILLARD says feature could be useful for
barebox as well.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Project proposals
    2012](http://eLinux.org/Category:Project_proposals_2012 "Category:Project proposals 2012")
-   [Project proposals
    2013](http://eLinux.org/Category:Project_proposals_2013 "Category:Project proposals 2013")

