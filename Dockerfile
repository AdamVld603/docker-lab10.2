#vk34
FROM ubuntu:16.04

LABEL maintainer="kiselv1"

RUN apt-get -q update && apt-get -yq dist-upgrade
RUN apt-get -yq install apache2

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/run/apache
ENV APACHE_PID_FILE /var/run/apache/httpd.pid
RUN mkdir /var/run/apache

ADD index.html /var/www/html/index.html

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2"]
CMD [-"DFOREGROUND"]

