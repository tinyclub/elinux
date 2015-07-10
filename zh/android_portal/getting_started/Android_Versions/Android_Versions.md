> From: [eLinux.org](http://eLinux.org/Android_Versions "http://eLinux.org/Android_Versions")


# Android Versions



## Contents

-   [1 Versions](#versions)
    -   [1.1 Version 1.1](#version-1-1)
    -   [1.2 Version 1.5 (cupcake)](#version-1-5-cupcake)
    -   [1.3 Version 1.6 (donut)](#version-1-6-donut)
    -   [1.4 Version 2.1 (eclair)](#version-2-1-eclair)
    -   [1.5 Version 2.2 (froyo)](#version-2-2-froyo)
    -   [1.6 Version 4.4 (kitkat)](#version-4-4-kitkat)
-   [2 Fragmentation](#fragmentation)
    -   [2.1 Dealing with API levels](#dealing-with-api-levels)
    -   [2.2 Need to support multiple
        versions](#need-to-support-multiple-versions)

## Versions

For a lot more detail, you should see the [wikipedia page for Android
version history](http://en.wikipedia.org/wiki/Android_version_history)

The following different Android versions have been released:

<table>
<thead>
<tr class="header">
<th align="left">Version number</th>
<th align="left">code name</th>
<th align="left">API Level</th>
<th align="left">Main features</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1.1</td>
<td align="left"><em>unknown</em></td>
<td align="left">2</td>
<td align="left">The base release, with Android system, phone, camera, webkit-based browser, Google search, contacts, calendar, cloud synchronization, android market, etc.</td>
</tr>
<tr class="even">
<td align="left">1.5</td>
<td align="left">Cupcake</td>
<td align="left">3</td>
<td align="left">camcorder mode, video and picture upload to net, auto bluetooth connect, animated screen transitions</td>
</tr>
<tr class="odd">
<td align="left">1.6</td>
<td align="left">Donut</td>
<td align="left">4</td>
<td align="left">voice search</td>
</tr>
<tr class="even">
<td align="left">2.1</td>
<td align="left">Eclair</td>
<td align="left">7</td>
<td align="left">more screen resolutions, live wallpaper, MS exchange support, UI revamp</td>
</tr>
<tr class="odd">
<td align="left">2.2</td>
<td align="left">Froyo</td>
<td align="left">8</td>
<td align="left">Dalvik JIT, USB tethering, voice dialing, V8 and javascript, adobe flash support</td>
</tr>
<tr class="even">
<td align="left">4.4</td>
<td align="left">KitKat</td>
<td align="left">19</td>
<td align="left">Low RAM improvements, sensor batching, full-screen UI, ART experimental test</td>
</tr>
</tbody>
</table>

See the [wikipedia
article](http://en.wikipedia.org/wiki/Android_(operating_system)#Update_history)
for some good information about different versions.

### Version 1.1

SDK released February, 2009

### Version 1.5 (cupcake)

SDK released April, 2009

Kernel version: 2.6.27

### Version 1.6 (donut)

SDK released September, 2009

Kernel version: 2.6.29

### Version 2.1 (eclair)

SDK released October, 2009

Kernel version: 2.6.29

### Version 2.2 (froyo)

SDK release May, 2010

Kernel version: 2.6.32

### Version 4.4 (kitkat)

SDK release October 31, 2013

Kernel version: 3.10?

Links to Android 4.4 information

-   Official Android Blog post:
    -   [http://officialandroid.blogspot.com/2013/10/android-for-all-and-new-nexus-5.html](http://officialandroid.blogspot.com/2013/10/android-for-all-and-new-nexus-5.html)
-   Consumer facing highlights:
    -   [http://www.android.com/versions/kit-kat-4-4/](http://www.android.com/versions/kit-kat-4-4/)
-   Platform highlights:
    -   [http://developer.android.com/about/versions/kitkat.html](http://developer.android.com/about/versions/kitkat.html)
-   Android Developers Blog post:
    -   [http://android-developers.blogspot.com/2013/10/android-44-kitkat-and-updated-developer.html](http://android-developers.blogspot.com/2013/10/android-44-kitkat-and-updated-developer.html)
-   API highlights:
    -   [http://developer.android.com/about/versions/android-4.4.html](http://developer.android.com/about/versions/android-4.4.html)
-   SDK updates:
    -   [http://developer.android.com/tools/revisions/platforms.html](http://developer.android.com/tools/revisions/platforms.html)

## Fragmentation

### Dealing with API levels

Developers should specify which API level their application requires or
is known to work with.

See
[http://developer.android.com/guide/appendix/api-levels.html](http://developer.android.com/guide/appendix/api-levels.html)

### Need to support multiple versions

Dianne Hackborn had this to say about fragmentation, after a developer
complained about having to support different versions of Android:

Developers will never be able to rely on there only being one version to
target. Never. Please drop that from your mind. This is not the case on
Windows, it is not the case on MacOS X, it is not the case on any
platform that is not uber-tightly controlled.

That would mean that every user, of every Android device, would be
delivered free updates as long as they are using the device. This would
completely prevent very interesting Android devices like the Dell Streak
(which due to its interesting design requires some customizations to the
platform), and would significantly limit the ability of manufacturers to
push Android into other interesting places.

This would also very greatly slow down the development of the platform.
Every release of Android would need to be extensively QAed on every
existing Android device before it could go out to any of them. There are
currently \> 50 such devices, and that number is growing exponentially.
Android just can't scale if that final productization and QA phase is
not spread out to the manufacturers. A core part of what makes our
Android model work is that most products are owned by their
manufacturer.

Here's a very small example: you say that manufacturers would be
responsible for the kernel. Obviously, that is required because the
kernel needs to talk with whatever their hardware is. However, pretty
much every release of the platform has snapped up to a more recent
version of the Linux kernel. The QA for that version of the platform is
done against that kernel on a small set of specific devices. For what
you propose, it would either need to be QAed across all possible
kernels, or require that all manufacturers upgrade to the newer kernel
before it can go out to any devices.

I honestly think that developers who are demanding there be only one
version they need to think about are living in a strange fantasy world.
Windows developers have always needed to think about 3 or so active
versions of windows. From the stats I have seen there are regularly two
very active versions of MacOS X that users run. Heck, if you are a web
developer you need to consider different browsers and different versions
implementing different versions of web standards.

I can more understand the issues from users, who want to be able to
upgrade their current device to a newer version. Even there, though, if
you compare us against another company that say releases a major
platform update every year... we're not that bad. Look at the devices
that have been out... how many at this point haven't received a
significant platform update in the year since they came out? I think not
many -- very few of them have been around for more than a year, and at
this point the bulk of those have received at least one update. The main
difference is that Android has gone through 3-4 significant updates in a
year... so sure, not every one of those goes to every device, but I do
think the manufacturers are showing that they are going to do some work
to snap their devices to a more recent version, and I also think that as
they are learning about Android and going through this upgrade
experience the first few times they are learning how to better handle
it.

At the end of the day Android is not a single monolithic uniform
environment. That isn't what Android is intended to be, and honestly I
think that this is something that should be pretty clear from day one. I
consider that one of Android's strengths.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

