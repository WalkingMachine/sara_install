#!/bin/bash
while getopts "sh" arg; do
  case $arg in
    s)
      # Switch to ssh
      sed "s/https:\/\/github\.com\/walkingmachine/git@github\.com\:WalkingMachine/g" src/.rosinstall  > /tmp/sara_install && mv /tmp/sara_install src/.rosinstall
      ;;
    h)
      # Switch to https
      sed "s/git@github\.com\:WalkingMachine/https:\/\/github\.com\/walkingmachine/g" src/.rosinstall  > /tmp/sara_install && mv /tmp/sara_install src/.rosinstall
      ;;
  esac
done
