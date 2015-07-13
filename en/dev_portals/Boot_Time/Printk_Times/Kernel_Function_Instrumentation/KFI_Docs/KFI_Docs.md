> From: [eLinux.org](http://eLinux.org/KFI_Docs "http://eLinux.org/KFI_Docs")


# KFI Docs



This is documentation for using KFI.



See `README.kfi` inside the kfi user-space tarfile for a quick overview.

Rough outline:

## Contents

-   [1 Introduction](#introduction)
-   [2 Using KFI](#using-kfi)
-   [3 Using the post-trace analysis
    tools](#using-the-post-trace-analysis-tools)
-   [4 Configuring a kfi trace](#configuring-a-kfi-trace)
-   [5 Tasks:](#tasks)
-   [6 Miscelaneous Info](#miscelaneous-info)

## Introduction

    - Description
    - Theory of operation
      - callout instrumentation
        - gcc option
          - -finstrument_functions
      - static run vs. dynamic run
        - initiating and terminating a trace run
      - reading the data from the trace buffer
     - trace buffer size issues
     - tracing overhead issues

## Using KFI

    - Apply patch found at Kernel Function Instrumentation
    - configure kernel
      - decide whether to do a static or dynamic run
      - edit kfistatic.conf
    - compile kfi for target
      - Makefile uses $CROSS_COMPILE to indicate toolchain prefix (same as Linux kernel)
        - set this in environment variable, and run make
    - make device node on target
      - execute the command mknod /dev/kfi c 10 51 on the target

static run:

    - run kernel
    - run kfi to collect trace buffer
    - run post-trace tools to examine data

dynamic run:

    - run kernel
    - run kfi to set up a trace
    - run kfi to read a trace
    - run post-trace tools to examine data

## Using the post-trace analysis tools

    - kfiresolve.py
      - resolves numeric addresses to function names, in a kfiboot log
      - requires System.map for kernel from which dump was made
    - kd - kfiboot dump
      - filters and formats a kfiboot log
      - finds time spent locally and in sub-functions, to isolate where time is being spent
    - kt - kfi tree (not finished yet)
      - generates call tree from kfiboot log, and reports time spent in branches

## Configuring a kfi trace

    - kfistatic.conf
      - filters:
        - start
        - stop
        - time threshold (duration)
        - interrupt
        - user id (not implemented yet)

Filter types:

    - DEV/NONE - system call???
    - TIME - time since boot or start of trace
    - FUNC_ENTRY - function entry
    - FUNC_EXIT - function exit
    - LOG_FULL - trace buffer full
    - multiple trace buffers??

## Tasks:

    - creating a static run
    - creating a dynamic run

## Miscelaneous Info

    - trace structures:
      - trigger structure:
        - type (one of: DEV, NONE, TIME, ENTRY, EXIT, FULL)
        - time or func_addr
        - mark - time at which this trigger occurred
      - filter structure
        - min_delta
        - max_delta
        - no_ints
        - only_ints
        - func_list - list of functions
      - trace entry structure
        - va - VA of instrumented function
        - call_site - where this func was called from
        - time - function entry time since trigger start time, in usec
        - delta - delta time from entry to exit, in usec
        - pid - process ID at time of call
      - run structure
        - int triggered;
           - int complete;
           - struct kfi_trigger start_trigger;
           - struct kfi_trigger stop_trigger;
           - struct kfi_filters filters;
           - struct kfi_entry* log;
           - int num_entries;
           - int next_entry;
           - int id;
           - struct kfi_run * next;


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Development
    Tools](http://eLinux.org/Category:Development_Tools "Category:Development Tools")
-   [Tips and
    Tricks](http://eLinux.org/Category:Tips_and_Tricks "Category:Tips and Tricks")

