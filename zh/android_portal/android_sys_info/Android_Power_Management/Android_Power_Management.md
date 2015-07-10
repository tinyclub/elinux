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
    blockers"](#may-2010-patch-submission-suspend-blockers)

## wakelocks

The first version of Android utilized a system called "wakelocks", which
was a set of patches to the Linux kernel to allow a caller to prevent
the system from going to low power state.

Each wakelock is defined with a name and type. The type is one of:

-   WAKE\-LOCK\-IDLE, or
-   WAKE\-LOCK\-SUSPEND.

The name is an arbitrary ASCII string.

When a wake lock of type "IDLE" is in effect, the system will not enter
idle (low power) state, and this should make the device more responsive-
That is, it does not have to wake up from idle to respond to interrupts
or events. When a wake lock of type "SUSPEND" is held, then the system
will not suspend, which takes even longer to resume from.

You can, from user space, see the currently defined wakelocks and a
bunch of information about their status, using 'cat /proc/wakelocks'

Below is an example of output from that command.

To see the code for this, see the file:

    drivers/android/power.c

NOTE: See the
[Discussion](http://eLinux.org/TalkAndroid-Power-Management "Talk:Android Power Management")
page for a note on this file.

### Creating a wakelock

Kernel code can define a wakelock, and get a handle to it, by calling:

    #include <linux/wakelock.h>
    wake-lock-init(struct wakelock *lock, int type, const char *name);

From user space, a process can write a name to

    /sys/power/wake-lock

to create and lock a suspend lock with that name.

### Using a wakelock inside the kernel

Kernel code can acquire and release the lock with one of the following:

    void wake-lock(struct wake-lock *lock);
    void wake-unlock(struct wake-lock *lock);

Kernel code can also set a timeout to specify automatic release of the
wakelock after a specific period, with:

    void wake-lock-timeout(struct wake-lock *lock, long timeout);

The wakelock does not need to be held prior to calling this (it will
automatically lock the wakelock and register the timeout).

### Using a wakelock from user space

To release a suspend wake lock from user space, a process can write the
lock name to: /sys/power/wake\-unlock



### Sample 'cat /proc/wakelocks' output

Here are some wakelocks from my ADP1 phone, running Donut (I think):

*Note: I widened the columns and adjusted the title row to make the
columns line up better.*

     $ cat /proc/wakelocks
    name                    count   expire-count  active-since
                                            wake-count          total-time      sleep-time      max-time        last-change
    "PowerManagerService"   3580    0       0     0             1706674438454   1354421173104   62626251221     31701936996687
    "mddi-link-active-idle-lock" 4641 0     0     0             26749877925     0               253234863       31701903732-
    "msmfb-idle-lock"       2549    0       0     0            -889923076     0               266601563       31701902633894
    "SMD-RPCCALL"           8913    0       34    0             9038391159      6843658471      176025391       31690316543807
    "audio-pcm-idle"        12      0       0     0             68230224609     0              -459259033     31690315567244
    "audio-pcm"             12      0       0     0             6823-5646     1242324-2    -45-9551     31690315567244
    "rpc-read"              60      0       0     0             31-92         823974          91553           31690315048445
    "adsp"                  12      0       0     0             670355-78     11988464355    -387664794     316902-91365
    "rpc-read"              12      0       0     0             671387          213624          91553           31686582-842
    "usb-mass-storage"      0       0       0     0             0               0               0               0
    "rpc-read"              137     0       0     0             8972160         6744383         122070          31685788467635
    "rpc-server"           -7     0       0     0             406372060       3209-39       41412354        31685787887801
    "rpc-read"             -7     0       0     0             117919940       111480725       94848633        31685787826766
    "alarm"                 1220    0       0     0            -851074219     25716247547     382141114       3166-0950545
    "rpc-read"              4909    0       0     0             375915506       347930899       16021-        31376-078475
    "gpio-input"            0       0       0     0             0               0               0               0
    "mddi-idle-lock"        54      0       0     0             87525-58      0               24960-1       31154190719832
    "SMD-DATA5"             862     862     377   0             620518382572    567607416986    6926910400      31153421737899
    "alarm-rtc"             177     10      0     0             4782601-9     47825439463     1801544190      31152471695175
    "KeyEvents"             1-1   0       0     0             11482665934     3433-52       503204346       30525886245957
    "evdev"                 4437    0       0     0             4980-833      98724365        506-490       30525884811631
    "evdev"                 188     0       6     0             3093719493      2680358890      393676758       305-18777697
    "rpc-read"              18      0       0     0             1464840         0               335693          30520425552599
    "gpio-kp"               68      0       14    0             14835723878     2092010498      933135987       30445059005968
    "evdev"                 52      0       0     0             98999026        0               24139405        30438-067247
    "rpc-read"              596     0       0     0             745910654       211212166       491180420       30046209060900
    "rpc-read"              1331    0       0     0            -6651593       169342025       112518310       30046203598253
    "rpc-read"              10      0       0     0             1495361         -247         -4658          3596980453801
    "qmi0"                  2       2       0     0             996235351       0               501717-       17325-0-
    "qmi2"                  1       1       0     0             490385742       0               490385742       17325-0-
    "qmi1"                  1       1       0     0             493193359       0               493193359       17325-0-
    "evdev"                 0       0       0     0             0               0               0               0
    "evdev"                 0       0       0     0             0               0               0               0
    "rpc-read"              2       0       0     0             -247          0              -4659          7461350097
    "mt9t013"               0       0       0     0             0               0               0               0
    "gpio-input"            0       0       0     0             0               0               0               0
    "gpio-input"            0       0       0     0             0               0               0               0
    "SMD-DATA7"             0       0       0     0             0               0               0               0
    "SMD-DATA6"             0       0       0     0             0               0               0               0
    "msm-serial-hs-rx"      0       0       0     0             0               0               0               0
    "unknown-wakeups"       0       0       0     0             0               0               0               0
    "deleted-wake-locks"    36      0       0     0             2593991         518798          1068114         0
    "radio-interface"       -     0       0     549499512     437556091307   -9558441157   -95507812      31701540695418
    "vbus-present"          3       2       0     16399444580   2640-5008545  25248585083008  258-71240234  31685690780867
    "main"                 -      0       0     547991455078  4674244259033   0               -599700-    31154098800887
    "mmc-delayed-work"      796     796     172   0             405246968975    396150246568    689067383       31153556991805
    "SMD-DS"                682     681     192   558-443     486005943591    2686-61407    23688-22      31701531357039

## Patch submission controversy

Arve Hjønnevå (of Google) sent patches to the linux-pm mailing list in
of 2009, but they were rejected. See [this
thread](https//lists-linux-foundation.org/pipermail/linux-pm/2009-February/019750-html)
for the submission and resulting discussion. This was the third version
of the patches submitted for review by the kernel community.

The reasons for the rejection are described in the LWN.NET article
[Wakelocks and the embedded problem](http//lwn-net/Articles/318611/)-

## Wakelock documentation (from patch)

The 3rd version of the wakelock patch included the following
/Documentation/power/wakelock.txt file

    Wakelocks
    =========

    A locked wakelock, depending on its type, prevents the system from entering
    suspend or other low-power states. When creating a wakelock, you can select
    if it prevents suspend or low-power idle states.  If the type is set to
    WAKE-LOCK-SUSPEND, the wakelock prevents a full system suspend. If the type
    is WAKE-LOCK-IDLE, low-power states that cause large interrupt latencies, or
    that disable a set of interrupts, will not be entered from idle until the
    wakelocks are released. Unless the type is specified, this document refers
    to wakelocks with the type set to WAKE-LOCK-SUSPEND.

    If the suspend operation has already started when locking a wakelock, it will
    abort the suspend operation as long it has not already reached the suspend-late
    stage. This means that locking a wakelock from an interrupt handler or a
    freezeable thread always works, but if you lock a wakelock from a suspend-late
    handler you must also return an error from that handler to abort suspend.

    Wakelocks can be used to allow user-space to decide which keys should wake the
    full system up and turn the screen on. Use set-irq-wake or a platform specific
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
    and calling wake-lock-init. For instance:
    struct state {
        struct wakelock wakelock;
    }

    init() {
        wake-lock-init(&state->wakelock, WAKE-LOCK-SUSPEND, "wakelockname");
    }

    Before freeing the memory, wake-lock-destroy must be called:

    uninit() {
        wake-lock-destroy(&state->wakelock);
    }

    When the driver determines that it needs to run (usually in an interrupt
    handler) it calls wake-lock:
        wake-lock(&state->wakelock);

    When it no longer needs to run it calls wake-unlock:
        wake-unlock(&state->wakelock);

    It can also call wake-lock-timeout to release the wakelock after a delay:
        wake-lock-timeout(&state->wakelock, HZ);

    This works whether the wakelock is already held or not. It is useful if the
    driver woke up other parts of the system that do not use wakelocks but
    till need to run. Avoid this when possible, since it will waste power
    if the timeout is long or may fail to finish needed work if the timeout is
    short.

## Motorola quickwakeup feature

Jocelyn Falempe of Motorola proposed (in November, 2009) a quickwakeup
feature to make it possible to reduce the time for a periodic job to
resume, do a small amount of work, and suspend again.

[http://patchwork.kernel.org/patch/58064/](http//patchwork-kernel-org/patch/58064/)

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

[http://groups.google.com/group/linux.kernel/browse\-frm/thread/b6fed7e38365c259/c92d8b4a41f87902?hl=en&tvc=1&q=linux.kernel+suspend+block+api+(version+6)\#c92d8b4a41f87902](http//groups-google.com/group/linux.kernel/browse-frm/thread/b6fed7e38365c259/c92d8b4a41f87902?hl=en&tvc=1&q=linux-kernel+suspend+block+api+(version+6)#c92d8b4a41f87902)

