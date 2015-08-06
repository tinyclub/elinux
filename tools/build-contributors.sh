#!/bin/bash
#
# Build translators section of ${lang}/README.md
#

LANGS="zh/"

for lang in $LANGS
do
	sed -e "/^<hr>/q" < ${lang}/README.md > ${lang}/README.tmp.md
	grep ">.*\[@" -ur zh/ | grep "翻译" | cut -d ">" -f2 | sed -e "s/.*\(\[.*)\).*/\1/g" \
		| sort | uniq -c | grep "\[@" \
		| sort -k1 -r | tr -s ' ' | sed -e "s/ \([0-9]*\) \(.*\)/\2 (\1)/g" \
		| xargs -i echo "-   " {} "<br/>" >> ${lang}/README.tmp.md
	mv ${lang}/README.tmp.md ${lang}/README.md
done
