#!/bin/bash

OPTS=""
OPTS+=" --rm --network host"
OPTS+=" -v /:/mnt"
OPTS+=" -v $HOME/.ssh:/home/dev/.ssh"
OPTS+=" -v $HOME/tools/venv:/home/dev/.pyenv"
OPTS+=" -e DEV_VENV=$VIP_VENV"
OPTS+=" -e DEV_TERM=$RUN_CMD"
OPTS+=" -e LANG=en_US.UTF-8"
OPTS+=" -e LC_ALL=en_US.UTF-8"
OPTS+=" -e LC_CTYPE=en_US.UTF-8"
OPTS+=" -e NVIM_ARGS=$@"
OPTS+=" --workdir /mnt/$PWD"
OPTS+=" --user $(id -u):$(id -g)"

RUN_CMD=${VIP_CMD:-nvim}

docker run $OPTS -it ey3ball/nvim-python
