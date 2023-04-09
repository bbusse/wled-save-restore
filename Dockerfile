ARG IMAGE_VERSION=latest
FROM ghcr.io/bbusse/mdns-discover:${IMAGE_VERSION}
LABEL maintainer="Björn Busse <bj.rn@baerlin.eu>"
LABEL org.opencontainers.image.source https://github.com/bbusse/wled-save-restore

ENV ARCH="x86_64" \
    USER="wsr" \
    PACKAGES="curl jq git" \
    PATH="/usr/local/go/bin:${PATH}" \
    WEB_PATH="/home/wsr/.config/wled/public"

USER root

# Add application user and application
RUN addgroup -S $USER && adduser -S $USER -G $USER \
    && apk add --no-cache ${PACKAGES} \
    && mkdir -p $WEB_PATH \
    && chown -R $USER /home/wsr/.config

COPY --from=ghcr.io/bbusse/matcha-build:latest /tmp/matcha/cmd/matcha/matcha /home/wsr/.config/wled
COPY --from=ghcr.io/bbusse/matcha-build:latest /tmp/matcha/public /home/wsr/.config/wled/public

USER $USER

# Add entrypoint
COPY wled-save-restore /usr/local/bin/
ENTRYPOINT ["wled-save-restore"]
