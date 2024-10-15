#!/bin/bash

source ${ISAAC_ROS_WS}/install/setup.bash

tmux new-session -d -s yolosession
tmux send-keys -t yolosession 'ros2 launch isaac_ros_examples isaac_ros_examples.launch.py \
launch_fragments:=zed_mono_rect,yolov8 \
model_file_path:=${ISAAC_ROS_WS}/isaac_ros_assets/models/yolov8/yolov8s.onnx engine_file_path:=${ISAAC_ROS_WS}/isaac_ros_assets/models/yolov8/yolov8s.plan \
interface_specs_file:=${ISAAC_ROS_WS}/isaac_ros_assets/isaac_ros_yolov8/zed2_quickstart_interface_specs.json; tmux kill-session -t yolosession' C-m
tmux split-window -h -t yolosession
tmux send-keys -t yolosession 'rqt --perspective-file "${ISAAC_ROS_WS}/yolov8.perspective" & ros2 run isaac_ros_yolov8 isaac_ros_yolov8_visualizer.py; tmux kill-session -t yolosession' C-m
tmux attach -t yolosession
