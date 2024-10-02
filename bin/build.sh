#!/bin/bash

set -eo pipefail

thisd="$(cd $(dirname $0); pwd)"
. "${thisd}/common.sh"

readonly instance_num="${1:-1}"

build_n() {
    local i="$1"
    local rootd="$(gen_filed $i)"
    cp -rn templates "$rootd"
    find "$rootd" -name "*.tpl" -type f | while read line ; do
        "${thisd}/jinja.sh" > "${line%.tpl}"
    done
    docker build -t "${image_name}:${i}" -f "$dockerfile" "$rootd"
}

for i in $(seq $instance_num) ; do
    build_n "$i"
done
