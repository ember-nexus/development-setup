# Development Setup

Important: The development setup requires multiple Docker containers, some of which require quite a lot of memory.  
Therefore the host system should have at least **16 GB of memory**.

## Install dependencies

- [Task](https://taskfile.dev/installation/)
- [Docker CLI + Docker Compose](https://docs.docker.com/engine/install/)
- [DuckDB](https://duckdb.org/docs/installation/), required for some commands

## Setup environment

```bash
task setup
cp ./api/api/.env ./volumes/api.env # edit env, todo
mkdir -p ./volumes/step-ca
chmod 777 ./volumes/step-ca
```

## Start environment

```bash
task up
# todo: step ca tls installation

# enter API container:
task cli
# inside of the API container:
composer install
./bin/test-feature-prepare
```

Index page is now available under [https://index.localhost](https://index.localhost).

## old readme, wip, incomplete

```bash
docker exec -it ember-nexus-proxy-step-ca bash

source .env
echo "domain should be set: ${DOMAIN}"
sudo chmod 777 ./volumes/neo4j-cert
docker exec -it ember-nexus-proxy-step-ca ls -lahn
docker exec -it ember-nexus-proxy-step-ca chown step:step neo4j-cert
docker exec -it ember-nexus-proxy-step-ca mkdir ./neo4j-cert/trusted
docker exec -it ember-nexus-proxy-step-ca cp ./neo4j-cert/public.crt certificates/bolt/trusted


docker exec -it ember-nexus-api-neo4j mkdir ./certificates/bolt/trusted
docker exec -it ember-nexus-api-neo4j cp /neo4j-cert/public.crt ./certificates/bolt
docker exec -it ember-nexus-api-neo4j cp /neo4j-cert/public.crt ./certificates/bolt/trusted
docker exec -it ember-nexus-api-neo4j cp /neo4j-cert/private.key ./certificates/bolt


docker exec -it ember-nexus-proxy-step-ca step certificate create "neo4j-bolt.localhost" /neo4j-cert/public.crt /neo4j-cert/private.key \
  --ca ./certs/root_ca.crt \
  --ca-key ./secrets/root_ca_key \
  --ca-password-file ./secrets/password \
  --no-password \
  --insecure \
  --not-after 17520h \
  --san "neo4j-bolt.${DOMAIN}"










step certificate create "neo4j-bolt.localhost" /neo4j-cert/test.crt /neo4j-cert/test.key \
  --ca ./certs/root_ca.crt \
  --ca-key ./secrets/root_ca_key \
  --ca-password-file ./secrets/password \
  --no-password \
  --insecure \
  --not-after 17520h \
  --san "neo4j-bolt.${DOMAIN}"
step certificate inspect test.crt
```
