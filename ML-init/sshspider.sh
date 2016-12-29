#!/bin/bash
for HOST in `cat allhost.txt`
#for HOST in `cat /tmp/mongodb.txt`
do
    ./spider.exp $HOST
done
