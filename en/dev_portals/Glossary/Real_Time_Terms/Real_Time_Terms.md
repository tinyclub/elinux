> From: [eLinux.org](http://eLinux.org/Real_Time_Terms "http://eLinux.org/Real_Time_Terms")


# Real Time Terms



The following terms were copied from the Terminology section of the
Realtime Technologies Specification of the CELF.

See
[http://tree.celinuxforum.org/CelfPubWiki/RTSpecDraft\_5fR2](http://tree.celinuxforum.org/CelfPubWiki/RTSpecDraft_5fR2)

* * * * *

 Context switch 
The act of replacing the running task *A* by another task *B*. The state
of task *A* is saved, and *A* is placed in the ready queue; the state of
task *B* is restored, and *B* becomes a running task.

 Critical section 
A brief interval during which a task accesses shared data. During this
interval, no other tasks are allowed to access the same data. One way of
ensuring this is to prevent preemption during the critical section. If
the critical section defers preemption for a bounded interval, the
resulting priority inversion is bounded.

 Deadline-monotonic priority setting 
The task with the shortest relative deadline is assigned the highest
priority.

 Deadline requirement 
A real-time requirement that requires the response to be completed
within a fixed time interval from the triggering event. A *relative
deadline* is the duration of the above mentioned interval; an *absolute
deadline* is the moment in time at which the response must be completed.

 Fixed priority preemptive scheduling 
The task with the highest priority is always running. If a task with a
higher priority becomes runnable, the running task will be preempted
immediately. The priority of a task, process or Interrupt Service
Routine (ISR) is explicitly determined at creation, or by an explicit
set-priority command. No implicit priority changes by the scheduler are
assumed. For an exception to this rule see **Priority inheritance.** The
scheduling policy of SCHED\_FIFO in Linux implements fixed priority
preemptive scheduling.

<!-- -->

    Note: Fixed priority scheduling is typically designed to be used for a single coherent application.

 Granularity 
The time range of a certain interval. We can talk about the granularity
of a timing requirement, of a non-interruptible code segment, etc.
*Needs fixing*

 Hard deadline requirement 
Missing the deadline is considered an error.

 Hard real-time system 
System with hard real-time requirements.

 Hybrid real-time system
This refers to a system where a real-time kernel is used in conjunction
with a (mostly) unmodified Linux kernel, to provide real-time services
to a subset of tasks on the system. This is often also referred to as
the "multi-kernel" approach.

 Interrupt latency 
Time passed between interrupt occurrence and activation of interrupt
handler.

 Interrupt masking 
Making certain interrupts invisible to the software.

 Interrupt response time (worst-case) 
(Worst-case) time passed between interrupt occurrence and either
completion of interrupt service routine (ISR) or wake up of dependent
task.

 Jitter – absolute 
Deviation of the occurrence of an event (e.g. completion of frame) from
expected occurrence.

 Jitter – relative 
Deviation of the interval between two successive occurrences of an event
(e.g. completion of frame) from expected interval.

 Mutual exclusion 
Prevent multiple tasks or ISRs from accessing the same data
concurrently. Mutual exclusion is used to protect the integrity of the
data.

 Preemption 
A running thread or process can be temporarily suspended. The state of
the thread or process (including e.g., program counter, and register
values) is saved. When the process or thread is later resumed, the saved
state is restored.

 Priority inheritance 
If a high priority-task blocks for a critical section, a low-priority
task that holds the lock for the section gets a priority boost. It
inherits the priority of the blocked task. This prevents the unbounded
priority inversion that could occur if medium priority tasks preempt the
lower-priority task that holds the lock. Note that, with priority
inheritance, the medium-priority tasks suffer priority inversion as
well. But, and this is important in real-time systems, the priority
inversion for all tasks is bounded (can be determined without knowing
the exact run-time schedule)

 Priority inversion 
The highest priority task is not running. There can be several reasons
for priority inversion. One of them is the absence of full preemption.
Priority inversion is one of the main reasons for deadlines being
missed.

 Real-time requirement 
A requirement on the completion time of a response, generally measured
relative to the event that triggered the response.

 Real-time system 
System with one or more real-time requirements.

 Response time (worst-case) 
(worst-case) Time passed between event occurrence and completion of the
response to that event. The event may be an interrupt. The response
typically involves an interrupt handler and one or more synchronized
tasks.

 Runnable task 
(also ready/active task) A task that can run from a logical perspective,
but is prevented from running physically.

 Semaphore 
A synchronization primitive often used to achieve mutual exclusion.

 Soft deadline 
Missing deadlines is sometimes acceptable. Compared to hard deadlines,
where there is no reason to consider the value of a late result, the
value of a late result for a soft deadline is of interest. The value of
the result may, for instance, decrease linearly after the deadline.

 Soft real-time requirement 
Soft deadline, or average-case response time requirement.

Note that hard and soft real-time requirements are orthogonal to the
temporal granularity that is required. Meeting a soft requirement in the
microsecond domain may be more difficult than meeting a hard requirement
in the milliseconds domain.

 Soft real-time system 
System with soft real-time requirements.

## Contents

-   [1 Timing Model](#timing-model)
    -   [1.1 Events](#events)
    -   [1.2 Time Periods](#time-periods)
-   [2 Terms in need of definition](#terms-in-need-of-definition)

## Timing Model

It is relatively well-established that the following events and time
periods are of interest when measuring realtime performance:

### Events

-   0' - event initiation
-   A - hardware interrupt assertion
    -   This is the time when the hardware interrupt line for an event
        is raised
-   B - Interrupt service routine starts execution
-   B' - Task is scheduled
-   C - Task starts execution
-   D - Result is received from processing the event

### Time Periods

Real time performance is often expressed in terms of the maximum,
minimum and average duration for certain time periods defined by the
events above.

Here are some common terms, expressed relative to those events:

 Interrupt latency 
The time from A to B (from hardware interrupt assertion to ISR start).

 Scheduling latency 
The time from B' to C (from time of task scheduling to process start).

<!-- -->

    Note that sometimes this term is used to refer to the time from A to C (from interrupt assertion to process start).

 Processing time 
The time from C to D (from process start to completion of processing).

 Response time 
The time from A to D (total time from interrupt assertion to delivery of
processed data).

Often, these or similar terms are used with less accuracy to describe
the closest approximation one can get, with a particular test framework
and instrumentation set.

For example, 'response latency' may be reported as "response time", and
refer to the time from when a host program records the time, previous to
transmitting a piece of data which will cause an interrupt on the target
machine, to the time when a host program records the time after
receiving some signal from the target that processing is completed. Of
course, time is taken in the operations of recording time, transmiting
data, and detecting signals on the host machine. But it may be that
timing these individual operations at a finer granularity requires
instrumentation or hardware support not reasonably available for a test.

## Terms in need of definition

-   Reservation system
-   Precision
-   Granularity (above definition is weak)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Linux](http://eLinux.org/Category:Linux "Category:Linux")

