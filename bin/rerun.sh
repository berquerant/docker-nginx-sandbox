#!/bin/bash

set -e
thisd="$(cd $(dirname $0); pwd)"
docker compose stop || true
"${thisd}/run.sh" "$@"
