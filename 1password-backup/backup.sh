#!/bin/sh

op vault list --format=json | jq -r ".[].name" | while read vault
do
    echo -n "$vault..."
    op item list --vault "$vault" --format=json --include-archive | op item get --format=json --reveal --include-archive - | jq -s > "/output/$vault.json"
    echo " done"
done
