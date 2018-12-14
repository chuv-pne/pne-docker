# Get the base image
FROM chuvpne/pne-docker-base

MAINTAINER alexis rapin

# CREATE RSTUDIO SERVER USER
RUN useradd -d /home/rstudio -ms /bin/bash -p $(openssl passwd -1 -salt $(openssl rand -base64 6) rstudio) rstudio
WORKDIR /home/rstudio

WORKDIR /home/rstudio

# Create a mounting point for external volume for which rstudio will have write permission
RUN mkdir /home/rstudio/project \
  && chown rstudio /home/rstudio/project

# Start the rstudio deamon and start a job in foreground to prevent the container to stop
CMD ["sh", "-c", "rstudio-server start && tail -f /dev/null"]
