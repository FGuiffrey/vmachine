FROM ubuntu:trusty
MAINTAINER Matt Contet <mco@emakina.fr>

# FIX Apache/PHP write permissions to the app
ENV BOOT2DOCKER_ID 1000
ENV BOOT2DOCKER_GID 50
RUN usermod -u ${BOOT2DOCKER_ID} www-data && \
    usermod -G staff www-data
RUN groupmod -g $(($BOOT2DOCKER_GID + 10000)) $(getent group $BOOT2DOCKER_GID | cut -d: -f1)
RUN groupmod -g ${BOOT2DOCKER_GID} staff

# Install base packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install \
        imagemagick \
        curl \
        wget \
        apache2 \
        memcached \
        libapache2-mod-php5 \
        php5-mysql \
        php5-gd \
        php5-curl \
        php-pear \
        php5-mcrypt \
        php-apc \
        php5-imagick \
        php5-xdebug \
        php5-memcached \
        nano \
        git \
        mysql-client \
        openssh-server \
        jpegoptim \
        nodejs \
        uglifyjs \
        && \
    rm -rf /var/lib/apt/lists/* && \
    php5enmod mcrypt && \
    a2enmod rewrite && \
    service apache2 stop

# Apache configuration
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini && \
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

# wkhtmltopdf
RUN apt-get update && \
    apt-get install -y \
        xfonts-utils \
        xfonts-base \
        xfonts-75dpi \
        && \
    wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb && \
    rm wkhtmltox-0.12.2.1_linux-trusty-amd64.deb

RUN apt-get autoremove && apt-get clean

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Add image configuration and scripts
ADD apache.sh /apache.sh
RUN chmod 755 /*.sh

ADD bash_aliases /root/.bash_aliases
ENV TERM xterm

EXPOSE 80

CMD ["/apache.sh"]