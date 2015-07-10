> From: [eLinux.org](http://eLinux.org/Android_File_Systems "http://eLinux.org/Android_File_Systems")


# Android File Systems



## YAFFS

Android in most mobile phones up to version 2.2 (Froyo) use the YAFFS2
filesystem.

Here is some information about YAFFS2:

-   [File Systems\#YAFFS2](http://eLinux.org/File_Systems#YAFFS2 "File Systems")
-   Wookey's presentation about YAFFS at ELC Europe 2007
    [yaffs.pdf](http://eLinux.org/images/e/e3/Yaffs.pdf "Yaffs.pdf"),
    [video](http://free-electrons.com/pub/video/2007/elce/elce-2007-wookey-yaffs.ogg)
-   [YAFFS update for ELC Europe
    2010](http://wookware.org/talks/yaffsupdate-ELCE-2010.pdf)

## EXT4

According to this report by Ted Tso, version 2.3 (Gingerbread) will be
using ext4

[http://www.linuxfoundation.org/news-media/blogs/browse/2010/12/android-will-be-using-ext4-starting-gingerbread](http://www.linuxfoundation.org/news-media/blogs/browse/2010/12/android-will-be-using-ext4-starting-gingerbread)

With ext4, you may need to explicitly sync the data to the file system,
in order to make sure not to lose information.

See [this blog entry by Tim
Bray](http://android-developers.blogspot.com/2010/12/saving-data-safely.html)
for information on this topic.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

