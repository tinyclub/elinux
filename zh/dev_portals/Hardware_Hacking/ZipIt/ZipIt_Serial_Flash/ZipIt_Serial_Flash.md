> From: [eLinux.org](http://eLinux.org/ZipIt_Serial_Flash "http://eLinux.org/ZipIt_Serial_Flash")


# ZipIt Serial Flash



**If someone would like to add instructions for flashing the Zipit in
Linux, it would be greatly appreciated.**

You can upload new firmware via a serial port connection to the Zipit's
flash memory from a Windows PC or Linux box. First you have to modify
your Zipit to add a serial port. See [Zipit Serial
Mod](http://eLinux.org/Zipit_Serial_Mod "Zipit Serial Mod")

To begin, perform the following instructions.


 What you need:

-   Windows PC
-   DB-9 Serial port or equivalent (such as a USB to Serial adapter)
-   Zipit with serial mod performed (preferably 5-wire mod); [Zipit
    Serial Mod](http://eLinux.org/Zipit_Serial_Mod "Zipit Serial Mod")
-   Zipit Software Tools;
    [http://www.aibohack.com/zipit/zipit\_tool\_extras.zip](http://www.aibohack.com/zipit/zipit_tool_extras.zip)

1.) Extract the Zipit software tools to a convenient location.

2.) Connect your modded Zipit to your computer through the serial port.
Make sure that the debug pin (DBG) is grounded.

3.) In your extracted folder, open the folder named SERIAL\_5.

4.) Run the file named up.bat. You should see the following below:

    Transferring bootstrap program
    Transfer complete
    Switch to 57.6kbps
    Echo + upload commands
           Decide what to upload
           'A' - allrom.bin upload (2MB)
           'a' - loader.bin upload (8K max)
           'k' - zimage.dat upload (581K max)
           'u' - ramdisk.gz upload (1.5MB max)
           Follow changes with 'WYes' to write
           Other commands
           'R' - grab ROM

    ZP< .02 - 57.6Kbps new cmds
     Loader addresses: 00002000 00090000

    OK >

5.) Now you need to type a lowercase "a". You should see the text below.

    OK > a
    //Uploading 8032 bytes from loader.bin
    // done upload
    OK >

6.) Type in a lowercase "k". This step may take a few minutes.

    OK > k
    //Uploading 573300 bytes from zimage.dat
    // done upload
    OK >

7.) Type in a lowercase "u". This step may take quite a while, SO LET IT
WORK! In my own personal experiences, it has taken 7 to 12 minutes.

    OK > u
    //Uploading 1372343 bytes from ramdisk.gz
    // done upload
    OK >

8.) Then, you need to type a capital "W". Wait a few moments until 'PWD'
shows up, then type 'Yes', with the capital Y.

    OK > [type W, wait for PWD, then type Yes]
    E+W PWD?ERASING,ERASED,WRITTEN!
    OK >

9.) Finally, type a question mark if you would like to see information
about your Zipit.

    OK > ?
    GPIO: 80 FF 28 02
    UNIQID: 902FDA7F
    RANDID: 007C1C60D37FEA1F59606150902FDA7F
    FLASHROM: 1EFDE9D2
    BURN_SRC: 1EFDE9D2
    OK >

Congratulations, your Zipit now runs Linux! Exit out of the command
prompt, turn off your Zipit, and unplug your Zipit. When you turn your
Zipit back on, you should see the "Hacked by ZipItPet" logo.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Zipit](http://eLinux.org/Category:Zipit "Category:Zipit")

