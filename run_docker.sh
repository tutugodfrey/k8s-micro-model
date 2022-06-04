#!/usr/bin/env bash

## Complete the following steps to get Docker running locally
if [ -z $IMAGE_NAME ]; then
    IMAGE_NAME=predictor
fi

if [ -z $IMAGE_TAG ]; then
    IMAGE_TAG=latest
fi

if [ -z $IMAGE_REPO ]; then
    IMAGE_REPO=tutug
fi

if [ -z $CONTAINER_NAME ]; then
 export CONTAINER_NAME=boston-house-app
fi

if [ -z $CONTAINER_PORT ]; then
    CONTAINER_PORT=8000
fi

if [ -z $IMAGE_PORT ]; then
    IMAGE_PORT=80       # This is the PORT export in the docker image (default 80)
fi

# Step 1:
# Build image and add a descriptive tag
docker build -t $IMAGE_REPO/$IMAGE_NAME:$IMAGE_TAG .

# Step 2: 
# List docker images
docker images

# Step 3: 
# Run flask app
docker rm -f $CONTAINER_NAME
docker run -d --name $CONTAINER_NAME -p $CONTAINER_PORT:$IMAGE_PORT $IMAGE_REPO/$IMAGE_NAME:$IMAGE_TAG
