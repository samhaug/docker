#!/bin/bash
# Written by: samhaug
# 2022 Jan 13 03:39:42 PM

docker run -it --rm \
     -e HOME=${HOME} \
     -v "${HOME}:${HOME}" \
     -v /etc/group:/etc/group:ro \
     -v /etc/passwd:/etc/passwd:ro \
     --security-opt seccomp=unconfined \
     -e DISPLAY=${DISPLAY} \
     -v /tmp/.X11-unix:/tmp/.X11-unix \
     -u $(id -u ${USER}):$(id -g ${USER}) \
     -h centosdev \
     centos:dev

