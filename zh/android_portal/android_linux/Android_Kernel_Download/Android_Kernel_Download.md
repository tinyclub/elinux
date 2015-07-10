> From: [eLinux.org](http://eLinux.org/Android_Kernel_Download "http://eLinux.org/Android_Kernel_Download")


# Android Kernel Download



See
[http://source.android.com/source/building-kernels.html](http://source.android.com/source/building-kernels.html)

Most of following information is outdated.

## Main Google Android Kernels

The main Google repository with Android source code is at:
[https://android.googlesource.com/](https://android.googlesource.com/)

There are (as of July 2014) 4 main separate kernel repositories at that
site:

-   common
-   exynos
-   goldfish
-   lk
-   samsung
-   tegra
-   msm
-   omap

To download one of these and use it directly, you can use git. For
example: (Do not use the git protocol to clone)

    git clone https://android.googlesource.com/kernel/common.git kernel

To preserve your sanity, it's probably worth downloading this into a
'kernel' directory in your overall Android source directory scheme

You can use repo, following the instructions at
[http://source.android.com/download](http://source.android.com/download),
to pull down the entire Android source. However, when you download the
rest of the Android source code, using the 'repo' command, you do NOT
automatically get a kernel tree included. That is, a kernel git tree is
not referenced in the default Android manifest file,

To add projects, such as the kernel, to your overall Android repository
scheme, you add the appropriate kernel repository to your local
manifest.xml file. This file is located in the .repo directory.

To include the kernel/common tree, include a line like this in
.repo/manifest.xml:

    <project path="kernel/common" name="kernel/common" />

The complete list of projects (including other kernel options besides
kernel/common) is listed on
[https://android.googlesource.com/](https://android.googlesource.com/).

Note that the default revision for git repositories is specified in the
\<default\> tag in manifest.xml as "revision=master" but the
kernel/common repository may not have a head called "master". In that
case if you just type "repo sync kernel/common" you may see the message:

    error: revision master in kernel/common not found

Typically the heads in the kernel/common repository will be called
android-2.6.x (where x is the kernel number); specifying this number in
the manifest should allow repo to sync properly, i.e.:

    <project path="kernel/common" name="kernel/common" revision="android-2.6.27"/>

You can view the heads by clicking on the project link from
[http://android.git.kernel.org/](http://android.git.kernel.org/).

For more about repo, see
[http://source.android.com/download/using-repo](http://source.android.com/download/using-repo)

## Other Repositories with Android-specific changes

-   Linux kernel for omap and beagle-board, by Embinux:
    [http://labs.embinux.org/git/cgit.cgi/repo/kernel.git](http://labs.embinux.org/git/cgit.cgi/repo/kernel.git)
    -   clone with: git clone
        [git://labs.embinux.org/repo/kernel.git](git://labs.embinux.org/repo/kernel.git)
        kernel

## 'Raw' Android kernel patches

I do not know of any freely available patches for the Linux kernel with
the Android fixes, as of November 2009. I have, however, heard of
multiple efforts to extract the patches to make it easier to port the
Android kernel features onto newer Linux kernels.

Here is a way of extracting raw Android patches at a certain point in
time, though this may be dated:

    (Do not use the git protocol to clone the source)
    git clone https://android.googlesource.com/kernel/common.git android-kernel
    cd android-kernel
    git checkout --track -b android-2.6.32 origin/android-2.6.32
    git fetch --tags git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-2.6.32.y.git
    git shortlog v2.6.32.9..HEAD
    git format-patch v2.6.32.9..HEAD

Sum total 173 patches for the 2.6.32.9 kernel as of writing.

If anyone knows where raw android kernel patches are available, please
add a link here. See also the [Android Kernel
Features](http://eLinux.org/Android_Kernel_Features "Android Kernel Features") page for
more information about individual kernel features.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

