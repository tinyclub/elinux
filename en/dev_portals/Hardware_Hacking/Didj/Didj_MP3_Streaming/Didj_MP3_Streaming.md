> From: [eLinux.org](http://eLinux.org/Didj_MP3_Streaming "http://eLinux.org/Didj_MP3_Streaming")


# Didj MP3 Streaming



## Contents

-   [1 Summary](#summary)
-   [2 Prerequisites](#prerequisites)
-   [3 Software Needed](#software-needed)
-   [4 Building madplay](#building-madplay)
-   [5 Playing MP3s](#playing-mp3s)
-   [6 Streaming MP3s](#streaming-mp3s)
-   [7 References](#references)

## Summary

This page describes how to play mp3 format audio streams and files on
your Didj using madplay, a command-line mp3 player.

## Prerequisites

[Set up the Build
Environment](http://eLinux.org/LeapFrog_Pollux_Platform:_Build_Environment "LeapFrog Pollux Platform: Build Environment")

In order to stream a networked MP3 stream, first set up networking.

-   [Enable Networking via USB
    Gadget](http://eLinux.org/Didj_Enable_Networking "Didj Enable Networking")
-   [Internet Access from
    Device](http://eLinux.org/LeapFrog_Pollux_Platform:_Internet_Access "LeapFrog Pollux Platform: Internet Access")



## Software Needed

[madplay-0.15.2b.tar.gz](http://sourceforge.net/projects/mad/files/)

[libmad-0.15.1b.tar.gz](http://sourceforge.net/projects/mad/files/)

[libid3tag-0.15.1b.tar.gz](http://sourceforge.net/projects/mad/files/)

[zlib-1.2.5.tar.gz](http://www.zlib.net/)



## Building madplay

Create a folder called madplay\_build and then extract the
abovementioned archives into folders in madplay\_build.

In addition to setting your build environment variables, you need to set
these variables also.

    export CC=arm-linux-uclibcgnueabi-gcc
    export CXX=arm-linux-uclibcgnueabi-gcc
    export CPPFLAGS='-I/full/path/to/madplay_build/libmad-0.15.1b -I/full/path/to/madplay_build/libid3tag-0.15.1b -I/full/path/to/madplay_build/zlib-1.2.5'
    export LDFLAGS='-L/full/path/to/madplay_build/libmad-0.15.1b -L/full/path/to/madplay_build/libid3tag-0.15.1b -L/full/path/to/madplay_build/zlib-1.2.5'



**Build zlib**

Enter the directory zlib-1.2.5 and run:

    $ ./configure

then run

    make


 **Build libid3tag**

Enter the directory libid3tag-0.15.1b and type

    $ ./configure --host=arm

then type

    $ make

after which, type

    $ cp .libs/libid3tag.a .

(note the trailing dot)


 **Build libmad**

Enter the directory libmad-0.15.1b *Note: Edit 'configure', removing
'-fforce-mem' from the CFLAGS directive with the following command.*

    $ sed -i -e '/fforce-mem/d' configure

and then type

    $ ./configure --host=arm


 then type

    $ make

after which, type

    $ cp .libs/libmad.a .

(note the trailing dot)


 **Build madplay**

Enter the directory madplay-0.15.2b and type

    $ ./configure --host=arm

then type

    $ make

Finally, strip the madplay file as follows:

    $ arm-linux-uclibcgnueabi-strip madplay


 **Install madplay**

Transfer the file, plus one or more MP3s of your choosing, to your Didj.

Make sure the lightning application is stopped.

*On Didj*

    $ /etc/init.d/lightning stop

## Playing MP3s

To execute madplay, On the Didj:

    # madplay yourfile.mp3

## Streaming MP3s

To stream audio, wget a stream (the example is NPR news), while piping
the stream through madplay:

    # wget -O - http://npr.ic.llnwd.net/stream/npr_live24 | ./madplay -

Note that .pls files are not supported in madplay. (but you can open
them with a text editor to get the URL)

Enjoy the sound!

## References

[http://www.mneuroth.de/privat/zaurus/madplay.html](http://www.mneuroth.de/privat/zaurus/madplay.html)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

