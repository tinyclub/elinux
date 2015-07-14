#!/bin/bash
#
# build-cross-toc.sh
#

page=$1
[ -z "$page" ] && page=Boot_Time
page=$(echo $page | sed -e "s/.md//g")

# Filter the already built one
grep -m1 __toc_ ${page}.md
[ $? -eq 0 ] && echo "WARN:TOC already build" && exit

title_lines=`egrep -n "^#|<h[0-9]" ${page}.md | egrep -v "## Contents|## 目录" | cut -d ':' -f1 | cut -d' ' -f2- | sed -e 1d`
echo $title_lines
title_lines=($title_lines)

egrep -m1 "^## Content|^## 目录" ${page}.md
[ $? -eq 1 ] && echo "No original table required" && exit

j=0
for i in `sed -n -e "/^## Content/,/^##* /{h;/(.*)/p}" -e "/^## 目录/,/^##* /{h;/(.*)/p}"  ${page}.md | sed -e "s=.*](#\([^ ]*\))$=\1=g" | grep -v "\- "`
do
	orig_toc=$i
	echo "::: $orig_toc"

	random_toc=__toc_${orig_toc}-${RANDOM}-${RANDOM}
	((line=${title_lines[$j]}+j-1))

	# Update toc
	echo sed -i -e "s/](#$orig_toc)$/](#$random_toc)/g" ${page}.md
	sed -i -e "s/](#$orig_toc)$/](#$random_toc)/g" ${page}.md

	# Insert a empty tab <span> with the id in toc for cross reference
        echo sed -i -e "${line}i\\<span id=\"$random_toc\"></span>" ${page}.md
        sed -i -e "${line}i\\<span id=\"$random_toc\"></span>" ${page}.md

	((j++))
done
