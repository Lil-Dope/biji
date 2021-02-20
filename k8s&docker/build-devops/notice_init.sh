#!/bin/bash
SERVICE_STATUS=`kubectl -n $2 get pod|grep $1`
NODE_IP=`kubectl -n $2 get pod -o wide|grep $1 |awk '{print $6}'`
echo "检查服务状态：${SERVICE_STATUS}"
echo "部署IP：${NODE_IP}"

sed -i "s#status#${SERVICE_STATUS}#g" $4/wehchat_sendmessage_k8s.sh
sed -i "s/node_ip/${NODE_IP}/g" $4/wehchat_sendmessage_k8s.sh

