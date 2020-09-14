#!/bin/bash

USER="admin"
PASS="Harbor12345"
HURL="http://10.66.226.77:88"
IMAGE_NAME=$1

ttoken=$(curl -iksL -X GET -u $USER:$PASS $HURL/service/token?account=${USER}\&service=harbor-registry\&scope=repository:${IMAGE_NAME}:pull|grep "token"|awk -F '"' '{print $4}')

#echo $ttoken

taglist=$(curl -ksL -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $ttoken" ${HURL}/v2/${IMAGE_NAME}/tags/list|awk -F '[' '{print $2}'|awk -F ']' '{print $1}'|sed 's/"//g')

echo $taglist

echo $taglist |sed 's/,/\n/g' |grep $2 >/dev/null

if [ $? = 0 ];then
   
   echo "检测GIT代码未更新，请提交更新代码后再部署"
   exit 1
else
   echo "没有检测到最新代码镜像"
fi
