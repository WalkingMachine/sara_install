#!/bin/bash


######################################
## Preparation

# Get the workspace path
WSDIR="${$(readlink -f ${0%/*})//\/script/}"

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
