> From: [eLinux.org](http://eLinux.org/GCC_Tips "http://eLinux.org/GCC_Tips")


# GCC Tips



## Contents

-   [1 What's Here, Why You Should
    Care](#what-s-here-why-you-should-care)
-   [2 Tips](#tips)
    -   [2.1 View Compilation Plan](#view-compilation-plan)
    -   [2.2 See default include search
        paths](#see-default-include-search-paths)
    -   [2.3 Timing sub-commands](#timing-sub-commands)
    -   [2.4 Pre-Process, Retain
        Comments](#pre-process-retain-comments)
    -   [2.5 Pre-Process, Retain
        Defines/Macros](#pre-process-retain-defines-macros)
    -   [2.6 See what Files the Linker is
        Using](#see-what-files-the-linker-is-using)
    -   [2.7 Print Pre-defined Macros](#print-pre-defined-macros)
    -   [2.8 Mixed Assembler and Source
        Output](#mixed-assembler-and-source-output)
    -   [2.9 Specify Language](#specify-language)
    -   [2.10 List Include File
        Dependencies](#list-include-file-dependencies)
    -   [2.11 Symbol Trace](#symbol-trace)
    -   [2.12 Saving temporary files](#saving-temporary-files)

## What's Here, Why You Should Care

A collection of tips useful to those doing embedded development.
Accumulated over several years of doing project work, helping other
engineers, untangling projects for customers and feedback from several
CELF presentations related to this topic.

## Tips

### View Compilation Plan

    gcc -### <the rest of your command line goes here>

The GCC you run is a driver program for a bunch of other programs. With
this parameter, gcc will produce (but not actually execute) the commands
it would have used to accomplish the task you asked it to do. This way,
you can see the gory details of what's going on behind the scenes. What
library is being used? What is -mcpu set to? It's all there.

You can pipe this output to a file and execute that to compile a
program, making it easy to experiment with tweaks to the linker or
assembler.

    Reading specs from /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/specs
    Configured with: ../configure --prefix=/opt/timesys/toolchains/ppc7xx-linux --mandir=/opt/timesys/toolchains/ppc7xx-linux/share/man --infodir=/opt/timesys/toolchains/ppc7xx-linux/share/info --enable-shared --enable-threads=posix --disable-checking --with-system-zlib --enable-__cxa_atexit --disable-libunwind-exceptions --enable-languages=c,c++ --with-sysroot=/here/workdir/i386-x-ppc7xx/deleteme --disable-libgcj --build=i686-timesys-linux --host=i686-timesys-linux --target=powerpc-linux --program-prefix=ppc7xx-linux-
    Thread model: posix
    gcc version 3.4.1 20040714 (TimeSys 3.4.1-7)
     /opt/timesys/toolchains/ppc7xx-linux/libexec/gcc/powerpc-linux/3.4.1/cc1 -quiet -v -D__unix__ -D__gnu_linux__ -D__linux__ -Dunix -D__unix -Dlinux -D__linux -Asystem=linux -Asystem=unix -Asystem=posix -I/opt/timesys/toolchains/ppc7xx-linux/powerpc-linux/include/nptl file.c -quiet -dumpbase file.c -auxbase file -version -o /tmp/ccShiHn4.s
    ignoring nonexistent directory "/here/workdir/i386-x-ppc7xx/deleteme/usr/local/include"
    ignoring nonexistent directory "/here/workdir/i386-x-ppc7xx/deleteme/usr/include"
    #include "..." search starts here:
    #include <...> search starts here:
     /opt/timesys/toolchains/ppc7xx-linux/powerpc-linux/include/nptl
     /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/include
     /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/../../../../powerpc-linux/include
    End of search list.
    GNU C version 3.4.1 20040714 (TimeSys 3.4.1-7) (powerpc-linux)
     compiled by GNU C version 3.2.2 20030222 (Red Hat Linux 3.2.2-5).
    GGC heuristics: --param ggc-min-expand=47 --param ggc-min-heapsize=32138
     /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/../../../../powerpc-linux/bin/as -mppc -many -V -Qy -o /tmp/ccWeV3a3.o /tmp/ccShiHn4.s
    GNU assembler version 2.15.90.0.3 (powerpc-linux) using BFD version 2.15.90.0.3 20040415
     /opt/timesys/toolchains/ppc7xx-linux/libexec/gcc/powerpc-linux/3.4.1/collect2 --eh-frame-hdr -V -Qy -L/opt/timesys/toolchains/ppc7xx-linux/powerpc-linux/lib/nptl --rpath-link /opt/timesys/toolchains/ppc7xx-linux/powerpc-linux/lib/tls -m elf32ppclinux -dynamic-linker /lib/ld.so.1 -o file /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/../../../../powerpc-linux/lib/crt1.o /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/../../../../powerpc-linux/lib/crti.o /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/crtbegin.o -L/opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1 -L/opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/../../../../powerpc-linux/lib /tmp/ccWeV3a3.o -lgcc --as-needed -lgcc_s --no-as-needed -lc -lgcc --as-needed -lgcc_s --no-as-needed /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/crtsavres.o /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/crtend.o /opt/timesys/toolchains/ppc7xx-linux/lib/gcc/powerpc-linux/3.4.1/../../../../powerpc-linux/lib/crtn.o
    GNU ld version 2.15.90.0.3 20040415
      Supported emulations:
       elf32ppclinux
       elf32ppc
       elf32ppcsim

Note: on my (Tim Bird's) Ubuntu 12.04 system, using gcc 4.6.3, it shows
quite different output. Specifically, it is missing anything about the
include directories.

### See default include search paths

You can get a report about the include search paths with the following
command:

    $ gcc -xc -E -v -
    Using built-in specs.
    COLLECT_GCC=gcc
    COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/4.6/lto-wrapper
    Target: x86_64-linux-gnu
    Configured with: ../src/configure -v --with-pkgversion='Ubuntu/Linaro 4.6.3-1ubuntu5' --with-bugurl=file:///usr/share/doc/gcc-4.6/README.Bugs --enable-languages=c,c++,fortran,objc,obj-c++ --prefix=/usr --program-suffix=-4.6 --enable-shared --enable-linker-build-id --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.6 --libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --enable-gnu-unique-object --enable-plugin --enable-objc-gc --disable-werror --with-arch-32=i686 --with-tune=generic --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
    Thread model: posix
    gcc version 4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5)
    COLLECT_GCC_OPTIONS='-E' '-v' '-mtune=generic' '-march=x86-64'
     /usr/lib/gcc/x86_64-linux-gnu/4.6/cc1 -E -quiet -v -imultilib . -imultiarch x86_64-linux-gnu - -mtune=generic -march=x86-64 -fstack-protector
    ignoring nonexistent directory "/usr/local/include/x86_64-linux-gnu"
    ignoring nonexistent directory "/usr/lib/gcc/x86_64-linux-gnu/4.6/../../../../x86_64-linux-gnu/include"
    #include "..." search starts here:
    #include <...> search starts here:
     /usr/lib/gcc/x86_64-linux-gnu/4.6/include
     /usr/local/include
     /usr/lib/gcc/x86_64-linux-gnu/4.6/include-fixed
     /usr/include/x86_64-linux-gnu
     /usr/include
    End of search list.



### Timing sub-commands

You can get a report for the amount of time taken for each sub-command
that gcc uses, using the '-time' command.

Example:

    $ gcc -time -static hello.c -o hello
    # cc1 0.01 0.01
    # as 0.00 0.00
    # collect2 0.03 0.02
    $

This was on a fast machine, with a very small sample program. It shows
that the sub-programs 'cc1', 'as', and 'collect2' (the compiler, the
assembler, and the linker (collect2 is a front-end for 'ld'),
respectively), took less than a few hundredths of a second each to run.

### Pre-Process, Retain Comments

    gcc -C -E <file-name.c> -o file

Some engineers love to do coding in macros. The rest of us would like to
break their fingers. This command will run the file through the
pre-processor, expanding all macros, but retaining all comments. Stick a
comment like "LOOK HERE" and search for that so you reduce the amount of
time you spend looking for the offending code.

### Pre-Process, Retain Defines/Macros

    gcc -dD -E <file-name.c> -o file

Just like the previous example, but perhaps you're trying to trace the
macro define mess.

### See what Files the Linker is Using

    gcc -Wl,-t <parameters>

Displays what files the linker opens in what order. When looking in
archive files, the archive file is displayed in para theses, followed by
the file in the archive. Very handy when working through a legacy
project that depends on files linking in a certain order that suddenly
breaks because of a small (probably viewed as not noteworthy) change in
a makefile somewhere.

    /usr/bin/ld: mode elf_i386
    /usr/lib/gcc-lib/i386-redhat-linux/3.3.3/../../../crt1.o
    /usr/lib/gcc-lib/i386-redhat-linux/3.3.3/../../../crti.o
    /usr/lib/gcc-lib/i386-redhat-linux/3.3.3/crtbegin.o
    /tmp/cc37FxnS.o
    -lgcc_s (http://eLinux.org/usr/lib/gcc-lib/i386-redhat-linux/3.3.3/libgcc_s.so)
    /lib/libc.so.6
    (http://eLinux.org/usr/lib/libc_nonshared.a)elf-init.oS
    -lgcc_s (http://eLinux.org/usr/lib/gcc-lib/i386-redhat-linux/3.3.3/libgcc_s.so)
    /usr/lib/gcc-lib/i386-redhat-linux/3.3.3/crtend.o
    /usr/lib/gcc-lib/i386-redhat-linux/3.3.3/../../../crtn.o

### Print Pre-defined Macros

    gcc -E -dM - < /dev/null | cut -c 9- | sort

Very handy when porting code. Lets you know if your target processor has
some missing defines or if something is different (like
\_\_INT\_MAX\_\_) that can have interesting effects on your project.
Diff the output from the old to the new compiler so you can easily see
the differences, makes it easy to spot problems before getting started.

Sample output, from a compiler targeting an ARM processor.

    __APCS_32__ 1
    __arm__ 1
    __ARM_ARCH_4T__ 1
    __ARMEL__ 1
    __CHAR_BIT__ 8
    __CHAR_UNSIGNED__ 1
    __DBL_DENORM_MIN__ 4.9406564584124654e-324
    __DBL_DIG__ 15
    __DBL_EPSILON__ 2.2204460492503131e-16
    __DBL_HAS_DENORM__ 1
    __DBL_HAS_INFINITY__ 1
    __DBL_HAS_QUIET_NAN__ 1
    __DBL_MANT_DIG__ 53
    __DBL_MAX_10_EXP__ 308
    __DBL_MAX__ 1.7976931348623157e+308
    __DBL_MAX_EXP__ 1024

### Mixed Assembler and Source Output

    gcc -g somefile.c -o somefile
    objdump -S somefile

Prints out each line in the program and the corresponding assembly code.
Very handy when you're trying to see that the processor is generating
the correct code, with the instructions you're expecting. You can also
see the effects of optimization, but would recommend doing this for a
small amount of code because when the optimization level is high,
there's a much lower relationship between line of code and generated
assembler.

Here's an example of what objdump produces for a few lines of code:

      gpvSharedMemory = shmat(hSharedMemory, NULL, 0);
    10000958:       80 7f 00 10     lwz     r3,16(r31)
    1000095c:       38 80 00 00     li      r4,0
    10000960:       38 a0 00 00     li      r5,0
    10000964:       48 01 09 31     bl      10011294 <shmat@plt>
    10000968:       7c 60 1b 78     mr      r0,r3
    1000096c:       3d 20 10 01     lis     r9,4097
    10000970:       90 09 11 d0     stw     r0,4560(r9)
      if (errno != 0) {
    10000974:       48 01 08 d1     bl      10011244 <__errno_location@plt>
    10000978:       7c 60 1b 78     mr      r0,r3
    1000097c:       7c 09 03 78     mr      r9,r0
    10000980:       80 09 00 00     lwz     r0,0(r9)
    10000984:       2f 80 00 00     cmpwi   cr7,r0,0
    10000988:       41 9e 00 50     beq-    cr7,100009d8 <main+0x10c>

### Specify Language

    gcc -x c a-c-source-file.with-a-non-standard-extension -o test.out

Great for legacy projects where where the file extensions don't match
with GCC's expectations, while less of a problem since many projects got
their start with GCC, this still is an issue with long-running projects
that years back, used some other compiler. This stays in effect for the
following file on the command line.

### List Include File Dependencies

There's a whole family of things around -M. These produce a rule that
could be used in a make file, with the included files as dependencies.

    gcc -M <file name>

This shows you all includes, even those on the system path. Useful if
you're doing porting work or validating if your compiler is working as
expected and getting the files from the right place. You'll see
something like this for a basic hello world program

    hello.o: hello.c /usr/include/stdio.h /usr/include/features.h \
      /usr/include/sys/cdefs.h /usr/include/gnu/stubs.h \
      /usr/lib/gcc-lib/i386-redhat-linux/3.3.3/include/stddef.h \
      /usr/include/bits/types.h /usr/include/bits/wordsize.h \
      /usr/include/bits/typesizes.h /usr/include/libio.h \
      /usr/include/_G_config.h /usr/include/wchar.h /usr/include/bits/wchar.h \
      /usr/include/gconv.h \
      /usr/lib/gcc-lib/i386-redhat-linux/3.3.3/include/stdarg.h \
      /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h

    gcc -MM <file name>

Like -M, but no system files. Great to see if your project is configured
and working as expected.

    gcc -M -MG <file name>

The prior -M and -MM commands will stop if header files can be located.
The parameter -MG will just produce the dependency list with the missing
file. Engineers that have projects that generate header files as part of
the build find -MM very handy.

    gcc -M -MT '<target>' <file name>

By default, the target will be the \<file name\>.o This command will
make the default the value of \<target\>.

If the command was

    gcc -M -MT '$(target)' hello.c

You would see

    $(target): hello.c

### Symbol Trace

    gcc -Wl,-y,printf hello.c

This is very handy when you want to understand where the linker is
finding a definition of a symbol. Some projects have name collisions or
link order dependencies. This lets you see precisely what the linker is
doing.

Given a hello world program, you would see output like

    /tmp/ccwZx5UV.o: reference to printf
    /lib/libc.so.6: definition of printf

The reference is in a temporary file created during the compilation
process. If you were linking several object files together explicitly,
you would see the name of the object file where printf was referenced.

### Saving temporary files

    gcc -save-temps hello.c

The compilers temporary files are saved. This is often invaluable
dealing with complicated makefiles to peek at the preprocessed output
without having to figure out how to do a -E option by hand.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")
-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")
-   [Compiler](http://eLinux.org/Category:Compiler "Category:Compiler")

