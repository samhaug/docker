#!/bin/bash
# Written by: samhaug
# 2022 Jan 13 03:39:42 PM

docker build --build-arg myuser=$(whoami) -t centos:dev -f Dockerfile .


