FROM openanalytics/r-ver:4.1.3

LABEL maintainer="Tobias Verbeke <tobias.verbeke@openanalytics.eu>"

RUN apt-get update && apt-get install --no-install-recommends -y \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    && rm -rf /var/lib/apt/lists/*

# packages needed for basic shiny functionality
RUN R -q -e "install.packages(c('shiny', 'rmarkdown'))"

# install shinyproxy package with demo shiny application
COPY shinyproxy_0.0.1.tar.gz /root/
RUN R -q CMD INSTALL /root/shinyproxy_0.0.1.tar.gz
RUN rm /root/shinyproxy_0.0.1.tar.gz

# set host and port
COPY Rprofile.site /usr/local/lib/R/etc/

EXPOSE 3838

CMD ["R", "-q", "-e", "shinyproxy::run_01_hello()"]
