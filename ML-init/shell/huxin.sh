#!/bin/bash
useradd spider
mkdir /home/spider/.ssh
echo "" > /home/spider/.ssh/authorized_keys
cat >> /home/spider/.ssh/authorized_keys <<EOF
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
EOF
echo "" > /home/spider/.ssh/id_rsa
cat >> /home/spider/.ssh/id_rsa <<EOF
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
EOF
echo "" > /home/spider/.ssh/id_rsa.pub
cat >> /home/spider/.ssh/id_rsa.pub <<EOF
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
EOF
chown -R spider.spider /home/spider/.ssh
