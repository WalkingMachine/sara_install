#!/bin/bash

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
echo "Your ROS distro is $ROS_DISTRO"

# Source ros
source "/opt/ros/$ROS_DISTRO/setup.bash"


######################################
## Installation

# Move to the workspace
cd "$WSDIR"

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


