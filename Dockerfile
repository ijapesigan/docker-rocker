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

# lazygit
RUN export LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/') ;\
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" ;\
        tar xf lazygit.tar.gz -C /usr/local/bin lazygit ;\
        rm lazygit.tar.gz

# quarto
RUN export QUARTO_VERSION=$(curl -s "https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/') ;\
        curl -Lo quarto.tar.gz "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz" ;\
        tar xf quarto.tar.gz -C /usr/local/bin quarto ;\
        rm quarto.tar.gz

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
      force = TRUE
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
