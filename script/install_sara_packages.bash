#!/bin/bash

#create sara workspace and enter in
mkdir -p  ~/sara_ws/src
cd ~/sara_ws

# download the rosinstall file
wget https://raw.githubusercontent.com/WalkingMachine/ros_install/master/desktop.rosinstall

# init the workspace
wstool init -j8 src sara.rosinstall

# rosdep
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro kinetic -y

catkin_make


# Create source entry in bashrc
echo "source ~/sara_ws/devel/setup.bash" >> ~/.bashrc

# Add ROS ip adress for communication with non local nodes
# Need to update IP adress in function of the network configuration
echo "#export ROS_IP=192.168.0.118" >> ~/.bashrc


echo "Please source the .bashrc file"
