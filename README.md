ijapesigan/rocker
================
Ivan Jacob Agaloos Pesigan
2023-07-07

<!-- README.md is generated from README.Rmd. Please edit that file -->

Ivan Jacob Agaloos Pesigan

<!-- badges: start -->

[![Docker and Apptainer Build and
Push](https://github.com/ijapesigan/docker-rocker/actions/workflows/docker-apptainer-build-push.yml/badge.svg)](https://github.com/ijapesigan/docker-rocker/actions/workflows/docker-apptainer-build-push.yml)
[![Docker and Apptainer Build and Push
(Weekly)](https://github.com/ijapesigan/docker-rocker/actions/workflows/docker-apptainer-build-push-weekly.yml/badge.svg)](https://github.com/ijapesigan/docker-rocker/actions/workflows/docker-apptainer-build-push-weekly.yml)
<!-- badges: end -->

## Description

Docker and Apptainer/Singularity containers for `R` projects based on
the [Rocker Project](https://rocker-project.org/).

## GitHub Actions

The `Docker and Apptainer Build and Push` GitHub actions workflow
performs the following:

- Builds the Docker image specified by the `Dockerfile`.
- Pushes the image to
  [DockerHub](https://hub.docker.com/repository/docker/ijapesigan/rocker/general)
  using the tags `latest` and
  `date and time of build (YEAR-MM-DD-HHMMSSMS)`.
- Builds the Singularity Image File (SIF) using Apptainer based on the
  Docker Hub image from the previous step.
- Creates a GitHub release named `sif-YEAR-MM-DD-HHMMSSMS`. Note that
  `sif-YEAR-MM-DD-HHMMSSMS.zip` contains the SIF.

## Docker Container

To launch `Rstudio Server`, run the following.

``` bash
docker run --rm -ti -e PASSWORD=yourpassword -p 127.0.0.1:8787:8787 ijapesigan/rocker
```

Open `http://localhost:8787` on your web browser to launch
`Rstudio Server`.

- username: rstudio
- password: yourpassword

## Apptainer Shell

Download and unzip `sif-YEAR-MM-DD-HHMMSSMS.zip` from the GitHub release
to extract `rocker.sif`.

``` bash
apptainer shell rocker.sif
```
