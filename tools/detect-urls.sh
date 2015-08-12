#!/bin/bash
#
# detect-urls.sh
#

page=$1
[ -z "$page" ] && page=Boot_Time
page=$(echo $page | sed -e "s/.md//g")

urls=`grep "](" ${page}.md | sed -e "s/.*\](\([^{\)]*\)).*/\1/g" | grep -v "\.\./" | grep -v \# | cut -d " " -f1 | tr '*' '\n' | sed -e "s#^/##g"`

flts="eLinux.org|wikipedia.org|lwn.net|sourceforge.net|http://www.linux-mtd.infradead.org/|linuxfoundation.org|www.landley.net|wiki.kernel.org|sourceware.org|www.denx.de"

for i in $urls
do
	url=`echo $i | egrep -v $flts`
	if [ $? -eq 0 ]; then
		chromium-browser $url
	fi
done
