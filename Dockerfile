FROM ijapesigan/dev:main

ENV S6_VERSION="v2.1.0.2"
ENV RSTUDIO_VERSION="2024.12.0+467"
ENV DEFAULT_USER="rstudio"

RUN /rocker_scripts/install_rstudio.sh

EXPOSE 8787
CMD ["/init"]

RUN /rocker_scripts/install_pandoc.sh

RUN /rocker_scripts/install_quarto.sh

# custom

ADD scripts /usr/src/local/src
RUN cd /usr/src/local/src     && \
    chmod 777 setup.sh        && \
    ./setup.sh                && \
    rm -rf /usr/src/local/src

ENV PATH="/opt/TinyTeX/bin/x86_64-linux:/opt/TinyTeX/bin/aarch64-linux:${PATH}"

# extra metadata
LABEL org.opencontainers.image.source="https://github.com/ijapesigan/docker-rocker" \
      org.opencontainers.image.authors="Ivan Jacob Agaloos Pesigan <ijapesigan@gmail.com>"
