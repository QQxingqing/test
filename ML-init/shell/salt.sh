#!/bin/bash
MASTERCOUNT=`grep "10.0.0.1" /etc/salt/minion | wc -l`
#rpm -ivh http://mirrors.yun-idc.com/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum -y update python
yum -y install salt-minion
if [ $MASTERCOUNT -eq 0 ];then
cd /etc/salt/
sed -i '/#master: salt/a\master: 10.0.0.1' /etc/salt/minion
sed -i "s/#default_include/default_include/g" /etc/salt/minion
sed -i "s/#user: root/user: root/g" /etc/salt/minion
sed -i "s/#pidfile: \/var\/run\/salt-minion.pid/pidfile: \/var\/run\/salt\/salt-minion.pid/g" /etc/salt/minion
sed -i "s/#random_reauth_delay: 60/random_reauth_delay: 30/g" /etc/salt/minion
fi
echo "" > /etc/salt/minion_id
/etc/init.d/salt-minion restart
