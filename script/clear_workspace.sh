#!/bin/bash


######################################
## Preparation

# Get the workspace path
WSDIR="${$(readlink -f ${0%/*})//\/script/}"

# Move to the workspace
cd "$WSDIR"


######################################
## Update all packages

rm -rf build devel src/!(.rosinstall|.|..)

######################################
## End

# Move back to the original position
cd - > /dev/null
