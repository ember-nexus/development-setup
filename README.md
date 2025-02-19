# Development Setup

WIP

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
