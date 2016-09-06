#!/bin/bash

# in /home/embat/.bashrc insert line `source /home/embat/tools/system/connect_to_databases.sh`


function connect_to_redshift() {
    REDSHIFT_HOST="$(cat /home/embat/my_credentials.json | jq -r '.aws.redshift.host')"
    REDSHIFT_PORT="$(cat /home/embat/my_credentials.json | jq -r '.aws.redshift.port')"
    REDSHIFT_DATABASE="$(cat /home/embat/my_credentials.json | jq -r '.aws.redshift.database')"
    REDSHIFT_USER="$(cat /home/embat/my_credentials.json | jq -r '.aws.redshift.user')"
    cat /home/embat/my_credentials.json | jq -r '.aws.redshift.password' | pbcopy

    psql -U $REDSHIFT_USER -p $REDSHIFT_PORT -d $REDSHIFT_DATABASE -h $REDSHIFT_HOST

    # TODO remove $REDSHIFT_PASSWORD from clipboard after login (successful or not)
}

export -f connect_to_redshift
