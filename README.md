# Running Shiny apps in ShinyProxy

This repository explains how to run a Shiny app in ShinyProxy.

## Building the Docker image

To pull the image made in this repository from Docker Hub, use

```bash
sudo docker pull openanalytics/shinyproxy-demo
```

The relevant Docker Hub repository can be found at [https://hub.docker.com/r/openanalytics/shinyproxy-demo](https://hub.docker.com/r/openanalytics/shinyproxy-demo])

To build the image from the Dockerfile, navigate into the root directory of this repository and run

```bash
sudo docker build -t openanalytics/shinyproxy-demo .
```

## ShinyProxy Configuration

Create a ShinyProxy configuration file (see [application.yml](application.yml)
for a complete file), containing:

```yaml
specs:
- id: 01_hello
  display-name: Hello Application
  description: Application which demonstrates the basics of a Shiny app
  container-cmd: ["R", "-e", "shinyproxy::run_01_hello()"]
  container-image: openanalytics/shinyproxy-demo
- id: 06_tabsets
  container-cmd: ["R", "-e", "shinyproxy::run_06_tabsets()"]
  container-image: openanalytics/shinyproxy-demo
```

**(c) Copyright Open Analytics NV, 2016-2021.**
