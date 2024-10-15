#!/bin/bash

source ${ISAAC_ROS_WS}/install/setup.bash

ros2 launch nvblox_examples_bringup zed_example.launch.py \
camera:=zed2
