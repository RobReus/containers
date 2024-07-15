#!/usr/bin/env bash
set -x
version=$(curl -sX GET https://api.github.com/repos/bitwarden/clients/releases | jq --raw-output 'first(.[] | select(.tag_name|test( "cli-.*")) | .tag_name)')
version="${version#*v}"
version="${version#*release-}"
printf "%s" "${version}"
