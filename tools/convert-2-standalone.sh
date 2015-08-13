#!/bin/bash
#
# convert-2-standalone.sh -- Convert the markdown to one standalone without toc and with absolute urls
#

md=$1
site=http://tinylab.gitbooks.io/elinux/content/zh

sed -i -e "/<span/d" $md

# Detect target language (only support en/ and zh-cn/ currently)
contents="Contents"
echo ${md} | grep -q "zh"
if [ $? -eq 1 ]; then
	echo $PWD | grep -q "zh"
	[ $? -eq 0 ] && contents="目录"
else
	contents="目录"
fi

# Drop old toc
start_line=`grep -n -m1 "^## ${contents}" $md | cut -d':' -f1`
end_line=`grep -n -m3 "^##*" $md | tail -1 | cut -d':' -f1`
((end_line--))
sed -i -e "/<span /d" ${md}
#echo $start_line $end_line
sed -i -e "${start_line},${end_line}d" ${md}

# Use absolute address
sed -i -e "s#(\.\./\.\./\(.*\).md#(${site}/\1.html#g" ${md}
