#!/bin/bash

# Copy Vundle & create YCM directory
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install YCM
sudo apt-get install build-essential cmake python-dev
echo -e ":PluginInstall\n:q" | vim
(cd ~/.vim/bundle/YouCompleteMe && ./install.sh)
