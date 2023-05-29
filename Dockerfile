FROM rocker/rstudio

COPY scripts/setup.sh /opt/src/scripts/setup.sh
RUN /opt/src/scripts/setup.sh

ENV PATH="/opt/TinyTeX/bin/x86_64-linux:${PATH}"

# author
MAINTAINER "Ivan Jacob Agaloos Pesigan <learn.jeksterslab@gmail.com>"

# extra metadata
LABEL description="jeksterslab/rocker container."
