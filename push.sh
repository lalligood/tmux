#!/bin/bash
# Create necessary symlink for tmux
currdir=`pwd`

function create_refs {
if [[ $2 == "" ]]; then
    # Verify directory exists. Create it if it does not.
    if [ ! -d $1 ]; then
        echo $1 directory does not exist. Creating directory...
        mkdir -v $1
        echo $1 directory created successfully
    else
        echo $1 already exists. Skipping...
    fi
else
    # Verify symlink exists. Create it if it does not.
    if  [ ! -h $HOME/$1 ]; then
        echo Symbolic link for $1 does not exist. Creating symlink...
        ln -v -s $currdir/$2 $HOME/$1
        echo Symbolic link for $1 created successfully.
    else
        echo Symbolic link for $1 already exists. Skipping...
    fi
fi
}

create_refs .tmux.conf .tmux.conf
