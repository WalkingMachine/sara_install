#!/bin/bash


######################################
## Validation

if [[ $_ == $0 ]]
then
	>&2 echo "This script must be sourced. Use this command instead:"
	>&2 echo "	source $0"
	exit 0
fi

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


# Getting the distros
export ROS_DISTRO=""
UBUNTUDISTRO=$(lsb_release -cs)
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


######################################
## Alias preparation

alias INSTALL_SARA="source $WSDIR/script/install.sh"
alias UPDATE_SARA="source $WSDIR/script/update.sh"
alias STATUS_SARA="source $WSDIR/script/status.sh"
alias SOURCE_SARA_WORKSPACE="source $WSDIR/script/setup.sh"
alias SCRAPE_SARA_CONFIG="source $WSDIR/script/scrape_config.sh"
alias CLEAR_SARA_WORKSPACE="source $WSDIR/script/clear_workspace.sh"
alias EDIT_ROSINSTALL="editor $WSDIR/src/.rosinstall"
alias CATKIN_MAKE_SARA="source $WSDIR/script/catkin_make.sh"


######################################
## Source

# Source ros
source "/opt/ros/$ROS_DISTRO/setup.$SHELL_EXTENSION"

# Source workspace
if [ -f "$WSDIR/devel/setup.$SHELL_EXTENSION" ] ; then
    source "$WSDIR/devel/setup.$SHELL_EXTENSION"
fi
