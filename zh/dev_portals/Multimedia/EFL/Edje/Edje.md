> From: [eLinux.org](http://eLinux.org/Edje "http://eLinux.org/Edje")


# Edje



Edje is an [Evas](http://eLinux.org/Evas "Evas") smart object implementation, so part of
[Enlightenment Foundation Libraries](http://eLinux.org/EFL "EFL"), written in C but with
bindings for Python. This smart object is very special because it will
load internal parts description from files and can be used as a
**super-theme** engine.

These files, often called EDC or EDJ due these names being used as
extension for source and binary form, will contain all resources
required, including images, fonts, description and even scripts. One can
compile the textual description from an EDC file to EDJ using
`edje_cc file.edc`. The compiled file is an archive created with EET
library.

Each EDJ file will contain a collection of groups. Each `edje_object` is
mapped to a group into and EDJ file. This group should contain a set of
parts that will map to children objects of `edje_object`, these objects
can be anything supported by Evas, like rectangles, text and even other
Edje objects! These parts will have states descriptions and possible
events to change from one state to another, Edje will take care of
keeping these states and recalculate as needed.

### Documentation

-   [API (Doxygen)](http://docs.enlightenment.org/api/edje/html/)
-   [EDC
    Reference](http://docs.enlightenment.org/api/edje/html/edcref.html)
-   [Wiki page at Enlightenment
    Wiki](http://wiki.enlightenment.org/index.php/Edje)
-   [Creating Edje User
    Interface](http://wiki.enlightenment.org/index.php/Creating_Edje_User_Interfaces),
    Python tutorial
-   [Application development with
    Edje](http://svn.enlightenment.org/svn/e/trunk/DOCS/devwithedje/pre-rendered/devwithedje.html),
    Book by Andres Blanc (work in progress)

### Features

-   based on states and state transitions
-   geometries can be specified as absolute and relative, including
    relative to other parts, this produces scalable yet pixel perfect
    intefraces
-   scriptable using Embryo, Lua is under consideration
-   application communication is done via messages and signals.
-   [Edje\_Editor](http://wiki.enlightenment.org/index.php/Edje_Editor)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Enlightenment](http://eLinux.org/index.php?title=Category:Enlightenment&action=edit&redlink=1 "Category:Enlightenment (page does not exist)")

