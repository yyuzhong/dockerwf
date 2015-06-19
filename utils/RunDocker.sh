#/bin/bash

if [ "$#" -lt 4 ]; then
    echo "Usage: $0 imagename workdir script arguments" >&2
    exit 1
fi

myimage=$1; # yyuzhong/xxxx:latest
mydir=$2;   # /home/yzyan/dockerwf
myapp=$3;   # test.R
myargs=${@:4};    # -i rdata/x.data -o output.data -p 100
workspace="/tmp/rstage/"
scriptdir="/home/workspace/rscript/"

subname=`echo $myimage| cut -d':' -f 1` #find the main name yyuzhong/xxxx

if docker images | grep "$subname" > /dev/null
then
    echo "Image already exists"
else
    docker pull $myimage
fi

WORKDIR=$( cd $(dirname $0) ; pwd -P)

NEW_UUID=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
myrwidget=$(echo $NEW_UUID | cut -c 1-8)
echo $myrwidget

#docker ps -a | grep myrwidget | awk '{print $1}' | xargs docker stop
#docker ps -a | grep myrwidget | awk '{print $1}' | xargs docker rm

myscript="$scriptdir$myapp"

docker run --name $myrwidget -v $mydir:$workspace -w $workspace --privileged=true "$myimage" Rscript $myscript $myargs

docker ps -a | grep $myrwidget | awk '{print $1}' | xargs docker stop
docker ps -a | grep $myrwidget | awk '{print $1}' | xargs docker rm

