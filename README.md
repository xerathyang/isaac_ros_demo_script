# isaac_ros_demo_script
Script to run NVIDIA Isaac ROS v3.1 Demo with Stereolabs ZED 2i on NVIDIA Jetson Orin Nano

(Stereolabs ZED 2 and other Jetson Orin developer board should also work, not tested)

For Isaac ROS installation, please see [document](https://nvidia-isaac-ros.github.io/)
(documents are modified frequently, please check the document for latest information)

## Test Environment

* NVIDIA Jetson Orin Nano
    * Jetpack 6.0GA
    * L4T 36.3.0
    * Ubuntu 22.04 LTS
    * Isaac ROS v3.1
    * ZED SDK 4.2
* StereoLabs ZED 2i

## How to prepare environment

* (Optional, do this outside Docker) Setting network for better performance, follow "Tune system-wide network settings" in [Autoware document](https://autowarefoundation.github.io/autoware-documentation/main/installation/additional-settings-for-developers/network-configuration/dds-settings/#tune-system-wide-network-settings)

* Follow documentation tutorial, build Isaac ROS Develop Docker with ZED support.

* After entering the docker environment, cloning this repository.
```
git clone https://github.com/xerathyang/isaac_ros_demo_script.git
```

* (Optional) Setting DDS implementation to CycloneDDS with some 
```
./isaac_ros_demo_script/set_cyclonedds.sh
```

* Install dependencies
```
./isaac_ros_demo_script/deps_zed.sh
```

## How to run demo
| Demo Name                 | Command                                                 |
| ------------------------- | ------------------------------------------------------- |
| AprilTag                  | ```./isaac_ros_demo_script/run_apriltag_zed.sh```       |
| Jetson Stats              | ```./isaac_ros_demo_script/run_jetson_status.sh```      |
| Object Detection (Yolov8) | ```./isaac_ros_demo_script/run_yolov8_zed.sh```         |
| Image Segmentation (Unet) | ```./isaac_ros_demo_script/run_unet_zed.sh```           |
| Visual SLAM               | ```./isaac_ros_demo_script/run_vslam_zed.sh```          |
| Nvblox                    | ```./isaac_ros_demo_script/run_nvblox_zed.sh```         |
