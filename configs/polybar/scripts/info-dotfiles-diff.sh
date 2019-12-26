#!/bin/sh

DOTFILES_DIR=$HOME/.dotfiles

cd $DOTFILES_DIR

if [ "$(git status | grep "nothing to commit" | wc -l)" -gt 0 ]; then
    echo ''
else
    echo 'Commit dotfiles!'
fi