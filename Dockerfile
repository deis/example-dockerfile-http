FROM alpine:3.1

RUN apk add -U bash nginx && mkdir -p /tmp/nginx && rm -rf /var/cache/apk/*
ENV POWERED_BY Deis
CMD /usr/local/bin/start.sh
EXPOSE 1500
ADD rootfs/ /
