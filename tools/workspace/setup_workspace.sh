#! /usr/bin/bash

echo -e "Setting up your workspace for Queen's Aerospace Design Team. This may take a moment...\n"
ws_dir=~/ws
qadt_dir=~/ws/qadt

cd $ws_dir
sudo apt-get update
sudo apt install gnome-terminal