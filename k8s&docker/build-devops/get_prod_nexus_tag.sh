#!/bin/bash

curl -ksL -H "Content-Type:application/json" -H "Data_Type:msg" -X POST --data  '{"action":"coreui_Browse","method":"read","data":[{"repositoryName":"niceloo-images","node":"v2/youlu/SERVER_NAME/tags"}],"type":"rpc","tid":18}' http://nexus-prod.niceloo.com/service/extdirect |grep 'v2/youlu/SERVER_NAME/tags/ttag'

#echo cat build_number.txt|grep 'v2/youlu/SERVER_NAME/tags/ttag'

#cat build_number.txt|grep 'v2/youlu/SERVER_NAME/tags/ttag'  




if [ $? = 0 ];then
   
   echo "已检测到ttag版本镜像，即将开始发布"
else
   echo "没有检测到本次发布版本: ttag 镜像，请推送仓库后再发布"
   exit 1
fi
