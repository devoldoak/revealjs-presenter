# Dockerfile for a reveal.js presenter environnement

FROM alpine:3.3

MAINTAINER Romain Pigeyre <rpigeyre@gmail.com>

RUN \
    apk update && \
    apk add nginx \
            apache2-utils && \
    cd /usr/share/nginx && \
    cat /etc/nginx/nginx.conf

ADD nginx.conf /etc/nginx/

WORKDIR /usr/share/nginx/html

EXPOSE 80 443

CMD \
    htpasswd -bc /etc/nginx/.htpasswd master $MASTER_PASSWORD && \
    nginx -g "daemon off;"