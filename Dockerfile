FROM chuvpne/pne-docker-base:v1.0.0
MAINTAINER alexis rapin
RUN apt-get -y update && apt-get clean \
  && apt-get -y install texlive-full
