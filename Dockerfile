FROM rocker/rstudio

COPY scripts/setup.sh /opt/setup.sh
RUN /opt/setup.sh

ENV PATH="/opt/TinyTeX/bin/x86_64-linux:${PATH}"

# author
MAINTAINER "Ivan Jacob Agaloos Pesigan <learn.jeksterslab@gmail.com>"

# extra metadata
LABEL description="jeksterslab/rocker container."
