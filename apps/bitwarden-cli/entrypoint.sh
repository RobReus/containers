#!/bin/bash

set -e

if [[ ! -z "${BW_APPID}" ]]; then
  if [[ -z "${BITWARDENCLI_APPDATA_DIR}" ]]; then
    echo "BITWARDENCLI_APPDATA_DIR is not set, must be set when using BW_APPID."
    exit 1
  fi
  mkdir -p ${BITWARDENCLI_APPDATA_DIR}
  echo "{\"appId\": \"${BW_APPID}\"}" > ${BITWARDENCLI_APPDATA_DIR}/data.json
fi

bw config server ${BW_HOST}

export BW_SESSION=$(bw login ${BW_USER} --passwordenv BW_PASSWORD --raw)

bw unlock --check

echo 'Running `bw serve` on port 8087'
bw serve --hostname 0.0.0.0 #--disable-origin-protection
