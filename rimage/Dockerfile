FROM r-base:latest

RUN apt-get update && apt-get install -y rsync

RUN apt-get update && apt-get install wget

RUN wget http://cran.r-project.org/src/contrib/getopt_1.20.0.tar.gz

RUN R CMD INSTALL getopt_1.20.0.tar.gz getopt

CMD ["R"]
