FROM ubuntu:latest

MAINTAINER Jorge Rodrigues <jorgerodrigues9@outlook.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  apache2 \
  curl \
  zip \
  unzip

RUN apt-get install -y \
  php7.2 \
  php7.2-mysql \
  php7.2-xml \
  php7.2-mbstring \
  php7.2-curl \
  php7.2-json \
  php7.2-gd \
  php7.2-sqlite3 \
  php7.2-zip \
  hp7.2-xdebug

# COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Algumas configurações extras
RUN a2enmod rewrite

COPY environment/apache2.conf /etc/apache2/apache2.conf
COPY environment/000-default.conf /etc/apache2/sites-available/000-default.conf

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]

WORKDIR /var/www

EXPOSE 80