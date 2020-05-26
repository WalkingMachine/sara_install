#!/bin/bash


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


# Move to the workspace
PREV_PWD=$(pwd)
cd "$WSDIR"


######################################
## Remove all packages

mv src/.rosinstall ./
# "safe" rm in 2 steps : first copy the content in the trash, then rm it
cp -alf build devel src ~/.local/share/Trash/ > /dev/null && rm -rf build/ devel/ src/ > /dev/null

mkdir src
mv .rosinstall src

######################################
## End

# Move back to the original position
cd $PREV_PWD > /dev/null
