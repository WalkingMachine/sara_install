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
echo "*                 STARTING SCRAPING"
echo "********************************************************"
echo "*"
echo "*       Updating the .rosinstall file"
echo "*       to match your current config."
echo "*       Please stay close in case of error(s)."
echo "*"
echo "*                     - Scraping script"
echo "*                       $(date +(%B %Y))"
echo "*"
echo "********************************************************"
echo -e "\n\n"


######################################
## Preparation

# Get the workspace path
WSDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Move to the workspace
cd "$WSDIR"

######################################
## Scrape all packages using wstool and some gawk magics.

# Get the new list of packages.
wstool scrape -t src

# Extract the branch name and add it to the .rosinnstall file.
wstool info -t src --data-only > /tmp/sara_install_ws
gawk '/git/ {print "- "$2":\n local-name: "$1"\n uri: https://"$NF"\n version: "$3}' /tmp/sara_install_ws > src/.rosinstall
rm /tmp/sara_install_ws

######################################
## End

# Get the right setup for the shell
source $WSDIR/devel/setup.$SHELL_EXTENTION
# Move back to the original position
cd - > /dev/null


echo -e "\n\n"
echo "********************************************************"
echo "*                 SCRAPING COMPLETED"
echo "********************************************************"
echo "*"
echo "*  Please make sure there are no errors up there."
echo "*  You can check the .rosinstall file to be sure."
echo "*"
echo "*  Remember to commit your configuration."
echo "*"
echo "********************************************************"
echo -e "\n\n"
