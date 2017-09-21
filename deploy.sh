#!/usr/bin/env bash
export KUBE_NAMESPACE=${KUBE_NAMESPACE}
export ENVIRONMENT=${ENVIRONMENT}
export KUBE_SERVER=${KUBE_SERVER}
export KUBE_TOKEN=${KUBE_TOKEN}
export WHITELIST=${WHITELIST:-0.0.0.0/0}

if [ $ENVIRONMENT == "prod" ]
then
    export DNS_PREFIX=
else
    export DNS_PREFIX=${ENVIRONMENT}.
fi

cd kd
kd --debug \
   --insecure-skip-tls-verify --timeout 5m0s \
   --file ingress.yaml \
   --file service.yaml \
   --file deployment.yaml