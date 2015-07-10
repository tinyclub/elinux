> From: [eLinux.org](http://eLinux.org/Android_Packages "http://eLinux.org/Android_Packages")


# Android Packages



## Contents

-   [1 Packages](#packages)
    -   [1.1 AndroidManifest.xml](#androidmanifest-xml)
    -   [1.2 Tools for managing packages](#tools-for-managing-packages)
-   [2 Resources](#resources)
-   [3 Assets](#assets)

## Packages

Android applications are shipped as "packages", which are compressed
archives with class files, resources, and meta-information (the
AndroidManifest.xml file and security certificates) for the application.

A package has the extension .apk, and it consists of a set of
directories and files in a gzip'ed archive.

A package usually contains the following items:

 META-INF/MANIFEST.MF 
The manifest file for the package file (apk) itself.

 META-INF/CERT.SF 
A security certificate

 META-INF/CERT.RSA 
another security certificate (should distinguish these two)

 AndroidManifest.xml 
The manifest file for the application(s) in this package

 classes.dex 
The actual code for the dalvik (http://eLinux.org/java) classes for the application(s) in
this package

 res/ 
a directory containing resource files

 resources.arsc 
 ???

### AndroidManifest.xml

The AndroidManifest.xml file has information about the application(s) in
a package. Usually, a package will contain a single application. The
AndroidManifest file describes the application's name, as well as
libraries and security permissions neede by the app, messages used by
the app, what icon to use to represent the app, and more.

See
[http://developer.android.com/guide/topics/manifest/manifest-intro.html](http://developer.android.com/guide/topics/manifest/manifest-intro.html)
for details.

### Tools for managing packages

The [aapt](http://eLinux.org/Android_aapt "Android aapt") tool is used to create, inspect
and modify Android packages.

## Resources

An overview of application resources is at:
[http://developer.android.com/guide/topics/resources/index.html](http://developer.android.com/guide/topics/resources/index.html)

It is possible to use a raw file as a resource (without it getting
compiled by the build system). See this article on [using raw files as
resources](http://thedevelopersinfo.com/2009/11/27/using-files-as-raw-resources-in-android/)
in Android.

## Assets

Assets are like resources, except that do not have a resource ID, and
they are listed in the 'assets' directory of a package, rather than the
'res' directory.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

