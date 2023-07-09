#!/bin/bash

git clone git@github.com:ijapesigan/docker-r2u.git
rm -rf "$PWD.git"
mv docker-r2u/.git "$PWD"
rm -rf docker-r2u
