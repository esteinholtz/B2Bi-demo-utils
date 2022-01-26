#!/bin/bash

#usage: mysql-drop-all-tables -d database -u dbuser -p dbpass

TEMP_FILE_PATH='./drop_all_tables.sql'

DBNAME=b2bi
DBUSER=root
DBPASS=Axway123*

while getopts d:u:p: option
do
	case "${option}"
	in
	d) DBNAME=${OPTARG};;
	u) DBUSER=${OPTARG};;
	p) DBPASS=${OPTARG};;
	esac
done

/opt/axway/b2bi/B2Bi.sh stop

echo "SET FOREIGN_KEY_CHECKS = 0;" > $TEMP_FILE_PATH
( mysqldump --add-drop-table --no-data -u$DBUSER -p$DBPASS $DBNAME | grep 'DROP TABLE' ) >> $TEMP_FILE_PATH
echo "SET FOREIGN_KEY_CHECKS = 1;" >> $TEMP_FILE_PATH
mysql -u$DBUSER -p$DBPASS $DBNAME < $TEMP_FILE_PATH
rm -f $TEMP_FILE_PATH

/opt/axway/b2bi/B2Bi.sh start