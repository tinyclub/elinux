#!/bin/bash

m2m=mediawiki-2-markdown.sh

page=$1

page=$(echo ${page} | sed -e "s/\.md//g")

mkdir $page

echo "{% include \"./${page}/${page}.md\" %}" > ${page}.md

pushd $page

$m2m $page

popd

ls $page
