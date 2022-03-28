#! /bin/bash

set -o errexit
set -o nounset

cd /opt/junte/services/api-projector/deploy/helm

RELEASE_PATH="./releases/${1}"

source ${RELEASE_PATH}/env

_HELM_OPTS="${@:2} --namespace ${K8S_NAMESPACE} ."

helm upgrade --reuse-values ${HELM_RELEASE} ${_HELM_OPTS}; 
