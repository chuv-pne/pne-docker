# Get the base image
FROM chuvpne/pne-docker-base

MAINTAINER alexis rapin

WORKDIR /home/rstudio

# Create a mounting point for external volume for which rstudio will have write permission
RUN mkdir /home/rstudio/project \
  && chown rstudio /home/rstudio/project

# Start the rstudio deamon and start a job in foreground to prevent the container to stop
CMD ["sh", "-c", "rstudio-server start && tail -f /dev/null"]
