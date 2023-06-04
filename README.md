# jeksterslab/rocker

Ivan Jacob Agaloos Pesigan

<!-- badges: start -->
[![Docker Build and Push Weekly](https://github.com/jeksterslab/docker-rocker/actions/workflows/docker-build-push-weekly.yml/badge.svg)](https://github.com/jeksterslab/docker-rocker/actions/workflows/docker-build-push-weekly.yml)
<!-- badges: end -->

## Description

A Docker container for `R` projects based on the [Rocker Project](https://rocker-project.org/).

## Run

To launch `Rstudio Server`, run the following.

```bash
docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 jeksterslab/rocker
```

Open `http://localhost:8787` on your web browser to launch `Rstudio Server`.

- username: rstudio
- password: yourpassword
