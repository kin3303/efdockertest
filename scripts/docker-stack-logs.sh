#!/bin/bash -e
stack=$1
if [ -z "${stack}" ]; then
    echo 'Usage:'
    echo "$0 <stack>"
    exit 1
fi
# Get a list of the service names
services=$(docker stack services --format {{.Name}} ${stack})
# Sort the service names
services=$(echo "${services}" | sort)
# Create the command to run
command='multitail -s 2'
for service in ${services}; do
    command="${command} -l 'docker service logs -f ${service}'"
done
# Run the command
bash -c "${command}"
