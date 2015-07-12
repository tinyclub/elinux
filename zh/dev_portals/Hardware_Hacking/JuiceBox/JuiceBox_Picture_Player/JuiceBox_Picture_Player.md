> From: [eLinux.org](http://eLinux.org/JuiceBox_Picture_Player "http://eLinux.org/JuiceBox_Picture_Player")


# JuiceBox Picture Player



## Picture Player

This uses the same flash card adaptor as the [JuiceBox Music
Player](http://eLinux.org/JuiceBox_Music_Player "JuiceBox Music Player"), but requires
that the pictures be in a more proprietary file format. Pictures must be
exactly 240x160 pixels, and stored in a raw format using 12 bits per
pixel (4 bits for each of RGB.) In addition, the files must have a
'.JBP' extension and appear in the root directory of the flash card.
Standard procedure seems to be to use your favorite photo editor to
produce the 240x160 pixel format, a common open source image reformatter
like [ImageMagick](http://www.imagemagick.org/script/index.php) to
produce a raw RGB file with 24 bits/pixel, and one of several [special
utilities written by the JuiceBox hacking
community](http://www.linux-hacker.net/cgi-bin/UltraBoard/UltraBoard.pl?Action=ShowPost&Board=MJB&Post=13)
to convert that to 12bits/pixel.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [JuiceBox](http://eLinux.org/Category:JuiceBox "Category:JuiceBox")

