> From: [eLinux.org](http://eLinux.org/Compressed_printk_messages_-_Results "http://eLinux.org/Compressed_printk_messages_-_Results")


# Compressed printk messages - Results



## Contents

-   [1 The origin](#the-origin)
    -   [1.1 Timothy's
        approach<sup>[2]</sup>](#timothy-s-approach-2)
    -   [1.2 Very intrusive and large overhead, yet three problems
        identified](#very-intrusive-and-large-overhead-yet-three-problems-identified)
-   [2 Extracting](#extracting)
    -   [2.1 Option 1: Scan the source
        files](#option-1-scan-the-source-files)
    -   [2.2 Option 2: Put printk strings to own
        section](#option-2-put-printk-strings-to-own-section)
        -   [2.2.1 Extracting: own section](#extracting-own-section)
    -   [2.3 Upstreaming likeliness](#upstreaming-likeliness)
-   [3 Compressing](#compressing)
    -   [3.1 Algorithms](#algorithms)
        -   [3.1.1 Requirements](#requirements)
        -   [3.1.2 Conclusion](#conclusion)
    -   [3.2 Codebooks to the rescue?](#codebooks-to-the-rescue-3f)
    -   [3.3 Codebooks & UTF8](#codebooks-26-utf8)
-   [4 Replacing](#replacing)
    -   [4.1 Source code level](#source-code-level)
    -   [4.2 Own section](#own-section)
-   [5 Conclusion](#conclusion-2)
    -   [5.1 Summary](#summary)
    -   [5.2 Further issues (from a higher
        level)](#further-issues-from-a-higher-level)
-   [6 Other approaches](#other-approaches)
    -   [6.1 Turn the viewpoint](#turn-the-viewpoint)
    -   [6.2 Print from central
        locations](#print-from-central-locations)
    -   [6.3 Prefixes](#prefixes)
        -   [6.3.1 Prefixes: Dead simple
            tinyfication](#prefixes-dead-simple-tinyfication)
        -   [6.3.2 Prefixes: More easy
            stuff](#prefixes-more-easy-stuff)
    -   [6.4 Copy'n'paste](#copy-n-paste)
    -   [6.5 Layer 8](#layer-8)
-   [7 Summary](#summary-2)
    -   [7.1 Compressed printk-strings, only for
        corner-cases](#compressed-printk-strings-only-for-corner-cases)
    -   [7.2 General improvements first, benefits for
        all](#general-improvements-first-benefits-for-all)

# The origin

Inspiration for this project originated in experiments conducted by
Timothy Miller in 2003<sup>[[1]](#cite_note-1)</sup>. His experiments
lead to the assumption that printk strings in the Linux Kernel can be
compressed by 50% (\~4% of the total size). No code or patches have been
posted, yet the description of his ideas and the published codebook
allow a discussion of his approaches, and of general challenges with
this topic.

## Timothy's approach<sup>[[2]](#cite_note-2)</sup>

1.  Compile kernel and keep `.i`-files
2.  Filter them for printk strings
3.  Compress those strings using tokenization
4.  Create copies of the source files
5.  There, replace strings with tokens
6.  Compile again

Further notes:

-   not even sure depacking at printk was ever made
-   `allyesconfig` was used for the tests
-   based on 2.4.20 and 2.5.68

## Very intrusive and large overhead, yet three problems identified

1.  Extract printk format strings
2.  Compress printk format strings
3.  Replace printk format strings

# Extracting

Problem: Find all printk-strings

-   There are *lots* of functions/defines embedding printk/vprintk\_emit
-   They are nested in all ways you can think of
-   Moving target, there will be more like `<new_subsys>_dev_err, ...`

## Option 1: Scan the source files

-   needs to know *all* printk-emerging functions
-   misses merging of literals at compiler level
-   needs to handle all ways of string concatenation in the source files
-   this is what was originally done by Timothy Miller

## Option 2: Put printk strings to own section

-   scales better (only base functions need to be converted)
-   compiler does the merging and concatenation
-   loses knowledge where strings came from
-   needs non-trivial changes to core functions
-   experimentally tried out for this research

### Extracting: own section

Here is an example how printk was modified to put the string into a
seperate section.

Define a wrapper:

    +#define __printk(fmt, args...) \
    +do { \
    +   if (__builtin_constant_p(fmt)) { \
    +       static const __attribute__((section("__printk"))) \
    +           char __f[] = fmt; \
    +       printk(__f, ##args); \
    +   } else \
    +       printk(fmt, ##args); \
    +} while (0)

And apply it (one example here):

     #define pr_emerg(fmt, ...) \
    -   printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
    +   __printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
     #define pr_alert(fmt, ...) \
    -   printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
    +   __printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)

Similar approaches have been implemented for `dev_*` and `BUG/WARN`.
However, due to various side effects, a full kernel build could not be
achieved in the timeframe for this project.

## Upstreaming likeliness

However, since the own section approach touches many files close to the
core in nasty ways and will most probably cause side-effects, it is
extremely unlikely to be accepted upstream. Same goes for the original
approach scanning the intermediate files.

# Compressing

## Algorithms

### Requirements

-   needs to handle lots of small strings
-   should be instantly available (not somewhere in the middle of packed
    data)
-   no significant overhead, both memory and cpu-time

### Conclusion

-   no sliding window algos (LZ and friends): can't extract slices &
    lots of bitwise shiftings
-   no variable length encoding (Huffman and friends): can't extract
    slices & lots of bitwise shifting
-   no frequency based compression
    (stats3<sup>[[3]](#cite_note-3)</sup>): needs 2MB RAM & also
    bitshifting

## Codebooks to the rescue?

-   tokenization is actually a good option
-   BytePairEncoding works, too
-   both achieve around 50% of compression
-   even today around 4% of the kernel size gained
-   estimation based on manually compressed printk sections

However:

-   `allyesconfig` is unrealistic for tiny systems
-   smaller kernels means smaller pool for codes
-   what about modules and their strings?
    -   share codebook from the monolithic kernel -\> modules are tied
        to that build
    -   modules have their own codebook -\> overhead eats gain

Brainstorming:

-   hardcode one pre-generated codebook especially suited to kernel
    printk strings?
-   would save second kernel compile, too, if codebook is previously
    known
-   loses some compression ratio since it is not the optimal codebook

## Codebooks & UTF8

Tokenization and BPE need unused characters for their symbols which
might collide with UTF8 encoding. While UTF8 also has 'illegal
encodings' which could be hijacked as compression
symbols<sup>[[4]](#cite_note-4)</sup>, this is approach is hackish and
will also decrease the compression factor by 50% (compression symbols
are then 16 bit instead of 8).

Reusing unused ASCII characters as compression symbols is technically
sensible here. However, giving up UTF8 cleanliness will probably be not
well received upstream.

# Replacing

## Source code level

In the original implementation, the source code was piped through a
filter on the second build of the kernel. Not being able to see what was
actually compiled is expected to raise eyebrows when upstreaming.

## Own section

Compressing the special printk sections turned out to be rather easy
with recent binutils. However, updating all references to the strings is
expected to be complex. In this timeframe, it was not possible to
research the topic. However, heavily modifying object files as a
post-processing step, maybe with modified binutils, is expected to have
serious problems upstream.

# Conclusion

## Summary

All solutions to the problems investigated here turned to be very
hackish already at the drafting phase. The likeliness of going upstream
is close to zero. They are also no good candidates for keeping them
out-of-tree since they tend to be very fragile when it comes to kernel
updates.

## Further issues (from a higher level)

It is worth noting that printk strings are only a subset of all strings
in the kernel. For example, devicetree uses a lot of strings and keeps
adding more. They might be easier to tackle since they are largely
accessed via `of_*` functions, but this will also add more complexity.
To be worth this effort and receive more gain, the problem should be
reevaluated at a higher level, considering all strings, maybe even all
.rodata.

# Other approaches

## Turn the viewpoint

From: Managing Gigabytes, Witten/Moffat/Bell, 1st edition, p. 385:

> We find ourselves in the midst of a practically important and
> intelectually fascinating convergence between the desire for more and
> better compression and the need to learn about what 'structure' there
> is in data.

So, trying to understand the structure and improve from there:

-   observations from 3.16-rc5:
    -   x86-64 allyesconfig
    -   arm-cortexa8 customer kernel
-   maybe a bit biased for device drivers

## Print from central locations

Proposal:

-   strings should be emitted from as centralized locations as possible
-   bonus: consistent messages

Already applied examples:

-   OOM error message removal (mm core will complain anyhow)
-   `devm_ioremap_resource()` (unifies error handling for `devm_ioremap`
    et al.)

Further possibilities:

-   have basic functions not printing error messages
-   have a convenience function suitable for most cases printing
    consistent error messages
-   `devm_get_optional` are also good candidates

Simple tests:

-   Removing error strings for `devm_clk_get` saved 20K instantly
-   lots of other candidates

## Prefixes

-   usually done by a literal prefixing the format string
-   creates unique strings which have redundancy in them
-   use `dev_*` and friends if possible

### Prefixes: Dead simple tinyfication

How `pr_fmt` gets applied:

    #define pr_alert(fmt, ...) \
        printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)

How to simplify it:

    -#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
    +#define pr_fmt(fmt) "%s" fmt, KBUILD_MODNAME ": "

That saved around 15% (or 250 byte) for sn9c20x. Applied to all 900
instances in the kernel, it saved about 30K (or 0.4%). It works better
in some places than in others.

### Prefixes: More easy stuff

Redefine subsystem printouts:

     /* UBI error messages */
    -#define ubi_err(fmt, ...) pr_err("UBI error: %s: " fmt "\n",      \
    -                __func__, ##__VA_ARGS__)
    +#define ubi_err(fmt, ...) printk("%s%s: " fmt "\n",      \
    +               KERN_ERR "UBI error: ",  __func__, ##__VA_ARGS__)

That saved around 15% (or 2.5K). UBIFS, JFFS2, SCSI layer seem also to
be promising candidates.

## Copy'n'paste

Some code duplicates strings too easy<sup>[[5]](#cite_note-5)</sup>:

    switch (sd->sensor) {
    case SENSOR_OV9650:
        ov9650_init_sensor(gspca_dev);
        if (gspca_dev->usb_err < 0)
            break;
        pr_info("OV9650 sensor detected\n");
        break;
    case SENSOR_OV9655:
        ov9655_init_sensor(gspca_dev);
        if (gspca_dev->usb_err < 0)
            break;
        pr_info("OV9655 sensor detected\n");
        break;
    case SENSOR_SOI968:
        soi968_init_sensor(gspca_dev);
        if (gspca_dev->usb_err < 0)
            break;
        pr_info("SOI968 sensor detected\n");
        break;

    /* ... 7 more ... */

And in the init functions:

    if (gspca_dev->usb_err < 0)
        pr_err("OV9650 sensor initialization failed\n");
    ...
    if (gspca_dev->usb_err < 0)
        pr_err("OV9655 sensor initialization failed\n");
    ...
    if (gspca_dev->usb_err < 0)
        pr_err("SOI968 sensor initialization failed\n");
    ...

A little love helps a lot here \<3

-   proper cleanups are most sustainable
-   will not only remove strings but code as well

For example, here:

-   refactor init routines to return error values
-   print detected/failed messages depending on error value
-   use a table for sensor names and keep the rest of the string static

## Layer 8

Be aware when adding strings:

-   be precise with printk level (error, warning, debug). This makes
    compiling out based on level more useful.
-   be conservative with non debug strings. We need rules of thumb
    here...
-   try to be consistent with the strings you create.
-   generate strings instead of copy-pasting similar strings
-   try to avoid prefixes; especially for drivers, there are plenty of
    alternatives
-   strings cost (a little), so they should be worth it

# Summary

## Compressed printk-strings, only for corner-cases

-   the price (overhead, complexity) for compressed printk-strings is
    still high
-   no existing implementation, depends heavily on use case (e.g. how
    are modules handled?)
-   the gain can be expected to be still around 4%
    -   note that you will lose compression rate on the compressed
        kernel image because the already compressed printk data will
        compress worse
-   lots of side effects and huge increase of build time
-   looking at printk-strings is not enough (e.g. DT bindings)

## General improvements first, benefits for all

-   there is quite some potential to simply reduce number of strings,
    especially through centralization
-   ...which mostly make strings more consistent, too
-   cleaning up sloppy code is good, too
-   should be the first goal before stepping further, lots of KB can be
    saved
-   then have another look for patterns

1.  [↑](#cite_ref-1)
    [http://elinux.org/Compressed\_printk\_messages](http://elinux.org/Compressed_printk_messages)
2.  [↑](#cite_ref-2)
    [http://lwn.net/Articles/28935/](http://lwn.net/Articles/28935/)
3.  [↑](#cite_ref-3)
    [http://www.scirp.org/journal/PaperInformation.aspx?PaperID=40783](http://www.scirp.org/journal/PaperInformation.aspx?PaperID=40783)
4.  [↑](#cite_ref-4)
    [http://en.wikipedia.org/wiki/UTF-8\#Codepage\_layout](http://en.wikipedia.org/wiki/UTF-8#Codepage_layout)
5.  [↑](#cite_ref-5)
    [https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/gspca/sn9c20x.c?id=v3.16-rc5\#n1813](https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/gspca/sn9c20x.c?id=v3.16-rc5#n1813)


