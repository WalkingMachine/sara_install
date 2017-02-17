#! /bin/bash

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup keus
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Install boostrap dependencies
sudo apt-get update
sudo apt-get install -y python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential

# Initializing rosdep
sudo rosdep init
rosdep update

# Create the ros directory
mkdir ~/ros_catkin_ws
cd ~/ros_catkin_ws

# Get the ros install
wget https://raw.githubusercontent.com/WalkingMachine/ros_install/master/ros_core.rosinstall

# pull down the repo
wstool init -j8 src ros_core.rosinstall

# Resolve the dependencies
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y

# Invoke catkin_make_isolated
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release

# Source the new workspace
source ~/ros_catkin_ws/install_isolated/setup.bash
