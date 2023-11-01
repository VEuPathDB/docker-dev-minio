FROM alpine:3.18.4

COPY entrypoint.sh /usr/bin/entrypoint.sh

RUN apk add --no-cache netcat-openbsd ca-certificates coreutils curl net-tools \
        shadow-login shadow shadow-subids util-linux gzip lsof tar iproute2 \
        iputils jq minisign \
    && curl https://dl.min.io/server/minio/release/linux-amd64/archive/minio.RELEASE.2023-11-01T01-57-10Z -o /usr/bin/minio \
    && chmod +x /usr/bin/entrypoint.sh \
    && chmod +x /usr/bin/minio

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]

CMD [ "minio" ]
