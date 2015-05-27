# Drupal-Test

* A suite of scripts to test UofC Drupal sites.

## Dependencies

* [Composer](https://getcomposer.org)
* PHP 5.35+

## Installation

* Brew
	
		ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

* Composer

		brew install composer
		
* App dependencies

		composer install

## Configure

1. Copy config.sh.default to config.sh

		cp config.sh.default config.sh
		chmod 755 config.sh

2. Configure variables in config.sh

		export BEHAT_PARAMS='{"extensions":{"Behat\\MinkExtension":{"base_url":"XXXXXX"},"Drupal\\DrupalExtension":{"drupal":{"drupal_root":"XXXXXX"}}}}'

## Usage

* Run scripts

		. ./config.sh
		bin/behat