#!/bin/bash

set -e

# build

GIT_HUB_USERNAME=ijapesigan
GIT_HUB_REPO=docker-r2u
GIT_HUB_BRANCH=main
DOCKER_HUB_USERNAME=ijapesigan
DOCKER_HUB_CONTAINER=r2u

## container
TEMP_VAR=$(git ls-remote "https://github.com/$GIT_HUB_USERNAME/$GIT_HUB_REPO".git "$GIT_HUB_BRANCH")
echo "$TEMP_VAR" > /etc/profile.d/container_init.sh
awk '{print $1 > "/etc/profile.d/container_init.sh"}' /etc/profile.d/container_init.sh
CONTAINER_RELEASE=$(cat /etc/profile.d/container_init.sh)
echo "export CONTAINER_RELEASE=$CONTAINER_RELEASE" > /etc/profile.d/container_init.sh
CONTAINER_RELEASE_MSG="\"This release is based on commit $CONTAINER_RELEASE.\""
echo "export CONTAINER_RELEASE_MSG=$CONTAINER_RELEASE_MSG" >> /etc/profile.d/container_init.sh

{
  echo "export GIT_HUB_USERNAME=$GIT_HUB_USERNAME"
  echo "export GIT_HUB_REPO=$GIT_HUB_REPO"
  echo "export GIT_HUB_BRANCH=$GIT_HUB_BRANCH"
  echo "export DOCKER_HUB_USERNAME=$DOCKER_HUB_USERNAME"
  echo "export DOCKER_HUB_CONTAINER=$DOCKER_HUB_CONTAINER"
} >> /etc/profile.d/container_init.sh

## srv
mkdir -p /srv/build

## container
touch /srv/build/CONTAINER_RELEASE_MSG
touch /srv/build/CONTAINER_RELEASE
echo "$CONTAINER_RELEASE_MSG" > /srv/build/CONTAINER_RELEASE_MSG
sed -i s/\"//g /srv/build/CONTAINER_RELEASE_MSG
echo "$CONTAINER_RELEASE" > /srv/build/CONTAINER_RELEASE

## github
touch /srv/build/GIT_HUB_USERNAME
touch /srv/build/GIT_HUB_REPO
echo "$GIT_HUB_USERNAME" > /srv/build/GIT_HUB_USERNAME
echo "$GIT_HUB_REPO" > /srv/build/GIT_HUB_REPO

## docker
touch /srv/build/DOCKER_HUB_USERNAME
touch /srv/build/DOCKER_HUB_CONTAINER
echo "$DOCKER_HUB_USERNAME" > /srv/build/DOCKER_HUB_USERNAME
echo "$DOCKER_HUB_CONTAINER" > /srv/build/DOCKER_HUB_CONTAINER
