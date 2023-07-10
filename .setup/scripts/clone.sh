#!/bin/bash

git clone git@github.com:ijapesigan/docker-rocker.git
rm -rf "$PWD.git"
mv docker-rocker/.git "$PWD"
rm -rf docker-rocker
