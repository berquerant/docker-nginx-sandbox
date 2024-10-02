#!/bin/bash

docker compose ps | awk '$1 ~ /sandbox-nginx/ {print $4}' | xargs docker compose restart
