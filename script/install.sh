#!/bin/bash

set -v

######################################
## Validation

if [[ $_ == $0 ]]
then
	>&2 echo "This script must be sourced. Use this command instead:"
	>&2 echo "	source $0"
	exit 0
fi


######################################
## Preparation

# Get the workspace path
WSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Source the workspace
source "$WSDIR/script/setup.sh"

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

# Get the right setup for the shell
source $WSDIR/devel/setup.$SHELL_EXTENTION

# Move back to the original position
cd - > /dev/null


echo "To automatically source this workspace, please add the following line to your ~/.$SHELL_EXTENTION""rc"
echo "    source $WSDIR/script/setup.sh"


set +v
