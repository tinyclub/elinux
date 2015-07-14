#!/bin/bash
#
# Handle subpages of a specified mediawiki page
#

TOP_DIR=$(dirname `readlink -f $0`)
BOOK_ROOT=$(readlink -f "${TOP_DIR}/../en/")
BOOK_SUMMARY=${BOOK_ROOT}/SUMMARY.md
M2M=${TOP_DIR}/m2m.sh
SUBPAGE=${TOP_DIR}/subpage.sh

# echo $TOP_DIR $BOOK_ROOT

root_depth=$(echo $BOOK_ROOT | tr -cd '/' | wc -c)
cur_depth=$(echo $PWD | tr -cd '/' | wc -c)
diff_depth=$((cur_depth-root_depth))

# echo $root_depth $cur_depth $diff_depth
rel_path="$(eval printf '../%.0s' {1..$diff_depth})"

site=http://eLinux.org
lowcase_site=http://elinux.org

page=$1
[ -z "$page" ] && page=`basename $PWD`

subpage_list_md=${page}.subpage.md

# Drop the old toc of the book summary
grep -n -m1 "\/${page}.md" ${BOOK_SUMMARY}

if [ $? -eq 0 ]; then
	page_indent=$(grep -m1 "\/${page}.md" ${BOOK_SUMMARY} | sed -n -e "s/\(^ *\)[^ ].*/\1/p" | wc -c)
	subpage_indent=$(sed -n -e "/\/${page}.md/{n;s/\(^ *\)[^ ].*/\1/p}" ${BOOK_SUMMARY} | wc -c)

	line_num=$(grep -n -m1 \/${page}.md ${BOOK_SUMMARY} | cut -d':' -f1)
	((line_num++))
	((line_num_end=line_num))
	total_line_num=`wc -l ${BOOK_SUMMARY} | cut -d ' ' -f1`
	echo $page_indent $subpage_indent
	while :; do
		if [ $subpage_indent -le $page_indent -a $subpage_indent -ge 1 ]; then
			break
		fi
		if [ $line_num_end -ge $total_line_num ]; then
			line_num_end=$total_line_num
			break
		fi
		((line_num_end++))
		subpage_indent=$(sed -n -e "${line_num_end}s/\(^ *\)[^ ].*/\1/p" ${BOOK_SUMMARY} | wc -c)
	done
	((line_num_end--))
	echo sed -i -e "${line_num},${line_num_end}d" ${BOOK_SUMMARY}
	if [ $line_num_end -ge $line_num ]; then
		sed -i -e "${line_num},${line_num_end}d" ${BOOK_SUMMARY}
	fi
else
	echo "Warn: Can not found ${page}.md in ${BOOK_SUMMARY}" && exit 0
fi

# [ $? -eq 0 ] && echo "Warn: The toc of ${page}.md is already in ${BOOK_SUMMARY}" && exit
# Build the toc for subpages
${SUBPAGE} > toc.md

test -s toc.md
[ $? -eq 1 ] && echo "Warn: No subpages found" && rm toc.md && exit

# Download the new subpages
for subpage in `cat ${subpage_list_md} | grep -v ^# | tr -d '*' | tr -d ' ' | sort -u | uniq`
do
	# Check if the subpage already exist
	tmp="$(grep -m1 /${subpage}.md ${BOOK_SUMMARY})"
	if [ $? -ne 0 ]; then
		echo $subpage
		${M2M} $subpage
	fi

done

# Insert the new pages
line_num=$(grep -n -m1 \/${page}.md ${BOOK_SUMMARY} | cut -d':' -f1)
sed -i -e "${line_num}r toc.md" ${BOOK_SUMMARY}

# Build cross references and download the subpages

for subpage in `cat ${subpage_list_md} | grep -v ^# | tr -d '*' | tr -d ' ' | sort -u | uniq`
do
	# Check if the subpage already exist
	base=$(basename $subpage)
	tmp="$(grep -m1 /${base}.md ${BOOK_SUMMARY})"
	if [ $? -eq 0 ]; then
		subpage_url=$(echo "$tmp" | sed -e "s/.*(\(.*\))/\1/g")
		echo $subpage_url
		sed -i -e "s=${site}/${subpage}=${rel_path}${subpage_url}=g" ${page}.md
		sed -i -e "s=${lowcase_site}/${subpage}=${rel_path}${subpage_url}=g" ${page}.md

	else
		echo $subpage
		# echo ${M2M} $subpage
	fi

done

# Remove the temp toc.md
rm toc.md
