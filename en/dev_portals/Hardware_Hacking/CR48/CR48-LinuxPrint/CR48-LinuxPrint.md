> From: [eLinux.org](http://eLinux.org/CR48-LinuxPrint "http://eLinux.org/CR48-LinuxPrint")


# CR48-LinuxPrint



# Printing via Google Cloud Print to a Linux based computer

Until vendors ship [cloud-aware
printers](http://code.google.com/apis/cloudprint/docs/overview.html), we
need the intermediary [cloud print
proxy](http://www.chromium.org/developers/design-documents/google-cloud-print-proxy-design)
to share our printers with the Cr-48. Unfortunately, cloud print proxy
is Windows only. If you're printer is hooked up to a Mac or Linux
machine, you're out of luck. But not any longer thanks to the work of
Chrome OS expert users Jason Michalski and Todd Vierling. They've
created a simple [cloud print proxy python
script](https://github.com/armooo/cloudprint) that runs on Linux and
Macs and connect your CUPS printers to cloud print. The script prompts
you for your Google Account and then discovers your printers
automatically.

-   Credit to
    [http://chromeos-cr48.blogspot.com](http://chromeos-cr48.blogspot.com/2011/02/cloud-print-to-printers-on-your-mac-or.html)





[Back to CR48 Home](http://eLinux.org/CR48 "CR48")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [CR48](http://eLinux.org/Category:CR48 "Category:CR48")

