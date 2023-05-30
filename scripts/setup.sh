#!/bin/bash

# based on https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/install_tidyverse.sh

set -e

## build ARGs
NCPUS=${NCPUS:--1}

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

apt_install                    \
    libxml2-dev                \
    libcairo2-dev              \
    libgit2-dev                \
    default-libmysqlclient-dev \
    libpq-dev                  \
    libsasl2-dev               \
    libsqlite3-dev             \
    libssh2-1-dev              \
    libxtst6                   \
    libcurl4-openssl-dev       \
    libharfbuzz-dev            \
    libfribidi-dev             \
    libfreetype6-dev           \
    libpng-dev                 \
    libtiff5-dev               \
    libjpeg-dev                \
    unixodbc-dev

# personal apt packages
apt_install        \
    wget           \
    parallel       \
    vim            \
    nnn            \
    curl           \
    less           \
    bat            \
    rsync          \
    openssh-server \
    neofetch

install2.r --error --skipinstalled -n "$NCPUS" \
    tidyverse   \
    devtools    \
    rmarkdown   \
    BiocManager \
    vroom       \
    gert

# development packages and cran packages
install2.r --error --skipinstalled -n "$NCPUS" \
    covr           \
    devtools       \
    distro         \
    ggplot2        \
    knitr          \
    lintr          \
    magick         \
    microbenchmark \
    pdftools       \
    pkgdown        \
    ragg           \
    remotes        \
    rmarkdown      \
    rprojroot      \
    styler         \
    testthat       \
    tidyverse      \
    qpdf           \
    semmcci        \
    betaDelta      \
    betaSandwich   \
    betaNB         \
    betaMC

## dplyr database backends
install2.r --error --skipmissing --skipinstalled -n "$NCPUS" \
    arrow        \
    dbplyr       \
    DBI          \
    dtplyr       \
    duckdb       \
    nycflights13 \
    Lahman       \
    RMariaDB     \
    RPostgres    \
    RSQLite      \
    fst

## a bridge to far? -- brings in another 60 packages
# install2.r --error --skipinstalled -n "$NCPUS" tidymodels

# development packages from GitHub
R -e "remotes::install_github(  \
    c(                          \
        'rstudio/tinytex',      \
        'r-lib/cli',            \
        'r-lib/devtools',       \
        'r-hub/rhub'            \
    )                           \
)"
R -e "remotes::install_github(      \
    c(                              \
        'jeksterslab/rProject',     \
        'jeksterslab/semmcci',      \
        'jeksterslab/betaDelta',    \
        'jeksterslab/betaSandwich', \
        'jeksterslab/betaNB',       \
        'jeksterslab/betaMC'        \
    )                               \
)"
R -e "tinytex::install_tinytex( \
    bundle = 'TinyTeX-2',       \
    force = TRUE,               \
    dir =  '/opt/TinyTeX'       \
)"

# Clean up
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/downloaded_packages

## Strip binary installed libraries from RSPM
## https://github.com/rocker-org/rocker-versioned2/issues/340
strip /usr/local/lib/R/site-library/*/libs/*.so

# working directory folder
mkdir -p /home/rstudio/working-dir
cd /home/rstudio/working-dir
wget https://raw.githubusercontent.com/jeksterslab/template/main/project.Rproj
chmod -R 0775 /home/rstudio/working-dir
echo "session-default-working-dir=/home/rstudio/working-dir" >> /etc/rstudio/rsession.conf

# project folder
mkdir -p /home/rstudio/project
chmod -R 0775 /home/rstudio/project
echo "session-default-new-project-dir=/home/rstudio/project" >> /etc/rstudio/rsession.conf

# Installation information
echo -e "Session information...\n"
R -q -e "sessionInfo()"
echo -e "Installed packages...\n"
R -q -e "unname(installed.packages()[, 1])"