#!/bin/bash
echo     '###########################################################'
read -p "Enter the images name and tag you want build(<name>:<tag>): " IMAGE
echo 	 'Starting build image' ${IMAGE}
docker build -t ${IMAGE} .
