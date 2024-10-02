#!/bin/bash

readonly image_name="docker-nginx-sandbox-api"
readonly dockerfile="Dockerfile"
readonly distd="dist"

gen_filed() {
    echo "${distd}/${i}/files"
}
