#!/bin/sh

# Adding source and key
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116

# To get the latest package lists
sudo apt-get update -y
sudo apt-get upgrade -y

# ROS installation
sudo apt-get install -y ros-indigo-desktop-full -y

# Install tools
sudo apt-get install git python-pip python-wstool -y

# Package installation
sudo apt-get install ros-indigo-openni2-launch ros-indigo-urg-node ros-indigo-xsens-driver \
ros-indigo-joystick-drivers ros-indigo-navigation ros-indigo-pocketsphinx ros-indigo-rosserial \
ros-indigo-roboteq-driver ros-indigo-roboteq-diagnostics ros-indigo-roboteq-msgs ros-indigo-smach \
ros-indigo-rtabmap-ros ros-indigo-gazebo-ros ros-indigo-slam-gmapping ros-indigo-map-laser \
ros-indigo-cob-perception-common ros-indigo-moveit-full ros-indigo-geographic-info \
ros-indigo-zbar-ros ros-indigo-dynamixel-motor couchdb python-rosinstall -y

# Interface grafic couchapp
pip install -U couchapp

# rosdep
sudo rosdep init
rosdep update

# workspace creation
mkdir -p ~/sara_ws
cd ~/sara_ws
wstool init src ~/sara_install/rosinstall/sara_full.rosinstall
wstool update -t src

echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bahsrc

rosdep update

