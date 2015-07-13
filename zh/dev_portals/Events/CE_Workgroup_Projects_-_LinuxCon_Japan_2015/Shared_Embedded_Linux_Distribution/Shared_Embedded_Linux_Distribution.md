> From: [eLinux.org](http://eLinux.org/Shared_Embedded_Linux_Distribution "http://eLinux.org/Shared_Embedded_Linux_Distribution")


# Shared Embedded Linux Distribution



This page describes the CE Workgroup "Shared Embedded Linux
Distribution" project

-   This is a project to use Debian packages with the Yocto Project
    -   Goal is to share the work of maintaining long-term support for
        an embedded distribution, by leveraging the work of the Debian
        project
-   See ["Poky meets Debian: Understanding How to Make an Embedded Linux
    by Using an Existing Distribution's Source
    Code"](http://eLinux.org/images/1/1b/Poky_meets_Debian_Understanding_How_to_Make_an_Embedded_Linux_by_Using_an_Existing_Distribution%27s_Source_Code.pdf "Poky meets Debian Understanding How to Make an Embedded Linux by Using an Existing Distribution's Source Code.pdf")
    talk at ELC 2015 by Yoshitake Kobayashi
-   See ["Meta-debian
    handout"](http://eLinux.org/images/b/bd/Meta-debian_handout_r2.pdf "Meta-debian handout r2.pdf")
    which was available at LinuxCon Japan 2015 CE Workgroup booth

## Contents

-   [1 Rationale](#rationale)
-   [2 How to use](#how-to-use)
    -   [2.1 Setup repositories](#setup-repositories)
    -   [2.2 Setup build directory](#setup-build-directory)
    -   [2.3 Bitbake kernel and tiny
        rootfs](#bitbake-kernel-and-tiny-rootfs)
    -   [2.4 Run the build image on Qemu](#run-the-build-image-on-qemu)
-   [3 Resources](#resources)
    -   [3.1 Download](#download)
    -   [3.2 Mailing list](#mailing-list)
    -   [3.3 Presentations](#presentations)

## Rationale

The meta-debian is a set of recipes (metadata) for the poky build
system, which allows cross-building Linux images using Debian source
packages. By enabling meta-debian, poky fetches required sources from
Debian source repository and LTSI kernel repository.meta-debian is
independent of OpenEmbedded-core recipes, so OE-Core recipes are still
available after meta-debian is enabled. meta-debian is mainly intended
to be used for embedded products which needs long-term support.

The purpose is to provide the following things

-   Fully customizable embedded Linux based on existed distro
-   Wide embedded CPU support
-   Stability and long-term support

The meta-debian recipes follow Debian build rules by default, but
sometimes customize them for embedded systems if necessary (e.g. remove
dependencies). Also they re-use essential patches from OE-Core to
support cross-building

## How to use

### Setup repositories

    $ git clone git://git.yoctoproject.org/poky.git
    $ cd poky
    $ git checkout daisy
    $ git clone https://github.com/meta-debian/meta-debian.git
    $ cd meta-debian
    $ git checkout daisy

Please don't forget to install essential packages into your host system
before you bitbake something. See Yocto Project's web site for this
information
[[1]](http://www.yoctoproject.org/docs/1.6/poky-ref-manual/poky-ref-manual.html#intro-requirements)

### Setup build directory

    $ export TEMPLATECONF=meta-debian/conf
    $ source ./poky/oe-init-build-env

You can change the target machine by setting MACHINE variable in
local.conf to one of the following machines.

-   qemux86, qemux86-64, qemuarm, qemuppc

### Bitbake kernel and tiny rootfs

    $ bitbake core-image-minimal

### Run the build image on Qemu

Please run the following commands after bitbake core-image-minimal
finishes.

    (qemux86)
    $ runqemu qemux86 nographic bootparams="init=/init root=/dev/sda"

    (qemux86-64)
    $ runqemu qemux86-64 nographic bootparams="init=/init root=/dev/sda"

    (qemuarm)
    $ runqemu qemuarm nographic bootparams="init=/init console=ttyAMA0"

    (qemuppc)
    $ runqemu qemuppc nographic bootparams="init=/init"

The shell prompt appears automatically after system boots without login.
"init=/init" means that kernel uses tiny-init script as the init process
instead of busybox /sbin/init.

## Resources

### Download

-   [https://github.com/meta-debian/](https://github.com/meta-debian/)

### Mailing list

-   meta-debian@googlegroups.com
-   Subscription
    -   meta-debian+subscribe@googlegroups.com
    -   [https://groups.google.com/forum/\#!forum/meta-debian/join](https://groups.google.com/forum/#!forum/meta-debian/join)

### Presentations

-   ["Poky meets Debian: Understanding How to Make an Embedded Linux by
    Using an Existing Distribution's Source
    Code"](http://eLinux.org/images/1/1b/Poky_meets_Debian_Understanding_How_to_Make_an_Embedded_Linux_by_Using_an_Existing_Distribution%27s_Source_Code.pdf "Poky meets Debian Understanding How to Make an Embedded Linux by Using an Existing Distribution's Source Code.pdf")
    talk at ELC 2015 by Yoshitake Kobayashi
-   ["meta-debian: Extending Yocto Project's Poky for building
    Debian-based embedded
    system"](http://eLinux.org/images/7/74/LinuxCon2015_meta-debian_r7.pdf "LinuxCon2015 meta-debian r7.pdf")
    talk at LinuxCon Japan 2015 by Kazuhiro Hayashi


