#!/bin/bash

source ${ISAAC_ROS_WS}/install/setup.bash

tmux new-session -d -s yolosession
tmux send-keys -t yolosession 'ros2 launch isaac_ros_examples isaac_ros_examples.launch.py \
launch_fragments:=zed_mono_rect,unet \
engine_file_path:=${ISAAC_ROS_WS}/isaac_ros_assets/models/peoplesemsegnet/deployable_quantized_vanilla_unet_v2.0/1/model.plan input_binding_names:=['input_1:0'] output_binding_names:=['argmax_1'] network_output_type:='argmax' \
interface_specs_file:=${ISAAC_ROS_WS}/isaac_ros_assets/isaac_ros_unet/zed2_quickstart_interface_specs.json; tmux kill-session -t yolosession' C-m
tmux split-window -h -t yolosession
tmux send-keys -t yolosession 'rqt --perspective-file "${ISAAC_ROS_WS}/unet.perspective"; tmux kill-session -t yolosession' C-m
tmux attach -t yolosession
