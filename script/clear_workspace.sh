#!/bin/bash


######################################
## Preparation

# Get the workspace path
WSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Move to the workspace
cd "$WSDIR"


######################################
## Update all packages

rm -rf src/!(.rosinstall|.|..)

######################################
## End

# Move back to the original position
cd - > /dev/null
