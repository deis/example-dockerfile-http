FROM gliderlabs/alpine:3.1
MAINTAINER OpDemand <info@opdemand.com>

RUN apk-install netcat-openbsd

ENV POWERED_BY Deis
CMD while true; do echo "HTTP/1.1 200 OK\n\nPowered by $POWERED_BY" | nc -n -l 1500; done
EXPOSE 1500
