> From: [eLinux.org](http://eLinux.org/CE_Workgroup_Device_Mainlining_Project "http://eLinux.org/CE_Workgroup_Device_Mainlining_Project")


# CE Workgroup Device Mainlining Project



This page describes the "Device Mainlining" project of the CE Workgroup.

This purpose of this project is to decrease the amount of
out-of-mainline patches for the Linux kernel, in modern consumer
electronics products.

This project was proposed at the CE Workgroup Steering Committee meeting
in Tokyo, Japan, in June of 2014.

## Contents

-   [1 Activities](#activities)
    -   [1.1 Communicate and meet to make plans and carry forth
        objectives](#communicate-and-meet-to-make-plans-and-carry-forth-objectives)
    -   [1.2 Identify problems](#identify-problems)
    -   [1.3 Implement solutions](#implement-solutions)
    -   [1.4 Train and Educate
        participants](#train-and-educate-participants)
-   [2 Meetings](#meetings)
    -   [2.1 Device Mainlining BOF - October 16,
        2015](#device-mainlining-bof-october-16-2015)
    -   [2.2 Device Mainlining meeting - March 24,
        2015](#device-mainlining-meeting-march-24-2015)
    -   [2.3 Calls and meetings - April and May
        2015](#calls-and-meetings-april-and-may-2015)
-   [3 Obstacles (or problems to
    overcome)](#obstacles-or-problems-to-overcome)
-   [4 Tools](#tools)
    -   [4.1 Upstream Analysis Tools](#upstream-analysis-tools)
-   [5 Resources](#resources)
    -   [5.1 Source code repositories](#source-code-repositories)

## Activities

In terms of overall strategy, the actions being performed for this
project fall into 4 categories:

-   communicate and meet to make plans and carry forth objectives
-   identify problems
-   implement solutions
-   train and educate participants

### Communicate and meet to make plans and carry forth objectives

-   see meetings section below

### Identify problems

-   Survey
    -   Conduct a survey to identify obstacles to mainlining - Done,
        September 2014
-   Present results from survey:
    -   Presented ["Overcoming Obstacles to
        Mainlining"](http://eLinux.org/images/8/8f/Overcoming_Obstacles_to_Mainlining-ELCE-2014-with-notes.pdf "Overcoming Obstacles to Mainlining-ELCE-2014-with-notes.pdf")
        talk at ELCE 2014
    -   Presented ["Overcoming Obstacles to Contributing to
        Linux"](http://eLinux.org/images/3/36/Overcoming_Obstacles_to_Contributing_to_Linux.pdf "Overcoming Obstacles to Contributing to Linux.pdf")
        talk at ELC 2015
-   Identify most-out-of-mainline areas
    -   Analyse source tree from multiple vendors (covering multiple
        SOCs) for actual products, to see what the delta is in different
        areas
        -   Initial analysis is done, and was presented at BOF in March,
            2015
        -   More detailed analysis is under way
-   Create white paper describing obstacles
    -   ["Overcoming Obstacles to Mainlining White Paper
        (v0.9)](http://eLinux.org/images/e/ed/Overcoming-Obstacles-to-Mainlining-White-Paper-version-0.9.pdf "Overcoming-Obstacles-to-Mainlining-White-Paper-version-0.9.pdf")
        - June 3, 2015

### Implement solutions

-   Decide on specific projects
    -   Identify kernel sub-systems that are the most out-of-tree
    -   Identify what the problems are
-   Push patches to mainline to address problem areas found
    -   Assist weary maintainers

### Train and Educate participants

-   Collect resource for mainlinining training
    -   See [Kernel Mainlining](../../../../dev_portals/Kernel_Mainlining/Kernel_Mainlining.md "Kernel Mainlining")
-   Convince management to provide funding and/or resources for this
    work
    -   Produce a white paper on obstacles (see above)
    -   Determine cost of out-of-tree code, and publish information for
        managers

## Meetings

### Device Mainlining BOF - October 16, 2015

[should list attendees and notes here]

### Device Mainlining meeting - March 24, 2015

This meeting will be held Tuesday, March 24, at 11:00 am in the
Guadalupe meeting room at the San Jose Marriott.

Attendees: [should list attendees here]

Topics:

Some of the issues I want to discuss are:

-   Tim reports on his SOC research
-   Where are we, really, with product-grade mainline support for SOCs?
    -   Based on recent work on my part, I've come to believe we're not
        nearly as close to mainline support for many, many processors,
        as we should be. I'm in the middle of doing some research on
        multiple SOCs used in mobile phones, and it appears that there
        are all kinds of fundamental problems that make using a mainline
        kernel on a production phone a fleeting dream.
-   What sub-systems have weakest support in mainline?
    -   For each sub-system, is the poor support because of:
        -   framework deficiencies
        -   DT blockage
        -   dependencies on out-of-tree code
        -   lack of documentation
        -   maintainer bandwidth, or
        -   something else?
-   Are there things the Linux Foundation, other industry groups, or
    companies can do to make interacting with the community easier?
    -   Would it be helpful to produce a scorecard, for evaluating where
        each SOC is
        -   Scorecard would have: what subsystems have been mainlined,
            what's outstanding, etc.
    -   Can git tools be developed to automate this analysis?
    -   Can Linaro and LF work together on some things?
    -   keep a list of "maintainer quirks" - what things individual
        maintainers like/dislike, insist on, what timing they like (when
        to submit relative to merge window).

### Calls and meetings - April and May 2015

-   Tim Bird held a Birds-of-a-Feather meeting to discuss issues with
    this during Linux Plumbers in Dusseldorf, Germany, on October 16,
    2014
    -   Kevin Hillman attended, and provided some good insights into SOC
        mainline efforts in the past
-   Tim held another meeting Special Interest Group meeting at ELC, to
    identify areas that need work (and could use CEWG/LF funding)
    -   Tim prepared some information about the out-of-tree status of
        various SOC and discussed this in the meeting
-   April 21, 2015 - Tim presented Obstacles to Mainlining talk at
    Genivi All-Members-Meeting
-   April 28, 2015 - Conference call was held with Linaro (Tim Bird,
    Kate Stewart and Mark Brown)
    -   different items were discussed, with main goal to be publication
        of upstream analysis tools
-   Tim Bird met with Ibrahim Hadad on April 28, 2015 in San Jose
    -   presented basic goals, got information about Samsung and their
        practices
-   May 12, 2015 - Conference call with Linaro (Kate Stewart and Mark
    Brown)
    -   had not published upstream-analysis-tools, but discussed
        possible names, and other topics

## Obstacles (or problems to overcome)

-   Version gap
-   Dependency on out-of-tree code
-   Inability to test (inability to generalize)
-   Low-quality code
-   Specialized code
-   Immature upstream frameworks
-   No time allocated by management
-   Difficult (or missing) internal approval process
-   Overloaded (or slow) maintainers
-   Lack of perceived business value
-   Rate of hardware churn greater than resources allocated to upstream
    effort
-   Difficult upstream process
-   Lack of English proficiency
-   Fear of rejection
-   Suppliers providing out-of-tree code

Categories:

-   intrinsic delays in the product pipeline
-   lack of corporate will
-   skill deficiency
-   sourcing woes??

## Tools

This section has information about tools provided by this project:

### Upstream Analysis Tools

Some tools that have been developed are available at:
[https://github.com/tbird20d/upstream-analysis-tools](https://github.com/tbird20d/upstream-analysis-tools)
The purpose of these tools is multiple:

-   to allow a company to analyze their own upstream status (check their
    own out-of-tree-ness)
-   to allow a company to score the source from potential suppliers
-   to try to identify areas where multiple companies have code for the
    same hardware or feature out-of-tree
    -   this is intended to help identify where shared work makes sense
    -   also, it might help identify a sub-system or framework weakness
        that needs addressing upstream

Some tools (also part of the release above) can be used for the
following:

-   to track the status of contributions from different parties to the
    Linux kernel over time
    -   this is intended to allow an organization to monitor the
        progress of their mainlining activities
-   to identify what their code is dependent on (commit-dep.py)
    -   this is to assess the potential difficulty of mainlining a
        particular patch, to help in prioritizing mainlining work
    -   also, this should help to identify dependencies between commits,
        to help in prioritizing individual patches

## Resources

[put here links to training or other resources that this project
develops (or should develop)]

### Source code repositories

See [Phones Processors and Download
Sites](http://eLinux.org/Phones_Processors_and_Download_Sites "Phones Processors and Download Sites")


