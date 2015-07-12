> From: [eLinux.org](http://eLinux.org/Compiler_Optimization "http://eLinux.org/Compiler_Optimization")


# Compiler Optimization



Here's a good overview on compiler optimizations:
[http://en.wikipedia.org/wiki/Compiler\_optimization](http://en.wikipedia.org/wiki/Compiler_optimization)

Here's some info about GCC optimization techniques:
[http://www.redhat.com/software/gnupro/technical/gnupro\_gcc.html](http://www.redhat.com/software/gnupro/technical/gnupro_gcc.html)

Effects of optimization options are explained in [this LJ
article](http://www.linuxjournal.com/article/7269).

A note of warning from [Gentoo
wiki](http://www.gentoo.org/doc/en/gcc-optimization.xml) on optimization
flags:

-O3: This is the highest level of optimization possible, and also the
riskiest. It will take a longer time to compile your code with this
option, and in fact it should not be used system-wide with gcc 4.x. The
behavior of gcc has changed significantly since version 3.x. In 3.x, -O3
has been shown to lead to marginally faster execution times over -O2,
but this is no longer the case with gcc 4.x. Compiling all your packages
with -O3 will result in larger binaries that require more memory, and
will significantly increase the odds of compilation failure or
unexpected program behavior (including errors). The downsides outweigh
the benefits; remember the principle of diminishing returns. Using -O3
is not recommended for gcc 4.x.


 In the following
[e-mail](http://gcc.gnu.org/ml/gcc/2004-04/msg01409.html), Jim Wilson,
who apparently supports gcc, writes:

    From: Jim Wilson <wilson at specifixinc dot com>
    Date: Thu, 29 Apr 2004 15:58:28 -0700
    Subject: Re: optimization issue about -O2 and -Os
    ------------------------------------------------------------
    ...
    The -Os option is buggy. You might want to report a bug into our bugzilla
    bug datase. See http://gcc.gnu.org/bugs.html for more info on reporting bugs.

    Though the -Os option is based on the -O2 option, it is a different option, that
    generates different code, and has different bugs.

[Tim Riker](http://eLinux.org/User:TimRiker "User:TimRiker"): this is a bit overly
dramtic. -Os is widely used and widely supported. The link is to a
thread about general information and does not refer to any specific bug
from what I can see. Try -Os out. If you have issues, try -O2 instead.
In general -Os will work. Be very careful in tweaking kernel
optimizations. There is kernel code that only works with the existing
optimizations.


 Gentoo has also a very good overview over [Safe
Cflags](http://en.gentoo-wiki.com/wiki/Safe_Cflags) for different
architectures and cpus.

## Link-time optimization (LTO)

-   gcc front-ends (parsers) produce GIMPLE, which is in "static single
    assignment" (SSA) form
-   Then, gcc optimizes the code, and converts to RTL (Register Transfer
    Language)
-   RTL is converted to assembler by an architecture-specific back-end.
    Then the assembler is called to convert to machine code
-   Finally, the linker is called to combine object files

### gcc LTO support

-   if -flto is used, then LTO information (GIMPLE) is stored in a
    special ELF section of a .o file, and used at link time to perform
    more optimization
-   You may need to use -fwhole-program in conjunction with -flto at
    link time in order to get the full set of optimizations
-   Using this option requires a lot of memory and takes more time to
    build the kernel
-   Some resources:
    -   [http://kemiisto.ru/2011/09/gcc-lto-3-basic-usage/](http://kemiisto.ru/2011/09/gcc-lto-3-basic-usage/)
    -   See the -flto section of:
        [http://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html](http://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html)

### Linux kernel LTO support

Andi Kleen produced a set of patches to support LTO in the Linux kernel
(originally for version 3.6 of the kernel and gcc 4.7)

-   [Link-time optimization for the kernel
    (LWN.net)](http://lwn.net/Articles/512548/)
-   Code is available at:
    [https://github.com/andikleen/linux-misc](https://github.com/andikleen/linux-misc)
    -   see the lto-3.x branches
    -   note that the code requires the const-sections patches, gcc 4.7
        and a special binutils as well, in order to work
        -   as of August 2012, this code was considered highly
            experimental


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [System Size](http://eLinux.org/Category:System_Size "Category:System Size")
-   [Compiler](http://eLinux.org/Category:Compiler "Category:Compiler")

