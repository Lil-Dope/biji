#!/bin/bash

curl 'https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=95c465f6-bd59-49db-95ee-2d47f27f2acc' \
   -H 'Content-Type: application/json' \
   -d '
{
    "msgtype": "markdown",
    "markdown": {
        "content": "k8s项目<font color=#008000 size=7>job-name</font>已部署完成，请注意。\n> 部署环境:<font color=\"comment\">  eenv</font>\n> 部署镜像:<font color=\"comment\">  iimage</font> \n> 部署空间：<font color=#000000> namespace</font> \n> 节点标签：<font color=#000000> nodemark</font>\n> 节点IP：<font color=#000000> node_ip</font>\n> 部署状态：<font color=#000000> status</font>\n> 部署执行人：<font color=#000000> build-user</font>\n>"
    }
}'
