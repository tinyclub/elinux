> From: [eLinux.org](http://eLinux.org/NTSC_Bitbang "http://eLinux.org/NTSC_Bitbang")


# NTSC Bitbang



### Introduction

This document describes how to generate composite color video signals in
software using an SX microcontroller. First the document describes the
video signal and after that how to do it in software. There is also a
[PDF-Version](http://eLinux.org/images/e/eb/Howtocolor.pdf "Howtocolor.pdf") of this
document, that is better if you wnat to print it to paper. (Note: The
PDF-file also contains the games pong and tetris with source, so you
might not want to print the whole document, also note that the document
is supposed to be printed on both sides of the paper making some of the
even pages are empty)

### Background

Back in early 1998 I made some experimenting using a PIC16F84
microcontroller (3MIPS of processor power) to generate composite B&W
video signals on the fly in software, with two resistors as the only
video hardware. I made the two classical games Pong and Tetris with this
technique and published them including source on my homepage. Since then
it has been built by several hundreds of people. During the Christmas
1998-1999 I got some equipment from Scenix (nowadays known as Ubicom)
and made some experiments to generate color video signals using an SX
chip, but before I got any results my programmer broke down, at least
that was what I believed, and I stopped developing it. In the early
summer of 2001 I was told by people at Parallax that it was the early
versions of the SX-chips that had a bug in them so my programmer was
just fine, so they gave me some new chips and I continued my work. After
some new experiments, calculating and many late hours and a bit of luck
I got my TV to lock onto the color signal an d by the end of summer I
got a Tetris game up and running. During the fall I developed the Pong
game, which was finished during the Christmas holidays 2001-2002. I
didn’t release the games as there were some details left to take care
of. I didn’t want to publish them until they were as perfect as possible
due to my bad experience with my PIC-based games that were spread in
early bad versions. Now in spring 2003 I decided that I shouldn’t do any
more improvements of the games as I don’t have time to work on them and
I got to stop sometime. The biggest remaining issue is that it only
works good for NTSC, it is much harder to get a correct PAL signal in
software, but that is a problem for someone else to solve. Another issue
about the games was this text about generating color video signals that
I wanted to finish before I released the games, to not get that many
questions about video generation that I don’t have time to answer. After
reading this document you will hopefully understand how to generate
color composite video signals in software. To fully understand this you
need mathematical knowledge at university level, some RF-knowledge would
also help a lot.



### Copyright note

How to generate color video signals in software with SX-chips (C)
Rickard Gunée. This is open source, use this at your own risk ! You may
use the information on this page for your own projects as long as you
refer to the original author (by name and link to authors homepage),
don't do it for profit and don't hurt or harm anyone or anything with
it. The author can not be held responsible for any damage caused by the
information on this and related pages.


