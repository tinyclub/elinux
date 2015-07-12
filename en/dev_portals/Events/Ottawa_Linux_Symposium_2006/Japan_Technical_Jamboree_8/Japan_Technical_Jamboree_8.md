> From: [eLinux.org](http://eLinux.org/Japan_Technical_Jamboree_8 "http://eLinux.org/Japan_Technical_Jamboree_8")


# Japan Technical Jamboree 8



[![SymbolJamboree.gif](http://eLinux.org/images/f/fd/SymbolJamboree.gif)](http://eLinux.org/File:SymbolJamboree.gif)

## Contents

-   [1 Introduction](#introduction)
    -   [1.1 Coordinators: (Your inquiries in English
        welcome).](#coordinators-your-inquiries-in-english-welcome)
-   [2 Table Of Contents](#table-of-contents)
-   [3 Date and Place](#date-and-place)
-   [4 Registration](#registration)
    -   [4.1 "Neta-Furi" ("What I can talk about")
        Card](#-neta-furi-22what-i-can-talk-about-22-card)
-   [5 Discussion Items](#discussion-items)
    -   [5.1 Special Session](#special-session)
    -   [5.2 General Session](#general-session)
        -   [5.2.1 kernel 2.6に於けるスケジューラの調査 / A Study about
            the Schedulers in Kernel
            2.6](#kernel-2-6.e3.81.ab.e6.96.bc.e3.81.91.e3.82.8b.e3.82.b9.e3.82.b1.e3.82.b8.e3.83.a5.e3.83.bc.e3.83.a9.e3.81.ae.e8.aa.bf.e6.9f.bb-a-study-about-the-schedulers-in-kernel-2-6)
    -   [5.3 Project Update Session](#project-update-session)
-   [6 第8回CELFテクニカルジャンボリー / 8th CELF Technical
    Jamboree](#-e7.ac.ac8.e5.9b.9ecelf.e3.83.86.e3.82.af.e3.83.8b.e3.82.ab.e3.83.ab.e3.82.b8.e3.83.a3.e3.83.b3.e3.83.9c.e3.83.aa.e3.83-bc-8th-celf-technical-jamboree)
    -   [6.1 日時・開催場所 / Date and
        Venue](#-e6.97.a5.e6.99.82.e3.83.bb.e9.96.8b.e5.82.ac.e5.a0.b4.e6.89-80-date-and-venue)
    -   [6.2 参加登録 /
        Registration](#-e5.8f.82.e5.8a.a0.e7.99.bb.e9.8c-b2-registration)
    -   [6.3 ネタ振りカード / Neta-Furi
        Card](#-e3.83.8d.e3.82.bf.e6.8c.af.e3.82.8a.e3.82.ab.e3.83.bc.e3.83-89-neta-furi-card)
    -   [6.4 進行の目安 /
        Agenda](#-e9.80.b2.e8.a1.8c.e3.81.ae.e7.9b.ae.e5.ae-89-agenda)
    -   [6.5 デモンストレーション /
        Demonstration](#-e3.83.87.e3.83.a2.e3.83.b3.e3.82.b9.e3.83.88.e3.83.ac.e3.83.bc.e3.82.b7.e3.83.a7.e3.83-b3-demonstration)
        -   [6.5.1 Demonstration by Fujitsu](#demonstration-by-fujitsu)
-   [7 お知らせ /
    Notice](#-e3.81.8a.e7.9f.a5.e3.82.89.e3.81-9b-notice)
    -   [7.1 Worldwide Embedded Linux Conference 2006 /
        Video](#worldwide-embedded-linux-conference-2006-video)
    -   [7.2 OSDL-Japan Linux Symposium](#osdl-japan-linux-symposium)
    -   [7.3 Ottawa Linux Symposium 2006](#ottawa-linux-symposium-2006)
    -   [7.4 A Special Offer of English Training
        Course](#a-special-offer-of-english-training-course)

## Introduction

-   The Japan Technical Jamboree is a forum-wide technical meeting of
    the CE Linux Forum. This meeting will be located conveniently in
    Japan and use Japanese as the native language of the event.
-   Attendance is not limited to the CELF members, but is open to all.
    Everyone who is interested in embedded Linux technologies is
    welcomed. There is no admission fee.
-   A general guidance page is available. [Japan Technical Jamboree
    Guidance](http://eLinux.org/Japan_Technical_Jamboree_Guidance "Japan Technical Jamboree Guidance")
    (Japanese/English)

### Coordinators: (Your inquiries in English welcome).

-   Hisao Munakata (munakata.hisao(a)renesas.com)
-   Satoru Ueda (Satoru.Ueda(a)jp.sony.com)



## Table Of Contents

## Date and Place

-   **May 26 (Friday), 2006**
    -   From 10am to 9pm
-   **Venue**
    -   **Gate City Osaki, West Tower, Meeting Room "D"** (**1st
        Floor**)
    -   [Homepage](http://www.gatecity.jp/index.html) (Japanese)
        -   English page is not available, however it is very easy to
            access. Just near by of "Osaki" station, JR Yamanote Line.

## Registration

-   Registration site is
    [here](http://www.celinux.org/TokyoTechnoJamboree8.htm).

### "Neta-Furi" ("What I can talk about") Card

-   /\\ Because we are confident that without this card, we can
    encourage every attendees to join the discussion, we will not ask
    everyone to present this card.

## Discussion Items

-   We are now calling for discussion items. Please feel free to send
    your subject to the coordinators
-   **You will find the agenda at the bottom of this page.**

### Special Session

-   A special session to review the "Worldwide Embedded Linux Conference
    2006" is planed.

### General Session

-   **We are calling for the discussion items**

#### kernel 2.6に於けるスケジューラの調査 / A Study about the Schedulers in Kernel 2.6

-   発表者：東芝情報システム株式会社 中嶋 健一郎 / By Kenichiro Nakajima
    (Toshiba Information Systems)
-   内容：linuxが2.6になってから提案されている以下のスケジューラをリアルタイムスレッドと通常のスレッドへの切替えレイテンシの点から調査した。
    Studied following schedulers, proposed since 2.6 was released, in
    terms of switching latency to real time threads and ordinary
    threads.
-   目的：今後のデジタル家電に使えるスケジューラは何かを調査するため。
    Objective: To survey which scheduler is appropriate for coming
    digital appliances
-   調査対象のスケジューラ surveyed schedulers：
    -   ingosched
    -   ingo\_ll
    -   nicksched
    -   staircase
-   発表方式：グラフなどを用いて説明予定。Presentation: Talk with graphs

### Project Update Session

-   **We are calling for the discussion items**
-   Improving Startup Using Power Management by Mr. Kaminaga, Sony

## 第8回CELFテクニカルジャンボリー / 8th CELF Technical Jamboree

-   前回のジャンボリーで予告しましたとおり、5月26日（金）に第8回東京テクニカルジャンボリーを開催します。(As
    announced in the previous Jamboree, 8th Tokyo Technical Jamboree
    will be held on May 26(Fri).
-   **はじめて参加される方に(For Newcomers)：**
    -   ガイダンスページを作りました。お役に立てば幸いです。[Japan
        Technical Jamboree
        Guidance](http://eLinux.org/Japan_Technical_Jamboree_Guidance "Japan Technical Jamboree Guidance")
        (Guidance page has been prepared. Hope it helps.)

### 日時・開催場所 / Date and Venue

-   5月26日（金）午前10時～午後9時（会議室は９時まで予約してあります）。
    May 26 (Fri) 10:00-21:00 (Meeting room is reserved till 21:00)
-   場所：ゲートシティー大崎D会議室（1階:入り口は地下一階です）[Homepage](http://www.gatecity.jp/index.html)
    Location: Gate City Ohsaki Meeting Room D (1F: Entrance of the
    meeting room is located in B1)
    -   JR山手線・湘南新宿ライン（埼京線）、東京臨海高速鉄道・りんかい線、大崎駅前（駅から雨に濡れずに行けます）
        -   大崎駅は品川駅から山手線で一駅。また、羽田空港からは京浜急行品川経由、または東京モノレール天王洲アイル経由が便利です。
-   **Good News**:
    この会場ではインターネットへのフリーアクセスが可能です。当日はWireless
    LANを設置します。(Free access to the Internet is available. Wireless
    Lan will be set up on the day.)
-   電源延長ケーブルをお持ちの方はご持参ください。(Come with your
    extension cable if possible)

### 参加登録 / Registration

-   参加登録はサイトは[こちら](http://www.celinux.org/TokyoTechnoJamboree8.htm)です。(Registration
    site is here)

### ネタ振りカード / Neta-Furi Card

-   /\\
    最近のジャンボリーの様子ですとこのカードに込めた活発な技術議論に対する呼び水の役割は終わりつつあるようですので、今回はネタ振りカードを止めてみます。

### 進行の目安 / Agenda

<table>
<tbody>
<tr class="odd">
<td align="left"><strong>時間 / Time</strong></td>
<td align="left"><strong>内容 / Session Title</strong></td>
<td align="left"><strong>場所</strong> <strong>Room</strong></td>
<td align="left"><strong>資料 / Materials<a href="http://elinux.org/File:Call4Volunteer.gif"><img src="http://elinux.org/images/7/7d/Call4Volunteer.gif" alt="Call4Volunteer.gif" /></a></strong></td>
</tr>
<tr class="even">
<td align="left">10:00..10:20</td>
<td align="left"><strong>連絡事項と簡単な自己紹介</strong>Notice and selfintroduction</td>
<td align="left">D</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">10:20..11:30</td>
<td align="left"><strong>A demonstration of &quot;Visual Terminal&quot;</strong>(Kondo/Fujitsu)</td>
<td align="left">D</td>
<td align="left"><a href="http://elinux.org/File:S_Fujitsu_001.jpg"><img src="http://elinux.org/images/b/b2/S_Fujitsu_001.jpg" alt="S Fujitsu 001.jpg" /></a> <a href="http://elinux.org/images/8/8e/A-demonstration-of-Visual-Terminal.pdf" title="A-demonstration-of-Visual-Terminal.pdf">Media:A-demonstration-of-Visual-Terminal.pdf</a> (Japanese) <a href="http://elinux.org/images/e/e4/A-demonstration-of-Visual-Terminal-en.pdf" title="A-demonstration-of-Visual-Terminal-en.pdf">Media:A-demonstration-of-Visual-Terminal-en.pdf</a> (English)</td>
</tr>
<tr class="even">
<td align="left">11:30..12:30</td>
<td align="left">Lunch</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">12:30..13:30</td>
<td align="left"><strong>WELC 2006を振り返って</strong>Review WELC 2006</td>
<td align="left">D</td>
<td align="left"><a href="http://elinux.org/ELC_2006_Presentations" title="ELC 2006 Presentations">ELC 2006 Presentations</a> <a href="http://www.celinux.org/elc2006/index.html">WELC2006</a> <a href="http://www.linuxdevices.com/news/NS9948464500.html">Technical Showcase</a></td>
</tr>
<tr class="even">
<td align="left">13:30..14:00</td>
<td align="left"><strong>Power Management Summit参加報告</strong> - Attending &quot;Power Management Summit&quot; (Kaminaga/Sony)</td>
<td align="left">D</td>
<td align="left"><a href="http://lwn.net/Articles/181888/">lwn article</a> <a href="http://linux-pm.org/">linux-pm</a> <a href="http://elinux.org/images/0/0b/Pmsummit2006.txt" title="Pmsummit2006.txt">Media:Pmsummit2006.txt</a> PM summit memo (English)</td>
</tr>
<tr class="odd">
<td align="left">14:00..14:30</td>
<td align="left"><strong>kernel 2.6に於けるスケジューラの調査</strong>A Study about the Schedulers in Kernel 2.6 (Nakajima/tjsys)</td>
<td align="left">D</td>
<td align="left">[#abstract Abstract] <a href="http://elinux.org/images/9/97/Tjsys-jamboree.odp" title="Tjsys-jamboree.odp">Media:tjsys-jamboree.odp</a> (Japanese) <a href="http://elinux.org/images/f/ff/Tjsys-jamboree-en.odp" title="Tjsys-jamboree-en.odp">Media:tjsys-jamboree-en.odp</a> (english)</td>
</tr>
<tr class="even">
<td align="left">14:30..15:30</td>
<td align="left"><strong>Analysis of User Level Device Driver Usability in Embedded Application</strong> – Technique to Achieve Good Real-Time Performance (Matsubara/IGEL)</td>
<td align="left">D</td>
<td align="left"><a href="http://www.celinux.org/elc2006/sessions.html#1">参考/Reference</a> uldd060526celfjambo08.ppt (English, partially Japanese)</td>
</tr>
<tr class="odd">
<td align="left">15:30..16:30</td>
<td align="left"><strong>Linux RAM-Based Filesystem</strong> - PRAMFS の評価および、その他 Linux RAM-Based Filesystem について - Evaluation of PRAMFS and the other RAM based file system on Linux (Uwatoko/Toshiba)</td>
<td align="left">D</td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">16:30..17:00</td>
<td align="left"><strong>Kernel size measurement tool (tentative)</strong> (Ikeda or Shibata/NEC)</td>
<td align="left">D</td>
<td align="left"></td>
</tr>
<tr class="odd">
<td align="left">17:00..17:20</td>
<td align="left">Break</td>
<td align="left"></td>
<td align="left"></td>
</tr>
<tr class="even">
<td align="left">17:20..18:30</td>
<td align="left"><strong>Cross-development on Mac</strong>what tools, where to find them and what devices they are good for(André Krützfeldt/Aplix)</td>
<td align="left">D</td>
<td align="left"><a href="http://elinux.org/images/6/65/Aplix_jamboree0605a.ppt" title="Aplix jamboree0605a.ppt">Media:aplix_jamboree0605a.ppt</a> (English)</td>
</tr>
<tr class="odd">
<td align="left">18:30..19:30</td>
<td align="left"><strong>The pepperpad as development platform</strong>what is it and what can it be used for.(André Krützfeldt/Aplix)</td>
<td align="left">D</td>
<td align="left"><a href="http://www.pepper.com/">http://www.pepper.com/</a> With actual hardware<a href="http://elinux.org/images/4/4e/Aplix_jamboree0605%EF%BD%82.ppt" title="Aplix jamboree0605ｂ.ppt">Media:aplix_jamboree0605ｂ.ppt</a> (English)</td>
</tr>
<tr class="even">
<td align="left">19:30..20:30</td>
<td align="left"><strong>Discussion: Mobile Phone API Specification</strong>(André Krützfeldt/Aplix)</td>
<td align="left">D</td>
<td align="left"></td>
</tr>
</tbody>
</table>

### デモンストレーション / Demonstration

-   デモンストレーションも歓迎します。今回の会場はコーディネータ（上田）のオフィスの所在地でもありますので、機材はあらかじめ上田宛送付してください。特別なご要望も有りましたらご遠慮なくお問い合わせください。
-   We welcome your technical demonstration. Please send the
    demonstration equipments to the coordinator (Ueda).

#### Demonstration by Fujitsu

-   [![Fujitsu
    001.jpg](http://eLinux.org/images/9/9e/Fujitsu_001.jpg)](http://eLinux.org/File:Fujitsu_001.jpg)

## お知らせ / Notice

### Worldwide Embedded Linux Conference 2006 / Video

-   ELC
    2006の様子がビデオで見られます。下記URLに、OGGファイルフォーマットでデータが有ります。
    -   [Video
        Archive](http://free-electrons.com/community/videos/conferences/)
-   TIPS: OGGファイルをWindows の環境で再生するには。
    -   [こちら](http://www.faireal.net/articles/9/03/)で解説が有ります。Real
        Player 10で再生できることを確認しました。

1.  Go to [Helix
    Plugins](https://helixcommunity.org/project/showfiles.php?group_id=7)
    site.
2.  Down load "xiphplins\_win32\_0\_1.zip" and extract files.
3.  You will find "Readme.txt" file which explains the procedure to
    install. It is quite simple

-   プレゼンテーション資料はこちらです / Presentation Materials
    -   [Presentation
        Materials](http://tree.celinuxforum.org/CelfPubWiki/ELC2006Presentations)

### OSDL-Japan Linux Symposium

-   6月13日、Andrew
    Mortonらを日本に招きシンポジウムを開催。参加費用は無料で事前申し込み先着150名参加可能です。
-   詳細は[こちら](http://www.osdl.jp/newsroom/press_releases/2006/2006_05_19_tokyo.html)まで。



    日本のソフトウェア技術者が、開発コミュニティのリーダーと対面で情報交換できる。
    カーネルメンテナのAndrew Morton、XenのChris Wrightなど4名が来日。



### Ottawa Linux Symposium 2006

-   OLSの参加受付が既に始まっています。早期登録には割引が有ります。

<table>
<tbody>
<tr class="odd">
<td align="left"><strong>Timing</strong></td>
<td align="left"><strong>General Registration Price</strong>(Canada Doller)</td>
<td align="left"><strong>Student Registration Price</strong>(Canada Doller)</td>
</tr>
<tr class="even">
<td align="left">Before March 1st</td>
<td align="left">300.00</td>
<td align="left">149.00</td>
</tr>
<tr class="odd">
<td align="left">On or before May 1st</td>
<td align="left">350.00</td>
<td align="left">200.00</td>
</tr>
<tr class="even">
<td align="left">On or before July 1st</td>
<td align="left">500.00</td>
<td align="left">250.00</td>
</tr>
<tr class="odd">
<td align="left">After July 1st</td>
<td align="left">750.00</td>
<td align="left">275.00</td>
</tr>
</tbody>
</table>

-   今年もCE Linux
    Forumではオタワリナックスシンポジウムにスポンサーします。公式に`BoF`セッションを持つことになりました。昨年大いに関心を集めたデモンストレーションも実施する予定です。更にCE
    Linux
    Forum発の話題がセッション提案に通ったという情報も有ります。是非OLSに参加することをご検討ください。昨年参加した印象は大変に強烈で、メインラインデベロッパーのみなさんも組込み系に大いに関心を示してくれました。参加の価値は絶大です。
    -   Please be noted that the registration for the OLS 2006 is
        already started
-   [OLS 2006](http://www.linuxsymposium.org/2006/)
-   オタワの案内ページを作りました。参考にしてください。Japan Jamboree
    To OLS

### A Special Offer of English Training Course

-   ALC教育社様から（[Home Page](http://www.alc.co.jp/)）CE Linux
    Forum関係者に対して英語教育コースの優待の申し出がありました。昨年(2005年)末にALC社常務取締役の吉川様始め皆様に、コミュニティー活動を英語圏で行うのに必要な英語力をつけるにはどうすれば良いか、お話を頂く機会がありました。その中で、エンジニアは書く英語から始めると実用的、との助言を頂き、「ビジネスEメール速習パック、ライティングエイド」の紹介を頂きました。詳細はホームページをご覧ください。なお、この教材には英文Eメール作成支援ソフト「カクスケ」が付属しています。カクスケ単体での販売は無いという事です。興味のある方はコーディネータに一報ください。優待の内容、申し込み方法をお知らせいたします。吉川様から「個人的にも是非リナックスオープン開発コミュニティーには大いに期待しており是非力になりたい」との事でした。
    -   [ライティングエイド](http://home.alc.co.jp/db/owa/sp_item_detail?p_sec_cd=11&p_item_cd=W2)
    -   [カクスケ](http://www.alc.co.jp/alcshop/program/w2/kakusuke.html)
-   An English training firm, "ALC Education" told us that they are
    pleased to provide us with a special discount offer of their English
    training course, "Business E-Mail Rapid Learning Course, Writing
    Aid". If you are interested in this offer, please do not hesitate
    asking to the coordinator of the Jamboree.


[Categories](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Events](http://eLinux.org/Category:Events "Category:Events")
-   [Japan Technical
    Jamboree](http://eLinux.org/Category:Japan_Technical_Jamboree "Category:Japan Technical Jamboree")

