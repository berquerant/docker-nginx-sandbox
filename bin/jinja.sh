#!/bin/bash

thisd="$(cd $(dirname $0); pwd)"
python "${thisd}/jinja.py" "$@"
