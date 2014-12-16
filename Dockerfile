FROM ubuntu-debootstrap:14.04
MAINTAINER OpDemand <info@opdemand.com>

RUN apt-get update && \
  apt-get install -y netcat-openbsd && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV POWERED_BY Deis
CMD while true; do echo "HTTP/1.1 200 OK\n\nPowered by $POWERED_BY" | nc -l -p 1500; done
EXPOSE 1500
