#!/bin/bash


######################################
## Preparation

# Get the workspace path
WSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Getting the distros
UBUNTUDISTRO=$(lsb_release -cs)
echo "The Ubuntu distro is: $UBUNTUDISTRO"
case "$UBUNTUDISTRO" in
        xenial)
            ROSDISTRO=kinetic
            ;;

        bionic)
            ROSDISTRO=melodic
            ;;
        *)
            echo "$UBUNTUDISTRO is not supported, check the install scipt for info."
            exit 1
esac
echo "Your ROS distro is $ROSDISTRO"

# Source ros
source "/opt/ros/$ROSDISTRO/setup.bash"


######################################
## Installation

# Move to the workspace
cd "$WSDIR"

catkin_make
source devel/setup.bash


wstool init src
wstool -t src







######################################
## End

# Move back to the original position
cd - > /dev/null
