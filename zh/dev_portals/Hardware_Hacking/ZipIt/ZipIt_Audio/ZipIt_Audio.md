> From: [eLinux.org](http://eLinux.org/ZipIt_Audio "http://eLinux.org/ZipIt_Audio")


# ZipIt Audio



The Zipit is a fairly capable audio device. There are several
applications that can play audio on the Zipit. [Yahoo!
group.](http://groups.yahoo.com/group/zipitwireless) has some of these
in the files section (see [OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") /
Applications / Freebase for example)

Thanks to Ken McGuire, The [ZipIt](http://eLinux.org/ZipIt "ZipIt")'s audio hardware is
supported and you have access to a standard OSS-style audio device. This
means that any application that works with /dev/dsp *should* work once
compiled for the [ZipIt](http://eLinux.org/ZipIt "ZipIt"). The Device names are a little
different than what you may be used to by default. They are:




    Mixer:  /dev/zipm      # mknod /dev/zipm c 245 0

    Audio:  /dev/zipaudio  # mknod /dev/zipaudio c 245 4

    DSP:    /dev/zipd      # mknod /dev/zipd c 245 3


 The zipaudio device is the one you wind up dealing with most often. As
on any other linux machine you can cat wav files to it and hear sound,
provided the wav files are encoded to exactly what the zipaudio device
is expecting.

Generally speaking, the zipaudio device expects audio data in RAW format
at 44100 Hz, 2 channel, 16bits (signed little-endian) per sample. This
equates to the following SOX output options:

sox inputfile.wav -t raw -c 2 -r 44100 -w -s output.wav

**Note**: *If your audio file was created on a big-endian machine
(powerpc, etc) you need to swap the bytes using the -x flag to sox*


 The big limitation on audio capability on the [ZipIt](http://eLinux.org/ZipIt "ZipIt")
is CPU power. The [ZipIt](http://eLinux.org/ZipIt "ZipIt")'s 90Mhz Arm CPU does not give
you a lot of room for audio processing. Though some users have had
success with audio decoding on the [ZipIt](http://eLinux.org/ZipIt "ZipIt"), at 'average'
bitrates, decoding the audio and playing it back seems to take the
majority of the CPU.

Other applications running while performing MP3 or OGG decoding tend to
make the audio 'skip' from time to time - though a well optimized /
buffered player can minimize or even alleviate this.

The company that makes and markets the [ZipIt](http://eLinux.org/ZipIt "ZipIt"),
[ZipitWireless](http://zipitwireless.com/) has recently released an
update that allows users to listen to music from their PC. Though little
is known about how this is actually accomplished, it is believed that
the decoding occurs on the PC, and raw audio is streamed to the
[ZipIt](http://eLinux.org/ZipIt "ZipIt").

Similar functionality has been developed on
[OpenZipIt](http://eLinux.org/OpenZipIt "OpenZipIt") by [Jay
Kuri](http://eLinux.org/index.php?title=Jay_Kuri&action=edit&redlink=1 "Jay Kuri (page does not exist)")
allowing users to stream any audio from their Linux desktop to their
[ZipIt](http://eLinux.org/ZipIt "ZipIt"). (note: add link to setup instructions)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

