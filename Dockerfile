# UnionPOS Package Distribution Builder
################################################################################
FROM unionpos/packages:latest as packages
WORKDIR /packages

# devbox image build
################################################################################
FROM alpine:3.10

# Install alpine package manifest
COPY packages.txt /etc/apk/

# Install alpine packages from manifest
RUN apk add --update $(grep -v '^#' /etc/apk/packages.txt)

# Copy binaries from packages builder
COPY --from=packages /packages/bin /usr/local/bin/

# copy root file system customizations
COPY rootfs/ /
