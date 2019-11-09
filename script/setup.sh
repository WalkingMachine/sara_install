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
if [[ "$SHELL" == *bash* ]]; then
    SHELL_EXTENTION=bash
elif [[ "$SHELL" == *zsh* ]]; then
    SHELL_EXTENTION=zsh
else
    SHELL_EXTENTION=sh
fi

# Get the workspace path
WSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Getting the distros
export ROS_DISTRO=""
UBUNTUDISTRO=$(lsb_release -cs)
echo "The Ubuntu distro is: $UBUNTUDISTRO"
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

set -v

######################################
## Alias preparation

alias INSTALL_SARA="source $WSDIR/script/install.sh"
alias UPDATE_SARA="source $WSDIR/script/update.sh"
alias STATUS_SARA="source $WSDIR/script/status.sh"


set +v

######################################
## Source

# Source ros
source "/opt/ros/$ROS_DISTRO/setup.$SHELL_EXTENTION"

# Source workspace
if [ -f "$WSDIR/devel/setup.$SHELL_EXTENTION" ] ; then
    source "$WSDIR/devel/setup.$SHELL_EXTENTION"
fi
