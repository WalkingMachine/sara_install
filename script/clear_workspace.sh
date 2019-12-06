#!/bin/bash


######################################
## Preparation

# Get the workspace path
WSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Move to the workspace
cd "$WSDIR"--install -DCMAKE_BUILD_TYPE=Release


######################################
## Update all packages


rm -rf src/!(src)

######################################
## End

# Move back to the original position
cd - > /dev/null
