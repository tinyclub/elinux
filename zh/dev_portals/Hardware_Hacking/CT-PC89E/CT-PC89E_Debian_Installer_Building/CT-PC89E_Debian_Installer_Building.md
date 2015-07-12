> From: [eLinux.org](http://eLinux.org/CT-PC89E_Debian_Installer_Building "http://eLinux.org/CT-PC89E_Debian_Installer_Building")


# CT-PC89E Debian Installer Building



The moment you've all been waiting for: installing Debian Squeeze using
Debian Installer is, with a few limitations, as easy as installing
Debian on any other system.

Some of you may want to build a kernel or installer images yourselves,
for example to develop and test patches (hint). Here's an overview of
the steps involved.

I'm not going to explain all the details (such as the need to install
build dependencies). If additional info is needed, please ask.

To build the kernel, you need to check out our git repository and check
out the current development branch (origin/ct-pc89e/2.6.24/from-smartq).
I used a cross-compiler on an amd64 Lenny system to build the kernel.

To build an installer image you need to check out my private branch for
the CT-PC89E from the D-I Subversion repository:

      $ svn co svn://svn.debian.org/svn/d-i/people/fjp/ctpc89e

Note that it is not possible to cross-build D-I images; this must be
done on an armel Sid system.

The simplest way to build the kernel as a Debian package (including
kernel image and modules) is:

    $ fakeroot make deb-pkg

Note that to be useful the name of the package must conform to the
Debian naming convention: linux-image-\<version\>-\<ABI\>-\<flavor\>. I
have done this by setting CONFIG\_LOCALVERSION to '-0-s3c' in the
.config.

Next step is to build udebs for the kernel modules. This is done from
the 'kernel' subdirectory of the D-I checkout.

    - create a subdirectory 'armel'
    - copy your kernel .deb to that subdir
    - make sure that the info in linux-kernel-di-armel-2.6/kernel-versions
     matches your <version>-<ABI>-<flavor>.
    - make sure that the version in massbuild.versions matches the package
     version of your kernel.deb
    - build the udebs using
     $ ./massbuild kbuild -k armel
    - the resulting udebs will be in massbuild.out.kernel

Next step is to build the ctpc89e-udeb and rootskel-flash udebs. Use
either debuild or dpkg-buildpackage, just like for regular packages. The
ctpc89e-udeb package contains all of the customizations I've developed
for the netbook. The rootskel-flash package is used in the micro-ramdisk
that gets piggy-packed onto the installer kernel image.

Copy all the udebs you've built to installer/build/localudebs.

Next you can build the D-I images: the boot micro-ramdisk and the actual
D-I root ramdisk. This is done from the 'installer/build' directory.

    $ sudo make reallyclean
    $ sudo make build_ctpc89e_boot
    $ sudo make build_ctpc89e_root


 Almost there. Last step is to piggy-back the boot micro-ramdisk onto
the kernel using (from the kernel checkout):

    $ fakeroot make INITRD=/path/to/boot_ramdisk.gz bootpImage

The resulting kernel image is arch/arm/boot/bootpImage.

You can now copy the images to SD card:

    - root_ramdisk.gz => boot.img
    - bootpImage => zImage_dt_update

And don't forget to include the dummy datang-epc.tar.gz.

For background info in how Debian Installer works please see the
following document:
[http://d-i.alioth.debian.org/doc/internals/](http://d-i.alioth.debian.org/doc/internals/)

Cheers, FJP


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CT-PC89E](http://eLinux.org/index.php?title=Category:CT-PC89E&action=edit&redlink=1 "Category:CT-PC89E (page does not exist)")

