FROM ijapesigan/dev:main

# rstudio
# based on https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/dockerfiles/rstudio_latest-daily.Dockerfile

ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=daily
ENV DEFAULT_USER=rstudio
ENV PANDOC_VERSION=default
ENV QUARTO_VERSION=default

RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh
RUN /rocker_scripts/install_quarto.sh

# custom

ADD scripts /usr/src/local/src
RUN cd /usr/src/local/src     && \
    chmod 777 setup.sh        && \
    ./setup.sh                && \
    rm -rf /usr/src/local/src

ENV PATH="/opt/TinyTeX/bin/x86_64-linux:${PATH}"

# extra metadata
LABEL org.opencontainers.image.source="https://github.com/ijapesigan/docker-rocker" \
      org.opencontainers.image.authors="Ivan Jacob Agaloos Pesigan <ijapesigan@gmail.com>"

# port

EXPOSE 8787

CMD ["/init"]
