FROM alpine:3.1

RUN apk add -U nginx && mkdir -p /tmp/nginx && rm -rf /var/cache/apk/*
ENV POWERED_BY Deis
CMD nginx -c /etc/nginx/nginx.conf
EXPOSE 1500
ADD rootfs/ /
