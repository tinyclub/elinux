#!/bin/bash
#
# Convert mediawiki html page to friendly markdown
#
# Author: Falcon <wuzhangjin@gmail.com>
# From  : http://tinylab.org
#         http://tinylab.gitbooks.io/elinux
#

page=$1
[ -z "$page" ] && page=Boot_Time

from=eLinux.org
site=http://$from
target_site=$site

# Download the printable html page
wget -O ${page}.html -c "${site}/index.php?title=${page}&printable=yes"

[ $? -ne 0 ] && exit 1

# Convert to strict markdown file
pandoc -f html -t markdown_strict --atx-headers ${page}.html > ${page}.md

# Dump the url architecture
cat ${page}.md | \
    egrep "^#|\]\(/[A-Z]" |\
    egrep -v "^$|^--$|/images/" |\
    sed -e "/Navigation menu/,/\%$/d" |\
    sed -e "s#.*](/\([^ ]*\) .*#\1#g" |\
    egrep -v "\[[a-zA-Z]|[^#].*#|Category:|:Categories" | sed -e "s/^\([^#][^#]*\)/* \1/g" > ${page}.subpage.md

# Misc Clean Up:
#
#  * Fix up internal links
#  * Extend the urls
#  * Remove the `Jump to` line
#  * Remove the `From` line
#  * Remove from `Navigation Menu` to the end
#
# Note:
#  * pandoc: need drop / (.2f), gitbook: need convert it to -
#  * pandoc/gitbook: need to drop :
#  * gitbook: need to replace . with -
#  * gitbook: need to replace "*" with -*

cat ${page}.md | \
    sed -e "/^## Content/,/^## Introduction/{s=](#\(.*\)=](#\L\1=g;s=_=-=g;s/.2f/-/g;s/.2c//g;s/.27//g;s/.5b//g;s/.5d//g;s/.28//g;s/.29//g;}" |\
    sed -e "/^## Content/,/^## Introduction/{s/(\([^:]*\):\(.*\))/(\1\2)/g;}" |\
    sed -e "/^## Content/,/^## Introduction/{s/(#\([^\.]*\)\.22\([^\.]*\)\.22\(.*\))/(#-\1\2\3)/g;}" |\
    sed -e "/^## Content/,/^## Introduction/{s/(\([^\.]*\)\.\(.*\))/(\1-\2)/g;}" |\
    sed -e "/^## Content/,/^## Introduction/{s/enlightenment-foundation-libraries-efl/enlightenment-foundation-libraries-efl-http-elinux-org-efl-efl/g;}" |\
    sed -e "s=(/=(${target_site}/=g" |\
    sed -e "/^Jump to:/d" |\
    sed -e "/^From eLinux.org/d" |\
    sed -e "/Navigation menu/,/\%$/d" |\
    sed -e "/Robot.*png.*ELC2013 Tech Zone Contest/,/^\* \* \* \* \*/d" |\
    sed -e "/ELC2013 Tech Zone Contest/d" |\
    sed -e "s/[[:space:]][[:space:]]*$//g" |\
    sed -e "/^[[:space:]][[:space:]]*$/d" > ${page}.md.tmp

# Insert From line with URL
sed -i -e "1i> From: [$from](${site}/${page} \"${site}/${page}\")\n\n" ${page}.md.tmp

mv ${page}.md.tmp ${page}.md

# Convert back to html for validation
pandoc -f markdown -t html ${page}.md > ${page}.new.html
