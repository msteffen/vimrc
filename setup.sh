#!/bin/bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c "PluginInstall | qa"
sudo apt-get install build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe && ./install.sh
vim -c "PluginInstall | qa"
