#!/bin/sh
set -e

if [ -z "$ALLOWED_HOSTS" ]; then 
    echo "No ALLOWED_HOSTS is set (set to ALL if you want to allow all hosts to connect)";
    exit 1
else 
    echo "socat: $ALLOWED_HOSTS" > /etc/hosts.allow;
    echo "socat: ALL" > /etc/hosts.deny;
fi

exec "$@"
