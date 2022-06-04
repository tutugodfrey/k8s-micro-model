#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub
if [ -z $IMAGE_NAME ]; then
    IMAGE_NAME=predictor
fi

if [ -z $IMAGE_TAG ]; then
    IMAGE_TAG=latest
fi

if [ -z $IMAGE_REPO ]; then
    IMAGE_REPO=tutug
fi

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath="$IMAGE_REPO/$IMAGE_NAME:$IMAGE_TAG"

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath
