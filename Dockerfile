FROM ubuntu

# File Author / Maintainer
MAINTAINER Derek McBurney

# Install OS dependencies
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y php5
RUN apt-get install -y php5-curl
RUN apt-get install -y php-pear

# Install Drush
RUN pear channel-discover pear.drush.org
RUN pear install drush/drush

# Install the app
ENV APP_PATH /var/uofc-test/
RUN mkdir -p $APP_PATH
RUN mkdir ~/.drush
ADD . $APP_PATH

# Install app dependencies
WORKDIR $APP_PATH
RUN curl -s http://getcomposer.org/installer | php
RUN php composer.phar install

# Define the entry point
RUN chmod 755 $APP_PATH/run.sh
ENTRYPOINT $APP_PATH/run.sh