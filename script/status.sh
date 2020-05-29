#!/bin/bash

######################################
## Validation

if [[ $_ == $0 ]]
then
	>&2 echo "This script must be sourced. Use this command instead:"
	>&2 echo "	source $0"
	exit 0
fi

echo -e "\n\n"
echo "********************************************************"
echo "*                 STATUS REPORT"
echo "********************************************************"
echo "*"
echo "*    Using wstool info and wstool status."
echo "*"
echo "*                     - Status script"
echo "*                       $(date)"
echo "*"
echo "********************************************************"
echo -e "\n\n"

######################################
## Preparation

# Get the shell extention
SHELL_EXTENSION=$(ps -ocomm= -q $$)

# Get the workspace path
if [[ $SHELL_EXTENSION == "bash" ]]
then
    WSDIR=$(readlink -f $(dirname $(dirname "${BASH_SOURCE[0]}")))
elif [[ $SHELL_EXTENSION == "zsh" ]]
then
    WSDIR="$(dirname $(readlink -f ${0%/*}))";
else
    echo "This shell is not supported. Please use bash or zsh."
    exit -1 # Not permitted
fi


# Source the workspace
source "$WSDIR/script/setup.sh"

# Move to the workspace
cd "$WSDIR"

######################################
## Status report

echo "*********  wstool info  *****************"
echo "*"
echo "*    The Status (S) column shows"
echo "*      x  for missing"
echo "*      L  for uncommited (local) changes"
echo "*      V  for difference in version and/or remote URI"
echo "*      C  for difference in local and remote versions"
echo "*      M  for modified"
echo "*"
wstool info -s -t src --fetch -u 2>/dev/null | sed 's/^/*    /'
echo "*"
echo "*"
echo -e "*****************************************\n\n"

echo "*********  wstool status  ***************"
echo "*"
wstool status -t src -u 2>/dev/null | sed 's/^/*    /'
echo "*"
echo "*"
echo -e "*****************************************\n\n"
######################################

## End

# Move back to the original position
cd - > /dev/null
