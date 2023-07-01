#!/bin/bash

# based on https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/install_tidyverse.sh

set -e

## tidyverse
install2.r --error --skipinstalled -n -1 \
    tidyverse   \
    devtools    \
    rmarkdown   \
    BiocManager \
    vroom       \
    gert

## dplyr database backends
install2.r --error --skipinstalled -n -1 \
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
install2.r --error --skipinstalled -n -1 \
    tidymodels

## development packages and cran packages
install2.r --error --skipinstalled -n -1 \
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
    printr         \
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

# vscode project dependencies
install2.r --error --skipinstalled -n -1 \
  languageserver \
  httpgd         \
  styler         \
  lintr
