#!/bin/sh

echo "Fixing CA cert"

mkdir -p /certs
rm -rf /certs/*
cp /step-ca/certs/root_ca.crt /certs/root_ca.crt
chmod 666 /certs/root_ca.crt

echo "Fixed CA cert, starting Traefik"

/bin/sh /entrypoint.sh traefik "$@"
