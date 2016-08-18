#!/bin/bash

# in ~/.bashrc insert line `source ~/devtools/system/connect_to_databases.sh`


function connect_to_redshift() {
    REDSHIFT_HOST="$(cat ~/my_credentials.json | jq -r '.aws.redshift.host')"
    REDSHIFT_PORT="$(cat ~/my_credentials.json | jq -r '.aws.redshift.port')"
    REDSHIFT_DATABASE="$(cat ~/my_credentials.json | jq -r '.aws.redshift.database')"
    REDSHIFT_USER="$(cat ~/my_credentials.json | jq -r '.aws.redshift.user')"
    cat ~/my_credentials.json | jq -r '.aws.redshift.password' | pbcopy

    psql -U $REDSHIFT_USER -p $REDSHIFT_PORT -d $REDSHIFT_DATABASE -h $REDSHIFT_HOST

    # TODO remove $REDSHIFT_PASSWORD from clipboard after login (successful or not)
}

export -f connect_to_redshift
