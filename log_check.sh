#/bin/bash
echo ">>>>>>>>>>>>>>>>>>>>>>>check /usr/local/unicorn-route-consumer/logs/unicorn-route-consumer.jar.out<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
#tail -n100 deploy_dir//usr/local/unicorn-route-consumer/logs/unicorn-route-consumer.jar.outs/jarname.out
tail -n100 /usr/local/unicorn-route-consumer/logs/unicorn-route-consumer.jar.out
