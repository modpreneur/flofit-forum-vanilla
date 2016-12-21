FROM modpreneur/apache-framework:1.0.3

MAINTAINER Tomáš Jančar <jancar@modpreneur.com>

RUN  apt-get install python-setuptools -y \
  && easy_install supervisor

RUN apt-get update && apt-get -y install \
    nano

ADD . /var/app

RUN rm /etc/apache2/sites-available/000-default.conf
COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN composer install --no-dev --optimize-autoloader --no-scripts --prefer-dist --no-interaction

ENV TERM xterm

EXPOSE 80 8666 9005

RUN chmod +x entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]