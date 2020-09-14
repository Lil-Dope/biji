FROM 10.66.226.77:88/yutong/centos-jdk1.8-7.6:devopsv2
#FROM 10.66.226.77:88/yutong/centos-jdk1.8-7.6:devops
MAINTAINER The CentOS Project <wxchenjt@yutong.com>

RUN mkdir -p /data/jenkins_home/users \
    && sed -i 's/ENV/selectenv/g' /run.sh

ADD PACKAGE_PATH /data/

CMD ["/run.sh", "-D"]
