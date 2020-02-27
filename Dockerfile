FROM ubuntu:18.04 AS builder

ARG VERSION_DOCKER=19.03.6
ARG VERSION_DOCKER_COMPOSE=1.25.4

ARG URL_DOCKER_COMPOSE=https://github.com/docker/compose/releases/download
ARG URL_DOCKER=https://download.docker.com/linux/static/stable

WORKDIR /workspace

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl ca-certificates \
    && curl -L "${URL_DOCKER}/$(uname -m)/docker-${VERSION_DOCKER}.tgz" -o docker.tgz \
    && tar xzvf docker.tgz docker/docker

RUN curl -L "${URL_DOCKER_COMPOSE}/${VERSION_DOCKER_COMPOSE}/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose \
    && curl -L "${URL_DOCKER_COMPOSE}/${VERSION_DOCKER_COMPOSE}/docker-compose-$(uname -s)-$(uname -m).sha256" -o docker-compose.sha256 \
    && sha256sum docker-compose.sha256 \
    && chmod +x docker-compose

FROM ubuntu:18.04

LABEL maintainer=plavc
LABEL git.url=https://github.com/plavc/docker-cli
LABEL version=1.0.0

COPY --from=builder /workspace/docker/docker /usr/local/bin/
COPY --from=builder /workspace/docker-compose /usr/local/bin/

CMD ["/bin/bash"]