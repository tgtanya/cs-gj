#!/bin/bash

nodeLog="/root/nodeABC.log"
while sshpass -p "password" rsync -rvz -e 'ssh -o StrictHostKeyChecking=no -p 22' --progress /var/log/auth.log root@server:$nodeLog 2>&1 >/dev/null | grep -q 'error'
do
    sleep 1
    echo No Connection Established, resending the log...
done

while inotifywait -q -e modify /var/log/auth.log >/dev/null
do
    while sshpass -p "password" rsync -rvz -e 'ssh -o StrictHostKeyChecking=no -p 22' --progress /var/log/auth.log root@server:$nodeLog 2>&1 >/dev/null | grep -q 'error'
    do
        sleep 1
        echo No Connection Established, resending the log...
    done
done
