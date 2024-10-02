#!/bin/bash

set -e

thisd="$(cd $(dirname $0); pwd)"
. "${thisd}/common.sh"

readonly instance_num="${1:-1}"
readonly nginx_port="${NGINX_PORT:-18000}"
readonly api_port="${API_PORT:-19000}"
jinja_sh() {
    "${thisd}/jinja.sh" -n "$instance_num" --nginx_port "$nginx_port" --api_port "$api_port"
}

build_n() {
    local i="$1"
    local rootd="$(gen_filed $i)"
    mkdir -p "$rootd"
    cp -rn templates/ "${rootd}/" || true
    find "$rootd" -name "*.tpl" -type f | while read line ; do
         jinja_sh < "$line" > "${line%.tpl}"
    done
    pushd "$rootd" > /dev/null
    docker build -t "${image_name}:${i}" -f "$dockerfile" .
    popd > /dev/null
}

if [ -n "$CLEAN" ] ; then
    rm -rf "$distd"
fi

for i in $(seq $instance_num) ; do
    build_n "$((i-1))"
done

jinja_sh < docker-compose.yml.tpl > docker-compose.yml
