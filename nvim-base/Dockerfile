FROM ubuntu:20.04

ARG DEV_HOME=/home/dev
ARG DEV_UID=1000
ARG DEV_GID=1000
ARG DEBIAN_FRONTEND=noninteractive

ENV DEV_HOME=$DEV_HOME
ENV DEV_UID=$DEV_UID
ENV DEV_GID=$DEV_GID

RUN echo "Install core dev tools" \
    && apt-get update \
    && apt-get install -y ca-certificates curl wget git tmux fzf

RUN echo "Install neovim" \
    && wget -q https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage \
    && chmod u+x ./nvim.appimage \
    && ./nvim.appimage --appimage-extract \
    && mv ./squashfs-root /opt/nvim \
    && chmod -R +rx /opt/nvim \
    && ln -s /opt/nvim/usr/bin/nvim /usr/local/bin/nvim

RUN echo "Install python" \
    && apt-get update \
    && apt-get install -y python3

RUN echo "Install node, yarn" \
    && apt-get update \
    && apt-get install -y --no-install-recommends npm \
    && npm --unsafe-perm -g install yarn

# Create default dev user/group
RUN groupadd -g $DEV_GID dev
RUN useradd dev -u $DEV_UID -g $DEV_GID -m
USER dev

# Install plugin manager for neovim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ADD config/*.vim $DEV_HOME/.config/nvim/

# Install extensions for local user
RUN set -x \
    && echo "Install neovim extensions:" \
    && nvim +"PlugInstall" +"qall"

ADD bash.bashrc /etc/bash.bashrc


WORKDIR /mnt
