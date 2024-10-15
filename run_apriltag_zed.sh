#!/bin/bash

source ${ISAAC_ROS_WS}/install/setup.bash

tmux new-session -d -s yolosession
tmux send-keys -t yolosession 'ros2 launch isaac_ros_examples isaac_ros_examples.launch.py launch_fragments:=zed_mono_rect,apriltag \
interface_specs_file:=${ISAAC_ROS_WS}/isaac_ros_assets/isaac_ros_apriltag/zed2_quickstart_interface_specs.json size:=0.15; tmux kill-session -t yolosession' C-m
tmux split-window -h -t yolosession
tmux send-keys -t yolosession 'rviz2 -d ${ISAAC_ROS_WS}/apriltag_demo.rviz; tmux kill-session -t yolosession' C-m
tmux attach -t yolosession
