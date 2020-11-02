#!/bin/bash

OPTS=""
OPTS+=" --rm --network host --init"
OPTS+=" -v /:/mnt"
OPTS+=" -v $HOME/.ssh:/home/dev/.ssh"
OPTS+=" --workdir /mnt/$PWD"
OPTS+=" --user $(id -u):$(id -g)"

docker run $OPTS -it ey3ball/nvim-base /bin/bash -c "nvim $*"
