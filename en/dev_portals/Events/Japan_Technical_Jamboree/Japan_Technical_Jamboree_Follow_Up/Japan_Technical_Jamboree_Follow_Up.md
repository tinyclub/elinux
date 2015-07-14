> From: [eLinux.org](http://eLinux.org/Japan_Technical_Jamboree_Follow_Up "http://eLinux.org/Japan_Technical_Jamboree_Follow_Up")


# Japan Technical Jamboree Follow Up



## Contents

-   [1 Introduction](#introduction)
-   [2 Follow-up Meeting](#follow-up-meeting)
    -   [2.1 ソニー主催のフォローアップミーティング / Follow up Meeting
        hosted by
        Sony](#-e3.82.bd.e3.83.8b.e3.83.bc.e4.b8.bb.e5.82.ac.e3.81.ae.e3.83.95.e3.82.a9.e3.83.ad.e3.83.bc.e3.82.a2.e3.83.83.e3.83.97.e3.83.9f.e3.83.bc.e3.83.86.e3.82.a3.e3.83.b3.e3.82-b0-follow-up-meeting-hosted-by-sony)
-   [3 本日の話題 / Today's
    topics](#-e6.9c.ac.e6.97.a5.e3.81.ae.e8.a9.b1.e9.a1-8c-today-s-topics)
    -   [3.1 CPU関連 / CPU
        related](#cpu-e9.96.a2.e9.80-a3-cpu-related)
    -   [3.2 Memory関連 / Memory
        related](#memory-e9.96.a2.e9.80-a3-memory-related)
    -   [3.3 Device Hot Plug](#device-hot-plug)
    -   [3.4 Suspend/Resume, PM](#suspend-resume-pm)
    -   [3.5 その他 / Others](#-e3.81.9d.e3.81.ae.e4.bb-96-others)

## Introduction

The Japan Technical Jamboree is a forum-wide technical meeting of the CE
Linux Forum. This meeting will be located conveniently in Japan and use
Japanese as the native language of the event.

***このサイトは原則として日本語のみです。*** ***THIS PAGE was;-)
JAPANESE LANGUAGE ONLY***

## Follow-up Meeting

-   第一回東京テクノジャンボリーの結果、更に詳細なディスカッションの場を設定しては如何でしょうか。(How
    about setting up follow-up meeting after the first Tokyo techno
    Jamboree as the opportunity for further detailed discussion?)

### ソニー主催のフォローアップミーティング / Follow up Meeting hosted by Sony

-   **ソニーは下記の場を設けさせて頂きます。**(Sony will prepare the
    following site.)
    -   場所：鶴屋町フォーラム（横浜駅から徒歩10分ほど）[[http://www.maybe.co.jp/index.html](http://www.maybe.co.jp/index.html)
        鶴屋町フォーラム(Location: Tsuruya Forum (10 min walk from
        Yokohama station)
        ***５階W3会議室
        1Fには案内が出ておりませんのでそのまま5階までお越しください。***(Meeting
        room W3 on 5F; As no signpost shown on 1F, please come directly
        up to 5F.)

-   -   日時：11月17日（水）午後5時30分～8時30分(新横浜発21:09のぞみ157号、22:00こだま535号（浜松行）に間に合います。)(Date
        and Time: November 17(Wed) 17:30-20:30 (You can go home by
        Shinkansen as far as Hamamatsu.))

-   話題(topics):
    1.  CPU/Memory [QoS](http://eLinux.org/QoS "QoS") (MTA等) / (MTA etc.)
    2.  USB/Memory Card Hot Plugging (File System関連も含む) /
        (Including File Systems)
    3.  Suspend
        Resume（サスペンド時のファイルシステム保護とリジューム時の高速起動など）/
        (File system protection at suspending and fast resuming, etc.)
-   ご興味を頂けるエンジニアの皆様と突っ込んだ情報交換や、今後の展開に関してディスカッションをしませんか。もしソースコードやスペック等、見せられる物が有ればお互いにレビューしたりできればと考えております。ソニーは1)3)に関してはアウトラインスペックや、完成レベルでは有りませんがソースコードをお見せできます。また、2)に関しては大いに興味があり、是非皆様のお知恵を拝借したく考えております。
    -   How about exchanging deep information among engineers with
        interest, and having discussion on future works? If you have
        something to show, such as source code or spec, we are expecting
        that we review them each other. Sony can show outline spec, and
        unfinished source code, on 1) and 3). We are interested also in
        2) and would like to get good ideas from attendees.
-   ちょうどパシフィコ横浜でET2004が開催されております。その後にでもお寄りいただけるように、時間と場所を設定させて頂きました。（CELFのブースはA-11です）。
    -   We arranged this meeting so that you can drop by after you see
        the ET2004 at Pacifico Yokohama (CELF booth is A-11).
-   周囲に手頃な飲食店も多い場所ですので、よろしければ終わってから軽くビールでも。・・・これは割り勘で。
    -   As there are a lot of restaurants and bars around the meeting
        site, we can talk more over beers ... please pay your share.

## 本日の話題 / Today's topics

-   CPU 資源, Memroy 関連 (CPU resources, Memory related)
-   Device `HotPlug`
-   Suspend/Resume, PM

### CPU関連 / CPU related

-   CPU [QoS](http://eLinux.org/QoS "QoS")
    -   ソフトリアルタイムのアプローチ: AXEさん (Soft real time
        approach: AXE)
    -   割り込み応答改善 (Improving interrupt response)
        -   富士通さん [Time Sys](http://eLinux.org/Time_Sys "Time Sys") さん (Fujitsu,
            [Time Sys](http://eLinux.org/Time_Sys "Time Sys"))
            [http://tree.celinuxforum.org/pubwiki/moin.cgi/RealTimeWorkingGroup](http://tree.celinuxforum.org/pubwiki/moin.cgi/RealTimeWorkingGroup)
        -   三菱さん
            [http://r2linux.sourceforge.jp/](http://r2linux.sourceforge.jp/)
            (Mitsubishi)
-   最近のLKML – BKLの排除 (Recent LKML - Exclusion of BKL)
    -   MVパッチ, Ingoパッチとか (MV patch, Ingo Patch etc.)
        [http://groups.google.co.jp/groups?hl=ja&lr=&client=firefox-a&frame=right&th=2e5c7c40d45a248b&seekm=2ZnuV-1rW-9@gated-at.bofh.it\#link1](http://groups.google.co.jp/groups?hl=ja&lr=&client=firefox-a&frame=right&th=2e5c7c40d45a248b&seekm=2ZnuV-1rW-9@gated-at.bofh.it#link1)
-   軽量なイベント通知機構 Inotify (Light weight event notification
    mechanism Inotify) -
    [http://lwn.net/Articles/104312/](http://lwn.net/Articles/104312/)

### Memory関連 / Memory related

-   MTA (Memory Type Based Allocation)　– メモリデバイス毎に割り当て
    Sony/MEIさん(MVさん)
    -   [http://tree.celinuxforum.org/CelfPubWiki/MemoryTypeBasedAllocation](http://tree.celinuxforum.org/CelfPubWiki/MemoryTypeBasedAllocation)
-   ompressed Swap AXEさん
    -   Sourceforge の2.4のプロジェクト[2.4 Projects in Sourceforge]
        [http://linuxcompressed.sourceforge.net/](http://linuxcompressed.sourceforge.net/)
    -   DOUBLE: compressed RAM disk for kernel 1.x/2.0

### Device [Hot Plug](http://eLinux.org/index.php?title=Hot_Plug&action=edit&redlink=1 "Hot Plug (page does not exist)")

-   USB Host 東芝さん (Toshiba)
    -   Mass Storage class
-   Memory card support FATでの対策 (Work in FAT)

### Suspend/Resume, PM

-   LDM / New PM model ([Pm Sub System](http://eLinux.org/Pm_Sub_System "Pm Sub System"))
-   ソニーの取り組み (Sony's approach)
    -   Safe Suspend
    -   Deferred Resume
    -   Fast Clean Shutdown
-   Hibernation from Flash …. サムソンさん (Samsung)
-   待機電力削減、Ｔｉｃｋなど削減 NECさん (Stand-by time power saving,
    reduction of ticks by NEC)

### その他 / Others

-   `PreLink` for MIPS – NECさん、東芝さん(NEC, Toshiba)
    -   CELF public wiki
        [http://tree.celinuxforum.org/pubwiki/moin.cgi/PreLinking](http://tree.celinuxforum.org/pubwiki/moin.cgi/PreLinking)
    -   似たような仕組み (Similar mechanisms)
        -   Prebinding ([Rel
            Cache](http://eLinux.org/index.php?title=Rel_Cache&action=edit&redlink=1 "Rel Cache (page does not exist)"))
            - `RelCache` (aka ELF prebinding) news
            [http://mail-index.netbsd.org/tech-userlevel/2002/12/04/0017.html](http://mail-index.netbsd.org/tech-userlevel/2002/12/04/0017.html)
        -   [Rel
            Cache](http://eLinux.org/index.php?title=Rel_Cache&action=edit&redlink=1 "Rel Cache (page does not exist)")
            vs. Red Hat prelink
            [http://mail-index.netbsd.org/tech-userlevel/2002/12/01/0000.html](http://mail-index.netbsd.org/tech-userlevel/2002/12/01/0000.html)
        -   Resident - Resident Good (comparisons with prebind)
            [http://www.shiningsilence.com/dbsdlog/archives/000215.html](http://www.shiningsilence.com/dbsdlog/archives/000215.html)


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Events](http://eLinux.org/Category:Events "Category:Events")
-   [Japan Technical
    Jamboree](http://eLinux.org/Category:Japan_Technical_Jamboree "Category:Japan Technical Jamboree")

