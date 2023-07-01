#!/bin/bash

set -e

## lavaan dependencies
install2.r --error --skipinstalled -n -1 \
    MASS     \
    mnormt   \
    pbivnorm \
    numDeriv \
    quadprog

## lavaan
install2.r --error --skipinstalled -n -1 \
    lavaan

R -e "                          \
  data(                         \
    'PoliticalDemocracy',       \
    package = 'lavaan'          \
  );                            \
  myModel <- '                  \
   # latent variables           \
     ind60 =~ x1 + x2 + x3      \
     dem60 =~ y1 + y2 + y3 + y4 \
     dem65 =~ y5 + y6 + y7 + y8 \
   # regressions                \
     dem60 ~ ind60              \
     dem65 ~ ind60 + dem60      \
   # residual covariances       \
     y1 ~~ y5                   \
     y2 ~~ y4 + y6              \
     y3 ~~ y7                   \
     y4 ~~ y8                   \
     y6 ~~ y8                   \
  ';                            \
  fit <- lavaan::sem(           \
    model = myModel,            \
    data  = PoliticalDemocracy  \
  );                            \
  lavaan::summary(fit)          \
"

echo -e "\nInstall lavaan, done!"
