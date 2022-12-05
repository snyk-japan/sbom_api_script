#!/bin/bash

if [ $# -ne 2 ]
  then
    echo 'Needs to supply argument'
    echo '  $1 = Organization'
    echo '  $2 = Project'
    exit 1
fi

ORG=${1}
PROJECT=${2}

#SNYK_TOKEN=$(cat ~/.config/configstore/snyk.json | jq -r '.api')
SNYK_TOKEN=$(snyk config get api)

if [[ ${SNYK_TOKEN} = "null" ]]; then
  echo "No snyk token found. Please run 'snyk auth' first"
  exit 1
fi

#VERSION=2021-06-01~experimental
VERSION=2022-04-06~experimental

#set -x

# Get organization ID
ORG_ID=$(http --body \
  https://api.snyk.io/rest/orgs \
  Authorization:"token $SNYK_TOKEN" \
  version==${VERSION} \
  slug==${ORG} | jq -r '.data[0].id')

if [[ ${ORG_ID} = "null" ]]; then
  echo "Org not found"
  exit 1
fi

# Get project ID
PROJECT_ID=$(http --body \
  https://api.snyk.io/rest/orgs/${ORG_ID}/projects \
  Authorization:"token $SNYK_TOKEN" \
  name==${PROJECT} \
  version==${VERSION} | jq -r '.data[0].id')

if [[ ${PROJECT_ID} = "null" ]]; then
  echo "Project not found"
  exit 1
fi

# Call SBOM API 
http --body \
  https://api.snyk.io/rest/orgs/${ORG_ID}/projects/${PROJECT_ID}/sbom \
  Authorization:"token ${SNYK_TOKEN}" \
  version==${VERSION} \
  format==cyclonedx+json

exit 0
