#!/bin/bash

set -e

R -e "remotes::install_github(      \
    c(                              \
        'rstudio/tinytex',          \
        'r-lib/cli',                \
        'r-lib/devtools',           \
        'r-hub/rhub',               \
        'jeksterslab/rProject',     \
        'jeksterslab/semmcci',      \
        'jeksterslab/betaDelta',    \
        'jeksterslab/betaSandwich', \
        'jeksterslab/betaNB',       \
        'jeksterslab/betaMC'        \
    )                               \
)"
