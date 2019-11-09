# Sara install

### Repository of rosinstall and install script for easy installation
This repo is an enveloppe containing a catkin workspace containing most tools needed to work with Sara.
Going from installation to environment configuration and code version control.
Note that this is a repo containing a workspace containing repos. This will affect tthe way you work with your repos.

## Table of content
1. [Recommended tools](#recommended-tools)
2. [Requirements](#requirements)
3. [Dedendency](#dependency-that-need-to-be-install-before)
4. [Install procedure](#step-to-install)
5. [Main workflow](#Main-workflow)
6. [Setup remote](#setup-remote)
7. [Troubleshooting](#troubleshooting)

## Recommended tools
These tool are recommended by Walking Machine to work on Sara. Those are only mere recomendation. You are invited to use your prefered IDE (except visual studio. Yerk!).
1. atom
2. pycharm
3. clion

## Requirements
1. [Ubuntu 16.04 LTS](http://releases.ubuntu.com/16.04/)
2. Install [ROS Kinetic for Ubuntu](https://wiki.ros.org/kinetic/Installation/Ubuntu) by following all steps up to 1.7. The tutorials are good for learners but not needed for Sara.
3.  Install our version control system, git. ``` sudo apt-get install git ```

## Step to install
1. Clone this repo anywhere ``` git clone https://github.com/WalkingMachine/sara_install.git ```
2. Run the install script ``` ./sara_install/script/install.sh``` and pay attention to the screen. There might be prompts for passwords and stuff.
5. Your are now ready to code.


## Main workflow

3. Edit code, commit, push
4.


## Setup Remote

Please check how to setup remote access to your roscore with the [remote_setup.md](https://github.com/WalkingMachine/sara_install/blob/master/remote_setup.md)

## Troubleshooting

* catkin_make not found
  1. Close the terminal and reopen it.
* Build error, finished before reaching [100%]
  1. Look for indacation of missing pacages. Install them if you can and create a issue mentionning the error on [the issue tracker](https://github.com/WalkingMachine/sara_install/issues).
