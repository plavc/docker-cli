FROM ubuntu:18.04 AS builder

ARG VERSION_DOCKER=19.03.6

ARG URL_DOCKER=https://download.docker.com/linux/static/stable

WORKDIR /workspace

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl ca-certificates \
    && curl -L "${URL_DOCKER}/$(uname -m)/docker-${VERSION_DOCKER}.tgz" -o docker.tgz \
    && tar xzvf docker.tgz docker/docker

FROM alpine

LABEL maintainer=plavc
LABEL git.url=https://github.com/plavc/docker-cli
LABEL version=1.0.0

RUN apk add --no-cache py-pip \
    && apk add --no-cache --virtual build-dependecies python-dev libffi-dev openssl-dev gcc libc-dev make \
    && pip install docker-compose \
    && apk del build-dependecies

COPY --from=builder /workspace/docker/docker /usr/local/bin/

CMD ["/bin/sh"]