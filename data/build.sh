#!/bin/bash

# before running this scripts be sure bhima use has necessary privileges (see: README.md)

echo "Building initial bhima database with accounts and inventories ..."

# TODO - store these in environmental variables somehow
DB_USER='bhima'
DB_PASS='HISCongo2013'
DB_NAME='bhima_production'

# set build timeout
TIMEOUT=${BUILD_TIMEOUT:-8}

# build the production database
mysql -u $DB_USER -p$DB_PASS -e "DROP DATABASE IF EXISTS $DB_NAME ;"
mysql -u $DB_USER -p$DB_PASS -e "CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

echo "1. Building schema"
mysql -u $DB_USER -p$DB_PASS $DB_NAME < latest/server/models/schema.sql

echo

echo "2. Building triggers"
mysql -u $DB_USER -p$DB_PASS $DB_NAME < latest/server/models/triggers.sql

echo

echo "3. Building functions and procedures"
mysql -u $DB_USER -p$DB_PASS $DB_NAME < latest/server/models/functions.sql
mysql -u $DB_USER -p$DB_PASS $DB_NAME < latest/server/models/procedures.sql

echo

echo "4. Building initial database"
mysql -u $DB_USER -p$DB_PASS $DB_NAME < data/system.sql
mysql -u $DB_USER -p$DB_PASS $DB_NAME < data/demo_hospital.sql

echo

echo "5. Import accounts, inventory and debtor groups"
mysql -u $DB_USER -p$DB_PASS $DB_NAME < data/core/account.sql
mysql -u $DB_USER -p$DB_PASS $DB_NAME < data/core/inventory.sql
mysql -u $DB_USER -p$DB_PASS $DB_NAME < data/core/debtor_group.sql

echo 

# end building process
echo "Building finished"
