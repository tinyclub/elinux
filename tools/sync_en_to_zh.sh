#!/bin/bash
#
# Remove zh/ and update en/ to
#
# NOTE: Only for administrators....
#

TOP_DIR=$(dirname `readlink -f $0`)
BOOK_ROOT=$(readlink -f "${TOP_DIR}/../")

rm -rf ${BOOK_ROOT}/zh/{android_portal,dbg_portal,dev_portals,embed_linux_info,hardware_pages,info_and_usage_tips,tech_watch_list,toolbox}
cp -r ${BOOK_ROOT}/en/{android_portal,dbg_portal,dev_portals,embed_linux_info,hardware_pages,info_and_usage_tips,tech_watch_list,toolbox} ${BOOK_ROOT}/zh/
cp ${BOOK_ROOT}/en/SUMMARY.md ${BOOK_ROOT}/zh/
