#!/bin/bash

mkdir -p  ~/sara_ws/src

# download the rosinstall file
wget https://raw.githubusercontent.com/WalkingMachine/ros_install/master/sara.rosinstall

# init the workspace
wstool init -j8 src sara.rosinstall

# rosdep
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y

cd ~/sara_ws
catkin_make

echo "Please source the .bashrc file"
