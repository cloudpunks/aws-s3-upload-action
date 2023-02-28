FROM alpine:3.17.2

RUN apk add --no-cache aws-cli
ADD entrypoint.sh /
RUN chmod 0755 /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]