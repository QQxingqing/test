#!/bin/bash
#2016/5/3 wngshipeng
BINPATH="/data/service/mongodb-3.2.1/bin"
TARGETPATH="/data/mongobak"
NOWTIME=$(date +%Y%m%d%H%M%S)
SDAYAGO=$(date -d "7 days ago" +%Y%m%d)
DATABASE="$1"
bak(){
    if [ ! -d "$TARGETPATH/$DATABASE/$NOWTIME" ];then
        mkdir -p $TARGETPATH/$DATABASE/$NOWTIME
    fi
    $BINPATH/mongodump  -h 127.0.0.1 -d $DATABASE -o $TARGETPATH/$DATABASE/$NOWTIME
    cd $TARGETPATH/$DATABASE
    tar -zcvf $NOWTIME.tar.gz $NOWTIME && rm -rf $NOWTIME
    if [ $? -eq 0 ];then
        clean
    fi
}
clean(){
    if [ -f "$TARGETPATH/$DATABASE/$SDAYAGO.tar.gz" ];then
        cd $TARGETPATH/$DATABASE
        rm -f $SDAYAGO.tar.gz
    fi
}
bak
