#!/bin/bash

# Check to be sure the user is root
if [[ $EUID  -ne 0 ]]
  then
  echo "Please run as root"
  exit
fi


echo "S.A.R.A. Installation beginning"
# Init values
PROJECT_SARA_INSTALER_PATH=$PWD

# Adding source and key
echo "Adding source and key"
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
if [ $? -ne 0 ]; then
	echo "Adding source failed."
	exit
fi

# To get the latest package lists
echo "Getting latest package lists and upgrading system"
apt update -y
apt upgrade -y

# ROS installation
echo "Installing ROS"
apt install -y ros-indigo-desktop-full -y

# Install tools
echo "Installing tools"
apt install git python-pip python-wstool -y

# Package installation
echo "Installing package"
apt install ros-indigo-openni2-launch ros-indigo-urg-node ros-indigo-xsens-driver \
ros-indigo-joystick-drivers ros-indigo-navigation ros-indigo-pocketsphinx ros-indigo-rosserial \
ros-indigo-roboteq-diagnostics ros-indigo-roboteq-msgs ros-indigo-smach \
ros-indigo-rtabmap-ros ros-indigo-gazebo-ros ros-indigo-slam-gmapping ros-indigo-map-laser \
ros-indigo-moveit-full ros-indigo-geographic-info \
ros-indigo-zbar-ros ros-indigo-dynamixel-motor couchdb python-rosinstall libyaml-dev \
ros-indigo-soem espeak ros-indigo-object-recognition-core  ros-indigo-object-recognition-renderer -y

# Utility installation
echo "Installing Utility"
apt install htop lm-sensors tig

# Interface graphic couchapp
echo "Installing graphic for couchapp"
pip install -U couchapp

# pyttsx
echo "Installing pyttsx"
pip install pyttsx

# workspace creation
echo "Creating Workspace"
mkdir -p ~/sara_ws
cd ~/sara_ws
wstool init src "$PROJECT_SARA_INSTALER_PATH""/rosinstall/sara_full.rosinstall"
wstool update -t src
grep  'source /opt/ros/indigo/setup.bash' ~/.bashrc
if [ $? -ne 0 ]; then
	echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
fi
source ~/.bashrc

# rosdep
echo "ros dep"
rosdep init
sudo -H -u $SUDO_USER bash -c "rosdep update"
sudo -H -u $SUDO_USER bash -c "rosdep install --from-paths src --ignore-src --rosdistro indigo -y"
if [ $? -ne 0 ]; then
        echo "ros dep failed."
	exit
fi


# catkin_make to build all the packages
echo "Building packages"

sudo -H -u $SUDO_USER bash -c 'catkin_make -DCATKIN_WHITELIST_PACKAGES="wm_arm_msgs"'

sudo -H -u $SUDO_USER bash -c 'catkin_make -DCATKIN_WHITELIST_PACKAGES="wm_arm_driver"'

sudo -H -u $SUDO_USER bash -c 'catkin_make -DCATKIN_WHITELIST_PACKAGES=""'

sudo -H -u $SUDO_USER bash -c 'catkin_make'
if [ $? -ne 0 ]; then
        echo "building package failed."
        exit
else
	grep  'source ~/sara_ws/devel/setup.bash' ~/.bashrc
	if [ $? -ne 0 ]; then
		echo "source ~/sara_ws/devel/setup.bash" >> ~/.bashrc
		source ~/.bashrc
	fi
fi


#enable database online viewer
sudo -H -u $SUDO_USER bash -c 'rosrun object_recognition_core push.sh'
if [ $? -eq 0 ]; then
	echo "Continue with remote_setup.md"
	echo "Installation done go get a beer and code"
else
	echo "The Installation faild. Unable to use command: rosrun"
fi

chown -R $SUDO_USER ~/sara_ws
