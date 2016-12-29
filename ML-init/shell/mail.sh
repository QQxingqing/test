MONITNUM=`grep "1234" /etc/mail.rc |wc -l`
if [ $MONITNUM -eq 0 ];then
cat << EOF >> /etc/mail.rc
set from=monit@qq.com
set smtp=smtp.exmail.qq.com
set smtp-auth-user=monit@qq.com
set smtp-auth-password=1234
set smtp-auth=login
EOF
fi
