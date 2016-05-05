FROM openanalytics/r-base

MAINTAINER Tobias Verbeke "tobias.verbeke@openanalytics.eu"

RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.0.0

# packages needed for basic shiny functionality
RUN R -e "install.packages(c('shiny', 'rmarkdown'), repos='https://cloud.r-project.org')"

# install shinyproxy package with demo shiny application
COPY shinyproxy /root/
RUN R CMD build /root/shinyproxy
RUN R CMD INSTALL /root/shinyproxy_*.tar.gz
RUN rm -fR /root/shinyproxy 

# set host and port
COPY Rprofile.site /usr/lib/R/etc/

EXPOSE 3838

CMD ["R", "-e shinyproxy::run_01_hello()"]
