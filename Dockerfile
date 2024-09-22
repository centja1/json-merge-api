FROM alpine
RUN apk --update --no-cache add netcat-openbsd bash jq
ADD entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
