#!/bin/bash

HURL="http://10.66.225.39:5000/"
IMAGE_NAME=$1
PRO_TAG=$2

taglist=$(curl -ksL -X GET ${HURL}/v2/${IMAGE_NAME}/tags/list|awk -F '[' '{print $2}'|awk -F ']' '{print $1}'|sed 's/"//g')



echo $taglist |sed 's/,/\n/g' |grep $2 >/dev/null

if [ $? = 0 ];then
   echo "images tag ${PRO_TAG}"
   echo "检测GIT代码未更新，请提交更新代码后再部署"
   exit 1
else
   echo "没有检测到最新代码镜像"
fi
