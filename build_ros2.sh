#!/bin/bash

# loosely based on https://docs.ros.org/en/jazzy/Installation/Alternatives/macOS-Development-Setup.html

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $SCRIPT_DIR/enable_brew.sh

$SCRIPT_DIR/install_ros2_brew_dependencies.sh


python3 -m venv ~/ros2_env
source ~/ros2_env/bin/activate

python3 -m pip install --upgrade pip

$SCRIPT_DIR/install_ros2_pip_dependencies.sh

mkdir -p ~/ros2_jazzy/src
cd ~/ros2_jazzy
vcs import --input https://raw.githubusercontent.com/ros2/ros2/jazzy/ros2.repos src


cd ~/ros2_jazzy
colcon build --symlink-install
