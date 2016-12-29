#!/bin/bash
rpm -ivh /root/app/jdk-7u79-linux-x64.rpm
JAVAENV=`grep "JAVA_HOME" /etc/profile |wc -l`
if [ $JAVAENV -eq 0 ];then
    echo 'export JAVA_HOME=/usr/java/jdk1.7.0_79' >> /etc/profile
    echo 'export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> /etc/profile
    echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
fi
source /etc/profile
