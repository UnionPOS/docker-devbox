FROM alpine:3.10

# Install alpine package manifest
COPY packages.txt /etc/apk/

# Install alpine packages from manifest
RUN apk add --update $(grep -v '^#' /etc/apk/packages.txt)

# copy root file system customizations
COPY rootfs/ /
