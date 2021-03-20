#!/bin/bash

echo "${ENV}"

echo "${CONTAINER_NAME}"

echo "sleep 3"

sleep 3

node_prod_status=`/usr/bin/kubectl get statefulset -o wide -n ${ENV}|grep -ci ${CONTAINER_NAME}`

echo "node_prod_status id ${node_prod_status}"

if [ "$node_prod_status" == "1" ];then

    echo -e "删除statefulset"

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

    /usr/bin/kubectl -n ${ENV} delete statefulset ${CONTAINER_NAME}

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

else

    echo -e "${CONTAINER_NAME}没有部署"

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"


fi