# SBCL-dev Dockerfile

This repository contains **Dockerfile** of [Swank(SLIME backend)](https://common-lisp.net/project/slime/doc/html/Connecting-to-a-remote-lisp.html)
for Docker's automated build published to the [Docker Hub](https://hub.docker.com/r/andron94/dockerfile-sbcl-dev/).

## Base Docker Image

+ [andron94/dockerfile-quicksbcl:1.2.0](https://hub.docker.com/r/andron94/dockerfile-quicksbcl/)

## Installation

1.  Install [Docker](https://docs.docker.com/engine/installation/).
2.  Download automated build from public Docker Hub Registry:
    ```sh
    docker pull andron94/dockerfile-sbcl-dev:[TAG]
    ```

## Usage

### Create environment for `Common Lisp` development

The main purpose of this image is to be used as Common Lisp
development environment. Docker helps to forget about dependencies
and installation; Swank helps to use Lisp REPL from an Emacs as usual.

```sh
# Run SBCL, create Swank server on port 4005(specified in Dockerfile).
# Also, set up the connection between localhost(127.0.0.1)
# on port 4000(you can use any port you like) and Docker port 4005.
docker run -id -p 127.0.0.1:4000:4005 \
           --name test-sbcl andron94/dockerfile-sbcl-dev:[TAG]
# Control Lisp image.
docker stop test-sbcl
docker start test-sbcl
docker restart test-sbcl
# And now you can connect to image from an Emacs:
# M-x slime-connect [localhost] [4000]
```

### Run `shell` session

```sh
docker run --rm -it --entrypoint /bin/sh andron94/dockerfile-sbcl-dev:[TAG]
```

