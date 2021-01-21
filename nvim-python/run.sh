#!/bin/bash

OPTS=""
OPTS+=" --rm --network host"
OPTS+=" -v /:/mnt"
OPTS+=" -v $HOME/.ssh:/home/dev/.ssh"
OPTS+=" -v $HOME/.gitconfig:/home/dev/.gitconfig"
OPTS+=" -v $HOME/tools/venv:/home/dev/.pyenv"
OPTS+=" -v $HOME/.config/coc:/home/dev/.coconfig"
OPTS+=" -v $HOME/tools/cache/pre-commit:/home/dev/.cache/pre-commit"
OPTS+=" -e LANG=en_US.UTF-8"
OPTS+=" -e LC_ALL=en_US.UTF-8"
OPTS+=" -e LC_CTYPE=en_US.UTF-8"
OPTS+=" --workdir /mnt/$PWD"
OPTS+=" --user $(id -u):$(id -g)"

docker run $OPTS -it ey3ball/nvim-python $@
