# Sara install

### Repository of rosinstall and install script for easy installation
This install script will install all the necesary packages and script to run S.A.R.A.

## Table of content
1. [Recommended tools](#recommended-tools)
2. [Requirements](#requirements)
3. [Dedendency](#dependency-that-need-to-be-install-before)
4. [Install procedure](#step-to-install)
5. [Setup remote](#setup-remote)
6. [Troubleshooting](#troubleshooting)

## Recommended tools
1. atom
2. pycharm
3. clion

## Requirements
1. [Ubuntu 14.04 LTS](http://releases.ubuntu.com/trusty/ubuntu-14.04.4-server-amd64.iso)

## Dependency that need to be install before
1.  ``` sudo apt-get install git ```

## Step to install (ROBOT)
1. Clone this repo to the root of the user ```git clone https://github.com/WalkingMachine/sara_install.git```
2. Run the script to install the ros packages ```./script/install_ros_packages.bash```
3. Add ``` source /opt/ros/kinetic/setup.bash``` to the bashrc
4. Run the script to install the robot packages ```./script/install_sara_robot_packages.bash```
5. Add ``` source ~/sara_ws/devel/setup.bash```

## Step to install (DESKTOP)
1. Clone this repo to the root of the user ```git clone https://github.com/WalkingMachine/sara_install.git```
2. Run the script to install the ros packages ```./script/install_ros_packages.bash```
3. Add ``` source /opt/ros/kinetic/setup.bash``` to the bashrc
4. Run the script to install the desktop packages ```./script/install_sara_packages.bash```\
5. Add ``` source ~/sara_ws/devel/setup/bash```

## Setup Remote

Please check with the [remote_setup.md](https://github.com/WalkingMachine/sara_install/blob/master/remote_setup.md)

## Troubleshooting

* catkin_make not found
  1. Close the terminal and reopen it.
* Build error, finished before reaching [100%]
  1. cd ~/sara_ws
  2. catkin_make -DCATKIN_WHITELIST_PACKAGES="wm_arm_msgs"
  3. catkin_make -DCATKIN_WHITELIST_PACKAGES=""
