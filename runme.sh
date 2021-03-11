#!/bin/bash

function pull_then_run()
{
    # TODO: check if image exist
    docker pull ubuntu:latest
    docker run -idt ubuntu:latest
}

function stopit()
{
    docker ps | grep ubuntu | xargs | awk -F: '{ print $1}' > docker_id.txt
    set `head -1 docker_id.txt`; echo $1 > docker_id.txt
    id=`cat docker_id.txt`
    docker stop $id 
}

function main()
{
    pull_then_run
    stopit
}

main
