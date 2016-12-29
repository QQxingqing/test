#!/bin/bash
cd ~/shell

/bin/bash fenqu.sh
wait
/bin/bash hostname.sh $1 $2
wait
/bin/bash huxin.sh
wait
/bin/bash jdk.sh
wait
/bin/bash ntp.sh
wait
/bin/bash monit.sh
wait
/bin/bash spider.sh
wait
/bin/bash sudoers.sh
wait
/bin/bash mail.sh
wait
/bin/bash salt.sh
wait
/bin/bash mdbcrontab.sh
wait
echo "####################################################################"
df -h
echo "####################################################################"
free -m
echo "####################################################################"
cat /etc/fstab
echo "####################################################################"
ntpq -p
echo "####################################################################"
monit status
