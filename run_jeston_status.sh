#!/bin/bash

source ${ISAAC_ROS_WS}/install/setup.bash

tmux new-session -d -s yolosession
tmux send-keys -t yolosession 'ros2 launch isaac_ros_jetson_stats jtop.launch.py; tmux kill-session -t yolosession' C-m
tmux split-window -h -t yolosession
tmux send-keys -t yolosession 'rqt --perspective-file "${ISAAC_ROS_WS}/jetson_status.perspective"; tmux kill-session -t yolosession' C-m
tmux attach -t yolosession
