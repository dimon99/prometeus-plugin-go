#!/bin/bash 

printf "Build/push container script"

REPO=$2

#tag=`git describe --abbrev=0 --tags | sed  's/^v//'`
tag=30
# $IMAGE_NAME var is injected into the build so the tag is correct.

#HUB
IMAGE_NAME="gcr.io/synthetic-diode-241509/custom-metric:$tag"
#ECR
#IMAGE_NAME="custom-metric:$tag"

case $1 in
    build)
  echo "Build the image: $tag \n"
  /usr/local/bin/docker build \
    --build-arg version="$tag" \
    --build-arg build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
    -t $IMAGE_NAME .
#ECR
#    /usr/local/bin/docker tag $IMAGE_NAME $REPO/$IMAGE_NAME
    ;;
   push)

#Dockerhub
  /usr/local/bin/docker push $IMAGE_NAME

#ERC
#   /usr/local/bin/docker push $REPO/$IMAGE_NAME

   ;;

esac