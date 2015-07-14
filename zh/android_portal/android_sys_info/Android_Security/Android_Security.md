> From: [eLinux.org](http://eLinux.org/Android_Security "http://eLinux.org/Android_Security")


# Android Security



## Contents

-   [1 Overview](#overview)
-   [2 Kernel-level security](#kernel-level-security)
    -   [2.1 Users and groups](#users-and-groups)
        -   [2.1.1 Sample File Permissions](#sample-file-permissions)
        -   [2.1.2 Sample Process List](#sample-process-list)
    -   [2.2 Paranoid network-ing](#paranoid-network-ing)
-   [3 Application-level security](#application-level-security)
-   [4 Tutorial](#tutorial)
-   [5 Security Analysis](#security-analysis)
-   [6 Security Investigations](#security-investigations)
    -   [6.1 TOMOYO Linux investigation](#tomoyo-linux-investigation)
        -   [6.1.1 Presentation](#presentation)
        -   [6.1.2 Code](#code)
        -   [6.1.3 Contact](#contact)
-   [7 Security Tricks](#security-tricks)
    -   [7.1 Changing application security permissions after
        installation](#changing-application-security-permissions-after-installation)

## Overview

The overall architecture of Android security is described at:
[http://developer.android.com/guide/topics/security/security.html](http://developer.android.com/guide/topics/security/security.html)

Each application is given its own Linux user id (UID) and group ID

## Kernel-level security

### Users and groups

Each application is assigned a uid and gid at install time. Application
data files are stored in /data/data/\<app-name\>/..., and are
read-writable only by that application process.

#### Sample File Permissions

Here is an example from my ADP1 phone (lots of lines omitted to reduce
noise):

(Oh, and yes, I'm using busybox - find, xargs, and sort are not
available otherwise)

    # find /data/data -type f | xargs ls -l | sort -k3 -n
    -rw-------    1 1000     1000         1954 Nov 12 01:10 /data/data/com.android.providers.subscribedfeeds/files/sslcache/android.clients.google.com.443
    -rw-r--r--    1 1000     1000       147608 Apr  6  2009 /data/data/com.google.tts/lib/libspeechsynthesis.so
    -rw-rw----    1 1000     1000           65 Nov  5 02:01 /data/data/com.google.android.systemupdater/shared_prefs/system_update_helper.xml
    -rw-rw----    1 1000     1000          679 Nov 11 23:18 /data/data/com.android.settings/shared_prefs/com.android.settings_preferences.xml
    -rw-rw----    1 1000     1000         2000 May 14 20:07 /data/data/com.google.android.location/files/DATA_Preferences
    -rw-rw----    1 1000     1000         6144 Dec 19  2008 /data/data/com.android.settings/databases/webviewCache.db
    -rw-rw----    1 1000     1000        11264 Nov 12 01:10 /data/data/com.android.providers.subscribedfeeds/databases/subscribedfeeds.db
    -rw-rw----    1 1000     1000        14336 Dec 19  2008 /data/data/com.android.settings/databases/webview.db
    -rw-rw----    1 1000     1000        36864 Nov 12 18:23 /data/data/com.android.providers.settings/databases/settings.db
    -rw-rw----    1 1000     1000       129024 Nov 12 18:45 /data/data/com.google.android.server.checkin/databases/checkin.db
    -rw-rw-r--    1 1000     1000          120 Nov 12 01:09 /data/data/com.android.providers.subscribedfeeds/shared_prefs/subscribedFeeds.xml
    -rwxrwx---    1 1000     1000        54052 Dec 20  2008 /data/data/com.android.settings/files/wallpaper
    -rw-------    1 1001     1001            4 Oct 31 21:09 /data/data/com.android.providers.telephony/app_parts/PART_1257023388570
    -rw-------    1 1001     1001            4 Oct 31 21:10 /data/data/com.android.providers.telephony/app_parts/PART_1257023445796

    ...
    -rw-rw----    1 1001     1001          103 May 13  2009 /data/data/com.android.providers.telephony/shared_prefs/preferred-apn.xml
    -rw-rw----    1 1001     1001          122 Oct 28 17:37 /data/data/com.android.phone/shared_prefs/com.android.phone_preferences.xml
    -rw-rw----    1 1001     1001          126 Sep  3  2008 /data/data/com.android.phone/shared_prefs/_has_set_default_values.xml
    -rw-rw----    1 1001     1001         7168 Nov  5 02:01 /data/data/com.android.providers.telephony/databases/telephony.db
    -rw-rw----    1 1001     1001        69632 Nov  6 01:58 /data/data/com.android.providers.telephony/databases/mmssms.db
    -rw-rw----    1 10000    10000         114 Apr 20  2009 /data/data/com.android.alarmclock/shared_prefs/AlarmClock.xml
    -rw-rw----    1 10000    10000        4096 Dec 19  2008 /data/data/com.android.alarmclock/databases/alarms.db
    -rw-rw----    1 10001    10001        7168 Nov 12 18:43 /data/data/org.koxx.forecast_weather.v2/databases/forecasts.db
    -rw-rw----    1 10002    10002         489 Nov 11 23:19 /data/data/com.android.calculator2/files/calculator.data
    -rw-rw----    1 10003    10003         683 Jun 10 19:27 /data/data/com.android.camera/shared_prefs/com.android.camera_preferences.xml
    -rw-rw----    1 10003    10003        5120 Dec 20  2008 /data/data/com.android.providers.drm/databases/drm.db
    -rw-rw----    1 10003    10003       10240 Nov  1 16:24 /data/data/com.android.providers.downloads/databases/downloads.db
    -rw-rw----    1 10003    10003       37888 May 13  2009 /data/data/com.android.providers.media/databases/internal.db
    -rw-rw----    1 10003    10003       37888 Sep  4 23:25 /data/data/com.android.camera/databases/launcher.db
    -rw-rw----    1 10003    10003       60416 Nov 12 19:01 /data/data/com.android.providers.media/databases/external-39636438.db
    -rw-r--r--    1 10004    10004           0 Jun 12 01:13 /data/data/com.android.providers.im/databases/im.db-mj76B91FF8
    -rw-r--r--    1 10004    10004           0 Jun 12 04:05 /data/data/com.android.providers.im/databases/im.db-mj0AB1E39C
    ...
    -rw-rw----    1 10004    10004         105 Dec 18  2008 /data/data/com.android.providers.contacts/shared_prefs/owner-info.xml
    -rw-rw----    1 10004    10004         125 Nov 11 16:37 /data/data/com.android.contacts/shared_prefs/dialtacts.xml
    -rw-rw----    1 10004    10004         126 Dec 19  2008 /data/data/com.android.contacts/shared_prefs/_has_set_default_values.xml
    -rw-rw----    1 10004    10004         146 Aug 28 16:02 /data/data/com.android.contacts/shared_prefs/com.android.contacts_preferences.xml
    -rw-rw----    1 10004    10004         169 Nov  5 02:01 /data/data/com.android.launcher/shared_prefs/launcher.xml
    -rw-rw----    1 10004    10004        4096 Jan 30  2009 /data/data/com.android.providers.userdictionary/databases/user_dict.db
    -rw-rw----    1 10004    10004       20480 Oct 31 21:12 /data/data/com.android.launcher/databases/launcher.db
    -rw-rw----    1 10004    10004       21504 Nov 12 18:45 /data/data/com.android.providers.im/databases/im.db
    -rw-rw----    1 10004    10004      110592 Nov 12 02:08 /data/data/com.android.providers.contacts/databases/contacts.db
    -rw-------    1 10005    10005         270 Jun 13 03:36 /data/data/com.android.email/databases/0c180cf8-fb7b-4d3e-b994-4282611af63a.db_att/32
    -rw-r--r--    1 10005    10005     1418240 Nov  5 02:01 /data/data/com.android.email/databases/0c180cf8-fb7b-4d3e-b994-4282611af63a.db
    -rw-rw----    1 10005    10005        1866 Dec 20  2008 /data/data/com.android.email/shared_prefs/AndroidMail.Main.xml
    -rw-rw----    1 10005    10005        6144 Sep  8 01:35 /data/data/com.android.email/databases/webviewCache.db
    -rw-rw----    1 10005    10005       14336 May 14 17:58 /data/data/com.android.email/databases/webview.db
    -rw-rw----    1 10006    10006         126 Dec 18  2008 /data/data/com.google.android.gm/shared_prefs/_has_set_default_values.xml
    -rw-rw----    1 10006    10006         199 Jan 22  2009 /data/data/com.google.android.gm/shared_prefs/Gmail.xml
    -rw-rw----    1 10006    10006        6144 Dec 19  2008 /data/data/com.google.android.gm/databases/gmail.db
    -rw-rw----    1 10006    10006        6144 Dec 23  2008 /data/data/com.google.android.gm/databases/webviewCache.db
    -rw-rw----    1 10006    10006       14336 Dec 23  2008 /data/data/com.google.android.gm/databases/webview.db
    -rw-------    1 10007    10007        1888 Nov 12 17:09 /data/data/com.google.android.apps.gtalkservice/files/sslcache/mtalk.google.com.5228
    -rw-------    1 10007    10007        1954 Nov 12 18:43 /data/data/com.google.android.providers.gmail/files/sslcache/android.clients.google.com.443
    -rw-rw----    1 10007    10007        6144 Oct 23 22:43 /data/data/com.google.android.googleapps/databases/webviewCache.db
    -rw-rw----    1 10007    10007        7168 May 13  2009 /data/data/com.google.android.providers.settings/databases/googlesettings.db
    -rw-rw----    1 10007    10007       13312 Nov 11 20:37 /data/data/com.google.android.googleapps/databases/accounts.db
    -rw-rw----    1 10007    10007       14336 May 13  2009 /data/data/com.google.android.googleapps/databases/webview.db
    -rw-rw----    1 10007    10007      502784 Nov 12 18:45 /data/data/com.google.android.providers.gmail/databases/mailstore.tbird20d@gmail.com.db
    -rw-rw----    1 10009    10009         126 Sep  3  2008 /data/data/com.android.mms/shared_prefs/_has_set_default_values.xml
    -rw-rw----    1 10009    10009         585 Sep  3  2008 /data/data/com.android.mms/shared_prefs/com.android.mms_preferences.xml
    -rw-rw-rw-    1 10010    10010         310 Sep 18 01:12 /data/data/com.android.music/shared_prefs/Music.xml
    -rw-rw----    1 10015    10015         126 Apr 29  2009 /data/data/com.google.android.street/shared_prefs/com.google.android.street.StreetView.xml
    -rw-------    1 10017    10017          35 Nov 12 16:49 /data/data/com.android.browser/cache/webviewCache/c24b0576
    -rw-------    1 10017    10017          43 Nov 12 16:47 /data/data/com.android.browser/cache/webviewCache/5446c8f2
    ...
    -rw-------    1 10017    10017     1204872 May 13  2009 /data/data/com.android.browser/app_plugins/gears.so
    -rw-r--r--    1 10017    10017         512 Nov 12 19:18 /data/data/com.android.browser/databases/webviewCache.db-journal
    -rw-r--r--    1 10017    10017        8192 May 14 19:15 /data/data/com.android.browser/gears/geolocation.db
    -rw-r--r--    1 10017    10017       18432 Dec 19  2008 /data/data/com.android.browser/gears/localserver.db
    -rw-r--r--    1 10017    10017       20480 Dec 19  2008 /data/data/com.android.browser/gears/permissions.db
    -rw-r--r--    1 10017    10017       48128 Nov 12 19:01 /data/data/com.android.browser/app_icons/WebpageIcons.db
    -rw-rw----    1 10017    10017         851 May 29 13:53 /data/data/com.android.browser/shared_prefs/com.android.browser_preferences.xml
    -rw-rw----    1 10017    10017       32768 Nov 12 16:49 /data/data/com.android.browser/databases/webviewCache.db
    -rw-rw----    1 10017    10017       68608 Nov 12 16:49 /data/data/com.android.browser/databases/browser.db
    -rw-rw----    1 10017    10017      257024 Nov 12 17:09 /data/data/com.android.browser/databases/webview.db
    -rw-rw-rw-    1 10017    10017           0 Nov 12 16:48 /data/data/com.android.browser/app_plugins/gears-0.5.17.0/gearstimestamp
    -rw-rw----    1 10018    10018         126 Sep  3  2008 /data/data/com.android.calendar/shared_prefs/_has_set_default_values.xml
    -rw-rw----    1 10018    10018         539 Nov 11 23:19 /data/data/com.android.calendar/shared_prefs/com.android.calendar_preferences.xml
    -rw-rw----    1 10018    10018      375808 Nov 12 09:58 /data/data/com.android.providers.calendar/databases/calendar.db
    -rw-rw----    1 10019    10019          48 Nov  7 06:11 /data/data/com.google.android.apps.maps/files/DATA_Tiles
    -rw-rw----    1 10019    10019         483 Nov 11 03:58 /data/data/com.google.android.apps.maps/shared_prefs/com.google.android.maps.MapsActivity.xml
    -rw-rw----    1 10019    10019         708 Nov 12 17:09 /data/data/com.google.android.apps.maps/shared_prefs/friend_finder.xml
    -rw-rw----    1 10019    10019        2000 Nov 11 03:58 /data/data/com.google.android.apps.maps/files/DATA_Preferences
    -rw-rw----    1 10019    10019        6144 May 13  2009 /data/data/com.google.android.apps.maps/databases/webviewCache.db
    -rw-rw----    1 10019    10019        6144 Nov  1 21:28 /data/data/com.google.android.apps.maps/databases/search_history.db
    -rw-rw----    1 10019    10019        8192 Nov 11 03:52 /data/data/com.google.android.apps.maps/databases/friends.db
    -rw-rw----    1 10019    10019       14336 May 13  2009 /data/data/com.google.android.apps.maps/databases/webview.db
    -rw-rw----    1 10019    10019       16048 Nov  7 06:11 /data/data/com.google.android.apps.maps/files/DATA_Tiles_1
    -rw-rw-rw-    1 10019    10019          65 Nov 11 03:52 /data/data/com.google.android.apps.maps/shared_prefs/extra-features.xml
    -rw-rw----    1 10021    10021         435 Oct 30 17:09 /data/data/com.android.vending/shared_prefs/vending_preferences.xml
    -rw-rw----    1 10021    10021        5120 Oct  6 19:38 /data/data/com.android.vending/databases/suggestions.db
    -rw-rw----    1 10021    10021        6144 May 14 17:17 /data/data/com.android.vending/databases/webviewCache.db
    -rw-rw----    1 10021    10021       14336 May 14 17:21 /data/data/com.android.vending/databases/webview.db
    -rw-rw----    1 10021    10021       17408 Oct  6 19:39 /data/data/com.android.vending/databases/assets.db
    -rw-------    1 10022    10022       50077 Nov 12 05:34 /data/data/com.google.android.youtube/cache/videos?vq=peter+sellers+inspector&format=2&restriction=us&start-index=18&max-results=8
    -rw-------    1 10022    10022       53110 Nov 12 05:33 /data/data/com.google.android.youtube/cache/videos?vq=peter+sellers+inspector&format=2&restriction=us&start-index=10&max-results=8
    -rw-------    1 10022    10022       57403 Nov 12 05:33 /data/data/com.google.android.youtube/cache/videos?vq=peter+sellers+inspector&format=2&restriction=us&start-index=1&max-results=9
    -rw-------    1 10022    10022       63761 Nov 12 05:32 /data/data/com.google.android.youtube/cache/recently_featured?format=2&start-index=1&max-results=9
    -rw-rw----    1 10022    10022         739 Nov 12 16:45 /data/data/com.google.android.youtube/shared_prefs/youtube.xml
    -rw-rw----    1 10022    10022        5120 Nov 12 05:34 /data/data/com.google.android.youtube/databases/suggestions.db
    -rw-rw----    1 10025    10025         114 May 13  2009 /data/data/com.google.android.voicesearch/shared_prefs/com.google.android.voicesearch_preferences.xml
    -rw-rw----    1 10025    10025         126 May 13  2009 /data/data/com.google.android.voicesearch/shared_prefs/_has_set_default_values.xml
    -rw-rw----    1 10025    10025        2000 May 13  2009 /data/data/com.google.android.voicesearch/files/DATA_Preferences
    -rw-rw----    1 10025    10025        8192 Jun 10 03:25 /data/data/com.google.android.voicesearch/databases/webviewCache.db
    -rw-rw----    1 10025    10025       14336 May 13  2009 /data/data/com.google.android.voicesearch/databases/webview.db
    -rw-rw----    1 10026    10026         688 Jan 10  2009 /data/data/com.quirkconsulting/shared_prefs/TouchTipv2.xml
    -rw-rw----    1 10026    10026        6144 Dec 19  2008 /data/data/com.quirkconsulting/databases/webviewCache.db
    -rw-rw----    1 10026    10026       14336 Dec 19  2008 /data/data/com.quirkconsulting/databases/webview.db
    -rw-------    1 10027    10027        4326 Aug  8 01:03 /data/data/com.a0soft.gphone.aCurrency/app_db/currency.db
    -rw-rw----    1 10027    10027         170 Aug  8 01:04 /data/data/com.a0soft.gphone.aCurrency/shared_prefs/com.a0soft.gphone.aCurrency_preferences.xml
    -rw-rw----    1 10027    10027         740 Dec 20  2008 /data/data/com.a0soft.gphone.aCurrency/shared_prefs/pref2.xml
    -rw-rw----    1 10027    10027         801 Aug  8 01:05 /data/data/com.a0soft.gphone.aCurrency/shared_prefs/pref3.xml
    -rw-rw----    1 10027    10027        6144 Aug  8 01:03 /data/data/com.a0soft.gphone.aCurrency/databases/webviewCache.db
    -rw-rw----    1 10027    10027       14336 Aug  8 01:03 /data/data/com.a0soft.gphone.aCurrency/databases/webview.db
    -rw-rw----    1 10028    10028       14336 Sep 19 22:17 /data/data/com.stylem.movies/databases/webview.db
    -rw-rw----    1 10028    10028       53248 Sep 19 22:18 /data/data/com.stylem.movies/databases/webviewCache.db
    -rw-rw----    1 10029    10029         241 Jan 10  2009 /data/data/com.capaci.android.flashlight/shared_prefs/SettingsFile.xml
    -rw-rw----    1 10030    10030         233 Jun 15 15:02 /data/data/com.weather.Weather/files/tile-Radar-023010230-200906151450-twc.png
    -rw-rw----    1 10030    10030         233 Jun 15 15:02 /data/data/com.weather.Weather/files/tile-Radar-023010231-200906151450-twc.png
    -rw-rw----    1 10030    10030         233 Jun 15 15:02 /data/data/com.weather.Weather/files/tile-Radar-023010232-200906151450-twc.png
    -rw-rw----    1 10030    10030         233 Mar 18  2009 /data/data/com.weather.Weather/files/tile-Radar-023010221-200903181940-twc.png
    -rw-rw----    1 10030    10030         233 Mar 18  2009 /data/data/com.weather.Weather/files/tile-Radar-023010223-200903181940-twc.png
    -rw-rw----    1 10030    10030         233 Mar 18  2009 /data/data/com.weather.Weather/files/tile-Radar-023010230-200903181940-twc.png
    -rw-rw----    1 10030    10030         233 Mar 18  2009 /data/data/com.weather.Weather/files/tile-Radar-023010232-200903181940-twc.png

When Dalvik (actually, the 'zygote' process') loads an application, it
changes to the uid and gid for the application, so that the process is
running in the correct security context.

#### Sample Process List

If you compare the Uids below with the above list, you'll see the
correspondence between the assigned UID and the running processes. (For
example, 10017 is the browser).

    # ps
      PID  Uid        VSZ Stat Command
        1 0           288 S   /init
    [kernel threads omitted...]
       30 1000        808 S   /system/bin/servicemanager
       31 0           848 S   /system/bin/vold
       32 0           668 S   /system/bin/debuggerd
       33 1001       7888 S   /system/bin/rild
       34 0         70548 S   zygote /bin/app_process -Xzygote /system/bin --zygote
       35 1013      30032 S   /system/bin/mediaserver
       36 1002       1172 S   /system/bin/dbus-daemon --system --nofork
       37 0           816 S   /system/bin/installd
       39 0           744 S   /system/bin/sh /runme.sh
       40 1008       1304 S   /system/bin/akmd
       41 0          3340 S   /sbin/adbd
       64 1000     171284 S   system_server
      108 1001     122172 S   com.android.phone
      110 10004    129936 S   android.process.acore
      387 10004    101668 S   com.android.inputmethod.latin
     6721 10017    158272 S   com.android.browser
     6901 10019     96340 S   com.google.android.apps.maps
     7166 0           740 S   /system/bin/sh -
     7635 10007    123776 S   com.google.process.gapps
     7727 10000     91284 S   com.android.alarmclock
     7753 0           872 S   sleep 3
     7754 0          2104 R   ps

### Paranoid network-ing

Android adds a "paranoid network" option to the Linux kernel, which
restricts access to some networking features depending on the group of
the calling process.

The list of groups that are allowed access to networking features is in
the kernel source file: */include/linux/android\_aids.h*

Here is the list:

<table>
<tbody>
<tr class="odd">
<td align="left">#define</td>
<td align="left">GID</td>
<td align="left">Capability</td>
</tr>
<tr class="even">
<td align="left">AID_NET_BT_ADMIN</td>
<td align="left">3001</td>
<td align="left">Can create an RFCOMM, SCO, or L2CAPP Bluetooth socket</td>
</tr>
<tr class="odd">
<td align="left">AID_NET_BT</td>
<td align="left">3002</td>
<td align="left">Can create a Bluetooth socket</td>
</tr>
<tr class="even">
<td align="left">AID_INET</td>
<td align="left">3003</td>
<td align="left">Can create IPv4 or IPv6 socket</td>
</tr>
<tr class="odd">
<td align="left">AID_NET_RAW</td>
<td align="left">3004</td>
<td align="left">Can create certain kinds of IPv4 sockets??</td>
</tr>
<tr class="even">
<td align="left">AID_NET_ADMIN*</td>
<td align="left">3005</td>
<td align="left">Allow CAP_NET_ADMIN permissions for process</td>
</tr>
</tbody>
</table>

Note: \* Added in Donut (not in original Android 1.0)

## Application-level security

Android also uses a user-space level security system to regulate
communication and interaction among applications and system components.
This is described at:
[http://developer.android.com/guide/topics/security/security.html](http://developer.android.com/guide/topics/security/security.html)

## Tutorial

See
[http://siis.cse.psu.edu/android-tutorial.html](http://siis.cse.psu.edu/android-tutorial.html)

(With an abridged version at:
[http://siis.cse.psu.edu/android\_sec\_tutorial.html](http://siis.cse.psu.edu/android_sec_tutorial.html))

## Security Analysis

See a good analysis of Android security at:
[http://www.isecpartners.com/files/iSEC\_Android\_Exploratory\_Blackhat\_2009.pdf](http://www.isecpartners.com/files/iSEC_Android_Exploratory_Blackhat_2009.pdf)

## Security Investigations

### [TOMOYO Linux](http://elinux.org/TomoyoLinux) investigation

#### Presentation

-   ["Learning, Analyzing and Protecting Android with TOMOYO Linux
    (JLS2009)"](http://www.slideshare.net/haradats/learning-analyzing-and-protecting-android-with-tomoyo-linux-jls2009)
    (Japan Linux Symposium 2009, Oct. 2009)
-   ["TOMOYO Linux on
    Android"](http://www.slideshare.net/haradats/taipei2009)
    ([Smartbook/Netbook/Mobile Application Conference Taipei
    2009](http://www.slideshare.net/haradats/taipei2009), Oct. 2009)
-   ["TOMOYO Linux on
    Android"](http://www.slideshare.net/haradats/tomoyo-linux-on-android)
    (CELF Japan Technical Jamboree 28, Jun. 2009)

-   [other English slides on slideshare of TOMOYO
    Linux](http://www.slideshare.net/haradats/presentations?order=popular)
-   [all English slides PDFs of TOMOYO
    Linux](http://sourceforge.jp/projects/tomoyo/docs/?category_id=532&language_id=1)

#### Code

-   [tomoyo-android-jp - Project Hosting on Google
    Code](http://code.google.com/p/tomoyo-android-jp/)

#### Contact

haradats@gmail.com

## Security Tricks

### Changing application security permissions after installation

Some applications request more permissions than they really need. You
can alter the set of permissions granted to an application by editing
/data/system/pacakges.xml.

lbcoder wrote this on the android-platform mailing list:

    Go into /data/system/packages.xml and you can remove permission lines.
    Immediately after saving the packages.xml, reboot the phone (otherwise
    the file will get overwritten by the system again). The newly reduced
    permissions will be read on boot.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

