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
## Update all packages

# wstool init src
wstool status -t src


######################################
## End

# Move back to the original position
cd - > /dev/null


set +v
