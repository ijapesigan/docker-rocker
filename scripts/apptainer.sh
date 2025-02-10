#!/bin/bash

set -e

apt update
apt install -y software-properties-common

add-apt-repository -y ppa:apptainer/ppa
apt update
apt install -y apptainer

add-apt-repository -y ppa:apptainer/ppa
apt update
apt install -y apptainer-suid
