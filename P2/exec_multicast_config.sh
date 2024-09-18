#!/bin/bash

#  update configuration of router containers only because we don't need to
#  modify host configuration
for i in $(docker ps -q)
do
    hostname=$(docker exec $i hostname)
    if [[ $hostname =~ router ]]; then
        echo "Let's update container's ${hostname} configuration and exec it"
        docker cp ${hostname}_multicast $i:/tmp/
        docker exec $i chmod +x /tmp/${hostname}_multicast
        docker exec $i /tmp/${hostname}_multicast
        echo "end of configuration for container ${hostname}"
    fi
done