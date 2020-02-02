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
echo "*                 STARTING CATKIN_MAKE"
echo "********************************************************"
echo "*"
echo "*       This may take a while."
echo "*       Please stay close in case of error(s)."
echo "*"
echo "*                     - Catkin_make script"
echo "*                       $(date +(%B %Y))"
echo "*"
echo "********************************************************"
echo -e "\n\n"


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

# Make the workspace
catkin_make -DCMAKE_BUILD_TYPE=Release

######################################
## End

# Get the right setup for the shell
source $WSDIR/devel/setup.$SHELL_EXTENTION
# Move back to the original position
cd - > /dev/null


echo -e "\n\n"
echo "********************************************************"
echo "*                 CATKIN_MAKE COMPLETED"
echo "********************************************************"
echo "*"
echo "*  Please make sure there are no errors up there."
echo "*"
echo "********************************************************"
echo -e "\n\n"
