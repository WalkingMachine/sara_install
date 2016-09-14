#!/bin/sh

# Adding source and key
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116

# To get the latest package lists
sudo apt update -y
sudo apt upgrade -y

# ROS installation
sudo apt install -y ros-indigo-desktop-full -y

# Install tools
sudo apt install git python-pip python-wstool -y

# Package installation
sudo apt install ros-indigo-openni2-launch ros-indigo-urg-node ros-indigo-xsens-driver \
ros-indigo-joystick-drivers ros-indigo-navigation ros-indigo-pocketsphinx ros-indigo-rosserial \
ros-indigo-roboteq-diagnostics ros-indigo-roboteq-msgs ros-indigo-smach \
ros-indigo-rtabmap-ros ros-indigo-gazebo-ros ros-indigo-slam-gmapping ros-indigo-map-laser \
ros-indigo-moveit-full ros-indigo-geographic-info \
ros-indigo-zbar-ros ros-indigo-dynamixel-motor couchdb python-rosinstall libyaml-dev \
ros-indigo-soem espeak -y


# Interface grafic couchapp
sudo pip install -U couchapp

# pyttsx
sudo pip install pyttsx

# workspace creation
mkdir -p ~/sara_ws
cd ~/sara_ws
wstool init src ~/sara_install/rosinstall/sara_full.rosinstall
wstool update -t src

echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
echo "source ~/sara_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc

# rosdep
sudo rosdep init
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro indigo -y

# catkin_make to build all the packages
catkin_make -DCATKIN_WHITELIST_PACKAGES="wm_arm_msgs"

catkin_make -DCATKIN_WHITELIST_PACKAGES="wm_arm_driver"

catkin_make -DCATKIN_WHITELIST_PACKAGES=""

catkin_make

#enable database online viewer
rosrun object_recognition_core push.sh

echo "Install Done"

