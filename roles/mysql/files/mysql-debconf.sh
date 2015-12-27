#!/usr/bin/env bash
#
# Pre-configure a password for the MySQL server package.
# Later on in the play, we can change this temp password.
#
echo mysql-server-5.5 mysql-server-5.5/root_password password 1 | sudo /usr/bin/debconf-set-selections
echo mysql-server-5.5 mysql-server-5.5/root_password_again password 1 | sudo /usr/bin/debconf-set-selections
