> From: [eLinux.org](http://eLinux.org/Android_Power_Management "http://eLinux.org/Android_Power_Management")


# Android Power Management



Notes on Power Management in Android

## Contents

-   [1 wakelocks](#wakelocks)
    -   [1.1 Creating a wakelock](#creating-a-wakelock)
    -   [1.2 Using a wakelock inside the
        kernel](#using-a-wakelock-inside-the-kernel)
    -   [1.3 Using a wakelock from user
        space](#using-a-wakelock-from-user-space)
    -   [1.4 Sample 'cat /proc/wakelocks'
        output](#sample-cat-proc-wakelocks-output)
-   [2 Patch submission controversy](#patch-submission-controversy)
-   [3 Wakelock documentation (from
    patch)](#wakelock-documentation-from-patch)
-   [4 Motorola quickwakeup feature](#motorola-quickwakeup-feature)
-   [5 Earlysuspend](#earlysuspend)
-   [6 May 2010 patch submission - "Suspend
    blockers"](#-may-2010-patch-submission-suspend-blockers)

## wakelocks

The first version of Android utilized a system called "wakelocks", which
was a set of patches to the Linux kernel to allow a caller to prevent
the system from going to low power state.

Each wakelock is defined with a name and type. The type is one of:

-   WAKE\_LOCK\_IDLE, or
-   WAKE\_LOCK\_SUSPEND.

The name is an arbitrary ASCII string.

When a wake lock of type "IDLE" is in effect, the system will not enter
idle (low power) state, and this should make the device more responsive.
That is, it does not have to wake up from idle to respond to interrupts
or events. When a wake lock of type "SUSPEND" is held, then the system
will not suspend, which takes even longer to resume from.

You can, from user space, see the currently defined wakelocks and a
bunch of information about their status, using 'cat /proc/wakelocks'

Below is an example of output from that command.

To see the code for this, see the file:

    drivers/android/power.c

NOTE: See the
[Discussion](http://eLinux.org/Talk:Android_Power_Management "Talk:Android Power Management")
page for a note on this file.

### Creating a wakelock

Kernel code can define a wakelock, and get a handle to it, by calling:

    #include <linux/wakelock.h>
    wake_lock_init(struct wakelock *lock, int type, const char *name);

From user space, a process can write a name to

    /sys/power/wake_lock

to create and lock a suspend lock with that name.

### Using a wakelock inside the kernel

Kernel code can acquire and release the lock with one of the following:

    void wake_lock(struct wake_lock *lock);
    void wake_unlock(struct wake_lock *lock);

Kernel code can also set a timeout to specify automatic release of the
wakelock after a specific period, with:

    void wake_lock_timeout(struct wake_lock *lock, long timeout);

The wakelock does not need to be held prior to calling this (it will
automatically lock the wakelock and register the timeout).

### Using a wakelock from user space

To release a suspend wake lock from user space, a process can write the
lock name to: /sys/power/wake\_unlock



### Sample 'cat /proc/wakelocks' output

Here are some wakelocks from my ADP1 phone, running Donut (I think):

*Note: I widened the columns and adjusted the title row to make the
columns line up better.*

     $ cat /proc/wakelocks
    name                    count   expire_count  active_since
                                            wake_count          total_time      sleep_time      max_time        last_change
    "PowerManagerService"   3580    0       0     0             1706674438454   1354421173104   62626251221     31701936996687
    "mddi_link_active_idle_lock" 4641 0     0     0             26749877925     0               253234863       31701903732527
    "msmfb_idle_lock"       2549    0       0     0             28889923076     0               266601563       31701902633894
    "SMD_RPCCALL"           8913    0       34    0             9038391159      6843658471      176025391       31690316543807
    "audio_pcm_idle"        12      0       0     0             68230224609     0               27459259033     31690315567244
    "audio_pcm"             12      0       0     0             68230285646     12423248292     27459289551     31690315567244
    "rpc_read"              60      0       0     0             3112792         823974          91553           31690315048445
    "adsp"                  12      0       0     0             67035552978     11988464355     27387664794     31690282791365
    "rpc_read"              12      0       0     0             671387          213624          91553           31686582229842
    "usb_mass_storage"      0       0       0     0             0               0               0               0
    "rpc_read"              137     0       0     0             8972160         6744383         122070          31685788467635
    "rpc_server"            277     0       0     0             406372060       320922839       41412354        31685787887801
    "rpc_read"              277     0       0     0             117919940       111480725       94848633        31685787826766
    "alarm"                 1220    0       0     0             27851074219     25716247547     382141114       31669270950545
    "rpc_read"              4909    0       0     0             375915506       347930899       16021729        31376427078475
    "gpio_input"            0       0       0     0             0               0               0               0
    "mddi_idle_lock"        54      0       0     0             8752532958      0               249603271       31154190719832
    "SMD_DATA5"             862     862     377   0             620518382572    567607416986    6926910400      31153421737899
    "alarm_rtc"             177     10      0     0             47826019299     47825439463     1801544190      31152471695175
    "KeyEvents"             13271   0       0     0             11482665934     343322752       503204346       30525886245957
    "evdev"                 4437    0       0     0             4980529833      98724365        506927490       30525884811631
    "evdev"                 188     0       6     0             3093719493      2680358890      393676758       30522918777697
    "rpc_read"              18      0       0     0             1464840         0               335693          30520425552599
    "gpio_kp"               68      0       14    0             14835723878     2092010498      933135987       30445059005968
    "evdev"                 52      0       0     0             98999026        0               24139405        30438128067247
    "rpc_read"              596     0       0     0             745910654       211212166       491180420       30046209060900
    "rpc_read"              1331    0       0     0             286651593       169342025       112518310       30046203598253
    "rpc_read"              10      0       0     0             1495361         427247          274658          3596980453801
    "qmi0"                  2       2       0     0             996235351       0               501717529       173250290527
    "qmi2"                  1       1       0     0             490385742       0               490385742       173250290527
    "qmi1"                  1       1       0     0             493193359       0               493193359       173250290527
    "evdev"                 0       0       0     0             0               0               0               0
    "evdev"                 0       0       0     0             0               0               0               0
    "rpc_read"              2       0       0     0             427247          0               274659          7461350097
    "mt9t013"               0       0       0     0             0               0               0               0
    "gpio_input"            0       0       0     0             0               0               0               0
    "gpio_input"            0       0       0     0             0               0               0               0
    "SMD_DATA7"             0       0       0     0             0               0               0               0
    "SMD_DATA6"             0       0       0     0             0               0               0               0
    "msm_serial_hs_rx"      0       0       0     0             0               0               0               0
    "unknown_wakeups"       0       0       0     0             0               0               0               0
    "deleted_wake_locks"    36      0       0     0             2593991         518798          1068114         0
    "radio-interface"       329     0       0     549499512     437556091307    299558441157    2895507812      31701540695418
    "vbus_present"          3       2       0     16399444580   26400295008545  25248585083008  25852771240234  31685690780867
    "main"                  27      0       0     547991455078  4674244259033   0               627599700928    31154098800887
    "mmc_delayed_work"      796     796     172   0             405246968975    396150246568    689067383       31153556991805
    "SMD_DS"                682     681     192   558929443     486005943591    268692961407    2368892822      31701531357039

## Patch submission controversy

Arve Hjønnevå (of Google) sent patches to the linux-pm mailing list in
of 2009, but they were rejected. See [this
thread](https://lists.linux-foundation.org/pipermail/linux-pm/2009-February/019750.html)
for the submission and resulting discussion. This was the third version
of the patches submitted for review by the kernel community.

The reasons for the rejection are described in the LWN.NET article
[Wakelocks and the embedded problem](http://lwn.net/Articles/318611/).

## Wakelock documentation (from patch)

The 3rd version of the wakelock patch included the following
/Documentation/power/wakelock.txt file

    Wakelocks
    =========

    A locked wakelock, depending on its type, prevents the system from entering
    suspend or other low-power states. When creating a wakelock, you can select
    if it prevents suspend or low-power idle states.  If the type is set to
    WAKE_LOCK_SUSPEND, the wakelock prevents a full system suspend. If the type
    is WAKE_LOCK_IDLE, low-power states that cause large interrupt latencies, or
    that disable a set of interrupts, will not be entered from idle until the
    wakelocks are released. Unless the type is specified, this document refers
    to wakelocks with the type set to WAKE_LOCK_SUSPEND.

    If the suspend operation has already started when locking a wakelock, it will
    abort the suspend operation as long it has not already reached the suspend_late
    stage. This means that locking a wakelock from an interrupt handler or a
    freezeable thread always works, but if you lock a wakelock from a suspend_late
    handler you must also return an error from that handler to abort suspend.

    Wakelocks can be used to allow user-space to decide which keys should wake the
    full system up and turn the screen on. Use set_irq_wake or a platform specific
    api to make sure the keypad interrupt wakes up the cpu. Once the keypad driver
    has resumed, the sequence of events can look like this:
    - The Keypad driver gets an interrupt. It then locks the keypad-scan wakelock
      and starts scanning the keypad matrix.
    - The keypad-scan code detects a key change and reports it to the input-event
      driver.
    - The input-event driver sees the key change, enqueues an event, and locks
      the input-event-queue wakelock.
    - The keypad-scan code detects that no keys are held and unlocks the
      keypad-scan wakelock.
    - The user-space input-event thread returns from select/poll, locks the
      process-input-events wakelock and then calls read in the input-event device.
    - The input-event driver dequeues the key-event and, since the queue is now
      empty, it unlocks the input-event-queue wakelock.
    - The user-space input-event thread returns from read. It determines that the
      key should not wake up the full system, releases the process-input-events
      wakelock and calls select or poll.

                     Key pressed   Key released
                         |             |
    keypad-scan          ++++++++++++++++++
    input-event-queue        +++          +++
    process-input-events       +++          +++


    Driver API
    ==========

    A driver can use the wakelock api by adding a wakelock variable to its state
    and calling wake_lock_init. For instance:
    struct state {
        struct wakelock wakelock;
    }

    init() {
        wake_lock_init(&state->wakelock, WAKE_LOCK_SUSPEND, "wakelockname");
    }

    Before freeing the memory, wake_lock_destroy must be called:

    uninit() {
        wake_lock_destroy(&state->wakelock);
    }

    When the driver determines that it needs to run (usually in an interrupt
    handler) it calls wake_lock:
        wake_lock(&state->wakelock);

    When it no longer needs to run it calls wake_unlock:
        wake_unlock(&state->wakelock);

    It can also call wake_lock_timeout to release the wakelock after a delay:
        wake_lock_timeout(&state->wakelock, HZ);

    This works whether the wakelock is already held or not. It is useful if the
    driver woke up other parts of the system that do not use wakelocks but
    till need to run. Avoid this when possible, since it will waste power
    if the timeout is long or may fail to finish needed work if the timeout is
    short.

## Motorola quickwakeup feature

Jocelyn Falempe of Motorola proposed (in November, 2009) a quickwakeup
feature to make it possible to reduce the time for a periodic job to
resume, do a small amount of work, and suspend again.

[http://patchwork.kernel.org/patch/58064/](http://patchwork.kernel.org/patch/58064/)

From the patch:

    The purpose of this feature is to drastically reduce the suspend/resume
    time for device driver which needs to do periodic job.
    In our use case (android smartphone), the system is most of the time in
    suspend to RAM, and needs to send a low level command every 30s. With
    current framework it takes about 500ms on omap3430 to resume the full
    system, and then suspend again. With quickwakup feature, in the resume
    process after resuming sysdev and re-enabling irq, the driver handler is
    executed, and then it suspends again.
    This new path takes 20ms for us, which leads to good power-saving.

## Earlysuspend

Arve's patches also included something referred to as "earlysuspend",
but I haven't reviewed this yet to see what it is.

# May 2010 patch submission - "Suspend blockers"

Arve refactored the patches and did a name change, and submitted them
again in April and May of 2010. There was a LOT of discussion on the
linux-pm mailing list, which many developers participated in. The
discussion raised lots of questions, and lots of responses were given.
People interested in Android power management may get more enlightenment
by reading the thread.

[http://groups.google.com/group/linux.kernel/browse\_frm/thread/b6fed7e38365c259/c92d8b4a41f87902?hl=en&tvc=1&q=linux.kernel+suspend+block+api+(version+6)\#c92d8b4a41f87902](http://groups.google.com/group/linux.kernel/browse_frm/thread/b6fed7e38365c259/c92d8b4a41f87902?hl=en&tvc=1&q=linux.kernel+suspend+block+api+(version+6)#c92d8b4a41f87902)


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

