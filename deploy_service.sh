#!/bin/sh

WORK_DIR=/usr/local/unicorn-route-consumer
FILENAME=unicorn-route-consumer.jar
TIME=`date "+%Y%m%d%H%M%S"`

PID=`ps -ef|grep ${FILENAME}|grep -v grep|grep -v unicorn-route-consumer_update.sh|awk '{print $2}'`


echo ">>>>>>>>>>>>>>>>>>>>>>>停止服务<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
if [ -n "${PID}" ]; then
   echo "PID:${PID}"
   kill -9 $PID
else
   echo ">>>>>>>>>>>>>>>>>>>>>>>${JAR}没有运行<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
fi

echo ">>>>>>>>>>>>>>>>>>>>>>>服务已停止<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo ">>>>>>>>>>>>>>>>>>>>>>>开始备份<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "${WORK_DIR}/${FILENAME}"
echo "${WORK_DIR}/bak/${FILENAME}-${TIME}"
mv ${WORK_DIR}/${FILENAME} ${WORK_DIR}/bak/${FILENAME}-${TIME}
echo ">>>>>>>>>>>>>>>>>>>>>>>备份完毕<<<<<<<<<<<<<<<<<<<<<<<<<<<"


echo ">>>>>>>>>>>>>>>>>>>>>>>开始部署<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

cd ${WORK_DIR} && unzip -o unicorn-route-consumer.zip

function start_process(){
		nohup java -jar -Xms1024m -Xmx1024m -Denv=UAT -Duat_meta=http://10.66.224.96:8090 -Dserver.port=8084  ${WORK_DIR}/${FILENAME} >>${WORK_DIR}/logs/${FILENAME}.out 2>&1 &
}

start_process "${FILENAME}"

echo ">>>>>>>>>>>>>>>>>>>>>>>部署完毕<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

