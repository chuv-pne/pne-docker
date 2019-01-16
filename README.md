RStudio server and data analysis tools on docker
================================================

This image is based on the rocker/rstudio image provided by the rocker team (https://github.com/rocker-org).

It includes additional tools and provides a dockerized working environment that improves the reproducibility of data analyses across projects.

## Resources

* Git clone URL: https://github.com/chuvpne/pne-docker.git
* Documentation: https://github.com/chuvpne/pne-docker
* Docker image: https://hub.docker.com/r/chuvpne/pne-docker
* Base image: https://hub.docker.com/r/chuvpne/pne-docker-base
* rocker/rstudio image: https://hub.docker.com/r/rocker/rstudio
* RStudio server: https://www.rstudio.com/products/rstudio/download-server
* illumina-utils: https://github.com/merenlab/illumina-utils

## Rights

* Copyright (c) 2018 Service de Pneumologie, Centre Hospitalier Universitaire Vaudois (CHUV), Switzerland
* License: The Dockerfile is provided under the GPLv3 license (See LICENSE.txt for details)
* Authors: A. Rapin, C. Pattaroni, B.J. Marsland

## Supported platforms

* Cross-platforms

## System requirements

* docker: https://docs.docker.com
* git

## Installation

If not done yet, install docker by following the documentation at https://docs.docker.com/install.

Note: you will have to use sudo with docker commands if docker is not configured to be used as a non-root user. You may have to contact your IT administrator for that.

Get a copy of the docker image:
```
$ docker pull chuvpne/pne-docker
```


## Usage

If not done yet, create a new project directory for your analysis:

```
$ mkdir my_project_dir
```


OR, you can get a copy of a R project template from https://github.com/chuvpne (per example the dada2 analysis template):

```
$ git clone https://github.com/chuvpne/dada2-pipeline.git my_project_dir
```


Run a docker container:

$USER and $UID are the current user and UID, they need to be specified in order to conserve permissions when editing files in the project.

The following command should output something like "alice:1000", alice being the current user and 1000 its associated UID:
```
$ echo $USER:$UID
alice:1000
```


"yourpassword" will be used to login into RStudio server, replace it with the password of your choice (but not by "rstudio").

The `-v` argument is used to give the docker container access to your local project directory and a DADA2-formatted reference database.

Replace `/path/to/my_project_dir` by the right path to your project directory.

Depending on your project, you may also need to use the `-v` argument to give access to additional directories/files from within the docker container.

```
$ docker run --rm -it -p 8787:8787 \
-e USER=$USER \
-e USERID=$UID \
-e PASSWORD=yourpassword \
-v /path/to/my_project_dir:/home/$USER/project \
chuvpne/pne-docker
```


You can use multiple `-v` arguments if additional volumes (such as reference databases) need to be available within the docker container.

RStudio server is now running within a docker container, access it from a web browser at the address [localhost:8787](localhost:8787) and login using the following credentials:
* user: "$USER" as set in the docker run command (per example: "alice")
* password: "yourpassword" as set in the docker run command

From the Rstudio server web interface, set the `project` directory as your working directory.

You are now ready to work.
