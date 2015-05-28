# Drupal Test

* A suite of scripts to test UofC Drupal sites.

## Dependencies

* [Composer](https://getcomposer.org)
* [Drush](http://www.drush.org/en/master/)
* PHP 5.35+

## Installation (OS X instructions)

* Brew
	
		ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

* Drush

		brew install drush

* Composer

		brew install composer
		
* App dependencies

		composer install

## Configure

1. Copy config.sh.default to config.sh

		cp config.sh.default config.sh
		chmod 755 config.sh

2. Configure variables in config.sh

		export BEHAT_PARAMS='{"extensions":{"Behat\\MinkExtension":{"base_url":"BASE_URL"},"Drupal\\DrupalExtension":{"drush":{"alias":"ALIAS"}}}}'

3. Copy casaccount.yml.default to casaccount.yml

		cp casaccount.yml.default casaccount.yml

4. Configure CAS user in casaccount.yml

		username: USERNAME
		password: PASSWORD

5. Configure aliases in aliases.drushrc.php and allow Drush to use it

		mkdir ~/.drush
		cp aliases.drushrc.php.default ~/.drush/alises.drushrc.php

6. [Ensure this application can SSH to remote-user on remote-host without a password](http://www.rebol.com/docs/ssh-auto-login.html)

## Usage

* Run scripts

		. ./config.sh
		bin/behat