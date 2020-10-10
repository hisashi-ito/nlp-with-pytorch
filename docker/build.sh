#! /bin/sh
IMAGE_NAME="nlp-pytorch"
sudo docker build -t ${IMAGE_NAME} -f ./Dockerfile .
