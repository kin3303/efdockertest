#!/bin/bash

# Deploy the executable
cp mysqlbkup.sh /usr/local/bin
chmod 755 /usr/local/bin/mysqlbkup.sh

# Deploy the configuration files
cp mysqlbkup.config.sample /etc/mysqlbkup.config
chmod 600 /etc/mysqlbkup.config
cp mysqlbkup.cnf.sample /etc/mysqlbkup.cnf
chmod 600 /etc/mysqlbkup.cnf

# Create the backup directory
. /etc/mysqlbkup.config
mkdir "$BACKUP_DIR"
chmod 600 "$BACKUP_DIR"
