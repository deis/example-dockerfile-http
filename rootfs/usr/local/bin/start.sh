#!/bin/sh

sed s/\${POWERED_BY}/"$POWERED_BY"/ /etc/nginx/nginx.conf.tmpl > /etc/nginx/nginx.conf
nginx -c /etc/nginx/nginx.conf
