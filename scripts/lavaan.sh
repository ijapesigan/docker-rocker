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

R -e "library(lavaan)"

echo -e "\nInstall lavaan, done!"
