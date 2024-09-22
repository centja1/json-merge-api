FROM alpine
RUN apk --update --no-cache add netcat-openbsd bash jq
RUN mkdir /config
ADD entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

