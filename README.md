# plavchub/docker-cli

https://hub.docker.com/r/plavchub/docker-cli

A Docker image with docker cli and docker-compose installed. This image doesn't contains docker daemon. 
The main purpose of the image is to access docker daemon on host from container.

## Supported tags

- [`1.0`, `latest`](Dockerfile)
- [`1.0-alpine`, `alpine`](alpine/Dockerfile)

## How to use image

### Basic usage

`docker run --rm -ti -v /var/run/docker.sock:/var/run/docker.sock plavchub/docker-in-docker:alpine`

