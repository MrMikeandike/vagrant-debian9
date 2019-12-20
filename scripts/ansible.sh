#!/bin/bash
# script that installs ansible
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
&& sudo apt update \
&& sudo apt install ansible
