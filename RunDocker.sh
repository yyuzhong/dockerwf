#/bin/bash

if [ "$#" -lt 4 ]; then
    echo "Usage: $0 imagename workdir script argumeents" >&2
    exit 1
fi

myimage=$1; # yyuzhong/myrimage:latest
mydir=$2;   # /home/yzyan/dockerwf
myapp=$3;   # test.R
myargs=${@:4};    # -i rdata/x.data -o output.data -p 100
workspace="/tmp/rstage/"

subname=`echo $myimage| cut -d':' -f 1` #find the main name yyuzhong/myrimage

if docker images | grep "$subname" > /dev/null
then
    echo "Image already exists"
else
    docker pull $myimage
fi

WORKDIR=$( cd $(dirname $0) ; pwd -P)

docker ps -a | grep myrwidget | awk '{print $1}' | xargs docker stop
docker ps -a | grep myrwidget | awk '{print $1}' | xargs docker rm

myscript="$workspace$myapp"

docker run --name myrwidget -v $mydir:$workspace -w $workspace --privileged=true "$myimage" Rscript $myscript $myargs


