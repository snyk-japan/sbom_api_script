#!/bin/bash

SNYK_TOKEN=$(cat ~/.config/configstore/snyk.json | jq -r '.api')

set -x

ORG_ID=6b8ae417-8aef-43b9-8885-7f85637e123c
PROJECT_ID=75c8f879-73cf-4bbe-83b7-13ac45f50bae

http --body \
  https://api.snyk.io/rest/orgs/${ORG_ID}/projects/${PROJECT_ID}/sbom \
  Authorization:"token ${SNYK_TOKEN}" \
  version==2022-06-01~experimental \
  format==cyclonedx+json
