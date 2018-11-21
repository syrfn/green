#!/bin/bash

if [ -z "$*" ]; then 
    echo "No args. Give image name!"
    echo "./build_run.sh [image_name]"
    exit 0
fi

#build image
docker build -t $1 .

#run image
docker run -it --rm -v $(pwd)/:/app $1

echo "Success!!"