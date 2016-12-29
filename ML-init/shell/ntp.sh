#!/bin/bash
NTPCOUNT=`grep "10.0.0.1" /etc/ntp.conf | wc -l`
if [ $NTPCOUNT -eq 0 ];then
sed -i 's/\*\/5 \* \* \* \* \/usr\/sbin\/ntpdate/#\*\/5 \* \* \* \* \/usr\/sbin\/ntpdate/g' /var/spool/cron/root
sed -i 's/server 0.centos.pool.ntp.org iburst/#server 0.centos.pool.ntp.org iburst/g' /etc/ntp.conf 
sed -i 's/server 1.centos.pool.ntp.org iburst/#server 1.centos.pool.ntp.org iburst/g' /etc/ntp.conf
sed -i 's/server 2.centos.pool.ntp.org iburst/#server 2.centos.pool.ntp.org iburst/g' /etc/ntp.conf
sed -i 's/server 3.centos.pool.ntp.org iburst/#server 3.centos.pool.ntp.org iburst/g' /etc/ntp.conf
echo "server 10.0.0.1" >> /etc/ntp.conf
/etc/init.d/ntpd restart
fi
