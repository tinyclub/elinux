#!/bin/bash
#
# Build translators section of ${lang}/Contributors.md
#

LANGS="zh/"

for lang in $LANGS
do
	contributor=${lang}/doc/Contributors.md
        echo -e "# 贡献者\n\n" > ${contributor}
        echo -e "## 翻译\n\n" >> ${contributor}
	grep ">.*\[@" -ur ${lang} | grep "翻译" | cut -d ">" -f2 | sed -e "s/.*\(\[.*)\).*/\1/g" \
		| sort | uniq -c | grep "\[@" \
		| sort -k1 -r -g | tr -s ' ' | sed -e "s/ \([0-9]*\) \(.*\)/\2 (\1)/g" \
		| xargs -i echo "-   " {} "<br/>" >> ${contributor}
        echo -e "\n\n## 校订\n\n" >> ${contributor}
	grep ">.*\[@" -ur ${lang} | grep "校订" | cut -d ">" -f2 | sed -e "s/.*\(\[.*)\).*/\1/g" \
		| sort | uniq -c | grep "\[@" \
		| sort -k1 -r -g | tr -s ' ' | sed -e "s/ \([0-9]*\) \(.*\)/\2 (\1)/g" \
		| xargs -i echo "-   " {} "<br/>" >> ${contributor}
done
