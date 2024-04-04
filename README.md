# Running Shiny apps in ShinyProxy

This repository explains how to run a Shiny app in ShinyProxy. The R code in
this repository is bundled into an [R package](https://r-pkgs.org/).
See [this demo](https://github.com/openanalytics/shinyproxy-demo-minimal) that
uses the same code, but without using an R package.

Related demos:

- [plain Shiny demo (no R package)](https://github.com/openanalytics/shinyproxy-demo-minimal)
- [Shiny demo using pak](https://github.com/openanalytics/shinyproxy-shiny-pak-demo)
- [Shiny demo using r2u](https://github.com/openanalytics/shinyproxy-shiny-r2u-demo)
- [Shiny demo using renv](https://github.com/openanalytics/shinyproxy-shiny-renv-demo)

## Building the Docker image

To pull the image made in this repository from Docker Hub, use

```bash
sudo docker pull openanalytics/shinyproxy-demo:euler
```

The relevant Docker Hub repository can be found at [https://hub.docker.com/r/openanalytics/shinyproxy-demo](https://hub.docker.com/r/openanalytics/shinyproxy-demo)

To build the image from the Dockerfile, navigate into the root directory of this repository and run

```bash
sudo docker build -t openanalytics/shinyproxy-demo:euler .
```

**Note**: the `openanalytics/shinyproxy-demo:latest` image does not contain the
euler package (it contains the `01_hello` and `06_tabsets` Shiny demos).

## ShinyProxy Configuration

Create a ShinyProxy configuration file (see [application.yml](application.yml)
for a complete file), containing:

```yaml
specs:
  - id: euler
    display-name: Euler
    description: Application to calculate euler
    container-image: openanalytics/shinyproxy-demo:euler
```

# References

- [ShinyProxy.io](https://shinyproxy.io/)
- [All demos](https://shinyproxy.io/documentation/demos/)

**(c) Copyright Open Analytics NV, 2016-2024.**
