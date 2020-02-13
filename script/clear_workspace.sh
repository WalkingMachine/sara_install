#!/bin/bash


######################################
## Preparation

# Get the workspace path
WSDIR="${$(readlink -f ${0%/*})//\/script/}"

# Move to the workspace
cd "$WSDIR"


######################################
## Remove all packages

mv src/.rosinstall ./
# "safe" rm in 2 steps : first the content, then the empty folders
mv build/ devel/ src/ ~/.local/share/Trash/ > /dev/null
mv build/ devel/ src/ ~/.local/share/Trash/ > /dev/null

mkdir src
mv .rosinstall src

######################################
## End

# Move back to the original position
cd - > /dev/null
