#!/bin/bash
for i in `cat ./srv.txt`
do
                export server=`echo $i`
                export cmdfile=`cat 1.txt`
                ./1.exp $server $cmdfile
		echo $server
done
