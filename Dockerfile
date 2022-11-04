FROM rocker/tidyverse

# apt
RUN apt-get update -y && apt-get install -y \
        wget                                \
        parallel                            \
        vim                                 \
        nnn                                 \
        curl                                \
        less                                \
        bat                                 \
        rsync

ENV QUARTO_VERSION="1.1.251"
ENV QUARTO_PATH="/opt/bin/quarto/${QUARTO_VERSION}"
ENV TINYTEX_PATH="/opt/bin/x86_64-linux:${PATH}"
ENV PATH="${QUARTO_PATH}:${PATH}"
ENV PATH="${TINYTEX_PATH}:${PATH}"

# lazygit
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
RUN curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
RUN tar xf lazygit.tar.gz -C /usr/local/bin lazygit
RUN rm -rf lazygit.tar.gz

# quarto
RUN mkdir -p "${QUARTO_PATH}"
RUN curl -o quarto.tar.gz -L "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz"
RUN tar -zxvf quarto.tar.gz -C "${QUARTO_PATH}" --strip-components=1
RUN rm quarto.tar.gz

# install R packages
# development packages
RUN install2.r --error \
        covr           \
        devtools       \
        distro         \
        ggplot2        \
        knitr          \
        lintr          \
        magick         \
        microbenchmark \
        pdftools       \
        pkgdown        \
        ragg           \
        remotes        \
        rmarkdown      \
        rprojroot      \
        styler         \
        testthat       \
        tidyverse      \
        qpdf

RUN R -e "remotes::install_github( \
      c(                           \
        'rstudio/tinytex',         \
        'r-lib/cli',               \
        'r-lib/devtools',          \
        'r-hub/rhub'               \
      )                            \
    )"

RUN R -e "tinytex::install_tinytex( \
      bundle = 'TinyTeX-2',         \
      force = TRUE,                 \
      dir = '/opt'                  \
    )"

RUN R -e "remotes::install_github( \
      c(                           \
        'jeksterslab/rProject'     \
      )                            \
    )"

# author
MAINTAINER "Ivan Jacob Agaloos Pesigan <r.jeksterslab@gmail.com>"

# extra metadata
LABEL description="rocker container."
