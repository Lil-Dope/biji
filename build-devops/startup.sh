#!/bin/sh
DEPLOY_DIR=/data
JAR_NAME=yutong-devops.jar
JAVA_OPTS="-Xmx1024M -Xms1024M  -Duser.timezone=Asia/Shanghai -Dclient.encoding.override=UTF-8 -Dfile.encoding=UTF-8"

export JENKINS_NODE_COOKIE=dontkillme

nohup /data/jdk1.8.0_131/bin/java $JAVA_OPTS -jar  $DEPLOY_DIR/$JAR_NAME -D --spring.profiles.active=test >>$DEPLOY_DIR/$JAR_NAME.out 2>&1 &
