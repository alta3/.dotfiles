#!/bin/bash

cd /home/$USER_NAME

if [ -f "/home/$USER_NAME/.config/fish/config.fish" ]
then
    echo "Dotfiles already installed..."
else
    cd /home/$USER_NAME
    mkdir -p .ssh
    mkdir -p .config/fish

    rm -rf /home/$USER_NAME/.vim
    ln -s /home/$USER_NAME/.dotfiles/vim /home/$USER_NAME/.vim
    ln -s /home/$USER_NAME/.dotfiles/vimrc /home/$USER_NAME/.vimrc
    ln -s /home/$USER_NAME/.dotfiles/git/gitconfig /home/$USER_NAME/.gitconfig
    ln -s /home/$USER_NAME/.dotfiles/git/gitignore_global /home/$USER_NAME/.gitignore_global
    ln -s /home/$USER_NAME/.dotfiles/config.fish /home/$USER_NAME/.config/fish/config.fish
    ln -s /home/$USER_NAME/.dotfiles/tmux.conf /home/$USER_NAME/.tmux.conf
    ln -s /home/$USER_NAME/.dotfiles/sshconf /home/$USER_NAME/.ssh/config
fi
cd /home/$USER_NAME

groupadd docker
