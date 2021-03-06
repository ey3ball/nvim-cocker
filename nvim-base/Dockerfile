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
    && apt-get install -y ca-certificates curl wget git tmux fzf locales

RUN echo 'en_US.UTF-8 UTF-8' >/etc/locale.gen \
    && LANG=en_US.UTF-8 dpkg-reconfigure locales

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

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
    && curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install -y nodejs \
    && npm --unsafe-perm -g install npm yarn

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
    && nvim +"PlugInstall" +"qall" \
    && nvim +"CocInstall -sync coc-yaml" +"qall" \
    && nvim +"CocInstall -sync coc-json" +"qall" \
    && nvim +"CocInstall -sync coc-dockerfile" +"qall" \
    && nvim +"CocInstall -sync coc-sh" +"qall" \
    && nvim +"CocInstall -sync coc-json" +"qall" \
    && nvim +"CocInstall -sync coc-html" +"qall"

ADD entry.sh /
ADD env.sh /

ENTRYPOINT [ "/entry.sh" ]

WORKDIR /mnt
