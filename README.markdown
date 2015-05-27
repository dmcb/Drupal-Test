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

		export BEHAT_PARAMS='{"extensions":{"Behat\\MinkExtension":{"base_url":""},"Drupal\\DrupalExtension":{"drush":{"alias":""}}}}'

3. Configure aliases in aliases.drushrc.php and allow Drush to use it

		mkdir ~/.drush
		cp aliases.drushrc.php.default ~/.drush/alises.drushrc.php

## Usage

* Run scripts

		. ./config.sh
		bin/behat