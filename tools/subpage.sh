#!/bin/bash
#
# subpage.sh -- Generate the subpage of a specified mediawiki page
#


TOP_DIR=$(dirname `readlink -f $0`)
BOOK_ROOT=$(readlink -f "${TOP_DIR}/../en/")
BOOK_SUMMARY=${BOOK_ROOT}/SUMMARY.md

page=$1
[ -z "$page" ] && page=`basename $PWD`
subpage=${page}.subpage.md

# Get relative path to book root
rel_path=$(echo $PWD | sed -e "s#$BOOK_ROOT##g")

#echo $BOOK_ROOT $PWD $rel_path

# Check if the toc is already there, otherwise, stop.
# sed -n -e "/\/${page}.md/,/\* /p" ${BOOK_SUMMARY} | grep -q "\- "
# [ $? -eq 0 ] && echo "Warn: The toc of ${page}.md is already in ${BOOK_SUMMARY}" && exit

base_indent=$(grep -m1 "\/${page}.md" ${BOOK_SUMMARY} | sed -n -e "s/\(^ *\)[^ ].*/\1/p" | wc -c)
((base_indent=base_indent/4))

cat $subpage | grep -v "^#" | tr -d '*' | tr -d ' ' | sort -u | uniq | grep -v "File:" | grep -v "User:" > ${subpage}.tmp
mv ${subpage}.tmp $subpage

echo > toc.tmp

while read line
do
	((tmp_indent=base_indent+1))

	line=$(echo "$line" | tr -d '*' | tr -d '#' | tr -d ' ')
	title=$(echo $line | tr '_' ' ')

	base=$(basename $line)
	tmp="$(grep -m1 /${base}.md ${BOOK_SUMMARY})"
	if [ $? -ne 0 ]; then
		grep -q -m1 ".${rel_path}/${line}/${base}.md" toc.tmp
		if [ $? -ne 0 ]; then
			eval "printf '    %.0s' {1..$tmp_indent}"
			echo "- [$title](.${rel_path}/${line}/${base}.md)" | tee -a toc.tmp
		fi
	fi
done < ${subpage}

rm toc.tmp
