> From: [eLinux.org](http://eLinux.org/Scripting "http://eLinux.org/Scripting")


# Scripting



Scripting is powerful technology especially valuable in embbedded Linux.
It is used for building complex projects, building root file systems and
distributions, system management, tests automation.

Most commons shells are [bash](http://www.gnu.org/software/bash/) on PC
and busybox's [ash](http://en.wikipedia.org/wiki/Almquist_shell) on
embedded Linux.

## Contents

-   [1 Shell scripting](#shell-scripting)
    -   [1.1 Shell scripting libraries](#shell-scripting-libraries)
        -   [1.1.1 Specialized frameworks and
            libraries](#specialized-frameworks-and-libraries)
        -   [1.1.2 Samples from books](#samples-from-books)
        -   [1.1.3 Historical](#historical)
        -   [1.1.4 References](#references)

## Shell scripting

-   [Bash Reference
    Manual](http://www.gnu.org/software/bash/manual/bash.html)
-   [Bash Guide for
    Beginners](http://www.makelinux.net/books/Bash-Beginners-Guide/)
-   [Advanced Bash-Scripting
    Guide](http://www.makelinux.net/books/abs-guide/)
-   [Command-Line Tools
    Summary](http://www.makelinux.net/books/GNU-Linux-Tools-Summary/GNU/Linux)
-   [http://wiki.bash-hackers.org/](http://wiki.bash-hackers.org/)
-   [http://bash.cyberciti.biz/](http://bash.cyberciti.biz/)
-   [Top 10 Best Cheat Sheets and Tutorials for Linux / UNIX
    Commands](http://www.cyberciti.biz/tips/linux-unix-commands-cheat-sheets.html)
-   [http://wiki.bash-hackers.org/](http://wiki.bash-hackers.org/)
-   [https://wiki.archlinux.org/index.php/bash](https://wiki.archlinux.org/index.php/bash)
-   [http://www.techbar.me/linux-shell-tips/](http://www.techbar.me/linux-shell-tips/)

### Shell scripting libraries

-   [shtool](http://www.gnu.org/software/shtool/) The GNU Portable Shell
    Tool
    -   [man shtool](http://www.makelinux.net/man/1/S/shtool)
    -   Portable wrappers to standard operations
    -   3000 SLOC, 19 functions, bloated
-   [Wicked Cool Shell Scripts, 2004,
    samples](http://intuitive.com/wicked/wicked-cool-shell-script-library.shtml)
    -   Indeed cool shell scripts, worth to read
    -   Most in interesting functions: 015-newrm.sh, 016-unrm.sh,
        021-findman.sh, 029-loancalc.sh, 037-zcat.sh,
        038-bestcompress.sh, 040-diskhogs.sh, 084-webaccess.sh,
        100-hangman.sh
    -   4000 SLOC, 100 files-functions
    -   Easy to use
-   [mbfl - Marco's Bash Functions
    Library](http://marcomaggi.github.io/docs/mbfl.html)
    -   5000 SLOC, 500 functions, bloated
    -   The philosophy of MBFL is to do the work as much as possible
        without external commands.
    -   Complicated to use
-   [@ aka monkey-tail](https://github.com/lmartinking/monkey-tail)
    -   300 SLOC, 20 functions, simple wrapper functions
    -   Easy to use
-   [lib.sh](https://github.com/makelinux/lib)
    -   Single script, 300 SLOC, 40 functions and aliases
    -   Easy to use
    -   Most useful functions: make-debug, trap\_err, readline-bindings,
        duplicates, fs\_usage, system\_status\_short, git\_fixup,
        tcpdump-text, git\_ign\_add, for\_each, mem\_avail\_kb

#### Specialized frameworks and libraries

-   [Bashinator](http://www.bashinator.org/)
    -   Logging framework
    -   700 SLOC, 18 functions
    -   Complicated to use
-   [libbash - tool for managing bash
    scripts](http://sourceforge.net/projects/libbash/)
    -   loads and unloads functions from scripts with commands source
        and unset
-   [bsfl - Bash Shell Function Library](http://code.google.com/p/bsfl/)
    -   600 SLOC, 50 functions, logging functions, trivial wrappers
    -   Easy to use
-   [shesfw - Shell Script Framework
    tool](http://code.google.com/p/shesfw/)
    -   200 SLOC, 20 functions
    -   unified interface to kdialog, Xdialog, zenity
-   [shUnit2 - xUnit based unit testing for Unix shell
    scripts](http://code.google.com/p/shunit2/)
-   [log4sh - logging
    framework](https://sites.google.com/a/forestent.com/projects/log4sh)
    -   logging framework for shell scripts that works similar to
        [http://logging.apache.org/](http://logging.apache.org/)
-   [bashworks](https://github.com/jpic/bashworks) - something messy
-   [rerun - a modular shell automation framework to organize your
    keeper
    scripts](https://github.com/rerun/rerun/blob/master/README.md)
    -   700 SLOC, 30 functions

#### Samples from books

-   [Learning the bash shell, 2005,
    samples](http://examples.oreilly.com/9781565923478/), 62 files
-   [Bash Cookbook, 2007](http://examples.oreilly.com/9780596526788/),
    99 files
-   [Classic Shell Scripting,
    2005](http://examples.oreilly.com/9780596005955/). 82 files

#### Historical

-   [UNIX Power Tools, 1997,
    samples](http://examples.oreilly.com/9780596003302/)
-   [Portable Shell Programming, 1995,
    samples](http://www.cs.uleth.ca/~holzmann/C/shells/shell_book_blinn/)
    -   1000 SLOC, 33 files-functions
    -   Regular operations implelented in shell. Usedfull on out of
        memory (OOM) when there is no memory to run external programms.
    -   easy to use

#### References

-   [List of Bash shell-scripting
    libraries](http://dberkholz.com/2011/04/07/bash-shell-scripting-libraries/)

See also

-   [Android Scripting](http://eLinux.org/Android_Scripting "Android Scripting")


