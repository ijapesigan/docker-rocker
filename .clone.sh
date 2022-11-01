#! /usr/bin/bash

git clone git@github.com:jeksterslab/docker-rocker.git
rm -rf "$PWD.git"
mv docker-rocker/.git $PWD
rm -rf docker-rocker
