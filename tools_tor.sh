#!/bin/sh
echo Prepare tools

sudo apt update
sudo apt upgrade
sudo apt install -y build-essential
sudo apt-get install -y python
sudo apt-get install -y autoconf autogen
sudo apt install -y libtool-bin
sudo apt-get install -y autopoint
