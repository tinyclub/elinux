> From: [eLinux.org](http://eLinux.org/Leapster_Explorer:_Play_Your_Own_Flash_Games "http://eLinux.org/Leapster_Explorer:_Play_Your_Own_Flash_Games")


# Leapster Explorer: Play Your Own Flash Games



This how-to will show you how to load your own flash swf files on to the
Leapster Explorer and play them from the standard User Interface. This
solution is very very beta, proceed to the Problems section before
experimenting with this, it does not work 100% and will require some
trial and error to find flash files that work well with the Explorers
range of inputs.



## Contents

-   [1 Programs Needed](#programs-needed)
-   [2 Software Needed](#software-needed)
-   [3 Requirements](#requirements)
-   [4 Configure Package and Load It](#configure-package-and-load-it)
-   [5 Problems](#problems)
-   [6 Example Flash App](#example-flash-app)
-   [7 Developing](#developing)

## Programs Needed

[STFP
Access](http://eLinux.org/LeapFrog_Pollux_Platform:_Networking_Applications#SSH "LeapFrog Pollux Platform: Networking Applications")

## Software Needed

Flash Game (see requirements)

[Game Package
Template](http://files.poxlib.org/LeapFrog/elinux_downloads/OpenDidj_Game_Template_V1.0.tar.gz)

## Requirements

The Flash Lite for the Digital Home, as built for the Leapster Explorer,
is a bit hit or miss, when it comes to playing random

-   The swf file must be ActionScript2 and compiled for versions no
    higher than Flash Player 8.
-   Flash Lite for the Digital Home does not support all AS2 features.
    No internet access, etc
-   Files built much larger than 320x240, may have issues with
    displaying, or the exit screen.
-   Pick games that have simple inputs. Flash Lite interprets the
    buttons as these values.

## Configure Package and Load It

The easiest way about this, is to download the Template folder. If you
have downloaded a game previously, you could make your own. By renaming
your file loader.swf and changing a few values as needed in the .json
files and meta.inf. The template package includes a loader.swf file,
that puts a wrapper around your file, so that you can cleanly exit back
to the UI. With out it, you must shut off the device.

The first step is finding a suitable swf file, this can take some trial
and error, the **Requirements** section has some hints about what to
look for.

Next rename the file test.swf and copy it into the folder.

Looking through the .json files and meta.inf you can change anything
that says OpenDidj. If its a file link, be sure it matches the file you
want to link to. Icons are 8 bit png files.

Rename the folder so it does not conflict with any other package you
have uploaded.

Using SFTP/SCP/SSH upload your file to the device.
/LF/Bulk/ProgramFiles/ is where it needs to be.

Unplug the USB cable and it should bring up the UI with a new menu
option, click right arrow if you do not see it.

Then start it like you would any other application. If it fails, it
should bring you back to the UI. If not you can test the playability and
when you want to exit, hit the home button and confirm.



## Problems

Screen goes black, and returns to Explorer UI

-   Flash file is newer than ActionScript2.
-   Flash file is made for a Flash Player greater Flash 8.
-   Flash executed a command that is not available in Flashlite, certain
    filters, web links, etc.

Controls not responding, or missing

-   game or interactive elements not compatible with the limited inputs
    of the Explorer.

No way to exit Flash

-   This is avoidable for the most part, by using the OpenDidj Package
    Template.
-   This is to my knowledge unavoidable with random Flash files, see the
    Example for how to deal with it on your own files.

Flash runs very slow

-   Common problem with games that have a lot of movement or complex
    physics or any other processor intensive code.

Displays bigger than screen size

-   Common problem with flash files whose document stage is bigger than
    320x240
-   OpenDidj Package Template loader.swf deals with this, but currently
    it will oversize the exit confirmation screen, forcing you to turn
    off the device to exit.

## Example Flash App

This assumes previous knowledge of Adobe Flash.

Document:

Width: 320

Height: 240

12 Frames Per Second

Publish Settings:

Flash Player 8

ActionScript 2

This sample will print the OS Name, Player version and will capture
input codes and print them to the stage which you can use to control the
games from LX input. On the stage create two labels and a button. Create
three labels *text\_version*, *text\_keypress* and, *text\_stylus*, name
the button *button\_exit*.

On the first frame add this for the Actions

     // get version from player
     version = eval("$version");

     // player info vars
     var os_type;
     var version_array;
     var major_version;
     var major_revision;
     var minor_version;
     var minor_revision;

     // split up version info
     os_array = version.split(' ');
     os_type = os_array[0];
     version_array = os_array[1].split(',');

     // populate version vars
     major_version = version_array[0];
     major_revision = version_array[1];
     minor_version = version_array[2];
     minor_revision = version_array[3];

     // populate text_version label
     text_version.text = "Version Info: \n" +
     "OS Version: " + os_type + "\n" +
     "Major Version: " + major_version + "\n" +
     "Major Revision: " + major_revision + "\n" +
     "Minor Version: " + minor_version + "\n" +
     "Minor Revision: " + minor_revision + "\n";

     // populate initial text_keypress label
     text_keypress.text = "Key Press Code:\nKey ASCII Code:";

     // set up key press event listener and function
     var key_listener:Object = new Object();
     key_listener.onKeyDown = function() {
       text_keypress.text = "Key Press Code: " + Key.getCode() + "\n" +
       "Key ASCII Code: " + Key.getAscii();
     };
     Key.addListener(key_listener);

     // capture stylus position
     text_stylus.text = "Stylus: \nX: 0\nY: 0";
     onEnterFrame = function() {
      text_stylus.text = "Stylus: \nX: " + _xmouse + "\n" +
      "Y: " + _ymouse;
     };


 An easy way to make your application exit, is to cause it to crash.
Change the label on your button to *Exit* and make its function do
something Flash Lite is not capable of doing, like getURL. This will
cause it to fail, and it will go back to the main UI.

     // on key press make Flash error
     on(release){
       getURL("error_out");
     }

Make sure your settings are to Flash Player 8 and ActionScript 2 and
publish your file. Save it as test.swf if you're using the OpenDidj
Template. Load the files as configured above to your device and if all
went well, you should see the Flash Player version and OS type once you
run the application. Now press the stylus on the screen and move it
around, you will its X and Y coordinates at the bottom.

## Developing

The Explorer uses Flash Lite 3.1 For The Digital Home, which is a
version meant for System On a Chip hardware. Unlike the Mobile version
which is for mobile phones and those such devices. With Digital Home,
the hardware vendor uses their own sources, in conjunction with
Actionscript Extensions. The Extensions are to provide the Flash Lite
player with specific access to items on the hardware. If this was a
media set top box, then it could be used to give Flash Lite access to a
volume circuit or the ability to change channels. Essentially an AS file
is created, that is similar to a C++ header file, which is imported into
the Flash app during development. The hardware vendor also creates a
corresponding C++ file with the actual working code in it, which is
compiled along with the Flash Lite player from the Adobe provided source
code. Which unless you're a company with a good pitch, you probably
won't be getting any time soon. Thus leaving you needing to reverse
engineer the added functionality of the hardware you are trying to
develop Flash for. If it is the Explorer you would surely want to be
able to exit your Flash app with out having to shut down your device.
There may very well also be some other features you would like to
incorporate, if you planned on creating your own User Interface, or
application that needs lower level hardware access. I will explain the
process to incorporating any functions you may find, that you would like
access to in your Flash app.

The functions are listed in plain text in the Plugin binaries, on your
LX look in /LF/Base/Flash/plugins, you will find AppManagerPlugin.so
CYOPlugin.so etc. I used Notepad++ to open these, its a text editor, and
while you will see a bunch of garbage, if you scroll down thru the file,
you will see some plain text, of what look like some function names.
AppManagerPlugin.so happened to have the exit function in it, popApp. It
will take some figuring out, popApp sounds like taking an element out of
an array, there was also pushApp. You may also want to check the log
file found in /LF/Base/FR/ as I did a search for popApp after it didn't
work I found a reference to a kPopApp, after some fiddling with the name
it turned out to be PopApp() a capital P instead of lower case. Also in
the binary you should find the plain text LF.AppManager, this turns out
to be the name of what you will import into Flash.

So now that we have our information, lets build the file needed by Flash
to use the LF exit function, instead of that nasty crash back to the UI
way. Create a folder in your project directory named LF/ inside that
file create a file named AppManager.as then open it with your favorite
text editor and put in

     intrinsic dynamic class LF.AppManager
     {
         public static function PopApp():Void;
     }

Intrinsic tells it that this file just basically has the prototypes of
the functions, dynamic allows the objects to be changed, and won't do
strict type checks. [AS Extensions for Flash Lite Digital
Home](http://wwwimages.adobe.com/www.adobe.com/content/dam/Adobe/en/devnet/devices/pdfs/as_extensions_flash_lite_digital_home.pdf)
This file will explain it much better. I went with Dynamic simply
because this is going to take some trial and error. Looking at your
binary in a text editor, should give you some clues as to what sort of
data is expected or is sent. Look for things like function\_arg(%s) or
function\_return() %s. Its a bit cryptic but with some practice, you
should be able to decipher some of it. Create an entry for each function
you would like access to, and put this in the Actions/Actionscript file
of your Flash project.

     import LF.AppManager;

Which will make the function PopApp() available in your application, and
allow the swf to compile with out complaint. Things I noted while trying
this out, the compiler complained the function wasn't static, you may
want to play around with it. Though it was noted in the linked document,
private is not appropriate, as all of that will be taken care of in the
C++ files themselves.

This is a rather generic explanation of the process, and should be
applicable to all SoC's that use Flash Lite in a standalone fashion for
their UI or other features. And of course, check with the manufacturer
on the legality of what you are attempting or more importantly, how you
are doing it, so think before you leap, least you want some trouble.
Some good resources I found linked to on the internet, explaining Adobe
Flashlite for Digital Home.

[Getting Started with Flashlite Digital
Home](http://wwwimages.adobe.com/www.adobe.com/content/dam/Adobe/en/devnet/devices/pdfs/flash_lite_digital_home_getting_started.pdf)

[Developing Apps for Flashlite Digital
Home](http://wwwimages.adobe.com/www.adobe.com/content/dam/Adobe/en/devnet/devices/pdfs/developing_apps_flash_lite_digital_home.pdf)

[AS Extenions for Flashlite Digital
Home](http://wwwimages.adobe.com/www.adobe.com/content/dam/Adobe/en/devnet/devices/pdfs/as_extensions_flash_lite_digital_home.pdf)

[Optimizing Flashlite Digital
Home](http://wwwimages.adobe.com/www.adobe.com/content/dam/Adobe/en/devnet/devices/pdfs/optimizing_flash_lite_digital_home.pdf)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Leapster
    Explorer](http://eLinux.org/Category:Leapster_Explorer "Category:Leapster Explorer")

