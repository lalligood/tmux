#!/bin/bash
# Create necessary symlink for tmux

currdir=`pwd`

function determine_os()
# Determine whether running on Linux or Mac
{
    myos=`uname -s`
    if [[ ${myos} == "Darwin" ]]; then
        tmux=".tmux.conf.mac"
        echo "Mac operating system detected."
    else
        tmux=".tmux.conf.linux"
        echo "Linux operating system detected."
    fi
    echo
}

function create_symlink()
# Create symlink to configuration file if doesn't already exist
{
    src=${currdir}/$2
    dest=$HOME/$1
    if  [ ! -h ${dest} ]; then
        echo Symbolic link for $1 does not exist. Creating symlink...
        ln -vs ${src} ${dest}
        echo Symbolic link for $1 created successfully.
    else
        echo Symbolic link for $1 already exists. Skipping...
    fi
}

determine_os
create_symlink .tmux.conf ${tmux}
