#!/bin/bash

readonly image_name="docker-nginx-sandbox-api"
readonly dockerfile="Dockerfile"
readonly tmpd="tmpd"

gen_filed() {
    echo "${tmpd}/${i}/files"
}
