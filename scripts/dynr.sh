#!/bin/bash

set -e

# dynr dependencies
install2.r --error --skipinstalled -n -1 \
  car            \
  deSolve        \
  devtools       \
  fda            \
  fds            \
  ggplot2        \
  knitr          \
  languageserver \
  latex2exp      \
  magrittr       \
  MASS           \
  Matrix         \
  mice           \
  numDeriv       \
  plyr           \
  Rcpp           \
  RcppArmadillo  \
  RcppGSL        \
  Rdpack         \
  remotes        \
  reshape2       \
  rmarkdown      \
  Ryacas         \
  stringi        \
  testthat       \
  tibble         \
  tinytex        \
  xtable

# autoVAR dependencies
install2.r --error --skipinstalled -n -1 \
  qgraph \
  igraph \
  fclust

# dynr
git clone https://github.com/mhunter1/dynr.git
cd dynr
./configure
make clean install
cd ..
rm -rf dynr

R -e "demo('LinearSDE', package = 'dynr')"
rm LinearSDE.*
rm Rplots.pdf
echo -e "\nInstall dynr, done!"
