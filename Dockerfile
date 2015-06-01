FROM ubuntu

# File Author / Maintainer
MAINTAINER Derek McBurney

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y php5
RUN apt-get install -y php-pear

RUN curl -s http://getcomposer.org/installer | php
RUN pear channel-discover pear.drush.org
RUN pear install drush/drush

ENV APP_PATH /var/uofc-test/
RUN mkdir -p $APP_PATH
ADD . $APP_PATH