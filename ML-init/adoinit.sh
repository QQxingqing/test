#!/bin/bash
for HOST in `cat game.txt`
do
    ./scpshell.exp $HOST
    wait
    ./shshell.exp $HOST game
    wait
    ./ssh.exp $HOST
done
#for HOST in `cat gate.txt`
#do
#    ./scpshell.exp $HOST
#    wait
#    ./shshell.exp $HOST game
#    wait
#    ./ssh.exp $HOST
#done
#for HOST in `cat login.txt`
#do
#   ./scpshell.exp $HOST
#    wait
#    ./shshell.exp $HOST login
#    wait
#    ./ssh.exp $HOST
#done
#for HOST in `cat mongodb.txt`
#do
#    ./scpshell.exp $HOST
#    ./shshell.exp $HOST game
#done
