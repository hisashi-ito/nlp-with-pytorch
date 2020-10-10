#! /bin/bash
#
#【launch】
#
IMAGE="nlp-pytorch"
CONTAINER="${IMAGE}-container"
CONTAINER_DIR="/work"
HOST_DIR=${HOME}/work
sudo docker run --name ${CONTAINER} -tid -v ${HOST_DIR}:${CONTAINER_DIR} ${IMAGE} /bin/bash
