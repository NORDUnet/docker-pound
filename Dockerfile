FROM ubuntu:14.04
MAINTAINER leifj@sunet.se
RUN apt-get -q update
RUN apt-get -y upgrade
RUN apt-get install -y pound ssl-cert
ADD pound_2.6-7_amd64.deb /pound_2.6-7_amd64.deb
RUN dpkg -i /pound_2.6-7_amd64.deb
ADD start.sh /start.sh
RUN chmod a+rx /start.sh
VOLUME /etc/ssl
ENV HTTP_PORT 80
ENV REWRITE_LOCATION 1
ENTRYPOINT ["/start.sh"]
EXPOSE 443
