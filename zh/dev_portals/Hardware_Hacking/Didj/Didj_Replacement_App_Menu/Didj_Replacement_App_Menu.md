> From: [eLinux.org](http://eLinux.org/Didj_Replacement_App_Menu "http://eLinux.org/Didj_Replacement_App_Menu")


# Didj Replacement App Menu



## Contents

-   [1 NOTE](#note)
-   [2 Theoretical implementation](#theoretical-implementation)
    -   [2.1 Background info](#background-info)
    -   [2.2 Basic idea](#basic-idea)
    -   [2.3 Basic implementation](#basic-implementation)
    -   [2.4 references](#references)

# NOTE

This is not a working replacement yet, is considered a work-in-progress,
is currently musings on how it could be done, and is in general not
going to work for you. Proceed with extreme caution!

# Theoretical implementation

## Background info

GrizzlyAdams on the IRC channel has been working on implementing a new
menu system called DJ System Menu.<sup>[[1]](#cite_note-1)</sup> With
that in mind, he is currently working on having a way to launch the menu
from Brio. This most likely won't work well for a few reasons. First, if
it's launched directly from Brio's AppManager, AppManager stays in
memory, eating away at what precious RAM we have to work with. Secondly,
if it's launched, and AppManager is exited to save RAM, the Didj by
default will shutdown because of how /usr/bin/launch\_main behaves
(which is pretty much the state machine watching AppManager and reacting
to it's various exit states.)

## Basic idea

Now, in order to work around the issues I think the best idea would be
to stop Brio from launching AppManager to begin with. The most user
friendly way I can think of is how GrizzlyAdams kind of started, but
rather than launching djsm from AppManager, the small Brio app disables
Brio and enables djsm to start when the system is started.

## Basic implementation

This is the actual application which Brio will launch: ` `

    /*
     * Simple Brio App.so to remove Brio at startup.
     */

    #include <stdio.h>
    #include <stdlib.h>
    #include <unistd.h>

    #define LaunchPath "/Didj/disabler"
    #define LaunchBin "/Didj/disable/disable.sh"

    int CreateApp(int argc, char** argv)
    {
        chdir(LaunchPath);

        system("/bin/sh " LaunchBin);

        return 0;
    }

And this is the /Didj/disable/disable.sh shell script: ` `

    #/bin/sh
    # make sure our / is mounted read/write
    mount -o remount,rw /
    # remove Brio from launching
    rm -fr /etc/rc.d/*lightning
    # remove an example init.d script that's pointless
    rm -fr /etc/rc.d/*example
    # copy our init.d script over
    cp djsm.init.d /etc/init.d/djsm
    # make a link that tell it when it should launch
    ln -s /etc/init.d/djsm /etc/rc.d/S99djsm
    # and make the link to tell it when it should quit
    ln -s /etc/init.d/djsm /etc/rc.d/K99djsm

And here would be the djsm.init.d: ` `

    #!/bin/sh
    DJSMPWD=/Didj/djsm
    case "$1" in
        start)
            echo "Starting djsm"
            $DJSMPWD/djsm -pid $DJSMPWD/djsm.pid
            ;;

        stop)
            echo "Stopping djsm"
            kill `cat $DJSMPWD/djsm.pid`
            ;;
        *)
            echo "Usage: /etc/init.d/example {start|stop}"
            exit 1
            ;;
    esac

    exit 0

Now, these are just untested prototypes at this point to get the basic
idea across about one possible method for disabling Brio from Brio.

## references

1.  [↑](#cite_ref-1)
    [http://didj.twihb.net/djsm/](http://didj.twihb.net/djsm/)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Didj](http://eLinux.org/Category:Didj "Category:Didj")

