#!/bin/bash

# in /home/embat/.bashrc insert line `source /home/embat/tools/system/connect_to_databases.sh`


function connect_to_redshift() {
    REDSHIFT_HOST="$(cat ~/custom-credentials/redshift.json | jq -r '.host')"
    REDSHIFT_PORT="$(cat ~/custom-credentials/redshift.json | jq -r '.port')"
    REDSHIFT_DATABASE="$(cat ~/custom-credentials/redshift.json | jq -r '.database')"
    REDSHIFT_USER="$(cat ~/custom-credentials/redshift.json | jq -r '.user')"
    cat ~/custom-credentials/redshift.json | jq -r '.password' | pbcopy

    psql -U $REDSHIFT_USER -p $REDSHIFT_PORT -d $REDSHIFT_DATABASE -h $REDSHIFT_HOST

    # TODO remove $REDSHIFT_PASSWORD from clipboard after login (successful or not)
}

export -f connect_to_redshift
