> From: [eLinux.org](http://eLinux.org/Source_Management_Tools "http://eLinux.org/Source_Management_Tools")


# Source Management Tools



Here are some different source management tools commonly used with
Linux:

## Contents

-   [1 Overview](#overview)
-   [2 Patch Management Tools](#patch-management-tools)
-   [3 Version Control Systems](#version-control-systems)
-   [4 Identity Verification, text
    validation](#identity-verification-text-validation)

## Overview

-   David Wheeler has an excellent breakdown of various SCM tools at:
    [http://www.dwheeler.com/essays/scm.html](http://www.dwheeler.com/essays/scm.html)
-   IBM has an good overview of available tools at:
    [http://www-128.ibm.com/developerworks/linux/library/l-vercon/](http://www-128.ibm.com/developerworks/linux/library/l-vercon/)
-   There is a comparison of several different tools at:
    [http://better-scm.berlios.de/comparison/comparison.html](http://better-scm.berlios.de/comparison/comparison.html)

## Patch Management Tools

-   diff - to create patches
    -   use 'man diff' on your local system for information
-   [patch](http://wikipedia.org/wiki/Patch_%28Unix%29) - to apply
    patches
    -   use 'man patch' on your local system for information
-   [Quilt](http://eLinux.org/Quilt "Quilt") is good for managing a group of patches
    relative to a single source base.
-   diffstat reads a patch file (or standard input) and displays a
    histogram of the insertions, deletions, and modifications per-file.
    It is useful for reviewing large, complex patch files. It reads from
    one or more input files or from standard input. If an input filename
    ends with .bz2, .Z or .gz, diffstat will read the uncompressed data
    via a pipe from the corresponding program.
    -   diffstat is included in most Linux distributions
    -   [diffstat home
        page](http://invisible-island.net/diffstat/diffstat.html)
    -   [diffstat man
        page](http://www.die.net/doc/linux/man/man1/diffstat.1.html)
-   [Tim's patch management
    tools](http://eLinux.org/Tim%27s_patch_management_tools "Tim's patch management tools")
    - diffinfo and friends - a more verbose diffstat, with splitting,
    joining and comparing of patches
-   See also [Diff And Patch
    Tricks](http://eLinux.org/Diff_And_Patch_Tricks "Diff And Patch Tricks")
-   [Splash](http://eLinux.org/Splash "Splash") - Sony tool for managing patches (kind of
    like quilt or stacked git)

## Version Control Systems

-   [Git](http://eLinux.org/Git "Git")
-   [Subversion](http://eLinux.org/Subversion "Subversion")
-   [BitKeeper](http://eLinux.org/BitKeeper "BitKeeper")

## Identity Verification, text validation

-   [PgpKey](http://eLinux.org/PgpKey "PgpKey")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

