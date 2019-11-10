# Sara install

### Repository of rosinstall and install script for easy installation
This repo is an enveloppe containing a catkin workspace containing most tools needed to work with Sara.
Going from installation to environment configuration and code version control.
Note that this is a repo containing a workspace containing repos. This will affect the way you work with your repos.

## Table of content
1. [Recommended tools](#recommended-tools)
1. [Requirements](#requirements)
1. [.rosinstall](#rosinstall)
1. [Workspace versioning layout](#workspace-versioning-layout)
1. [src](#src)
1. [Main workflow](#main-workflow)
1. [Troubleshooting](#troubleshooting)

## Recommended tools
These tool are recommended by Walking Machine to work on Sara. Those are only mere recomendation. You are invited to use your prefered IDE (except visual studio. Yerk!).
1. atom
1. pycharm
1. clion

## Requirements
1. [Ubuntu 16.04 LTS](http://releases.ubuntu.com/16.04/)
1. Install [ROS Kinetic for Ubuntu](https://wiki.ros.org/kinetic/Installation/Ubuntu) by following all steps up to 1.7. The tutorials are good for learners but not needed for Sara.
1.  Install our version control system, git. ``` sudo apt-get install git ```

## .rosinstall
Sara_install make use of a tool called [wstool](https://wiki.ros.org/wstool). This piece of software use a configuration file named [.rosinstall](#src/.rosinstall) within wich we can define the list of packages we need to install. Depending on our needs, we can edit this file to change our configuration.

## src
The src directory is usually the place where all packages are cloned in a catkin workspace. Sara_install is no exception to this rule. The difference is that the packages within src are 

## Workspace versioning layout
This workspace is special since it is encapsuled within the sara_install git repo. This mean that it's configuration is versionnised and you can switch branches to change configuration. Thouhg, you need to keep in mind that the [src directory](#src) directory is purposely ignored by sara_install. [See .gitignore](#.gitignore). This is to les wstool be the main package manager and also maintain a retrocompatibility whith the old manual workflow. Each packages within src will not be touched by sara_install and remain their own individual git repositories.
![Versionning layout](https://raw.githubusercontent.com/WalkingMachine/sara_install/complete_rework/WorkspaceLayout.jpg "Versionning layout")


## Main workflow
### First complete installation
If you want to install every packages with their main branches.
1. Clone this repo anywhere ``` git clone https://github.com/WalkingMachine/sara_install.git ```
1. Run the install script ``` ./sara_install/script/install.sh``` and pay attention to the screen. There might be prompts for passwords and stuff.
1. Your are now ready to code.

### Installation for specific development
If you want to work on a specific new feature which require a specific set of packages.
1. Clone this repo anywhere ``` git clone https://github.com/WalkingMachine/sara_install.git ```
1. Create your development branch.``` git checkout -b config/my_awesome_feature_config ```
1. Modify the [.rosinstall file](#src/.rosinstall) to set the packages you need.
1. Run the install script ``` ./sara_install/script/install.sh``` and pay attention to the screen. There might be prompts for passwords and stuff.

### Make modifications
1. Edit code within the desired packages, create feature branches, commit your changes, push them.
   ``` cd src/my_package ```
   
   ``` editing ```
   
   ``` git commit edited_file ```
   
   ``` git push origin feature/my_awesome_feature ```
   
1. If you need to create a new branch on a package, make sure to also change the [.rosinstall file](#src/.rosinstall) accordingly to match the version/branch.
1. Use the status.sh script to see all modified packages.

### Update all packages
If you need to work with all the latest packages use the update.sh script.
   ``` source script/update.sh ```
   
## Troubleshooting

* catkin_make not found
  1. Close the terminal and reopen it.
* Build error, finished before reaching [100%]
  1. Look for indacation of missing packages. Install them if you can and create a issue mentionning the error on [the issue tracker](https://github.com/WalkingMachine/sara_install/issues).
