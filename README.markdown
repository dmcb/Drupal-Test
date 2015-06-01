# Drupal Test

* A suite of scripts to test UofC Drupal sites.

## Dependencies

* [Docker](https://www.docker.com)
* [Git](http://www.git-scm.com)

## Installation

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

3. Configure aliases in aliases.drushrc.php

4. Build the docker container

		sudo docker build -t drupal-test .

5. Ensure this application can SSH to the remote-user on remote-host as defined in the aliases.drushrc.php file, [without a password](http://www.rebol.com/docs/ssh-auto-login.html)


## Usage

* Run drupal-test

		sudo docker run drupal-test