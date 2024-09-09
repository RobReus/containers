#!/usr/bin/env bash
set -x
VERSION=$(curl -sX GET https://papermc.io/api/v2/projects/paper | jq -r '.versions[-1]')
BUILD=$(curl -sX GET https://papermc.io/api/v2/projects/paper/versions/${VERSION} | jq -r '.builds[-1]')
FULL="${VERSION}-${BUILD}"
printf "%s\n" "${VERSION}-${BUILD}"
printf "%s\n" "${FULL#*-}"
printf "%s\n" "${FULL%-*}"
