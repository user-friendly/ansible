#!/usr/bin/env bash

MYSQL_CLIENT_BIN='/usr/bin/mysql'
MYSQL="$MYSQL_CLIENT_BIN -u root"
STATEMENT="
SET PASSWORD FOR 'root'@'::1' = PASSWORD('$1');
SET PASSWORD FOR 'root'@'127.0.0.1' = PASSWORD('$1');
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$1');
"

# Test for initial password.
$MYSQL --password=1 -e ''

if [ "$?" == "0" ]; then
    echo "Setting up MySQL root password for localhost."
    $MYSQL --password=1 -e "$STATEMENT"
else
    echo "Setup MySQL root password should've already be done."
fi
