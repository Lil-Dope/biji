#!/bin/bash

echo "${ENV}"

echo "${CONTAINER_NAME}"

echo "${REP}"

echo "sleep 30"

sleep 30

node_prod_status=`/usr/bin/kubectl get pod -o wide -n ${ENV}|grep ${CONTAINER_NAME}|grep -ci "Running"`

echo "node_prod_status id ${node_prod_status}"

if [ "$node_prod_status" == "${REP}" ];then

    echo -e "the application $2 successfully deployed "

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  /usr/bin/kubectl get pod -o wide -n ${ENV}|grep ${CONTAINER_NAME}

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

else

    echo -e "the application $2 deploy failed "

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

    /usr/bin/kubectl get pod -o wide -n ${ENV}|grep ${CONTAINER_NAME}

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

    exit 1

fi
