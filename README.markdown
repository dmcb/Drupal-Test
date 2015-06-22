# Drupal Test

* A suite of scripts to test UofC Drupal sites.

## Dependencies

* [Composer](https://getcomposer.org)
* [Drush](http://www.drush.org/en/master/)
* [Docker](https://www.docker.com)
* [Git](http://www.git-scm.com)
* PHP 5.35+
	* mbstring
	* xml
	* pear
	* curl


## Installation

### OS X

* Brew
	
		ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

* Composer

		brew install composer
		
* Drush

		brew install drush
		
* App dependencies

		composer install

### Red Hat

* PHP

		yum install php php-mbstring php-xml php-pear php-curl
		
* Composer

		curl -sS https://getcomposer.org/installer | php
		mv composer.phar /usr/local/bin/composer
		
* Drush

		composer global require drush/drush:7.*
		echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bash_profile
		export PATH="$HOME/.composer/vendor/bin:$PATH"

### Docker

* [Docker](https://docs.docker.com/installation/#installation)
* [Git](http://git-scm.com/downloads)	
* This library

		git clone https://github.com/dmcb/drupal-test.git


## Configure

1. In /drupal-test, copy default CAS account file to a configurable file

		cp casaccount.yml.default casaccount.yml

2. Configure a valid CAS user in casaccount.yml

		username: USERNAME
		password: PASSWORD
		
3. Ensure this application can SSH to the remote-user on remote-host as defined in the aliases.drushrc.php file, [without a password](http://www.rebol.com/docs/ssh-auto-login.html).
		
### Docker steps

1. Build the docker container

		sudo docker build -t drupal-test .


## Usage

* Run drupal-test

		run.sh drupal-test [base_url] [remote_host] [remote_user] [root] [uri]

* Example

		run.sh drupal-test http://www.hotelalma.ca wcmweb1.ucalgary.ca wcm /d7/current hotelalma