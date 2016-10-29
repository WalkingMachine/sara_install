#!/bin/bash
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_8.0.44-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_8.0.44-1_amd64.deb
sudo apt update
sudo apt install cuda
echo "export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}"
echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"\
echo "export LD_LIBRARY_PATH="/usr/lib/nvidia-367/"${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
