# Sara install

### Repository of rosinstall and install script for easy installation
This install script will install all the necesary packages and script to run S.A.R.A.

## Table of content
1. [Recommended tools](#recommended-tools)
2. [Requirements](#requirements)
3. [Dedendency](#dependency-that-need-to-be-install-before)
4. [Install procedure](#step-to-install)
5. [Setup remote](#setup-remote)
6. [Troubleshooting](#troubleshooting)

## Recommended tools
1. atom
2. pycharm
3. clion

## Requirements
1. [Ubuntu 14.04 LTS](http://releases.ubuntu.com/trusty/ubuntu-14.04.4-server-amd64.iso)

## Dependency that need to be install before
1.  ``` sudo apt-get install git ```

## Step to install
1. Clone repo to your home ``` git clone https://github.com/WalkingMachine/sara_install.git ```
2. Run the install script ``` ./sara_install/script/sara_installer.bash```
3. Take a coffee break or a tea break its going to take a while.
4. See the remote_setup script.
5. Your are now ready to code.

## Setup Remote

Please check with the [remote_setup.md](https://github.com/WalkingMachine/sara_install/blob/master/remote_setup.md)

## Troubleshooting

* catkin_make not found
  1. Close the terminal and reopen it.
* Build error, finished before reaching [100%]
  1. cd ~/sara_ws
  2. catkin_make -DCATKIN_WHITELIST_PACKAGES="wm_arm_msgs"
  3. catkin_make -DCATKIN_WHITELIST_PACKAGES=""
