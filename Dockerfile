FROM golang:1.17

ARG VERSION=v0.1.4

RUN apt-get update \
    && apt-get install --no-install-recommends -y netcat wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN go install github.com/rakyll/hey@${VERSION}

COPY "wait-for" "/wait-for"
COPY "entrypoint.sh" "/entrypoint.sh"

CMD ["hey"]
ENTRYPOINT ["/entrypoint.sh"]