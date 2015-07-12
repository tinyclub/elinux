> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_Play_Theora_Videos "http://eLinux.org/Leapster_Explorer:_Play_Theora_Videos")


# Leapster Explorer: Play Theora Videos



This how-to will show you how to load your own Theora (Ogg Vorbis) video
files on to the Leapster Explorer and play them from the standard User
Interface.

## Contents

-   [1 Prerequisites](#prerequisites)
-   [2 Programs Needed](#programs-needed)
-   [3 Convert and Upload Video](#convert-and-upload-video)
    -   [3.1 Get Video Packaging](#get-video-packaging)
    -   [3.2 Encoding the Video](#encoding-the-video)
    -   [3.3 Encoding the Menu Audio](#encoding-the-menu-audio)
    -   [3.4 Editing the Package Files](#editing-the-package-files)
    -   [3.5 Upload the Movie](#upload-the-movie)

## Prerequisites

[SFTP
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking_Applications#SSH "LeapFrog Pollux Platform: Networking Applications")

## Programs Needed

All programs are available for Windows and Linux.

[ffmpeg2theora](http://www.v2v.cc/~j/ffmpeg2theora/download.html)

[LAME mp3 Encoder](http://lame.sourceforge.net/)

[OpenDidj Video Template
Package](http://files.poxlib.org/LeapFrog/elinux_downloads/OpenDidj_Video_Template_V1.0.tar.gz)
(If you no longer have ConnectMovieApp installed)

SFTP Program

-   This tutorial uses the Linux command line, you can also use a GUI
    program in either Windows or Linux

## Convert and Upload Video

Each program needs to contain a few different files in its directory,
for it to work correctly with the LeapFrog GUI. First thing you'll need
to do, is connect to your device with your SFTP program.

#### Get Video Packaging

We are going to use the ConnectMovieApp folder as the base template for
holding our video file. From your host PC run the following command:

    $ scp -r root@10.0.0.2:/LF/Bulk/ProgramFiles/ConnectMovieApp .

Scp will then download the files to your current working directory.

#### Encoding the Video

For Linux ffmpeg2theora is included in most distribution repos so
install using your distributions method. On Windows see the link in
Programs Needed.

Encoding the file is done with one line:

     ffmpeg2theora -o output_video.ogg -F 12 -H 16000 -x 320 -y 240 input_video.avi

#### Encoding the Menu Audio

The menu sound is played after you make a selection, and it asks you if
you are sure. The mp3 found in the Audio/ folder is the one used, to
encode you're own using LAME run:

    lame.exe -b 48 -m m --resample 44 <input>.wav <output>.mp3

Then replace the one provided and change the name in the main
directories GameInfo.json file to point it.

#### Editing the Package Files

Depending on your firmware version, ConnectMovieApp may no longer be
available. You can use the OpenDidj version which was pulled from an old
update. Anywhere you see OpenDidj, you can replace it with your name.

First thing to do is to open the ConnectMovieApp directory and inside
the Video directory delete the ConnectMovie.ogg and
LExplorer\_ConnectMovie\_Mix\_V6.ogg place your newly encoded file in
this directory. You may need to use a Leaplet code or find someone that
has the package, that could give you the files, as ConnectMovieApp may
not exist on your device.

Open the VideoInfo.json file and replace the ConnectMovie.ogg and
LExplorer\_ConnectMovie\_Mix\_V6.ogg lines with your new video filename.

Moving back to the parent directory you can edit the GameInfo.json with
some infomation about your video rather then the default you could also
use this time to edit the ConnectMovie001.png to something more
meaningful.

Rename the directory from ConnectMovieApp to something that means
something.

#### Upload the Movie

     scp -r NewVid root@10.0.0.2:/LF/Bulk/ProgramFiles/

Unplug the USB cable and enjoy your new video.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

