#!/bin/bash
#
# Build translators section of ${lang}/Contributors.md
#

LANGS="zh/"

for lang in $LANGS
do
	sed -e "/^<hr>/q" < ${lang}/doc/Contributors.md > ${lang}/doc/Contributors.tmp.md
	grep ">.*\[@" -ur zh/ | grep "翻译" | cut -d ">" -f2 | sed -e "s/.*\(\[.*)\).*/\1/g" \
		| sort | uniq -c | grep "\[@" \
		| sort -k1 -r -g | tr -s ' ' | sed -e "s/ \([0-9]*\) \(.*\)/\2 (\1)/g" \
		| xargs -i echo "-   " {} "<br/>" >> ${lang}/doc/Contributors.tmp.md
	mv ${lang}/doc/Contributors.tmp.md ${lang}/doc/Contributors.md
done
