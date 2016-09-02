#!/bin/bash

which git || { sudo apt install git; }

# Copy Vundle & create YCM directory
curl https://raw.githubusercontent.com/msteffen/vimrc/master/vimrc >~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall" -c ":qa"
echo "See https://github.com/msteffen/vimrc/blob/master/README.md if you want to set up YouCompleteMe as well"
