> From: [eLinux.org](http://eLinux.org/Android_Logging_System "http://eLinux.org/Android_Logging_System")


# Android Logging System



This article describes the Android logging system

## Contents

-   [1 Overview](#overview)
-   [2 Kernel driver](#kernel-driver)
-   [3 System and Application logging](#system-and-application-logging)
    -   [3.1 Application log](#application-log)
    -   [3.2 Event log](#event-log)
    -   [3.3 System log](#system-log)
-   [4 'log' command line tool](#-log-command-line-tool)
-   [5 Capturing stdout with
    logwrapper](#capturing-stdout-with-logwrapper)
-   [6 Logcat command](#logcat-command)
    -   [6.1 Trick to couple Android logging to Linux kernel
        logging](#trick-to-couple-android-logging-to-linux-kernel-logging)
-   [7 Resources](#resources)

## Overview

The Android system has a logging facility that allows systemwide logging
of information, from applications and system components. This is
separate from the Linux kernel's own logging system, which is accessed
using 'dmesg' or '/proc/kmsg'. However, the logging system does store
messages in kernel buffers.

[![](http://eLinux.org/images/c/c9/Android-logging-kmc-kobayashi.png)](http://eLinux.org/File:Android-logging-kmc-kobayashi.png)

image by Tetsuyuki Kobabayshi, of Kyoto Microcomputer Co.

The logging system consists of:

-   a kernel driver and kernel buffers for storing log messages
-   C, C++ and Java classes for making log entries and for accessing the
    log messages
-   a standalone program for viewing log messages (logcat)
-   ability to view and filter the log messages from the host machine
    (via eclipse or ddms)

There are four different log buffers in the Linux kernel, which provide
logging for different parts of the system. Access to the different
buffers is via device nodes in the file system, in /dev/log.

The four log buffers are:

-   main - the main application log
-   events - for system event information
-   radio - for radio and phone-related informatio
-   system - a log for low-level system messages and debugging

Up until 2010, only the first three logs existed. The system log was
created to keep system messages in a separate buffer (outside of
'/dev/log/main') so that a single verbose application couldn't overrun
system messages and cause them to be lost.

Each message in the log consists of a tag indicating the part of the
system or application that the message came from, a timestamp, the
message log level (or *priority* of the event represented by the
message) and the log message itself.

All of the log buffers except for 'event' use free-form text messages.
The 'event' buffer is a 'binary' buffer, where the event messages (and
event parameters) are stored in binary form. This form is more compact,
but requires extra processing when the event is read from the buffer, as
well as a message lookup database, to decode the event strings.

The logging system automatically routes messages with specific tags into
the radio buffer. Other messages are placed into their respective
buffers when the the log class or library for that buffer is used.

## Kernel driver

The kernel driver for logging is called the 'logger'. See [Android
logger](http://eLinux.org/Android_logger "Android logger")

## System and Application logging

### Application log

An Android application includes the [android.util.Log
class](http://developer.android.com/reference/android/util/Log.html),
and uses methods of this class to write messages of different priority
into the log.

Java classes declare their tag statically as a string, which they pass
to the log method. The log method used indicates the message "severity"
(or log level). Messages can be filtered by tag or priority when the
logs are processed by retrieval tools (logcat).

### Event log

Event logs messages are created using [android.util.EventLog
class](http://developer.android.com/reference/android/util/EventLog.html),
which create binary-formatted log messages. Log entries consist of
binary tag codes, followed by binary parameters. The message tag codes
are stored on the system at: /system/etc/event-log-tags. Each message
has the string for the log message, as well as codes indicating the
values associated with (stored with) that entry.

### System log

Many classes in the Android framework utilize the system log to keep
their messages separate from (possibly noisy) application log messages.
These programs use the android.util.Slog class, with its associated
messages.

In all cases, eventually a formatted message is delivered through the
C/C++ library down to the kernel driver, which stores the message in the
appropriate buffer.

## 'log' command line tool

There is a 'log' command line tool that can be used to create log
entries from any program. This is built into the 'toolbox'
multi-function program.

The usage for this is:

    USAGE: log [-p priorityChar] [-t tag] message
           priorityChar should be one of:
                   v,d,i,w,e

## Capturing stdout with logwrapper

It is sometimes useful to capture stdout from native applications into
the log. There is a utility called 'logwrapper' which can be used to run
a program, and redirect it's stdout into log messages.

The logwrapper usage is:

    Usage: logwrapper [-x] BINARY [ARGS ...]

    Forks and executes BINARY ARGS, redirecting stdout and stderr to
    the Android logging system. Tag is set to BINARY, priority is
    always LOG_INFO.

    -x: Causes logwrapper to SIGSEGV when BINARY terminates
        fault address is set to the status of wait()

Source for logwrapper is at: system/core/logwrapper/logwrapper.c

## Logcat command

You can use the 'logcat' command to read the log. This command is
located in /system/bin in the local filesystem, or you can access the
functionality using the 'adb logcat' command.

Documentation on the use of this command is at:
[http://developer.android.com/guide/developing/tools/adb.html](http://developer.android.com/guide/developing/tools/adb.html)

Some quick notes:

-   Log messages each have a tag and priority.
    -   You can filter the messages by tag and log level, with a
        different level per tag.
-   You can specify (using a system property) that various programs emit
    their stdout or stderr to the log.

### Trick to couple Android logging to Linux kernel logging

Note that the android logging system is completely separate from the
Linux kernel log system (which uses printk inside the kernel to save
messages and dmesg to extract them). You can write to the kernel log
from user space by writing to /dev/kmsg.

I've seen a reference to couple the two together, to redirect android
messages into the kernel log buffer, using the 'logcat' program launched
from init, like below:

    service logcat /system/bin/logcat -f /dev/kmsg
          oneshot

(See
[http://groups.google.com/group/android-kernel/browse\_thread/thread/87d929863ce7c29e/f8b0da9ed6376b2f?pli=1](http://groups.google.com/group/android-kernel/browse_thread/thread/87d929863ce7c29e/f8b0da9ed6376b2f?pli=1))

I'm not sure why you'd want to do this (maybe to put all messages into a
single stream? With the same timestamp, if kernel message timestamping
is on?)

## Resources

-   [Android Debug Bridge reference
    page](http://developer.android.com/guide/developing/tools/adb.html)
    - has 'adb logcat' usage information
-   [Logging System Of
    Android](http://blog.kmckk.com/archives/2936958.html) Presentation
    by Tetsuyuki Kobayashi, September, 2010 at CELF's [Japan Technical
    Jamboree
    34](http://eLinux.org/Japan_Technical_Jamboree_34 "Japan Technical Jamboree 34")


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

