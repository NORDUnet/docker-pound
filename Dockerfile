FROM debian:stretch
MAINTAINER leifj@sunet.se
RUN apt-get update
RUN apt-get -y dist-upgrade
RUN apt-get install -y pound ssl-cert
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
VOLUME /etc/ssl
ENV HTTP_PORT 80
ENV REWRITE_LOCATION 1
ENTRYPOINT ["/start.sh"]
EXPOSE 443
