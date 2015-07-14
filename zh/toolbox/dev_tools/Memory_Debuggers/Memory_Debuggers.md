> From: [eLinux.org](http://eLinux.org/Memory_Debuggers "http://eLinux.org/Memory_Debuggers")


# Memory Debuggers



Several tools exist for finding memory leaks or for reporting individual
memory allocations of a program. These tools help analyze memory usage
patterns, detect unbalanced allocations and frees, report buffer over-
and under-runs, etc.

## Contents

-   [1 mtrace](#mtrace)
-   [2 memwatch](#memwatch)
-   [3 mpatrol](#mpatrol)
-   [4 dmalloc](#dmalloc)
-   [5 dbgmem](#dbgmem)
-   [6 valgrind](#valgrind)
-   [7 Electric Fence](#electric-fence)
-   [8 Tutorials or Overviews](#tutorials-or-overviews)

### mtrace

mtrace is a builtin part of glibc which allows detection of memory leaks
caused by unbalanced malloc/free calls. To use it, the program is
modified to call mtrace() and muntrace() to start and stop tracing of
allocations. A log file is created, which can then be scanned by the
'mtrace' Perl script. The 'mtrace' program lists only unbalanced
allocations. If source is available it can show the source line where
the problem occurred. mtrace can be used on both C and C++ programs.

See the [mtrace wikipedia article](http://wikipedia.org/wiki/Mtrace) for
more information.

### memwatch

memwatch is a program that not only detects malloc and free errors but
also reads and writes beyond the allocated space (buffer over and
under-runs). To use it, you modify the source to include the memwatch
code, which provides replacements for malloc and free.

Some things that memwatch does not catch are writing to an address that
has been freed and reading data from outside the allocated memory.

### mpatrol

mpatrol appears to be like memwatch.

See [http://mpatrol.sourceforge.net/](http://mpatrol.sourceforge.net/)

### dmalloc

"The debug memory allocation or dmalloc library has been designed as a
drop in replacement for the system's malloc, realloc, calloc, free and
other memory management routines while providing powerful debugging
facilities configurable at runtime. These facilities include such things
as memory-leak tracking, fence-post write detection, file/line number
reporting, and general logging of statistics."

This library can be used without modifying the existing program, and
uses environment variables to control it's operation and set of issues
to log.

It's home page is at: [http://dmalloc.com/](http://dmalloc.com/)

See Cal Erickson's article (link below, page 2) for information about
using this system.

### dbgmem

dbgmem looks like another dynamic library replacement tool, similar to
dmalloc (but possibly having less features)

See [http://dbgmem.sourceforge.net/](http://dbgmem.sourceforge.net/)

### valgrind

valgrind does dynamic binary instrumentation to analyze the program, and
provides a number of memory problem detection tools and profiling tools.
Unfortunately, as of July 2010 it is only available for x86 and ppc64
architecture platforms.

See [Valgrind](http://eLinux.org/Valgrind "Valgrind")

### Electric Fence

See [Electric Fence](http://eLinux.org/Electric_Fence "Electric Fence")

## Tutorials or Overviews

-   [Memory Leak Detection in Embedded
    Systems](http://www.linuxjournal.com/article/6059) by Cal Erickson,
    Linux Journal, September 2002
    -   This article mentions mtrace, memwatch and dmalloc


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")

