#!/bin/bash


# Update configuration of docker containers
for i in $(docker ps -q)
do
    hostname=$(docker exec $i hostname)
    echo "Let's copy file inside the docker container ${hostname} and exec it"
    docker cp $hostname $i:/tmp/
    docker exec $i chmod +x /tmp/$hostname
    docker exec $i /tmp/$hostname
    echo "end of configuration for container ${hostname}"
done

