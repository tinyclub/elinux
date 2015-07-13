#!/bin/bash

TOP_DIR=$(dirname `readlink -f $0`)

m2m=${TOP_DIR}/mediawiki-2-markdown.sh

page=$1

page=$(echo ${page} | sed -e "s/\.md//g")

mkdir -p $page

base=$(basename $page)

# echo "{% include \"./${page}/${page}.md\" %}" > ${page}.md
git rm ${base}.md 2> /dev/null
rm -rf ${base}.md 2> /dev/null

pushd $page

$m2m $page

popd

ls $page
