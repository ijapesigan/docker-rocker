
<!-- README.md is generated from .setup/readme/README.Rmd, which rProject's
docker template writes. Edit .setup/readme/description.md, scripts/cran.txt,
scripts/github.txt, or .setup/scripts/project.R instead. -->

# ijapesigan/rocker

<!-- badges: start -->

[![Docker Build and Push Rocker \[multi\]
(Daily)](https://github.com/ijapesigan/docker-rocker/actions/workflows/docker-build-push-daily-multi-rocker.yml/badge.svg)](https://github.com/ijapesigan/docker-rocker/actions/workflows/docker-build-push-daily-multi-rocker.yml)
[![Docker Build and Push
\[multi\]](https://github.com/ijapesigan/docker-rocker/actions/workflows/docker-build-push-multi.yml/badge.svg)](https://github.com/ijapesigan/docker-rocker/actions/workflows/docker-build-push-multi.yml)
[![Make
Project](https://github.com/ijapesigan/docker-rocker/actions/workflows/make.yml/badge.svg)](https://github.com/ijapesigan/docker-rocker/actions/workflows/make.yml)
[![Non-ASCII
Check](https://github.com/ijapesigan/docker-rocker/actions/workflows/non-ascii-check.yml/badge.svg)](https://github.com/ijapesigan/docker-rocker/actions/workflows/non-ascii-check.yml)
[![Shell
Check](https://github.com/ijapesigan/docker-rocker/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/ijapesigan/docker-rocker/actions/workflows/shellcheck.yml)
<!-- badges: end -->

## Description

An R image for projects based on the [Rocker
Project](https://rocker-project.org/), built on `ijapesigan/dev`
(rebuilt after it every day), with rProject, TinyTeX, an unprivileged
[Apptainer](https://apptainer.org/), and
[uv](https://docs.astral.sh/uv/).

Based on `ijapesigan/dev:latest`; built for linux/amd64 and linux/arm64.
Source: <https://github.com/ijapesigan/docker-rocker>.

## Use

Docker (Docker Hub or the GitHub Container Registry):

``` bash
docker run -it ijapesigan/rocker
docker run -it ghcr.io/ijapesigan/rocker
```

Apptainer:

``` bash
apptainer pull rocker.sif docker://ijapesigan/rocker
apptainer shell rocker.sif
```

## Builds

- Docker Build and Push Rocker \[multi\] (Daily)
  (`docker-build-push-daily-multi-rocker.yml`): when the base image is
  rebuilt
- Docker Build and Push \[multi\] (`docker-build-push-multi.yml`): after
  Make Project
- Make Project (`make.yml`): on push
- Non-ASCII Check (`non-ascii-check.yml`): after Make Project
- Shell Check (`shellcheck.yml`): after Make Project

The images are pushed to Docker Hub and the GitHub Container Registry as
`ijapesigan/rocker:latest`.
