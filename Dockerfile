ARG IMAGE_VERSION=2.6-alpine
FROM caddy:${IMAGE_VERSION}
LABEL maintainer="Björn Busse <bj.rn@baerlin.eu>"
LABEL org.opencontainers.image.source https://github.com/bbusse/wled-save-restore

ENV ARCH="x86_64" \
    USER="wsr" \
    PACKAGES="curl jq git" \
    PATH="/usr/local/go/bin:${PATH}"

COPY --from=golang:1.20-alpine /usr/local/go/ /usr/local/go/

# Add application user and application
RUN addgroup -S $USER && adduser -S $USER -G $USER \
    && apk add --no-cache ${PACKAGES} \
    && go install github.com/bbusse/mdns-discover@latest

USER $USER

# Add entrypoint
COPY wled-save-restore /usr/local/bin/
ENTRYPOINT ["wled-save-restore", "save", "lights-bed-0", "2"]
