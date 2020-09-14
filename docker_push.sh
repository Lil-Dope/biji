#/bin/bash

images_list=`cat /data/docker/images_list.txt`

for i in in ${images_list[@]};

do
  docker push $i
done
