#!/bin/bash

set -e

thisd="$(cd $(dirname $0); pwd)"
. "${thisd}/common.sh"

readonly instance_num="${1:-1}"
readonly nginx_port="${NGINX_PORT:-18000}"
readonly api_port="${API_PORT:-19000}"
readonly debug="$DEBUG"

jinja_opt="-n ${instance_num} --nginx_port ${nginx_port} --api_port ${api_port}"
if [ -n "$debug" ] ; then
    jinja_opt="${jinja_opt} --debug"
fi
jinja_sh() {
    "${thisd}/jinja.sh" $jinja_opt
}

build_n() {
    local i="$1"
    local rootd="$(gen_filed $i)"
    mkdir -p "$rootd"
    cp -rn templates/ "${rootd}/" || true
    find "$rootd" -name "*.tpl" -type f | while read line ; do
        dest="${line%.tpl}"
        if [ -n "$CLEAN" ] || [ ! -f "$dest" ] ; then
            jinja_sh < "$line" > "$dest"
        fi
    done
    pushd "$rootd" > /dev/null
    docker build -t "${image_name}:${i}" -f "$dockerfile" .
    popd > /dev/null
}

if [ -n "$CLEAN" ] ; then
    rm -rf "$distd"
    docker ps -a | grep docker-nginx-sandbox | awk '{print $1}' | xargs docker rm
    docker images | grep docker-nginx-sandbox | awk '{print $1":"$2}' | xargs docker rmi
fi

for i in $(seq $instance_num) ; do
    build_n "$((i-1))"
done

jinja_sh < docker-compose.yml.tpl > docker-compose.yml
