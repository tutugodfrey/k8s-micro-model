#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub
if [ -z $PORT ]; then
  PORT=8000
fi

if [ -z $IMAGE_NAME ]; then
    IMAGE_NAME=predictor
fi

if [ -z $IMAGE_TAG ]; then
    IMAGE_TAG=latest
fi

if [ -z $IMAGE_REPO ]; then
    IMAGE_REPO=tutug
fi

echo $IMAGE_NAME
echo $IMAGE_TAG

# Step 1:
# This is your Docker ID/path
dockerpath=$IMAGE_REPO/$IMAGE_NAME:$IMAGE_TAG
containername="boston-house-predictor"
# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment $containername --image=$dockerpath
# kubectl run boston-house-predictor --image=tutug/predictor:latest
# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward $containername $PORT:80
