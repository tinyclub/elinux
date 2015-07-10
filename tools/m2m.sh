#!/bin/bash

TOP_DIR=$(dirname `readlink -f $0`)

m2m=${TOP_DIR}/mediawiki-2-markdown.sh

page=$1

page=$(echo ${page} | sed -e "s/\.md//g")

mkdir $page

# echo "{% include \"./${page}/${page}.md\" %}" > ${page}.md
git rm ${page}.md 2> /dev/null
rm -rf ${page}.md 2> /dev/null

pushd $page

$m2m $page

popd

ls $page
