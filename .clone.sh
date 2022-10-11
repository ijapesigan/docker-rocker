#! /usr/bin/bash

git clone git@github.com:jeksterslab/docker-template-rocker.git
rm -rf "$PWD.git"
mv docker-template-rocker/.git $PWD
rm -rf docker-template-rocker
