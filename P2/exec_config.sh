#!/bin/bash

for i in $(docker -ps -q)
do
    hostname = $(docker exec $i hostname)
    echo $hostname
done

