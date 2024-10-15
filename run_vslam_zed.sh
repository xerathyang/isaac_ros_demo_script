#!/bin/bash

source ${ISAAC_ROS_WS}/install/setup.bash

tmux new-session -d -s yolosession
tmux send-keys -t yolosession 'ros2 launch isaac_ros_examples isaac_ros_examples.launch.py \
launch_fragments:=zed_stereo_rect,visual_slam \
base_frame:=zed2_camera_center camera_optical_frames:="['zed2_left_camera_optical_frame', 'zed2_right_camera_optical_frame']" \
interface_specs_file:=${ISAAC_ROS_WS}/isaac_ros_assets/isaac_ros_visual_slam/zed2_quickstart_interface_specs.json; tmux kill-session -t yolosession' C-m
tmux split-window -h -t yolosession
tmux send-keys -t yolosession 'rviz2 -d $(ros2 pkg prefix isaac_ros_visual_slam --share)/rviz/default.cfg.rviz; tmux kill-session -t yolosession' C-m
tmux attach -t yolosession
