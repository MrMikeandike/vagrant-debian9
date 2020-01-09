#!/bin/bash
# script that installs ansible
# ----------------------------
# prereqs
# - git: needed for galaxy
# - dirmngr: needed to add apt-key
# - python & python-pip
# - python3 & python3-pip
# - ca-certificates
#----
# - update ca certificates to try and avoid ssl issues with galaxy
sudo apt update -y \
&& sudo apt install --upgrade -y git dirmngr software-properties-common python python-pip python3 python3-pip ca-certificates python-apt python3-apt \
&& sudo update-ca-certificates
# ---------------------------
# install ansible
sudo add-apt-repository 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' \
&& sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
&& sudo apt update -y \
&& sudo apt install -y ansible
