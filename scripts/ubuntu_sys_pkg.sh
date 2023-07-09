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

# personal apt packages
apt_install        \
    bat            \
    curl           \
    git            \
    less           \
    nnn            \
    openssh-server \
    parallel       \
    rsync          \
    tmux           \
    vim            \
    wget

# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin
rm -rf lazygit*

# pfetch
git clone https://github.com/dylanaraps/pfetch.git
install pfetch/pfetch /usr/local/bin/
ls -l /usr/local/bin/pfetch

# quarto
QUARTO_VERSION=$(curl -s "https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')
export QUARTO_VERSION
curl -Lo quarto.tar.gz "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"
mkdir -p /usr/local
tar -zxvf quarto.tar.gz -C /usr/local --strip-components=1
rm -rf quarto*

# pandoc
wget https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/install_pandoc.sh
bash install_pandoc.sh
rm -rf install_pandoc.sh
