jeksterslab/template-rocker
===========================
Ivan Jacob Agaloos Pesigan

<!-- badges: start -->
[![Docker Build and Push](https://github.com/jeksterslab/docker-template-rocker/actions/workflows/docker-build-push.yml/badge.svg)](https://github.com/jeksterslab/docker-template-rocker/actions/workflows/docker-build-push.yml)
<!-- badges: end -->

## Description

A `rocker/rstudio` container for the `template` project.

## Build Docker Container

The `Docker Build and Push` Github action builds the Docker container and pushes it to Docker Hub.

## Build Apptainer/Singularity Image File

To build the Apptainer/Singularity image file (`template-rocker.sif`),
run the following.

```bash
git clone https://github.com/jeksterslab/docker-template-rocker.git
cd docker-template-rocker
make
```

## Docker Run

To launch `Rstudio Server`, run the following.

```bash
docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 jeksterslab/template-rocker
```

Open `http://localhost:8787` on your web browser to launch `Rstudio Server`.

- username: rstudio
- password: yourpassword

## Apptainer Shell

```bash
apptainer shell template-rocker.sif
```
