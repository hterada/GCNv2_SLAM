#!/bin/bash

nvidia-docker run -it \
-v /home/terada/GCNv2/docker_share/:/docker_share \
-v /data1/dataset/:/dataset \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/.Xauthority:/root/.Xauthority \
--net host \
-e DISPLAY=${DISPLAY} \
gcn_v2:1.0 /bin/bash