# List of available functions.
## setup.sh
### description
This script will setup your environment to work with this workspace. Among other things, it create aliases for all the others scripts.
### List of aliases
1. INSTALL_SARA
2. UPDATE_SARA
3. STATUS_SARA
4. SOURCE_SARA_WORKSPACE
5. SCRAPE_SARA_CONFIG
6. CLEAR_SARA_WORKSPACE

### usage
1. ```source setup.sh``` source this workspace.
2. ```SOURCE_SARA_WORKSPACE``` same thing but using the alias.

## install.sh
### description
Install all basic dependencies and use ```wstool update```, ```rosdep init```, ```rosdep install``` and ```catkin_make``` to install all desired packages.
### usage
1. ```INSTALL_SARA``` Install all packages from the .rosinstall file.

## update.sh
### description
Use ```wstool update```, ```rosdep install``` and ```catkin_make``` to update all packages.
### usage
1. ```UPDATE_SARA``` Install all packages from the .rosinstall file.

## status.sh
### description
Use ```wstool info``` and ```wstool status``` to produce a summary of the changes in the workspace.
### usage
1. ```STATUS_SARA```

## scrape_config.sh
### description
Use ```wstool info``` and gawk to extract the current workspace configuration and overwrite the .rosinstall file.
### usage
1. ```SCRAPE_SARA_CONFIG```
List all installed repos at their current branches.
2. ```SCRAPE_SARA_CONFIG commit```
list all installed repos at their current commits. This effectively "lock" the configuration to a specific commit instead of a branch.

## clear_workspace.sh
### description
Delete all packages in the workspace.
### usage
1. ```CLEAR_SARA_WORKSPACE```
