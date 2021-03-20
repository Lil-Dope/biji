#!/bin/bash

#author:wangqf
#date:20200830


if [ $# -lt 2 ];then
  echo "输入参数不合法，请重新输入"
  exit 1;
fi

echo "----------------------------------------------"
echo `date '+%Y-%m-%d %H:%M:%S'`" 打包程序执行开始！";
echo "原目录保留15天日志，开始打包15天天前一天日志";

#筛选打包日志文件的截止日期
currentDate=`date -d "15 days ago" +%Y%m%d`


#截至日期时间戳
currentTimeStamp=`date -d $currentDate +%s`
index=0

#日志读取路径
filePath=$1

#获取该路径下所有日志文件
fileList=`ls $filePath/$2.* -1 -c`

cd $filePath

#遍历所有日志文件
for fileName in $fileList
do
    filename1=$( echo $fileName|awk -F "/" '{print $NF}' )

    fileDate=$( echo $fileName|awk -F "." '{print  substr($2,1,8)}' )
    #将日期转换为时间戳
    fileDateTimeStamp=`date -d $fileDate +%s`

    #当时间戳值不为空且大于等于起始日期小于当前日期，那么获取该日志文件
    if [ $fileDateTimeStamp != "" ]  && [ $fileDateTimeStamp -lt $currentTimeStamp ]
    then
         /opt/ossutil64 cp ${filename1}  oss://microservice-qingdao/172.31.3.85-msa/
         #tar zcvf - ${filename1} | ssh 172.31.3.126 "cat > /nasdata/microlog_his/172.31.3.85/msa_701/${filename1}.tar.gz"
         #tar  --warning=no-file-changed -zcPf  /nas/microlog_his/172.31.3.129/msu_700/$filename1.tar.gz $filename1

         if [ $? = 0 ] || [ $? = 1 ]; then
         echo  "`date +"%Y-%m-%d %H:%M:%S"`  ${filename1}  backup end and sucess"
         echo -e '\n'
         #删除所有在日期范围内的日志文件
          rm -rf $fileName

         echo "删除已被打包压缩的日志文件"

        else
         echo  "`date +"%Y-%m-%d %H:%M:%S"`  ${filename1}   backup failed"
         fi
    fi
done


#echo "删除nas上100天前日志"
#find /nas/microlog_his/172.31.3.129/msu_700/midservice.*  -mtime +100 -exec rm -rf {} \;


echo `date '+%Y-%m-%d %H:%M:%S'`" 打包程序执行结束！";
echo "------------------------------------------------"