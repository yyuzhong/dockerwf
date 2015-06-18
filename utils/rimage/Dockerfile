FROM r-base:latest

RUN apt-get update && apt-get install -y rsync

RUN apt-get update && apt-get install wget

RUN wget http://cran.r-project.org/src/contrib/getopt_1.20.0.tar.gz

RUN R CMD INSTALL getopt_1.20.0.tar.gz getopt

RUN wget http://cran.r-project.org/src/contrib/zoo_1.7-12.tar.gz
RUN wget http://cran.r-project.org/src/contrib/timeDate_3012.100.tar.gz
RUN wget http://cran.r-project.org/src/contrib/quadprog_1.5-5.tar.gz
RUN wget http://cran.r-project.org/src/contrib/tseries_0.10-34.tar.gz
RUN wget http://cran.r-project.org/src/contrib/fracdiff_1.4-2.tar.gz
RUN wget http://cran.r-project.org/src/contrib/Rcpp_0.11.6.tar.gz
RUN wget http://cran.r-project.org/src/contrib/nnet_7.3-9.tar.gz
RUN wget http://cran.r-project.org/src/contrib/colorspace_1.2-6.tar.gz
RUN wget http://cran.r-project.org/src/contrib/RcppArmadillo_0.5.200.1.0.tar.gz
RUN wget http://cran.r-project.org/src/contrib/Archive/forecast/forecast_6.0.tar.gz

RUN R CMD INSTALL zoo_1.7-12.tar.gz zoo
RUN R CMD INSTALL timeDate_3012.100.tar.gz timeDate
RUN R CMD INSTALL quadprog_1.5-5.tar.gz quadprog
RUN R CMD INSTALL tseries_0.10-34.tar.gz tseries
RUN R CMD INSTALL fracdiff_1.4-2.tar.gz fracdiff
RUN R CMD INSTALL Rcpp_0.11.6.tar.gz Rcpp
RUN R CMD INSTALL nnet_7.3-9.tar.gz nnet
RUN R CMD INSTALL colorspace_1.2-6.tar.gz colorspace
RUN R CMD INSTALL RcppArmadillo_0.5.200.1.0.tar.gz RcppArmadillo
RUN R CMD INSTALL forecast_6.0.tar.gz forecast

CMD ["R"]
