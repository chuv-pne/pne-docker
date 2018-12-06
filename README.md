RStudio server and data analysis tools on docker
================================================

Docker images contain light-weight copies of an operating system. Here we have created a docker image with a pre-installed RStudio server and the illumina-utils FASTQ file processing toolbox.

This docker image provides a working environment that is easy to deploy across machines and platforms, ensuring reproducibility of data analyses.

This docker image is primarily dedicated to provide a stable working environment for metagenomic data analysis. R Notebook templates that can be used with RStudio server running on an instance of this docker image (a docker container) are available at https://github.com/chuvpne.

Note: Commands described in this documentation assume that you are using a Unix CLI.

## Resources

* Git clone URL: https://github.com/chuvpne/pne-docker.git
* Documentation: https://github.com/chuvpne/pne-docker
* Docker image: https://hub.docker.com/r/chuvpne/pne-docker
* RStudio server: https://www.rstudio.com/products/rstudio/download-server
* illumina-utils: https://github.com/merenlab/illumina-utils
* Using the DADA2 pipeline for sequence variant identification: https://github.com/chuvpne/dada2

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
$ git clone https://github.com/chuvpne/dada2.git my_project_dir
```

Run a docker container:
```
# The -v argument is used to give the docker container access to your local project directory.
# Replace "/path/to/my_project_dir" by the right path to your project directory.
$ docker run --rm -v /path/to/my_project_dir:/home/rstudio/project -p 8787:8787 -ti chuvpne/pne-docker
```

RStudio server is now running within a docker container, access it from a web browser at the address <a href="localhost:8787" target="_blank">"localhost:8787"</a> and login using the following credentials:
* user: rstudio
* password: rstudio

From the Rstudio server web interface, set the `project` directory as your working directory.

You are now ready to work.
