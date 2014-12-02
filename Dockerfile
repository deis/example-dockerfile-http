FROM busybox:latest
MAINTAINER OpDemand <info@opdemand.com>

ENV POWERED_BY Deis
CMD while true; do echo -e "HTTP/1.1 200 OK\n\nPowered by $POWERED_BY" | nc -l -p 1500; done
EXPOSE 1500
