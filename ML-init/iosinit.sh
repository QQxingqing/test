#!/bin/bash
for HOST in `cat ios.game`
do
    ./scpshell.exp $HOST
    wait
    ./shshell.exp $HOST ios
    wait
    ./ssh.exp $HOST
done
for HOST in `cat ios.gate`
do
    ./scpshell.exp $HOST
    wait
    ./shshell.exp $HOST ios
    wait
    ./ssh.exp $HOST
done
for HOST in `cat ios.login`
do
    ./scpshell.exp $HOST
    wait
    ./shshell.exp $HOST ios
    wait
    ./ssh.exp $HOST
done
#for HOST in `cat mongodb.txt`
#do
#    ./scpshell.exp $HOST
#    ./shshell.exp $HOST ios
#done
