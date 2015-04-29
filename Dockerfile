FROM alpine:3.1

RUN apk add -U bash socat && rm -rf /var/cache/apk*
ENV POWERED_BY Deis
CMD socat TCP4-LISTEN:1500,fork EXEC:"echo \"HTTP/1.1 200 OK\n\nPowered by $POWERED_BY\""
EXPOSE 1500
