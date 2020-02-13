#! /bin/sh

DB_USER=${DB_USER:-"db2inst1"}
DB_PASSWORD=${DB_PASSWORD:-"passw0rd"}
DB_SERVICE_NAME=${DB_SERVICE_NAME:-"db"}
DB_NAME=${DB_NAME:-"TEST"}

[ ! -d "`pwd`/setdbparms" ] && mkdir -v "`pwd`/setdbparms"
[ ! -d "`pwd`/policy" ] && mkdir -v "`pwd`/policy"

cp templates/setdbparms.txt $(pwd)/setdbparms/
sed -i -e "s/%DB_USER%/${DB_USER}/g" setdbparms/setdbparms.txt
sed -i -e "s/%DB_PASSWORD%/${DB_PASSWORD}/g" setdbparms/setdbparms.txt

cp templates/DB2Policy.policyxml $(pwd)/policy/
sed -i -e "s/%DB_SERVICE_NAME%/${DB_SERVICE_NAME}/g" policy/DB2Policy.policyxml
sed -i -e "s/%DB_NAME%/${DB_NAME}/g" policy/DB2Policy.policyxml

echo "setdbparms.txt"
cat $(pwd)/setdbparms/setdbparms.txt

echo "DB2Policy.policyxml"
cat $(pwd)/policy/DB2Policy.policyxml

chown -v 1000:1000 -R $(pwd)/setdbparms
chown -v 1000:1000 -R $(pwd)/policy

exit 0 