#!/bin/bash

# Copy Vundle & create YCM directory
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall" -c ":qa"
echo "See https://github.com/msteffen/vimrc/blob/master/README.md if you want to set up YouCompleteMe as well"
