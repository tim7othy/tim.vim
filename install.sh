#!/bin/bash

VIM=$HOME/.vim
CONFIG=$HOME/.config
NVIM=$CONFIG/nvim
OS="$(uname -s)"

function install_vimrc() {
    ln -s $VIM/tim.vim $HOME/.vimrc
}

function install_nvim_init() {
    mkdir -p $CONFIG
    ln -s $VIM $NVIM
    ln -s $VIM/tim.vim $NVIM/init.vim
}

function install_vim_plugin() {
    vim -E -c "PlugInstall" -c "qall"
}

function install_nvim_plugin() {
    nvim -E -c "PlugInstall" -c "qall"
}

function main() {
    # install files
    install_vimrc
    install_nvim_init

    # install plugins
    install_vim_plugin
    install_nvim_plugin
}

main
