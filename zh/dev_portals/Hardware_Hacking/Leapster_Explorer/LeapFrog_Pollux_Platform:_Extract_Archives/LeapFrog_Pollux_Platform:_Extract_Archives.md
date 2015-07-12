> From: [eLinux.org](http://eLinux.org/LeapFrog_Pollux_Platform:_Extract_Archives "http://eLinux.org/LeapFrog_Pollux_Platform:_Extract_Archives")


# LeapFrog Pollux Platform: Extract Archives



## Summary

The [LeapFrog Pollux
Platform](http://eLinux.org/LeapFrog_Pollux_Platform "LeapFrog Pollux Platform") of
devices is updated by the LFConnect program retrieving archive files
from a central server. Of note the firmware file system image comes
contained in one of these archives. It can be useful to extract the
image, and mount it on your PC to inspect its contents.

-   Types of LeapFrog archives
    -   lfp - Zip archives
    -   lf2 - bzip2 archives



## Software Needed

Archive tool, 7zip can handle both types, .zip and .tar.bz2.

## Extract Archives

The archive files can be found in a device named subfolder in one of
these folders, after installing and running LFConnect. Which one depends
on your Windows version.

    XP C:\Documents and Settings\All Users\Application Data\Leapfrog\LeapFrog Connect\
    Vista/Win7 C:\ProgramData\Leapfrog\LeapFrog Connect

Once in possession of the desired archive file. These commands can be
used to extract the contents. It may be necessary to set the actual
archive type with some programs.

*7z Command Line Example*

.lfp

    $ 7z x -tzip LST3-0x00170029-000000.lfp

.lf2

    $ 7z x -tbzip2 LST3-0x00170030-000001.lf2
    $ 7z x -ttar LST3-0x00170030-000001


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")
-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")
-   [LeapPad
    Explorer](http://eLinux.org/index.php?title=Category:LeapPad_Explorer&action=edit&redlink=1 "Category:LeapPad Explorer (page does not exist)")
-   [LeapFrog Pollux
    Platform](http://eLinux.org/index.php?title=Category:LeapFrog_Pollux_Platform&action=edit&redlink=1 "Category:LeapFrog Pollux Platform (page does not exist)")

