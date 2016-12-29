#!/bin/bash
yum install monit -y
chkconfig --add monit
chkconfig monit on
cat > /etc/init/monit.conf <<EOF
# This is an upstart script to keep monit running.
# To install disable the old way of doing things:
#
#   /etc/init.d/monit stop && update-rc.d -f monit remove
#
# then put this script here:
#
#   /etc/init/monit.conf
#
# and reload upstart configuration:
#
#   initctl reload-configuration
#
# You can manually start and stop monit like this:
# 
# start monit
# stop monit
#
description "Monit service manager"
limit core unlimited unlimited
start on runlevel [2345]
stop on starting rc RUNLEVEL=[016]
expect daemon
respawn
exec /usr/bin/monit -c /etc/monit.conf
pre-stop exec /usr/bin/monit -c /etc/monit.conf quit
EOF
initctl reload-configuration
echo 'set logfile /var/log/monit.log' > /etc/monit.d/logging
cd /etc/monit.d
rm -f game gate login
#if [[ `hostname` =~ "game" ]];then
cat > /etc/monit.conf << EOF
#配置发邮件的smtp服务器
set mailserver smtp.exmail.qq.com port 25
    username "monit@qq.com"
    password "1234"
#配置服务检测的周期,30秒检查一次
set daemon 120
#配置报警邮件格式
set mail-format {
from: monit@millergame.com
subject: \$HOST monit alert -- \$EVENT \$SERVICE at \$DATE
message: \$EVENT Service \$SERVICE
    Date:        \$DATE
    Action:      \$ACTION
    Host:        \$HOST
    Description: \$DESCRIPTION

    Your faithful employee,
monit
}
#配置收报警的人,出问题时最多连续报5次
set alert w@qq.com with reminder on 5 cycles
set alert l@qq.com with reminder on 5 cycles
#配置日志文件的位置
set logfile /var/log/monit.log
#配置PID文件的位置
set pidfile /var/run/monit.pid
#配置包含配置文件路径
include /etc/monit.d/*
#配置monit监听的端口号（不配置此部分会导致monit status无法查看监控状态）
set httpd port 2812
#配置monit服务器的IP
use address 127.0.0.1
#配置允许访问的主机
allow 127.0.0.1
EOF
cat > /etc/monit.d/data <<EOF
check filesystem datafs with path /dev/vdb1
if space usage > 75% for 5 times within 5 cycles then alert
EOF
cat > /etc/monit.d/root <<EOF
check filesystem rootfs with path /dev/vda1
if space usage > 75% for 5 times within 5 cycles then alert
EOF
if [[ `hostname` =~ "l" ]];then
cat > /etc/monit.d/system <<EOF
check system \$HOST
if loadavg (1min) > 2 for 3 cycles then alert
if memory usage > 90% for 5 cycles then alert
if swap usage > 20% for 4 cycles then alert
if cpu usage (user) > 80% for 3 cycles then alert
if cpu usage (system) > 20% for 3 cycles then alert
if cpu usage (wait) > 80% for 3 cycles then alert
EOF
elif [[ `hostname` =~ "g" ]];then
cat > /etc/monit.d/system <<EOF
check system \$HOST
if loadavg (1min) > 4 for 3 cycles then alert
if memory usage > 90% for 5 cycles then alert
if swap usage > 20% for 4 cycles then alert
if cpu usage (user) > 80% for 3 cycles then alert
if cpu usage (system) > 20% for 3 cycles then alert
if cpu usage (wait) > 80% for 3 cycles then alert
EOF
elif [[ `hostname` =~ "a" ]];then
cat > /etc/monit.d/system <<EOF
check system \$HOST
if loadavg (1min) > 4 for 3 cycles then alert
if memory usage > 90% for 5 cycles then alert
if swap usage > 20% for 4 cycles then alert
if cpu usage (user) > 80% for 3 cycles then alert
if cpu usage (system) > 20% for 3 cycles then alert
if cpu usage (wait) > 80% for 3 cycles then alert
EOF
fi
stop monit
wait
start monit
