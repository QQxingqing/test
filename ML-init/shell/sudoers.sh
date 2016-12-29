#!/bin/bash
groupadd sudogroup
groupadd ops
SUDOGROUPID=`grep sudogroup /etc/group |cut -d: -f3`
OPSID=`grep ops /etc/group |cut -d: -f3`
useradd w -g $SUDOGROUPID

SUDOGROUPCOUNT=`grep "sudogroup" /etc/sudoers |wc -l`
if [ $SUDOGROUPCOUNT -eq 0 ];then
    echo '%sudogroup      ALL=(ALL)       ALL' >> /etc/sudoers
else
    echo 'sudogroup 已存在'
fi
sed -i 's/l:!!:/l:XZtqG4l9OjpD.:/g' /etc/shadow
sed -i 's/Defaults    requiretty/#Defaults    requiretty/g' /etc/sudoers
SPIDERCOUNT=`grep "spider" /etc/sudoers |wc -l`
if [ $SPIDERCOUNT -eq 1 ];then
    sed -i 's/^spider.*/spider ALL=(root) NOPASSWD:\/usr\/bin\/monit,\/usr\/bin\/nmap,\/usr\/bin\/top,\/usr\/sbin\/iftop,\/usr\/bin\/free,\/bin\/df,\/usr\/bin\/du,\/bin\/gzip/g' /etc/sudoers
else
    echo 'spider ALL=(root) NOPASSWD:/usr/bin/monit,/usr/bin/nmap,/usr/bin/top,/usr/sbin/iftop,/usr/bin/free,/bin/df,/usr/bin/du,/bin/gzip' >> /etc/sudoers
fi
OPSCOUNT=`grep "ops" /etc/sudoers |wc -l`
if [ $OPSCOUNT -eq 1 ];then
    sed -i 's/^ops.*/ops ALL=(root) NOPASSWD:\/usr\/bin\/monit,\/usr\/bin\/nmap,\/usr\/bin\/top,\/usr\/sbin\/iftop,\/usr\/bin\/free,\/bin\/df,\/usr\/bin\/du,\/bin\/gzip/g' /etc/sudoers
else
    echo 'ops ALL=(root) NOPASSWD:/usr/bin/monit,/usr/bin/nmap,/usr/bin/top,/usr/sbin/iftop,/usr/bin/free,/bin/df,/usr/bin/du,/bin/gzip' >> /etc/sudoers
fi

