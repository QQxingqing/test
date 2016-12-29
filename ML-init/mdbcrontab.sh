#!/bin/bash
DATABASES=`hostname |grep ljm |awk -F - '{print $1}'`
DATABASESCOUNT=`grep $DATABASES /var/spool/cron/root |grep $DATABASES | wc -l`
if [ $DATABASESCOUNT -eq 0 ];then
echo "0 * * * * /bin/bash /data/shell/mongodbbak.sh $DATABASES" >> /var/spool/cron/root
fi
