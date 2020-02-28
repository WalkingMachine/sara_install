#!/bin/bash

######################################
## Preparation

# Get the workspace path
WSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Move to the workspace
cd "$WSDIR/src"


######################################
## Removal

for F in */; do
    if [ -z $( cat .rosinstall | gawk "/local-name:[ \t]*$F"' {print $2}') ]
    then
        echo "The repo \"$F\" is no longer needed. It will be deleted."
        rm -rf $F
    fi
done


######################################
## End

# Move back to the original position
cd - > /dev/null
