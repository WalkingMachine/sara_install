#!/bin/bash


######################################
## Validation

export ROS_DISTRO=""
WSDIR=""


######################################
## Preparation

# Get the workspace path
WSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."


# Getting the distros
UBUNTUDISTRO=$(lsb_release -cs)
echo "The Ubuntu distro is: $UBUNTUDISTRO"
case "$UBUNTUDISTRO" in
        xenial)
            ROS_DISTRO=kinetic
            ;;
        bionic)
            ROS_DISTRO=melodic
            ;;
        *)
            echo "$UBUNTUDISTRO is not supported, check the install scipt for info."
            exit 1
esac

# Source ros
source "/opt/ros/$ROS_DISTRO/setup.bash"


######################################
## Move to workspace

# Get the workspace path
WSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."
# Move to the workspace
cd "$WSDIR"


######################################
## Installation

# Install wstool
sudo apt install python-wstool

# Initialise rosdep database
sudo rosdep init

# wstool init src
wstool update -t src
rosdep update
rosdep install --from-paths src --ignore-src -r -y

# Make the workspace
catkin_make


######################################
## End

source devel/setup.bash
# Move back to the original position
cd - > /dev/null


echo "To automatically source this workspace, please add the following line to your ~/.bashrc"
echo "source $WSDIR/devel/setup.bash"
