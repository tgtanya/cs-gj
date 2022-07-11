#!/bin/bash

while true
do
    (echo $(echo "Metrics for ssh log-in attempt(s)")
    echo $(echo "\n")
    echo $(echo "nodeABC has "; if [ -e /root/nodeABC.log ]; then grep -o -i "failed password\|accepted password" /root/nodeABC.log | wc -l; else echo "0"; fi; echo " attempt(s)")
    echo $(echo "nodeXYZ has "; if [ -e /root/nodeXYZ.log ]; then grep -o -i "failed password\|accepted password" /root/nodeXYZ.log | wc -l; else echo "0"; fi; echo " attempt(s)")) > /home/livemetrics.log
    sleep 1
done
