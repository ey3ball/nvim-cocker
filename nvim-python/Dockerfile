FROM ey3ball/nvim-base

USER root
RUN apt-get update \
    && apt-get install -y build-essential python3-dev python3-pip \
    && pip3 install black jedi pydocstyle flake8 mypy pylint pynvim

RUN apt-get install -y python3-venv
RUN apt-get update && apt-get install -y postgresql-client
COPY --chown=dev:dev config/coc-settings.json $DEV_HOME/.config/nvim/coc-settings.json

ADD entry.sh /entry.sh
ADD requirements.txt $DEV
COPY --chown=dev:dev requirements.txt $DEV_HOME/requirements.txt

USER dev
RUN mkdir ~/.cache
RUN nvim +"CocInstall -sync coc-python" +"qall"

RUN rm -f $HOME/.config/coc/memos.json \
    && ln -s $HOME/.coconfig/memos.json $HOME/.config/coc/memos.json
