#!/bin/bash


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
cd "$WSDIR"--install -DCMAKE_BUILD_TYPE=Release


######################################
## Update all packages

set -v
# wstool init src
wstool update -t src
rosdep update
rosdep install --from-paths src --ignore-src -r -y

# Make the workspace
catkin_make -DCMAKE_BUILD_TYPE=Release
set +v

######################################
## End

source devel/setup.bash
# Move back to the original position
cd - > /dev/null
