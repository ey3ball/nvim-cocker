FROM ey3ball/nvim-base

USER root
RUN apt-get update \
    && apt-get install -y build-essential python3-dev python3-pip \
    && pip3 install black jedi pydocstyle flake8 mypy pylint pynvim

RUN apt-get install -y python3-venv
ADD bashrc /tmp
RUN cat /tmp/bashrc >> /etc/bash.bashrc
ADD config/coc-settings.json $DEV_HOME/.config/nvim/coc-settings.json

USER dev
RUN set -x \
    && nvim +"CocInstall -sync coc-python" +"qall"

