FROM ubuntu:14.04.2
MAINTAINER Alex McLain <alex@alexmclain.com>

ENV CROSSTOOL crosstool-ng-1.20.0

# Install system packages
RUN apt-get -qq update
RUN apt-get -y dist-upgrade
RUN apt-get -y install wget
RUN apt-get -y install git
RUN apt-get -y install build-essential
RUN apt-get -y install automake
RUN apt-get -y install libtool
RUN apt-get -y install gawk
RUN apt-get -y install bison
RUN apt-get -y install flex
RUN apt-get -y install texinfo
RUN apt-get -y install gperf
RUN apt-get -y install libncurses5-dev
RUN apt-get -y install libexpat1-dev

# Install crosstool-ng
RUN wget http://crosstool-ng.org/download/crosstool-ng/${CROSSTOOL}.tar.bz2
RUN tar -xjf ${CROSSTOOL}.tar.bz2
WORKDIR ${CROSSTOOL}
RUN ./configure
RUN make
RUN make install

WORKDIR ..