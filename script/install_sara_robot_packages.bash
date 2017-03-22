#!/bin/bash

#create sara workspace and enter
mkdir -p ~/sara_ws/src
cd ~/sara_ws

# download the rosinstall file 
wget https://raw.githubusercontent.com/WalkingMachine/ros_install/master/sara.rosinstall

# init the workspace
wstool init -j8 src sara.rosinstall

# rosdep
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y

catkin_make

echo "Please source the .bashrc file"
