#/bin/bash
NU=`ps -ef|grep unicorn-route-consumer|grep -v grep |wc -l`

if [ "${NU}" -eq 0 ]; then
   echo ">>>>>>>>>>>>>>>>>>>>>>>unicorn-route-consumer is not running,  please check!!!请检查！！！<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
   exit 1
else
   echo ">>>>>>>>>>>>>>>>>>>>>>>unicorn-route-consumer is running,  hold on!!!<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
   ps -ef|grep unicorn-route-consumer
fi
