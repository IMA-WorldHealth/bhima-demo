#!/bin/bash

# before running this scripts be sure bhima use has necessary privileges (see: README.md)

echo "Building initial bhima database with accounts and inventories ..."

# TODO - store these in environmental variables somehow
DB_USER='bhima'
DB_PASS='HISCongo2013'
DB_NAME='bhima_production'

# build the production database
mysql -u $DB_USER -p$DB_PASS -e "DROP DATABASE IF EXISTS $DB_NAME ;"
mysql -u $DB_USER -p$DB_PASS -e "CREATE DATABASE $DB_NAME CHARACTER SET utf8 COLLATE utf8_unicode_ci;"

mysql -u $DB_USER -p$DB_PASS -e "SET AUTOCOMMIT = 0; SET FOREIGN_KEY_CHECKS=0;"

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

echo "4. Building system database"
mysql -u $DB_USER -p$DB_PASS $DB_NAME < latest/server/models/icd10.sql
mysql -u $DB_USER -p$DB_PASS $DB_NAME < latest/server/models/bhima.sql
mysql -u $DB_USER -p$DB_PASS $DB_NAME < data/demo_hospital.sql

echo

echo "5. Import accounts, inventory and debtor groups"
mysql -u $DB_USER -p$DB_PASS $DB_NAME < data/demo_hospital_core/account.sql
mysql -u $DB_USER -p$DB_PASS $DB_NAME < data/demo_hospital_core/inventory.sql
mysql -u $DB_USER -p$DB_PASS $DB_NAME < data/demo_hospital_core/debtor_group.sql

echo

mysql -u $DB_USER -p$DB_PASS -e "SET AUTOCOMMIT = 1; COMMIT; SET FOREIGN_KEY_CHECKS = 1;"

# end building process
echo "Building finished"
