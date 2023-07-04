#!/bin/bash

set -e

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

# OpenMx system dependencies
#apt_install          \
#    build-essential  \
#    cmake            \
#    libopenblas-dev  \
#    liblapack-dev    \
#    libarpack2-dev   \
#    libsuperlu-dev   \
#    libgsl-dev       \
#    libarmadillo-dev \
#    libeigen3-dev

# curl
apt-get install -y   \
    libcurl4-openssl-dev

# openssl
apt-get install -y   \
    libssl-dev
