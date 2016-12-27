#!/bin/bash
for i in `cat ./srv.txt`
do
                export server=`echo $i`
                ./1.exp $server 
		echo $server
done
