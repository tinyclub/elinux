> From: [eLinux.org](http://eLinux.org/Linux_Tiny_Test_Project "http://eLinux.org/Linux_Tiny_Test_Project")


# Linux Tiny Test Project



## Contents

-   [1 Description](#description)
-   [2 Linux-tiny specific core
    member](#linux-tiny-specific-core-member)
-   [3 Step1](#step1)
-   [4 Step2](#step2)
-   [5 Rationale](#rationale)
-   [6 Resources](#resources)
    -   [6.1 Projects](#projects)
    -   [6.2 Specifications](#specifications)
-   [7 Downloads](#downloads)
    -   [7.1 Patch](#patch)
    -   [7.2 Utility programs](#utility-programs)
-   [8 How To Use](#how-to-use)
-   [9 Sample Results](#sample-results)
-   [10 Case Study 1](#case-study-1)
-   [11 Case Study 2](#case-study-2)
-   [12 Future Work/Action Items](#future-work-action-items)

## Description

This is a project to implement an automated test framework for finding
the specific sub-patches or configuration options (in the total set of
Linux tiny sub-patches) which yeild the biggest size improvements.

The main motivation for this is the (overwhelming) number of sub-patches
in the linux-tiny patchset. In order to avoid doing a manual test of
each sub-patch, this framework was conceived as a method of isolate the
most important sub-patches of the patchset, in order to focus our
attention on those.

The basic idea is that an automated script will run which will test each
configuration option provided by the Linux-tiny patchset. For each one,
the script will measure the reduction in size of the Linux kernel that
results from turning that option on. From this, a list of the 'top-10'
configuration options will be made. Subsequently, patches to support
those top-10 configuration options will be ported and analyzed on
non-x86 processor platforms.

This will give us a starting point to determine the most beneficial
parts of the linux-tiny patchset.

[![Alert.gif](http://eLinux.org/images/e/e7/Alert.gif)](http://eLinux.org/File:Alert.gif) *It is
recognized that some parts of Linux-tiny are tools for* size evaluation.
Some parts affect dynamic memory size, rather than the static size from
the kernel compilation. While the technique described here is crude and
ignores these parts, it's at least a starting point for evaluating and
analyzing Linux-tiny.

## Linux-tiny specific core member

-   Classified by Name
    -   Chihiro Morita(Mitsubishi) / Step 3
    -   Richard Griffiths(intel) / Step 1 and 2
    -   M Ranga Swami Reddy(sankhya) / Step 1
    -   Keijiro Yano(Toshiba) / Step 3
    -   Masahiro Fukuda(NEC Electronics) / Step 2
    -   Shuduo Sang(Monta Vista) / Step 1 , 2 and 3
-   Classified by Steps
    -   Step 1 Richard Griffiths(intel), M Ranga Swami
        Reddy(sankhya),ShuduoSang(MontaVista)
    -   Step 2 Richard Griffiths(intel), Masahiro Fukuda(NEC
        Electronics), ShuduoSang(MontaVista)
    -   Step 3 Chihiro Morita(Mitsubishi), Keijiro Yano(Toshiba),
        ShuduoSang(MontaVista)



## Step1

Scope and objective

-   Step1 is to develop automated testing (config--\>build--\>capture
    size) framework on PC/Linux platform.

Specification on the framework(tentative)

-   given the following directory structure:

`input/...` = input directory = environment var INPUT\_DIR

has `baseline_config` file

`linux-2.6.8.1/...` = kernel source directory = environment var
KERN\_SRC

`results/...` = output directory = environment var RESULT\_DIR

-   variable iteration:

for CONFIG\_VAR in \`cat \$(INPUT\_DIR)/varlist\`; do \<loop body
here\> ; done

-   Automated flow control for the following operation assuming
    individual CONFIG vars are given by Step2.
    1.  copy baseline\_config to .config
        -   `cp ../$(INPUT_DIR)/baseline_config .config`

    2.  turn on that variable in the .config file
        -   may need to strip current definition of CONFIG\_FOO from
            .config file)
        -   `echo "CONFIG_FOO=y" >>.config`

    3.  make sure configuration is consistent (turn on dependent
        configuration options)
        -   yes `` | make oldconfig

    4.  save a diff between .config and baseline\_config
        -   `diff -u $RESULT_DIR/baseline_config .config  *#*>../$(RESULT_DIR)/$(CONFIG_VAR).config.patch `

    5.  build kernel image
    6.  make vmlinux
    7.  save results
        -   echo \$(CONFIG\_VAR) \>\>../\$(RESULT\_DIR)/size\_results
        -   size vmlinux \>\>../\$(RESULT\_DIR)/size\_results
        -   (sub-system size measurements from linux-tiny presentation
            by Matt Mackall)
        -   `echo ==================================== >>../$(RESULT_DIR)/size_results`

    8.  cleanup for next loop iteration, if necessary
        -   `make clean` (is this needed?)

    9.  repeat

## Step2

-   pre-requisite (manual tasks):

1.  build a list of individual CONFIG vars to test
2.  create a baseline\_config file
3.  kernel source for your platform
4.  provide environment to run automated script, consisting of:

-   directories mentioned above: {{{input, results, \<linux kernel
    source}}}
-   environment variables for script: {{{INPUT\_DIR, RESULT\_DIR,
    KERN\_SRC}}}
-   environment variables for kernel building: {{{ARCH, CROSS\_COMPILE,
    PATH}}}

1.  measure size of kernel compiled with baseline\_config
2.  if the build is cleaned out between every compile, it may be
    desirable to have ccache installed - see
    [http://ccache.samba.org/](http://ccache.samba.org/)

-   step2 script
    [File:Tiny-step2script.tgz](http://eLinux.org/File:Tiny-step2script.tgz "File:Tiny-step2script.tgz")
-   result
    [http://www.elinux.org/images//8/83/Pdf.gif](http://www.elinux.org/images//8/83/Pdf.gif)
    [linux-tiny-size-result](http://eLinux.org/images/b/b3/Linux-tiny-size-result.pdf "Linux-tiny-size-result.pdf")
    [http://www.elinux.org/images/d/da/Info\_circle.png](http://www.elinux.org/File:Linux-tiny-size-result.pdf)

## Rationale

[This feature is important because ...]

## Resources

### Projects

-   see the [Linux Tiny](http://eLinux.org/Linux_Tiny "Linux Tiny") page

### Specifications

None

## Downloads

### Patch

-   See [Patch Archive](http://eLinux.org/Patch_Archive "Patch Archive")

### Utility programs

[other programs, user-space, test, etc. related to this technology]

[Linux Tiny Kernel Size
Script](http://eLinux.org/Linux_Tiny_Kernel_Size_Script "Linux Tiny Kernel Size Script")

## How To Use

## Sample Results

[Examples of use with measurement of the effects.]

## Case Study 1

On RBTX4938 board (MIPS architecture):

-   [http://www.elinux.org/images//8/83/Pdf.gif](http://www.elinux.org/images//8/83/Pdf.gif)
    [linux-tiny\_size\_mips](http://eLinux.org/images/3/3e/Linux-tiny_size_mips.pdf "Linux-tiny size mips.pdf")
    [http://www.elinux.org/images/d/da/Info\_circle.png](http://www.elinux.org/File:Linux-tiny_size_mips.pdf)

[![Linux-tiny size
mips.png](http://eLinux.org/images/e/e0/Linux-tiny_size_mips.png)](http://eLinux.org/File:Linux-tiny_size_mips.png)

## Case Study 2

# Future Work/Action Items

Here is a list of things that could be worked on for this feature:  ??


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux Tiny](http://eLinux.org/Category:Linux_Tiny "Category:Linux Tiny")

