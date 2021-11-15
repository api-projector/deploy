# /bin/bash

set -o errexit
set -o nounset

cd /opt/junte/services/api-projector/deploy/helm

RELEASE_PATH="./releases/${1}"

source ${RELEASE_PATH}/env

_HELM_OPTS="-f values.yaml -f ${RELEASE_PATH}/config.yaml --namespace ${K8S_NAMESPACE} ."

helm upgrade --create-namespace --reuse-values  --cleanup-on-fail -i ${HELM_RELEASE} ${_HELM_OPTS} 
