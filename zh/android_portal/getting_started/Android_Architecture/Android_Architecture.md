> 原文：[eLinux.org](http://eLinux.org/Android_Architecture "http://eLinux.org/Android_Architecture")<br/>
> 翻译：[@willis](http://eLinux.org/Android_Architecture "http://eLinux.org/Android_Architecture")<br/>
> 校订：[@willis](http://eLinux.org/Android_Architecture "http://eLinux.org/Android_Architecture")<br/>


# Android 框架



通过查阅Google Android网址(http://developer.android.com/guide/basics/what-is-android.html) 了解Android 的各个部分，以及框架图。

我曾经想要了解的 Android 技术主题就展现在这幅框架图的每一个描述里面。

## 目录

-   [1 框架图](#框架图)
-   [2 概要介绍](#概要介绍)
-   [3 Android 系统运行下的分类](#Android 系统运行下的分类)
-   [4 Linux 内核相关](#Linux 内核相关)
-   [5 Java](#Java)
        -   [5.1 Java/面向对象思想](#Java 面向对象思想)

## 框架图

Android 框架图出自于：
[这里](http://developer.android.com/images/system-architecture.jpg).

[![Android-system-architecture.jpg](http://eLinux.org/images/c/c2/Android-system-architecture.jpg)](http://eLinux.org/File:Android-system-architecture.jpg)

请也参考 [Android 内部图](http://www.makelinux.net/android/internals/)

Basically Android has the following layers:
基本上, Android　存在如下几层结构:

-   应用(Java 程序语言编写, 运行在Dalvik虚拟机上)
-   框架服务和函数库(大多数用Java 程序语言编写)
    -   应用层以及大多数的Java　代码运行在虚拟机上)
-   本地库，守护进程和服务(C/C++ 程序语言编写)
-   Linux 内核。包括
    -   硬件驱动，网络，文件系统以及进程间通讯

## 概要介绍

-   [Android 不仅仅是基于Linux的Java](http://kobablog.wordpress.com/2011/05/22/android-is-not-just-java-on-linux/)
    -   这是作者Tetsuyuki Kobayashi对Android的精辟讲解

-   查阅Karim Yaghmour对Android 深度剖析
    -   [http://www.opersys.com/blog/android-internals-101103](http://www.opersys.com/blog/android-internals-101103)
    -   您可以在这里找到视频以及幻灯片资料

-   [Mythbusters\_Android.pdf](http://eLinux.org/images/2/2d/Mythbusters_Android.pdf "Mythbusters Android.pdf")
    Matt Porter 在欧洲Linux 嵌入式峰会上的报告
    －  关于有疑问的Android 代码以及策略的林林总总

## Android 系统运行下的分类

概览Android 程序的的运行状态:

-   [http://benno.id.au/blog/2007/11/13/android-under-the-hood](http://benno.id.au/blog/2007/11/13/android-under-the-hood)

## Linux 内核相关

来自于2010年CELF峰会的[Greg Kroah-Hartmans presentation on Android](http://github.com/gregkh/android-presentation/downloads)就Google/Android与Linux 社区协作与否进行了讨论。

## Java

Java 是应用程序编程语言，但是它会通过通用自定义解释器（Dalvik）解析为运行时非Java字节码。

### Java/面向对象思想

Android 系统，实践出真知。

在Android 工作的一位资深工程师Dianne Hackborn 写道:

并不是说我不喜欢面向对象设计的C程序员。实际上我之前在Android上主要的编程语言是C++...。诚实的说，Java之所以困扰我的是，我能通过C++的非常棒的面向对象的概念来得到更容易的结果，但是Java却需要如此多的重写方法来完成。

尽管在Android上，Java有许多其他很好的属性，　但是它也有自身设计上的缺陷和不足，以至于我们不能认同它就是我们心中的完美的面向对象。

最终，API的定义允许我们有时间在硬件上良好运行操作系统。但是这也会随着某些情况而改变，比如变得慢，却不是非常慢。。。然而，我将愿意继续尝试保持这些APId的适当性以便于保证目前的每一项工作的连续性。　当然了，如果Android是成功的，那么在从现在起的10年内，我们将设计全新的下一代Android框架。　那么，这就更加不一样了。




[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Android](http://eLinux.org/Category:Android "Category:Android")

