FROM r-base:latest

EXPOSE 80
WORKDIR /app

RUN apt-get update && \
  apt-get install -y lynx libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev libwebp-dev libharfbuzz-dev libfribidi-dev  libfontconfig1-dev libuv1-dev libcurl4-openssl-dev libssl-dev libssh2-1-dev libxml2-dev zlib1g-dev && \
  R -e "install.packages(c('devtools', 'testthat', 'roxygen2', 'DT', 'shinydashboard', 'shinydashboardPlus', 'tidyverse'))"
COPY . .
RUN R -e "pak::local_install()"
RUN R -e "library(murderParty) ; creer_serveur_habemus('habemus'); creer_server_dieu('dieu')"
ENTRYPOINT ["Rscript", "--vanilla", "startServeur.R"]
CMD ["habemus"]
