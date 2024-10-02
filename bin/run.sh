#!/bin/bash

set -e
thisd="$(cd $(dirname $0); pwd)"
. "${thisd}/common.sh"

"${thisd}/build.sh" "$@"
docker compose up -d
