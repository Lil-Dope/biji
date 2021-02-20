FROM nexus.niceloo.com:8083/basicimages/centos:msv0
MAINTAINER Chen Jing Tao <chenjingtao@jiaoyu361.com>

ADD PACKAGE_PATH /data/


RUN sed -i 's/selectenv/ENV/g' /run.sh && sed -i 's#package_name#PACKAGE_NAME#g' /run.sh &&  sed -i 's/selectport/APP_PORT/g' /run.sh &&  sed -i 's/selectapollo/APOLLOENV/g' /run.sh && chmod +x /run.sh && /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone


CMD ["/run.sh", "-D"]
