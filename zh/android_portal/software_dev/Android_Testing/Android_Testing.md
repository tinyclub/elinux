> From: [eLinux.org](http://eLinux.org/Android_Testing "http://eLinux.org/Android_Testing")


# Android Testing



This page has information about various tests you can perform on Android

Google provides a number of resources for testing applications,
including monkey, the logger, and the compliance test suite (CTS)

For an overview of Android application testing and resources provided by
Google, see:
[http://developer.android.com/guide/topics/testing/index.html](http://developer.android.com/guide/topics/testing/index.html)

## Contents

-   [1 Android Test Framework](#android-test-framework)
-   [2 Application testing resources](#application-testing-resources)
-   [3 Benchmarks](#benchmarks)
-   [4 Compliance Test Suite](#compliance-test-suite)

## Android Test Framework

Google provides an integrated test framework for testing Android
applications, based on the JUnit test framework from java.

See [Android Testing
Fundamentals](http://developer.android.com/guide/topics/testing/testing_android.html)

## Application testing resources

-   [monkeyrunner](http://developer.android.com/guide/developing/tools/monkeyrunner_concepts.html)
    -   The monkeyrunner tool provides an API for writing programs that
        control an Android device or emulator from outside of Android
        code. It allows you to write a program, which runs on your host
        machine that can interact with an application running in the
        emulator or on a target device.
    -   With monkeyrunner, you can write a Python program that installs
        an Android application or test package, runs it, sends
        keystrokes to it, takes screenshots of its user interface, and
        stores screenshots on the host.

-   [Monkey](http://developer.android.com/guide/developing/tools/monkey.html)
    is a user interface and application tester for Android applications.
    -   It is a command-line tool that sends pseudo-random streams of
        keystrokes, touches, and gestures to a device.
    -   This tool in unrelated to the monkeyrunner tool mentioned above.
        (It runs on the target, and monkeyrunner-based programs run on
        the development host machine.)

-   [Robotium](http://code.google.com/p/robotium/) test framework
    -   Robotium is a test framework created to make it easy to write
        powerful and robust automatic black-box test cases for Android
        applications. With the support of Robotium, test case developers
        can write function, system and acceptance test scenarios,
        spanning multiple Android activities.
    -   Robotium has full support for Activities, Dialogs, Toasts, Menus
        and Context Menus.

-   [Roboelectric](http://pivotal.github.com/robolectric) test framework
    -   Roboelectric allow you to test-drive the development of your
        Android app inside the JVM on your workstation in seconds,
        instead of in the emulator on on a device (which can be slow)
    -   Robolectric allows you to test most Android functionality
        including layouts and GUI behavior, services, and networking
        code. It has more flexibility than Google's testing framework in
        some areas.

-   [Ranorex](http://www.ranorex.com/mobile-automation-testing/android-test-automation.html)
    test framework
    -   Ranorex provides a .Net based test automation framework which
        allows to record test scenarios directly on real mobile devices
        as well as on desktop machines.
    -   Ranorex easily instruments the apk and deploys the instrumetned
        apk directly on the devices, starts the application
        automatically, performs all recorded actions (keystrokes, touch
        events, device button events, validations) and closes the
        application automatically.

## Benchmarks

There are a number of benchmarks you can use to test operating system,
hardware and graphics performance.

For information about performance testing and benchmarks, see: [Android
Benchmarks](http://eLinux.org/Android_Benchmarks "Android Benchmarks")

## Compliance Test Suite

Google provides a suite of tests to validate that a device complies with
the Android standard.

See [Android Compliance Test
Suite](http://eLinux.org/Android_Compliance_Test_Suite "Android Compliance Test Suite")
for more informaton.


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

