#!/bin/bash

if [ $# -ne 5 ]; then
	echo "Usage: "`basename $0`" base_url remote_host remote_user root uri"
	echo "e.g. `basename $0` http://www.hotelalma.ca wcmweb1.ucalgary.ca wcm /d7/current hotelalma"
	exit 1
fi

BASE_URL="$1"
REMOTE_HOST="$2"
REMOTE_USER="$3"
ROOT="$4"
URI="$5"

export BEHAT_PARAMS='{"extensions":{"Behat\\MinkExtension":{"base_url":"$BASE_URL"}}}'
cp behat_aliases.drushrc.php.default behat_aliases.drushrc
sed -i "s/\$REMOTE_HOST/$REMOTE_HOST/" behat_aliases.drushrc.php
sed -i "s/\$REMOTE_USER/$REMOTE_USER/" behat_aliases.drushrc.php
sed -i "s/\$ROOT/$ROOT/" behat_aliases.drushrc.php
sed -i "s/\$URI/$URI/" behat_aliases.drushrc.php
cp behat_aliases.drushrc.php ~/.drush/behat_aliases.drushrc.php

bin/behat