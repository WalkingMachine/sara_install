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
