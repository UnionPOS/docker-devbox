# UnionPOS Package Distribution Builder
################################################################################
FROM unionpos/packages:latest as packages
WORKDIR /packages

# devbox image build
################################################################################
FROM alpine:3.10

# Install all packages as root
USER root

# Use TLS for alpine default repo
RUN sed -i 's|http://dl-cdn.alpinelinux.org|https://alpine.global.ssl.fastly.net|g' /etc/apk/repositories && \
    echo "@testing https://alpine.global.ssl.fastly.net/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@community https://alpine.global.ssl.fastly.net/alpine/edge/community" >> /etc/apk/repositories

# Install alpine package manifest
COPY packages.txt /etc/apk/

# Install alpine packages from manifest
RUN apk add --update $(grep -v '^#' /etc/apk/packages.txt)

# Copy binaries from packages builder
COPY --from=packages /packages/bin /usr/local/bin/

# copy root file system customizations
COPY rootfs/ /

# copy documentation
COPY docs/ /usr/share/docs/

# build man pages
RUN /usr/local/bin/docs update
