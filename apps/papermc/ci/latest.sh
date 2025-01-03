#!/usr/bin/env bash
set -x
VERSION=$(curl -sX GET https://api.papermc.io/v2/projects/paper | jq -r '.versions[-1]')
BUILD=$(curl -sX GET https://api.papermc.io/v2/projects/paper/versions/${VERSION}/builds | jq '.builds | .[-1] | .build')
FULL="${VERSION}-${BUILD}"
printf "%s" "${VERSION}-${BUILD}"
