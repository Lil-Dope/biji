#!/bin/bash

echo "${APP_ID}-${ENV}"

echo "${JOB_NAME}"

echo "${REP}"

echo "sleep 30"

sleep 30

node_prod_status=`/usr/bin/kubectl get pod -o wide -n ${APP_ID}-${ENV}|grep ${JOB_NAME}|grep -ci "Running"`

echo "node_prod_status id ${node_prod_status}"

if [ "$node_prod_status" == "${REP}" ];then

    echo -e "the application $2 successfully deployed "

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  /usr/bin/kubectl get pod -o wide -n ${APP_ID}-${ENV}|grep ${JOB_NAME}

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

else

    echo -e "the application $2 deploy failed "

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

    /usr/bin/kubectl get pod -o wide -n ${APP_ID}-${ENV}|grep ${JOB_NAME}

    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

    exit 1

fi
