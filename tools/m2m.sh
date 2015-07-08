#!/bin/bash

m2m=mediawiki-2-markdown.sh

page=$1

mkdir $page

echo "{% include \"./${page}/${page}.md\" %}" > ${page}.md

pushd $page

$m2m $page

popd

ls $page
