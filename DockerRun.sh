#/bin/bash

myimage=$1; # yyuzhong/myrimage:latest
myapp=$2;   # test.R
mydir=$3;   # /home/yzyan/dockerwf
args=$4;    # -i rdata/x.data -o output.data -p 100

subname=`echo $INPUT| cut -d':' -f 1` #find the main name yyuzhong/myrimage

if docker images | grep "$subname" > /dev/null
then
    echo "Image already exists"
else
    docker pull $myimage
fi

WORKDIR=$( cd $(dirname $0) ; pwd -P)

docker ps -a | grep myrdaemon | awk '{print $1}' | xargs docker stop
docker ps -a | grep myrdaemon | awk '{print $1}' | xargs docker rm

docker run --name myrdaemon -v "$mydir":/tmp/rstage -w /tmp/rstage --privileged=true "$myimage" Rscript $myapp $args


