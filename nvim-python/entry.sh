#!/bin/bash

source /env.sh

if [ ! -z "$DEV_VENV" ]; then
    echo "Activate venv: $DEV_VENV"
    source ~/venv/$DEV_VENV/bin/activate
fi

nvim $@
