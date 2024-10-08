#!/bin/bash

# Update configuration of docker containers
for i in $(docker ps -q)
do
    hostname=$(docker exec $i hostname)
    if [[ $hostname =~ router ]]; then
        echo "Let's update container's ${hostname} configuration and exec it"
        docker cp ${hostname} $i:/tmp/
        docker cp ./vtysh.conf.sample $i:/etc/frr/vtysh.conf
        docker exec $i chmod +x /tmp/${hostname}
        docker exec $i /tmp/${hostname}
        echo "end of configuration for container ${hostname}"
    else
        addr=${hostname: -1}
        docker exec $i ip addr add 20.1.1.${addr}/24 dev eth0
        echo "address 20.1.1.${addr} added on eth0 for ${hostname}"
    fi

done