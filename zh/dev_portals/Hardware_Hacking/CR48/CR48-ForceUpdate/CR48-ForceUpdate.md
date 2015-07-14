> From: [eLinux.org](http://eLinux.org/CR48-ForceUpdate "http://eLinux.org/CR48-ForceUpdate")


# CR48-ForceUpdate



## Forcing a Software Update

Because Google does not prompt all machines to upgrade at once,
sometimes your machine may not be on the latest release. If you know
that an update is available, and have a reason to upgrade, here are the
steps.
 NOTE: You will need to be [rooted](http://eLinux.org/CR48-rooting "CR48-rooting") for
this procedure.

Stop the normal background update engine process.
 It runs at a very low priority by default meaning updates can take a
long time

` sudo su  initctl stop update-engine`

 Start the update-engine process running in the foreground and with
errors reported to the shell. The & gives us our shell back.

` update_engine -foreground -logtostderr &` The following Code runs the
upgrade check in a constant loop till Google's servers offer us the
update. Once that starts, we can end this process with CTRL+C
 This command should be entered all on one line.

` while true; do update_engine_client -check_for_update; update_engine_client -update; sleep 5; done`



[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

